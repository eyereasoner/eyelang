import { struct, fresh, instantiate, unify, termKey, format, ground, list } from './terms.js';
import { signature, checkQuery } from './analyze.js';
import { builtinRelations, builtin, compare, evaluate, requireGround } from './builtins.js';

export class LimitError extends Error {
  constructor(limit) {
    super(`Evaluation incomplete: ${limit} limit reached`);
    this.name = 'EyelangLimitError';
  }
}

export function createContext(options = {}) {
  const limits = { maxSteps: 1_000_000, maxTables: 100_000, maxAnswers: 100_000 };
  for (const name of Object.keys(limits)) {
    if (options[name] !== undefined) {
      if (!Number.isSafeInteger(options[name]) || options[name] < 1) throw new Error(`${name} must be a positive safe integer`);
      limits[name] = options[name];
    }
  }
  return {
    limits, steps: 0, tables: 0, answers: 0, proofs: [], completed: new Map(),
    tick() { if (++this.steps > this.limits.maxSteps) throw new LimitError('steps'); },
  };
}

function freshExpression(expression, variables) {
  if (expression.type === 'value') return { ...expression, term: fresh(expression.term, variables) };
  if (expression.type === 'unary') return { ...expression, arg: freshExpression(expression.arg, variables) };
  if (expression.type === 'binary') return { ...expression, left: freshExpression(expression.left, variables), right: freshExpression(expression.right, variables) };
  return { ...expression, args: expression.args.map(arg => freshExpression(arg, variables)) };
}

function freshGoals(body, variables) {
  return body.map(goal => {
    if (goal.type === 'call' || goal.type === 'not') return { ...goal, term: fresh(goal.term, variables) };
    if (goal.type === 'compare') return { ...goal, left: fresh(goal.left, variables), right: fresh(goal.right, variables) };
    if (goal.type === 'let') return { ...goal, target: fresh(goal.target, variables), expression: freshExpression(goal.expression, variables) };
    return { ...goal, target: fresh(goal.target, variables), template: fresh(goal.template, variables), body: freshGoals(goal.body, variables) };
  });
}

function bindExpression(expression, env) {
  if (expression.type === 'value') return { ...expression, term: instantiate(expression.term, env) };
  if (expression.type === 'unary') return { ...expression, arg: bindExpression(expression.arg, env) };
  if (expression.type === 'binary') return { ...expression, left: bindExpression(expression.left, env), right: bindExpression(expression.right, env) };
  return { ...expression, args: expression.args.map(arg => bindExpression(arg, env)) };
}

function bindGoals(body, env) {
  return body.map(goal => {
    if (goal.type === 'call' || goal.type === 'not') return { ...goal, term: instantiate(goal.term, env) };
    if (goal.type === 'compare') return { ...goal, left: instantiate(goal.left, env), right: instantiate(goal.right, env) };
    if (goal.type === 'let') return { ...goal, target: instantiate(goal.target, env), expression: bindExpression(goal.expression, env) };
    return { ...goal, target: instantiate(goal.target, env), template: instantiate(goal.template, env), body: bindGoals(goal.body, env) };
  });
}

function bindPremise(premise, env) {
  const result = { ...premise };
  for (const field of ['callTerm', 'valueTerm', 'leftTerm', 'rightTerm', 'template']) {
    if (result[field]) result[field] = instantiate(result[field], env);
  }
  if (result.expression) result.expression = bindExpression(result.expression, env);
  if (result.body) result.body = bindGoals(result.body, env);
  return result;
}

// Demand-driven fixed point. A call table subscribes to tables used by its
// bodies. New answers put subscribers back on the work queue. Recursive calls
// read currently known answers, never recursively invoke the JavaScript solver.
// This intentionally simple reference algorithm replays a subscriber's clauses;
// it does not claim the performance of continuation-based SLG or semi-naive joins.
class Engine {
  constructor(program, body, projection, context) {
    this.program = program;
    this.context = context;
    this.tables = new Map();
    this.queue = [];
    this.cursor = 0;
    this.root = { id: 0, head: struct('$query', projection), body, location: null };
  }

  enqueue(table) {
    if (!table.queued) { table.queued = true; this.queue.push(table); }
  }

  table(call) {
    const key = termKey(call);
    if (!this.tables.has(key)) {
      if (++this.context.tables > this.context.limits.maxTables) throw new LimitError('tables');
      const table = { call: fresh(call), answers: new Map(), subscribers: new Set(), queued: false };
      this.tables.set(key, table);
      this.enqueue(table);
    }
    return this.tables.get(key);
  }

