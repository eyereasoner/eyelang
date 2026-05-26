import { COMPOUND, Env, flattenConjunction, freshTerm, termToString, unify, variantTerms } from './term.js';
import { createDefaultRegistry } from './builtins/registry.js';
import { selectClauseCandidates } from './program.js';

let freshCounter = 0;

export class Solver {
  constructor(program, options = {}) {
    this.program = program;
    this.registry = options.registry ?? createDefaultRegistry();
    this.maxDepth = options.maxDepth ?? 100000;
    this.solutionLimit = options.solutionLimit ?? 10000000;
    this.solutionsSeen = 0;
    this.active = [];
    this.memo = new Map();
    this.stats = {
      completed_goal_lists: 0,
      solve_goals_calls: 0,
      solve_one_goal_calls: 0,
      unify_calls: 0,
      max_depth: 0,
      max_goal_count: 0,
      deterministic_builtin_successes: 0,
      deterministic_builtin_failures: 0,
    };
  }

  cloneForSubquery(solutionLimit = this.solutionLimit) {
    const solver = new Solver(this.program, { registry: this.registry, maxDepth: this.maxDepth, solutionLimit });
    solver.memo = this.memo;
    return solver;
  }

  *solve(goals, env = new Env(), depth = 0) {
    this.stats.solve_goals_calls++;
    this.stats.max_depth = Math.max(this.stats.max_depth, depth);
    this.stats.max_goal_count = Math.max(this.stats.max_goal_count, goals.length);
    if (depth > this.maxDepth || this.solutionsSeen >= this.solutionLimit) return;
    if (!Array.isArray(goals)) goals = [goals];

    if (goals.length === 0) {
      this.solutionsSeen++;
      this.stats.completed_goal_lists++;
      yield env;
      return;
    }

    const [goal, ...rest] = goals;
    if (goal.type === COMPOUND && goal.name === ',' && goal.arity === 2) {
      yield* this.solve([...flattenConjunction(goal), ...rest], env, depth + 1);
      return;
    }

    const def = goal.type === COMPOUND ? this.registry.get(goal.name, goal.arity) : null;
    if (def) {
      let produced = false;
      for (const next of def.handler({ solver: this, goal, env })) {
        produced = true;
        yield* this.solve(rest, next, depth + 1);
        if (this.solutionsSeen >= this.solutionLimit) return;
      }
      if (def.deterministic) {
        if (produced) this.stats.deterministic_builtin_successes++;
        else this.stats.deterministic_builtin_failures++;
      }
      return;
    }

    yield* this.solveUserGoal(goal, rest, env, depth);
  }

  activeVariant(goal, env) {
    return this.active.some((entry) => variantTerms(goal, env, entry.goal, entry.env));
  }

  *solveUserGoal(goal, rest, env, depth) {
    this.stats.solve_one_goal_calls++;
    if (depth > this.maxDepth || this.solutionsSeen >= this.solutionLimit) return;
    if (goal.type !== COMPOUND) return;
    const group = this.program.findGroup(goal.name, goal.arity);
    if (!group) return;
    if (group.memoized) {
      yield* this.solveMemoizedGoal(group, goal, rest, env, depth);
      return;
    }
    yield* this.solveUserGoalUncached(group, goal, rest, env, depth);
  }

  *solveMemoizedGoal(group, goal, rest, env, depth) {
    const key = memoKey(goal, env);
    if (!key.hasBound) {
      yield* this.solveUserGoalUncached(group, goal, rest, env, depth);
      return;
    }
    const mapKey = `${goal.name}/${goal.arity}:${key.text}`;
    let entry = this.memo.get(mapKey);
    if (!entry) {
      entry = { computing: false, complete: false, answers: [] };
      this.memo.set(mapKey, entry);
    }
    if (!entry.complete && !entry.computing) {
      entry.computing = true;
      const collector = this.cloneForSubquery();
      for (const answerEnv of collector.solveUserGoalUncached(group, goal, [], env.clone(), depth)) {
        entry.answers.push(goal.args.map((arg) => importResolved(arg, answerEnv)));
      }
      entry.computing = false;
      entry.complete = true;
    }
    if (!entry.complete && entry.computing) {
      yield* this.solveUserGoalUncached(group, goal, rest, env, depth);
      return;
    }
    for (const answerArgs of entry.answers) {
      const next = env.clone();
      let ok = true;
      for (let i = 0; i < goal.arity; i++) {
        this.stats.unify_calls++;
        if (!unify(goal.args[i], answerArgs[i], next)) { ok = false; break; }
      }
      if (ok) yield* this.solve(rest, next, depth + 1);
      if (this.solutionsSeen >= this.solutionLimit) return;
    }
  }

  *solveUserGoalUncached(group, goal, rest, env, depth) {
    if (this.activeVariant(goal, env)) return;
    const candidates = selectClauseCandidates(group, goal, env);
    for (const pass of [candidates.primary, candidates.fallback]) {
      for (const clause of pass) {
        if (headCannotMatch(goal, clause.head, env)) continue;
        const id = ++freshCounter;
        const freshHead = freshTerm(clause.head, id);
        const freshBody = clause.body.map((term) => freshTerm(term, id));
        const next = env.clone();
        this.stats.unify_calls++;
        if (!unify(goal, freshHead, next)) continue;
        if (freshBody.length === 0) {
          yield* this.solve(rest, next, depth + 1);
        } else {
          yield* this.solveRuleBodyThenRest(goal, env, freshBody, rest, next, depth);
        }
        if (this.solutionsSeen >= this.solutionLimit) return;
      }
    }
  }
  *solveRuleBodyThenRest(goal, goalEnv, body, rest, env, depth) {
    // Match the C engine's active-call lifetime: the active guard protects
    // expansion of the current rule body, but it must be released before
    // the caller's remaining goals are solved. Keeping the goal active
    // through rest goals over-prunes valid transitive/recursive derivations.
    this.active.push({ goal, env: goalEnv });
    for (const bodyEnv of this.solve(body, env, depth + 1)) {
      if (this.solutionsSeen > 0) this.solutionsSeen--;
      this.active.pop();
      yield* this.solve(rest, bodyEnv, depth + 1);
      this.active.push({ goal, env: goalEnv });
      if (this.solutionsSeen >= this.solutionLimit) break;
    }
    this.active.pop();
  }

}

function headCannotMatch(goal, head, env) {
  if (goal.type !== COMPOUND || head.type !== COMPOUND) return false;
  if (goal.name !== head.name || goal.arity !== head.arity) return true;
  for (let i = 0; i < goal.arity; i++) {
    const a = goal.args[i];
    const b = head.args[i];
    // Keep this only as a cheap scalar rejection. unify() remains authoritative.
    const da = derefForLocal(a, env);
    if (da.args?.length === 0 && ['atom', 'string', 'number'].includes(da.type) && ['atom', 'string', 'number'].includes(b.type) && da.name !== b.name) return true;
  }
  return false;
}

function derefForLocal(term, env) {
  let current = term;
  while (current.type === 'var' && env.has(current.name)) current = env.get(current.name);
  return current;
}

function memoKey(goal, env) {
  let hasBound = false;
  const parts = goal.args.map((arg) => {
    const value = derefForLocal(arg, env);
    if (value.type !== 'var') hasBound = true;
    return value.type === 'var' ? '_' : termToString(value, env, true);
  });
  return { hasBound, text: parts.join('|') };
}

function importResolved(term, env) {
  const { copyResolved } = termModuleCache;
  return copyResolved(term, env);
}

// Avoid circular import surprises in older Node loaders.
import * as termModuleCache from './term.js';
