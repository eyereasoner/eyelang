// Proof explanation printer.
// This replays a successful ground goal against the program and emits the native-style "why" tree.
import { COMPOUND, Env, VAR, deref, flattenConjunction, freshTerm, termToString, unify } from './term.js';
import { selectClauseCandidates } from './program.js';
import { createDefaultRegistry } from './builtins/registry.js';
import { Solver, nextFreshId } from './solver.js';

const DETERMINISTIC_EXPLAIN_BUILTINS = new Set([
  'eq/2',
  'neq/2',
  'neg/2',
  'abs/2',
  'sin/2',
  'cos/2',
  'asin/2',
  'acos/2',
  'rounded/2',
  'log/2',
  'add/3',
  'sub/3',
  'mul/3',
  'div/3',
  'mod/3',
  'max/3',
  'min/3',
  'pow/3',
  'lt/2',
  'gt/2',
  'le/2',
  'ge/2',
  'local_time/1',
  'difference/3',
  'smallest_divisor_from/3',
  'atom_concat/3',
  'str_concat/3',
  'contains/2',
  'not_contains/2',
  'matches/2',
  'not_matches/2',
  'append/3',
  'nth0/3',
  'set_nth0/4',
  'rest/2',
  'not_member/2',
  'sort/2',
  'reverse/2',
  'length/2',
  'is_list/1',
]);


export function explainProof(program, goal, options = {}) {
  const out = [];
  const maxDepth = options.maxDepth ?? 256;
  const registry = options.registry ?? createDefaultRegistry();
  const env = options.env ?? new Env();
  const ok = explainGoal(program, goal, env, 0, maxDepth, out, registry) != null;
  return { ok, text: out.join('') };
}

function explainGoal(program, goal, env, depth, maxDepth, out, registry) {
  if (depth > maxDepth) {
    explainLine(out, depth, '... depth limit reached');
    return null;
  }

  explainLine(out, depth, `need ${termToString(goal, env, true)}`);

  if (goal.type === COMPOUND && goal.name === ',' && goal.arity === 2) {
    return explainGoals(program, flattenConjunction(goal), env, depth + 1, maxDepth, out, registry);
  }

  const det = tryDeterministicBuiltin(program, goal, env, registry);
  if (det.handled) {
    if (det.env) {
      explainLine(out, depth + 1, `builtin ${termToString(goal, det.env, true)} succeeds`);
      return det.env;
    }
    explainLine(out, depth + 1, 'builtin fails');
    return null;
  }

  if (goal.type !== COMPOUND) {
    explainLine(out, depth + 1, 'no rule can prove this non-compound goal');
    return null;
  }

  const group = program.findGroup(goal.name, goal.arity);
  if (!group) {
    explainLine(out, depth + 1, `no clauses for ${goal.name}/${goal.arity}`);
    return null;
  }

  const candidates = selectClauseCandidates(group, goal, env);
  for (const pass of [candidates.primary, candidates.fallback]) {
    for (const clause of pass) {
      const id = nextFreshId();
      const freshHead = freshTerm(clause.head, id);
      const freshBody = clause.body.map((term) => freshTerm(term, id));
      const next = env.clone();
      if (!unify(goal, freshHead, next)) continue;

      const substitutions = collectClauseSubstitutions(clause, freshHead, freshBody);
      const originalHeadText = termToString(clause.head, env, true);
      const clauseNumber = (clause.index ?? 0) + 1;

      if (freshBody.length === 0) {
        explainLine(out, depth + 1, `because fact #${clauseNumber}: ${originalHeadText}`);
        explainSubstitutions(substitutions, next, depth + 2, out);
        return next;
      }

      const originalBodyText = goalsToString(clause.body, env);
      explainLine(out, depth + 1, `because rule #${clauseNumber}: ${originalHeadText} :- ${originalBodyText}`);
      explainSubstitutions(substitutions, next, depth + 2, out);

      const provedEnv = explainGoals(program, freshBody, next, depth + 2, maxDepth, out, registry);
      if (provedEnv) {
        explainLine(out, depth + 1, `therefore ${termToString(goal, provedEnv, true)}`);
        return provedEnv;
      }
    }
  }

  explainLine(out, depth + 1, 'no matching clause succeeds');
  return null;
}

function explainGoals(program, goals, env, depth, maxDepth, out, registry) {
  let current = env.clone();
  for (const goal of goals) {
    const det = tryDeterministicBuiltin(program, goal, current, registry);
    if (det.handled && det.env) {
      explainLine(out, depth, `builtin ${termToString(goal, det.env, true)} succeeds`);
      current = det.env;
      continue;
    }

    const next = explainGoal(program, goal, current, depth, maxDepth, out, registry);
    if (!next) return null;
    current = next;
  }
  return current;
}

function tryDeterministicBuiltin(program, goal, env, registry) {
  if (goal.type !== COMPOUND) return { handled: false, env: null };
  const signature = `${goal.name}/${goal.arity}`;
  if (!DETERMINISTIC_EXPLAIN_BUILTINS.has(signature)) return { handled: false, env: null };

  const def = registry.get(goal.name, goal.arity);
  if (!def) return { handled: false, env: null };

  const solver = new Solver(program, { registry, solutionLimit: 1 });
  for (const next of def.handler({ solver, goal, env })) {
    return { handled: true, env: next.clone ? next.clone() : next };
  }
  return { handled: true, env: null };
}

function goalsToString(goals, env) {
  return goals.map((goal) => termToString(goal, env, true)).join(', ');
}

function explainLine(out, depth, text) {
  out.push(`${'  '.repeat(depth)}${text}\n`);
}

function collectClauseSubstitutions(clause, freshHead, freshBody) {
  const substitutions = [];
  const seen = new Set();
  collectSubstitutions(clause.head, freshHead, substitutions, seen);
  for (let i = 0; i < clause.body.length && i < freshBody.length; i++) {
    collectSubstitutions(clause.body[i], freshBody[i], substitutions, seen);
  }
  return substitutions;
}

function collectSubstitutions(original, fresh, substitutions, seen) {
  if (!original || !fresh) return;
  if (original.type === VAR) {
    if (!seen.has(original.name)) {
      seen.add(original.name);
      substitutions.push({ name: original.name, fresh });
    }
    return;
  }
  if (original.type !== COMPOUND || fresh.type !== COMPOUND) return;
  const arity = Math.min(original.arity, fresh.arity);
  for (let i = 0; i < arity; i++) collectSubstitutions(original.args[i], fresh.args[i], substitutions, seen);
}

function explainSubstitutions(substitutions, env, depth, out) {
  for (const substitution of substitutions) {
    const resolved = deref(substitution.fresh, env);
    if (resolved.type === VAR) continue;
    explainLine(out, depth, `where ${substitution.name} = ${termToString(substitution.fresh, env, true)}`);
  }
}