  run() {
    const root = this.table(this.root.head);
    while (this.cursor < this.queue.length) {
      const table = this.queue[this.cursor++];
      table.queued = false;
      this.evaluateTable(table);
      // Release old queue references during long computations.
      if (this.cursor > 4096 && this.cursor * 2 > this.queue.length) {
        this.queue = this.queue.slice(this.cursor); this.cursor = 0;
      }
    }
    return [...root.answers.values()];
  }

  evaluateTable(table) {
    const { context } = this;
    const rules = table.call.name === '$query' ? [this.root] : this.program.predicates.get(signature(table.call));
    for (const rule of rules) {
      context.tick();
      const variables = new Map(), env = new Map();
      const head = fresh(rule.head, variables);
      const body = freshGoals(rule.body, variables);
      if (!unify(table.call, head, env)) continue;
      for (const solution of this.join(body, env, [], table)) {
        const answer = instantiate(table.call, solution.env);
        const key = termKey(answer);
        if (table.answers.has(key)) continue;
        if (++context.answers > context.limits.maxAnswers) throw new LimitError('answers');
        const proof = context.proofs.length + 1;
        context.proofs.push({
          id: proof, conclusion: format(answer), conclusionTerm: answer, rule: rule.id || 'query',
          location: rule.location, premises: solution.premises.map(premise => bindPremise(premise, solution.env)),
        });
        table.answers.set(key, { term: answer, proof });
        for (const subscriber of table.subscribers) this.enqueue(subscriber);
      }
    }
  }

  *join(body, env, premises, owner, index = 0) {
    this.context.tick();
    if (index === body.length) { yield { env, premises }; return; }
    const goal = body[index];
    for (const result of this.step(goal, env, owner)) {
      yield* this.join(body, result.env, [...premises, result.premise], owner, index + 1);
    }
  }

  *step(goal, env, owner) {
    const context = this.context;
    if (goal.type === 'call') {
      const call = instantiate(goal.term, env);
      if (builtinRelations.has(signature(call))) {
        for (const branch of builtin(call, env, () => context.tick())) {
          yield { env: branch, premise: { kind: 'builtin', call: format(instantiate(goal.term, branch)), callTerm: goal.term } };
        }
        return;
      }
      const dependency = this.table(call);
      dependency.subscribers.add(owner);
      // Snapshot: a table can subscribe to itself and add answers during replay.
      for (const answer of [...dependency.answers.values()]) {
        context.tick();
        const branch = new Map(env);
        if (unify(goal.term, fresh(answer.term), branch)) yield { env: branch, premise: { kind: 'answer', proof: answer.proof, callTerm: goal.term } };
      }
      return;
    }
    if (goal.type === 'not') {
      const call = requireGround(instantiate(goal.term, env), 'not');
      const key = termKey(call);
      if (!context.completed.has(key)) {
        const answers = solve(this.program, [{ type: 'call', term: call }], [], context);
        context.completed.set(key, answers.length !== 0);
      }
      if (!context.completed.get(key)) {
        yield { env, premise: { kind: 'not', call: format(call), callTerm: call, basis: 'completed lower-stratum query over immutable program' } };
      }
      return;
    }
    if (goal.type === 'collect') {
      // Capture bound inputs; remaining collection variables are local to this
      // invocation and must not acquire later bindings from the enclosing body.
      const locals = new Map();
      const body = freshGoals(bindGoals(goal.body, env), locals);
      const template = fresh(instantiate(goal.template, env), locals);
      const answers = solve(this.program, body, [template], context);
      const unique = new Map();
      for (const answer of answers) {
        const value = answer.term.args[0];
        if (!ground(value)) throw new Error('collect template must be ground in every answer');
        unique.set(termKey(value), value);
      }
      // Collection results are sets represented in a deterministic canonical order.
      const values = list([...unique.entries()].sort(([a], [b]) => a < b ? -1 : a > b ? 1 : 0).map(([, value]) => value));
      const branch = new Map(env);
      if (unify(goal.target, values, branch)) {
        yield { env: branch, premise: { kind: 'collect', value: format(values), valueTerm: values, template, body, proofs: answers.map(answer => answer.proof), basis: 'completed lower-stratum query' } };
      }
      return;
    }
    const branch = new Map(env);
    if (goal.type === 'let') {
      const value = evaluate(goal.expression, env);
      if (unify(goal.target, value, branch)) yield { env: branch, premise: { kind: 'let', value: format(value), valueTerm: value, expression: goal.expression } };
    } else if (compare(goal.op, goal.left, goal.right, branch)) {
      yield { env: branch, premise: { kind: 'compare', op: goal.op, left: format(instantiate(goal.left, branch)), right: format(instantiate(goal.right, branch)), leftTerm: goal.left, rightTerm: goal.right } };
    }
  }
}

export function solve(program, body, projection, context) {
  checkQuery(body, program);
  return new Engine(program, body, projection, context).run();
}
