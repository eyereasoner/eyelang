// SEE proof output helpers.
// The --why printer replays a successful goal against the program and emits
// ordinary SEE facts.  Explanations are therefore both human-readable and
// machine-readable: answers are facts, and explanations are facts too.
import { COMPOUND, Env, Term, VAR, deref, flattenConjunction, freshTerm, isCons, isEmptyList, termToString, unify } from './term.js';
import { selectClauseCandidates } from './program.js';
import { createDefaultRegistry } from './builtins/registry.js';
import { Solver, nextFreshId } from './solver.js';

export function whyProof(program, goal, options = {}) {
  const maxDepth = options.maxDepth ?? 256;
  const registry = options.registry ?? createDefaultRegistry();
  const env = options.env ?? new Env();
  const proof = proveGoal(program, goal, env, 0, maxDepth, registry);
  if (!proof) return { ok: false, text: '' };
  return { ok: true, text: renderWhyFacts(goal, proof.node, proof.env) };
}

// Kept for embedders that already import explainProof.  The CLI exposes machine-readable output through whyProof.
export function explainProof(program, goal, options = {}) {
  return whyProof(program, goal, options);
}

function proveGoal(program, goal, env, depth, maxDepth, registry) {
  if (depth > maxDepth) return null;

  if (goal.type === COMPOUND && goal.name === ',' && goal.arity === 2) {
    const proved = proveGoals(program, flattenConjunction(goal), env, depth + 1, maxDepth, registry);
    if (!proved) return null;
    return {
      env: proved.env,
      node: {
        goal: resolveForProof(goal, proved.env),
        method: 'conjunction',
        sourceHead: null,
        sourceBody: flattenConjunction(goal),
        bindings: [],
        children: proved.children,
      },
    };
  }

  const builtin = tryBuiltin(program, goal, env, registry);
  if (builtin.handled) {
    if (!builtin.env) return null;
    return {
      env: builtin.env,
      node: {
        goal: resolveForProof(goal, builtin.env),
        method: `builtin(${quoteAtomText(goal.type === COMPOUND ? goal.name : 'goal')}, ${goal.type === COMPOUND ? goal.arity : 0})`,
        sourceHead: resolveForProof(goal, builtin.env),
        sourceBody: [],
        bindings: [],
        children: builtinChildren(program, goal, builtin.env, depth + 1, maxDepth, registry),
      },
    };
  }

  if (goal.type !== COMPOUND) return null;

  const group = program.findGroup(goal.name, goal.arity);
  if (!group) return null;

  const candidates = selectClauseCandidates(group, goal, env);
  for (const pass of [candidates.primary, candidates.fallback]) {
    for (const clause of pass) {
      const id = nextFreshId();
      const freshHead = freshTerm(clause.head, id);
      const freshBody = clause.body.map((term) => freshTerm(term, id));
      const next = env.clone();
      if (!unify(goal, freshHead, next)) continue;

      const substitutions = collectClauseSubstitutions(clause, freshHead, freshBody);
      const bindings = resolvedSubstitutions(substitutions, next);
      const clauseNumber = (clause.index ?? 0) + 1;

      if (freshBody.length === 0) {
        return {
          env: next,
          node: {
            goal: resolveForProof(goal, next),
            method: `fact(${clauseNumber})`,
            sourceHead: clause.head,
            sourceBody: [],
            bindings,
            children: [],
          },
        };
      }

      const proved = proveGoals(program, freshBody, next, depth + 1, maxDepth, registry);
      if (!proved) continue;

      return {
        env: proved.env,
        node: {
          goal: resolveForProof(goal, proved.env),
          method: `rule(${clauseNumber})`,
          sourceHead: clause.head,
          sourceBody: clause.body,
          bindings: resolvedSubstitutions(substitutions, proved.env),
          children: proved.children,
        },
      };
    }
  }

  return null;
}

