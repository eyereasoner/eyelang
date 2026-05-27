// Proof explanation printer.
// It replays a successful goal against the program and emits a Prolog-readable
// explanation: the derived answer is a fact, and every explanation line is a
// Prolog comment.  Builtins are handled through the same registry metadata as
// the solver, so optimized builtin predicates explain themselves instead of
// being reported as missing user clauses.
import { COMPOUND, Env, VAR, deref, flattenConjunction, freshTerm, termToString, unify } from './term.js';
import { selectClauseCandidates } from './program.js';
import { createDefaultRegistry } from './builtins/registry.js';
import { Solver, nextFreshId } from './solver.js';

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

  const builtin = tryBuiltin(program, goal, env, registry);
  if (builtin.handled) {
    if (builtin.env) {
      explainLine(out, depth + 1, `because builtin ${signature(goal)}: ${termToString(goal, builtin.env, true)}`);
      explainBuiltinDetails(program, goal, builtin.env, depth + 2, maxDepth, out, registry);
      explainLine(out, depth + 1, `therefore ${termToString(goal, builtin.env, true)}`);
      return builtin.env;
    }
    explainLine(out, depth + 1, `builtin ${signature(goal)} fails`);
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
    const next = explainGoal(program, goal, current, depth, maxDepth, out, registry);
    if (!next) return null;
    current = next;
  }
  return current;
}

function tryBuiltin(program, goal, env, registry) {
  if (goal.type !== COMPOUND) return { handled: false, env: null };
  const def = registry.get(goal.name, goal.arity);
  if (!def) return { handled: false, env: null };

  const solver = new Solver(program, { registry, solutionLimit: 1 });
  if (!builtinIsUsedForGoal(def, solver, goal, env)) return { handled: false, env: null };
  for (const next of def.handler({ solver, goal, env })) {
    return { handled: true, env: next.clone ? next.clone() : next };
  }
  return { handled: true, env: null };
}

function builtinIsUsedForGoal(def, solver, goal, env) {
  if (typeof def.shouldUse === 'function' && !def.shouldUse({ solver, goal, env })) return false;
  if (typeof def.ready !== 'function') return true;
  if (def.ready(goal, env)) return true;
  return !def.fallbackWhenNotReady;
}

function explainBuiltinDetails(program, goal, env, depth, maxDepth, out, registry) {
  if (goal.type !== COMPOUND) return;

  if (goal.name === 'not' && goal.arity === 1) {
    explainLine(out, depth, `negation-as-failure: ${termToString(goal.args[0], env, true)} has no proof`);
    return;
  }

  if (goal.name === 'once' && goal.arity === 1) {
    explainLine(out, depth, 'once/1 keeps the first proof of its argument');
    explainGoal(program, goal.args[0], env.clone(), depth, maxDepth, out, registry);
    return;
  }

  if (goal.name === 'findall' && goal.arity === 3) {
    explainLine(out, depth, 'findall/3 collects all template instances proved by its goal');
    return;
  }

  if (goal.name === 'countall' && goal.arity === 2) {
    explainLine(out, depth, 'countall/2 counts all proofs of its goal');
    return;
  }

  if (goal.name === 'sumall' && goal.arity === 3) {
    explainLine(out, depth, 'sumall/3 sums all template values proved by its goal');
    return;
  }

  if ((goal.name === 'aggregate_min' || goal.name === 'aggregate_max') && goal.arity === 5) {
    explainLine(out, depth, `${goal.name}/5 selects the best proof according to its score argument`);
    return;
  }
}

function goalsToString(goals, env) {
  return goals.map((goal) => termToString(goal, env, true)).join(', ');
}

function explainLine(out, depth, text) {
  out.push(`% ${'  '.repeat(depth)}${text}\n`);
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

function signature(goal) {
  if (goal.type !== COMPOUND) return 'goal';
  return `${goal.name}/${goal.arity}`;
}