function proveGoals(program, goals, env, depth, maxDepth, registry) {
  let current = env.clone();
  const children = [];
  for (const goal of goals) {
    const proved = proveGoal(program, goal, current, depth, maxDepth, registry);
    if (!proved) return null;
    current = proved.env;
    children.push(proved.node);
  }
  return { env: current, children };
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

function builtinChildren(program, goal, env, depth, maxDepth, registry) {
  if (goal.type !== COMPOUND) return [];
  if (goal.name === 'once' && goal.arity === 1) {
    const proved = proveGoal(program, goal.args[0], env.clone(), depth, maxDepth, registry);
    return proved ? [proved.node] : [];
  }
  return [];
}

function renderWhyFacts(answerGoal, rootNode, env) {
  const out = [];
  const ids = new Map();
  assignIds(rootNode, ids, { next: 1 });
  const answer = termToString(resolveForProof(answerGoal, env), new Env(), true);
  out.push(`why(${answer}, ${ids.get(rootNode)}).\n`);
  renderNode(rootNode, ids, out);
  return out.join('');
}

function assignIds(node, ids, state) {
  ids.set(node, `p${state.next++}`);
  for (const child of node.children) assignIds(child, ids, state);
}

function renderNode(node, ids, out) {
  const id = ids.get(node);
  const goal = termToString(node.goal, new Env(), true);
  out.push(`proof(${id}, ${goal}, ${node.method}).\n`);
  if (node.sourceHead) {
    out.push(`source(${id}, ${termToProofSource(node.sourceHead)}, ${listToProofSource(node.sourceBody)}).\n`);
  } else if (node.sourceBody.length !== 0) {
    out.push(`source(${id}, ${goal}, ${listToProofSource(node.sourceBody)}).\n`);
  }
  for (const binding of node.bindings) {
    out.push(`binding(${id}, ${quoteString(binding.name)}, ${termToString(binding.value, new Env(), true)}).\n`);
  }
  for (const child of node.children) out.push(`uses(${id}, ${ids.get(child)}).\n`);
  for (const child of node.children) renderNode(child, ids, out);
}

function listToProofSource(terms) {
  return `[${terms.map(termToProofSource).join(', ')}]`;
}

function termToProofSource(term) {
  const resolved = deref(term, new Env());
  if (resolved.type === VAR) return `v(${quoteString(originalVariableName(resolved.name))})`;
  if (isCons(resolved) || isEmptyList(resolved)) return listTermToProofSource(resolved);
  if (resolved.type !== COMPOUND) return termToString(resolved, new Env(), true);
  return `${quoteCompoundName(resolved.name)}(${resolved.args.map(termToProofSource).join(', ')})`;
}

function listTermToProofSource(term) {
  const parts = [];
  let cursor = term;
  while (isCons(cursor)) {
    parts.push(termToProofSource(cursor.args[0]));
    cursor = deref(cursor.args[1], new Env());
  }
  if (isEmptyList(cursor)) return `[${parts.join(', ')}]`;
  if (parts.length) return `[${parts.join(', ')} | ${termToProofSource(cursor)}]`;
  return '[]';
}

function quoteCompoundName(name) {
  return termToString({ type: 'atom', name: String(name), args: [] }, new Env(), true);
}

function quoteAtomText(text) {
  return quoteCompoundName(text);
}

function quoteString(value) {
  return JSON.stringify(String(value));
}

function originalVariableName(name) {
  return String(name).replace(/#\d+$/, '');
}

function resolveForProof(term, env) {
  const resolved = deref(term, env);
  if (resolved.type === VAR) return new Term(VAR, originalVariableName(resolved.name), []);
  return new Term(resolved.type, resolved.name, resolved.args.map((arg) => resolveForProof(arg, env)));
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

function resolvedSubstitutions(substitutions, env) {
  const out = [];
  for (const substitution of substitutions) {
    const resolved = deref(substitution.fresh, env);
    if (resolved.type === VAR) continue;
    out.push({ name: substitution.name, value: resolveForProof(substitution.fresh, env) });
  }
  return out;
}
