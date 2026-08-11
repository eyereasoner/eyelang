// Finite-domain kernel for library(clpz).
//
// This starts the attributed-variable functionality needed by a full CLP(Z)
// system without pretending that Trealla's complete global-constraint engine
// is already present. Constraint stores are immutable snapshots on Env branches,
// so ordinary Prolog backtracking also backtracks domain and relation postings.

import {
  ATOM, COMPOUND, NUMBER, VAR, atom, compound, deref, numberTerm,
  properListItems, unify, variable,
} from './term.js';
import { PrologError } from './iso.js';

const MAX_ENUMERATED_DOMAIN = 100000;

export const clpzBuiltins = {
  register(registry) {
    registry.add('eyeprolog__clpz_post', 1, postBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_in', 2, inBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_ins', 2, insBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_all_distinct', 1, allDistinctBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_nvalue', 2, nvalueBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_sum', 3, sumBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_scalar_product', 4, scalarProductBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_tuples_in', 2, tuplesInBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_lex_chain', 1, lexChainBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_serialized', 2, serializedBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_global_cardinality', 3, globalCardinalityBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_circuit', 1, circuitBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_chain', 2, chainBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_element', 3, elementBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_zcompare', 3, zcompareBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_labeling', 2, labelingBuiltin, { eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_fd_var', 1, fdVarBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_fd_inf', 2, fdBoundBuiltin('inf'), { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_fd_sup', 2, fdBoundBuiltin('sup'), { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_fd_size', 2, fdSizeBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_fd_dom', 2, fdDomBuiltin, { deterministic: true, eyePrologLibrary: true });
  },
};

function emptyStore() {
  return { domains: new Map(), constraints: [], globals: [] };
}

function storeOf(env) {
  return env._clpz ?? emptyStore();
}

function updateStore(env, change) {
  const current = storeOf(env);
  env._clpz = {
    domains: change.domains ?? current.domains,
    constraints: change.constraints ?? current.constraints,
    globals: change.globals ?? current.globals,
  };
}

function integerValue(term, env) {
  term = deref(term, env);
  if (term.type === VAR) return null;
  if (term.type !== NUMBER || !/^-?\d+$/.test(term.name)) {
    throw new PrologError('type_error(integer)', term);
  }
  return BigInt(term.name);
}

function expressionValue(term, env) {
  term = deref(term, env);
  if (term.type === VAR) return null;
  if (term.type === NUMBER) {
    if (!/^-?\d+$/.test(term.name)) throw new PrologError('type_error(integer)', term);
    return BigInt(term.name);
  }
  if (term.type !== COMPOUND) throw new PrologError('type_error(evaluable)', term);
  const values = term.args.map((arg) => expressionValue(arg, env));
  if (values.some((value) => value == null)) return null;
  const [a, b] = values;
  if (term.arity === 1 && term.name === '+') return a;
  if (term.arity === 1 && term.name === '-') return -a;
  if (term.arity === 1 && term.name === 'abs') return a < 0n ? -a : a;
  if (term.arity !== 2) throw new PrologError('type_error(evaluable)', term);
  if (term.name === '+') return a + b;
  if (term.name === '-') return a - b;
  if (term.name === '*') return a * b;
  if (term.name === 'min') return a <= b ? a : b;
  if (term.name === 'max') return a >= b ? a : b;
  if (['//', 'div', 'mod', 'rem'].includes(term.name) && b === 0n) {
    throw new PrologError('evaluation_error(zero_divisor)');
  }
  if (term.name === '//' || term.name === 'rem') return term.name === '//' ? a / b : a % b;
  if (term.name === 'div') {
    const q = a / b;
    const r = a % b;
    return r !== 0n && ((a < 0n) !== (b < 0n)) ? q - 1n : q;
  }
  if (term.name === 'mod') return ((a % b) + b) % b;
  if (term.name === '^' && b >= 0n) return a ** b;
  throw new PrologError('type_error(evaluable)', term);
}

function relationTruth(term, env) {
  term = deref(term, env);
  if (term.type === VAR) return null;
  if (term.type === NUMBER) {
    const value = integerValue(term, env);
    return value === 0n ? false : value === 1n ? true : null;
  }
  if (term.type !== COMPOUND) throw new PrologError('type_error(clpz_constraint)', term);
  const name = term.name;
  if (term.arity === 1 && name === '#\\') {
    const value = relationTruth(term.args[0], env);
    return value == null ? null : !value;
  }
  if (term.arity === 2 && ['#=', '#\\=', '#<', '#>', '#=<', '#>='].includes(name)) {
    const left = expressionValue(term.args[0], env);
    const right = expressionValue(term.args[1], env);
    if (left == null || right == null) return null;
    if (name === '#=') return left === right;
    if (name === '#\\=') return left !== right;
    if (name === '#<') return left < right;
    if (name === '#>') return left > right;
    if (name === '#=<') return left <= right;
    return left >= right;
  }
  if (term.arity === 2 && ['#/\\', '#\\/', '#\\', '#==>', '#<==', '#<==>'].includes(name)) {
    const left = relationTruth(term.args[0], env);
    const right = relationTruth(term.args[1], env);
    if (left == null || right == null) return null;
    if (name === '#/\\') return left && right;
    if (name === '#\\/') return left || right;
    if (name === '#\\') return left !== right;
    if (name === '#==>') return !left || right;
    if (name === '#<==') return left || !right;
    return left === right;
  }
  const value = expressionValue(term, env);
  return value == null ? null : value !== 0n;
}

function relationName(term, env) {
  term = deref(term, env);
  if (term.type !== ATOM || !['#=', '#\\=', '#<', '#>', '#=<', '#>='].includes(term.name)) {
    throw new PrologError('domain_error(clpz_relation)', term);
  }
  return term.name;
}

function relationTerm(name, left, right) {
  return compound(name, [left, right]);
}

function postTo(next, constraint) {
  const store = storeOf(next);
  updateStore(next, { constraints: [...store.constraints, constraint] });
  return propagate(next) && clpzStateConsistent(next);
}

function* postBuiltin({ goal, env }) {
  const next = env.clone();
  if (postTo(next, goal.args[0])) yield next;
}

function domainValues(term, env) {
  term = deref(term, env);
  if (term.type === COMPOUND && term.name === '\\/' && term.arity === 2) {
    const values = [...domainValues(term.args[0], env), ...domainValues(term.args[1], env)];
    return [...new Set(values.map(String))].map(BigInt).sort(compareBigInt);
  }
  if (term.type === COMPOUND && term.name === '..' && term.arity === 2) {
    const lower = expressionValue(term.args[0], env);
    const upper = expressionValue(term.args[1], env);
    if (lower == null || upper == null) throw new PrologError('instantiation_error');
    if (upper < lower) return [];
    if (upper - lower + 1n > BigInt(MAX_ENUMERATED_DOMAIN)) {
      throw new PrologError('representation_error(clpz_domain)');
    }
    const values = [];
    for (let value = lower; value <= upper; value++) values.push(value);
    return values;
  }
  const value = integerValue(term, env);
  if (value == null) throw new PrologError('instantiation_error');
  return [value];
}

function compareBigInt(a, b) {
  return a < b ? -1 : a > b ? 1 : 0;
}

function rootVariableName(term, env) {
  term = deref(term, env);
  return term.type === VAR ? term.name : null;
}

function domainsForRoot(root, env) {
  const domains = [];
  for (const [name, values] of storeOf(env).domains) {
    if (rootVariableName(variable(name), env) === root) domains.push(values);
  }
  return domains;
}

function intersectValues(left, right) {
  const allowed = new Set(right.map(String));
  return left.filter((value) => allowed.has(String(value)));
}

function domainForRoot(root, env) {
  const domains = domainsForRoot(root, env);
  if (domains.length === 0) return null;
  return domains.slice(1).reduce(intersectValues, domains[0]);
}

function constrainTermDomain(next, term, values) {
  const result = narrowTermDomain(next, term, values);
  return result.ok && clpzStateConsistent(next);
}

function narrowTermDomain(next, term, values) {
  const resolved = deref(term, next);
  if (resolved.type === NUMBER) {
    const value = integerValue(resolved, next);
    return { ok: values.some((candidate) => candidate === value), changed: false };
  }
  if (resolved.type !== VAR) throw new PrologError('type_error(integer)', resolved);
  const existing = domainForRoot(resolved.name, next);
  const narrowed = existing == null ? values : intersectValues(existing, values);
  if (narrowed.length === 0) return { ok: false, changed: false };
  const changed = existing == null || existing.length !== narrowed.length ||
    existing.some((value, index) => value !== narrowed[index]);
  if (!changed) return { ok: true, changed: false };
  const domains = new Map(storeOf(next).domains);
  domains.set(resolved.name, narrowed);
  updateStore(next, { domains });
  if (narrowed.length === 1 && !unify(resolved, numberTerm(narrowed[0].toString()), next)) {
    return { ok: false, changed: false };
  }
  return { ok: true, changed: true };
}

function* inBuiltin({ goal, env }) {
  const next = env.clone();
  if (constrainTermDomain(next, goal.args[0], domainValues(goal.args[1], next))) yield next;
}

function* insBuiltin({ goal, env }) {
  const items = properListItems(goal.args[0], env);
  if (items == null) throw new PrologError('type_error(list)', deref(goal.args[0], env));
  const values = domainValues(goal.args[1], env);
  const next = env.clone();
  for (const item of items) if (!constrainTermDomain(next, item, values)) return;
  yield next;
}

function addGlobal(next, global) {
  const store = storeOf(next);
  updateStore(next, { globals: [...store.globals, global] });
  return propagate(next) && clpzStateConsistent(next);
}

function listArgument(term, env) {
  const items = properListItems(term, env);
  if (items == null) throw new PrologError('type_error(list)', deref(term, env));
  return items;
}

function nestedListArgument(term, env) {
  return listArgument(term, env).map((item) => listArgument(item, env));
}

function integerListArgument(term, env) {
  return listArgument(term, env).map((item) => {
    const value = integerValue(item, env);
    if (value == null) throw new PrologError('instantiation_error');
    return value;
  });
}

function integerRange(lower, upper) {
  const values = [];
  for (let value = BigInt(lower); value <= BigInt(upper); value++) values.push(value);
  return values;
}

function* allDistinctBuiltin({ goal, env }) {
  const next = env.clone();
  if (addGlobal(next, { kind: 'allDistinct', terms: listArgument(goal.args[0], env) })) yield next;
}

function* nvalueBuiltin({ goal, env }) {
  const terms = listArgument(goal.args[1], env);
  const next = env.clone();
  if (!constrainTermDomain(next, goal.args[0], integerRange(terms.length === 0 ? 0 : 1, terms.length))) return;
  if (addGlobal(next, { kind: 'nvalue', count: goal.args[0], terms })) yield next;
}

function* sumBuiltin({ goal, env }) {
  const next = env.clone();
  const relation = relationName(goal.args[1], env);
  if (addGlobal(next, { kind: 'sum', terms: listArgument(goal.args[0], env), relation, value: goal.args[2] })) yield next;
}

function* scalarProductBuiltin({ goal, env }) {
  const coefficients = listArgument(goal.args[0], env);
  const terms = listArgument(goal.args[1], env);
  if (coefficients.length !== terms.length) throw new PrologError('domain_error(same_length)');
  for (const coefficient of coefficients) integerValue(coefficient, env);
  const next = env.clone();
  const relation = relationName(goal.args[2], env);
  if (addGlobal(next, { kind: 'scalarProduct', coefficients, terms, relation, value: goal.args[3] })) yield next;
}

function* tuplesInBuiltin({ goal, env }) {
  const tuples = nestedListArgument(goal.args[0], env);
  const relation = nestedListArgument(goal.args[1], env).map((row) => row.map((item) => {
    const value = integerValue(item, env);
    if (value == null) throw new PrologError('instantiation_error');
    return value;
  }));
  const next = env.clone();
  if (addGlobal(next, { kind: 'tuplesIn', tuples, relation })) yield next;
}

function* lexChainBuiltin({ goal, env }) {
  const lists = nestedListArgument(goal.args[0], env);
  if (lists.some((list) => list.length !== (lists[0]?.length ?? 0))) return;
  const next = env.clone();
  if (addGlobal(next, { kind: 'lexChain', lists })) yield next;
}

function* serializedBuiltin({ goal, env }) {
  const starts = listArgument(goal.args[0], env);
  const durations = integerListArgument(goal.args[1], env);
  if (starts.length !== durations.length) throw new PrologError('domain_error(same_length)');
  if (durations.some((duration) => duration < 0n)) throw new PrologError('domain_error(not_less_than_zero)');
  const next = env.clone();
  if (addGlobal(next, { kind: 'serialized', starts, durations })) yield next;
}

function gccPairs(term, env) {
  const pairs = listArgument(term, env).map((pair) => {
    const resolved = deref(pair, env);
    if (resolved.type !== COMPOUND || resolved.name !== '-' || resolved.arity !== 2) {
      throw new PrologError('domain_error(gcc_pair)', resolved);
    }
    const key = integerValue(resolved.args[0], env);
    if (key == null) throw new PrologError('instantiation_error');
    return { key, count: resolved.args[1] };
  });
  const keys = new Set(pairs.map(({ key }) => key.toString()));
  if (keys.size !== pairs.length) throw new PrologError('domain_error(gcc_unique_key_pairs)', deref(term, env));
  return pairs;
}

function gccOptions(term, env, rowCount, columnCount) {
  let cost = null;
  let matrix = null;
  for (const option of listArgument(term, env)) {
    const resolved = deref(option, env);
    if (resolved.type === COMPOUND && resolved.name === 'consistency' && resolved.arity === 1 &&
        deref(resolved.args[0], env).type === ATOM && deref(resolved.args[0], env).name === 'value') continue;
    if (resolved.type === COMPOUND && resolved.name === 'cost' && resolved.arity === 2 && cost == null) {
      cost = resolved.args[0];
      matrix = nestedListArgument(resolved.args[1], env).map((row) => row.map((item) => {
        const value = integerValue(item, env);
        if (value == null) throw new PrologError('instantiation_error');
        return value;
      }));
      if (matrix.length !== rowCount || matrix.some((row) => row.length !== columnCount)) {
        throw new PrologError('domain_error(gcc_cost_matrix)', resolved.args[1]);
      }
      continue;
    }
    throw new PrologError('domain_error(global_cardinality_option)', resolved);
  }
  return { cost, matrix };
}

function* globalCardinalityBuiltin({ goal, env }) {
  const terms = listArgument(goal.args[0], env);
  const pairs = gccPairs(goal.args[1], env);
  const options = gccOptions(goal.args[2], env, terms.length, pairs.length);
  const keys = pairs.map(({ key }) => key).sort(compareBigInt);
  const next = env.clone();
  for (const term of terms) if (!constrainTermDomain(next, term, keys)) return;
  for (const { count } of pairs) if (!constrainTermDomain(next, count, integerRange(0, terms.length))) return;
  if (addGlobal(next, { kind: 'globalCardinality', terms, pairs, ...options })) yield next;
}

function* circuitBuiltin({ goal, env }) {
  const terms = listArgument(goal.args[0], env);
  const next = env.clone();
  if (terms.length > 0) {
    const values = integerRange(1, terms.length);
    for (const term of terms) if (!constrainTermDomain(next, term, values)) return;
  }
  if (addGlobal(next, { kind: 'circuit', terms })) yield next;
}

function* chainBuiltin({ goal, env }) {
  const terms = listArgument(goal.args[1], env);
  const relation = relationName(goal.args[0], env);
  if (relation === '#\\=') throw new PrologError('domain_error(chain_relation)', deref(goal.args[0], env));
  const next = env.clone();
  if (addGlobal(next, { kind: 'chain', terms, relation })) yield next;
}

function* elementBuiltin({ goal, env }) {
  const next = env.clone();
  if (addGlobal(next, { kind: 'element', index: goal.args[0], terms: listArgument(goal.args[1], env), value: goal.args[2] })) yield next;
}

function* zcompareBuiltin({ goal, env }) {
  const next = env.clone();
  if (addGlobal(next, { kind: 'zcompare', order: goal.args[0], left: goal.args[1], right: goal.args[2] })) yield next;
}

function tupleCandidates(tuple, relation, env) {
  return relation.filter((row) => row.length === tuple.length && row.every((candidate, index) => {
    const resolved = deref(tuple[index], env);
    if (resolved.type === NUMBER) return integerValue(resolved, env) === candidate;
    if (resolved.type !== VAR) throw new PrologError('type_error(integer)', resolved);
    const domain = domainForRoot(resolved.name, env);
    return domain == null || domain.some((value) => value === candidate);
  }));
}

function lexPairTruth(left, right, env) {
  if (left.length !== right.length) return false;
  for (let index = 0; index < left.length; index++) {
    const a = expressionValue(left[index], env);
    const b = expressionValue(right[index], env);
    if (a == null || b == null) return true;
    if (a < b) return true;
    if (a > b) return false;
  }
  return true;
}

function circuitTruth(terms, env) {
  if (terms.length === 0) return true;
  const values = terms.map((term) => expressionValue(term, env));
  const seenValues = new Set();
  for (let index = 0; index < values.length; index++) {
    const value = values[index];
    if (value == null) continue;
    if (value < 1n || value > BigInt(values.length)) return false;
    if (values.length > 1 && value === BigInt(index + 1)) return false;
    const key = value.toString();
    if (seenValues.has(key)) return false;
    seenValues.add(key);
  }
  if (values.some((value) => value == null)) return true;
  const visited = new Set();
  let node = 1;
  for (let step = 0; step < values.length; step++) {
    if (visited.has(node)) return false;
    visited.add(node);
    node = Number(values[node - 1]);
  }
  return node === 1 && visited.size === values.length;
}

function orderAtom(term, env) {
  const resolved = deref(term, env);
  if (resolved.type === VAR) return null;
  if (resolved.type !== ATOM || !['<', '=', '>'].includes(resolved.name)) {
    throw new PrologError('domain_error(order)', resolved);
  }
  return resolved.name;
}

function comparedOrder(left, right) {
  return left < right ? '<' : left > right ? '>' : '=';
}

function globalTruth(global, env) {
  if (global.kind === 'allDistinct') {
    const seen = new Set();
    for (const term of global.terms) {
      const value = expressionValue(term, env);
      if (value == null) continue;
      const key = String(value);
      if (seen.has(key)) return false;
      seen.add(key);
    }
    return true;
  }
  if (global.kind === 'nvalue') {
    const values = global.terms.map((term) => expressionValue(term, env));
    const known = new Set(values.filter((value) => value != null).map(String));
    const count = expressionValue(global.count, env);
    if (count == null) return true;
    if (count < BigInt(known.size) || count > BigInt(known.size + values.filter((value) => value == null).length)) return false;
    return values.some((value) => value == null) || count === BigInt(known.size);
  }
  if (global.kind === 'sum') {
    const values = global.terms.map((term) => expressionValue(term, env));
    const right = expressionValue(global.value, env);
    if (right == null || values.some((value) => value == null)) return true;
    const total = values.reduce((sum, value) => sum + value, 0n);
    return relationTruth(relationTerm(global.relation, numberTerm(total.toString()), global.value), env) !== false;
  }
  if (global.kind === 'scalarProduct') {
    const values = global.terms.map((term) => expressionValue(term, env));
    const right = expressionValue(global.value, env);
    if (right == null || values.some((value) => value == null)) return true;
    let total = 0n;
    for (let i = 0; i < values.length; i++) total += integerValue(global.coefficients[i], env) * values[i];
    return relationTruth(relationTerm(global.relation, numberTerm(total.toString()), global.value), env) !== false;
  }
  if (global.kind === 'tuplesIn') {
    return global.tuples.every((tuple) => tupleCandidates(tuple, global.relation, env).length > 0);
  }
  if (global.kind === 'lexChain') {
    for (let index = 1; index < global.lists.length; index++) {
      if (!lexPairTruth(global.lists[index - 1], global.lists[index], env)) return false;
    }
    return true;
  }
  if (global.kind === 'serialized') {
    for (let left = 0; left < global.starts.length; left++) {
      const a = expressionValue(global.starts[left], env);
      if (a == null) continue;
      for (let right = left + 1; right < global.starts.length; right++) {
        const b = expressionValue(global.starts[right], env);
        if (b == null) continue;
        if (a + global.durations[left] > b && b + global.durations[right] > a) return false;
      }
    }
    return true;
  }
  if (global.kind === 'globalCardinality') {
    const values = global.terms.map((term) => expressionValue(term, env));
    for (const { key, count: countTerm } of global.pairs) {
      const known = values.filter((value) => value === key).length;
      const possible = global.terms.filter((term, index) => {
        if (values[index] != null) return false;
        const resolved = deref(term, env);
        const domain = resolved.type === VAR ? domainForRoot(resolved.name, env) : null;
        return domain == null || domain.some((value) => value === key);
      }).length;
      const count = expressionValue(countTerm, env);
      if (count != null && (count < BigInt(known) || count > BigInt(known + possible))) return false;
      if (possible === 0 && count != null && count !== BigInt(known)) return false;
    }
    if (global.cost != null && values.every((value) => value != null)) {
      let total = 0n;
      for (let row = 0; row < values.length; row++) {
        const column = global.pairs.findIndex(({ key }) => key === values[row]);
        if (column < 0) return false;
        total += global.matrix[row][column];
      }
      const cost = expressionValue(global.cost, env);
      if (cost != null && cost !== total) return false;
    }
    return true;
  }
  if (global.kind === 'circuit') return circuitTruth(global.terms, env);
  if (global.kind === 'chain') {
    for (let i = 1; i < global.terms.length; i++) {
      const truth = relationTruth(relationTerm(global.relation, global.terms[i - 1], global.terms[i]), env);
      if (truth === false) return false;
    }
    return true;
  }
  if (global.kind === 'element') {
    const index = expressionValue(global.index, env);
    if (index == null) return true;
    if (index < 1n || index > BigInt(global.terms.length)) return false;
    const selected = global.terms[Number(index - 1n)];
    const left = expressionValue(selected, env);
    const right = expressionValue(global.value, env);
    return left == null || right == null || left === right;
  }
  if (global.kind === 'zcompare') {
    const order = orderAtom(global.order, env);
    const left = expressionValue(global.left, env);
    const right = expressionValue(global.right, env);
    return order == null || left == null || right == null || order === comparedOrder(left, right);
  }
  return true;
}

function bindExpressionEquality(left, right, env) {
  const resolvedLeft = deref(left, env);
  const resolvedRight = deref(right, env);
  if (resolvedLeft.type === VAR) {
    const value = expressionValue(resolvedRight, env);
    if (value == null) return { ok: true, changed: false };
    return { ok: unify(resolvedLeft, numberTerm(value.toString()), env), changed: true };
  }
  if (resolvedRight.type === VAR) {
    const value = expressionValue(resolvedLeft, env);
    if (value == null) return { ok: true, changed: false };
    return { ok: unify(resolvedRight, numberTerm(value.toString()), env), changed: true };
  }
  return { ok: true, changed: false };
}

function linearExpression(term, env) {
  term = deref(term, env);
  if (term.type === VAR) return { constant: 0n, coefficients: new Map([[term.name, 1n]]) };
  if (term.type === NUMBER) return { constant: integerValue(term, env), coefficients: new Map() };
  if (term.type !== COMPOUND) return null;
  if (term.arity === 1 && ['+', '-'].includes(term.name)) {
    const value = linearExpression(term.args[0], env);
    if (!value) return null;
    return term.name === '+' ? value : scaleLinear(value, -1n);
  }
  if (term.arity !== 2 || !['+', '-', '*'].includes(term.name)) return null;
  const left = linearExpression(term.args[0], env);
  const right = linearExpression(term.args[1], env);
  if (!left || !right) return null;
  if (term.name === '+') return addLinear(left, right);
  if (term.name === '-') return addLinear(left, scaleLinear(right, -1n));
  if (left.coefficients.size === 0) return scaleLinear(right, left.constant);
  if (right.coefficients.size === 0) return scaleLinear(left, right.constant);
  return null;
}

function addLinear(left, right) {
  const coefficients = new Map(left.coefficients);
  for (const [name, coefficient] of right.coefficients) {
    const total = (coefficients.get(name) ?? 0n) + coefficient;
    if (total === 0n) coefficients.delete(name);
    else coefficients.set(name, total);
  }
  return { constant: left.constant + right.constant, coefficients };
}

function scaleLinear(value, factor) {
  return {
    constant: value.constant * factor,
    coefficients: new Map([...value.coefficients].map(([name, coefficient]) => [name, coefficient * factor])),
  };
}

function bindLinearEquality(left, right, env) {
  const linearLeft = linearExpression(left, env);
  const linearRight = linearExpression(right, env);
  if (!linearLeft || !linearRight) return { ok: true, changed: false };
  const difference = addLinear(linearLeft, scaleLinear(linearRight, -1n));
  if (difference.coefficients.size === 0) return { ok: difference.constant === 0n, changed: false };
  if (difference.coefficients.size !== 1) return { ok: true, changed: false };
  const [[name, coefficient]] = difference.coefficients;
  if (coefficient === 0n || (-difference.constant) % coefficient !== 0n) return { ok: false, changed: false };
  const value = (-difference.constant) / coefficient;
  return { ok: unify(variable(name), numberTerm(value.toString()), env), changed: true };
}

function propagate(env) {
  const store = env._clpz;
  if (!store) return true;
  let changed;
  do {
    changed = false;
    for (const constraint of store.constraints) {
      const resolved = deref(constraint, env);
      if (resolved.type === COMPOUND && resolved.name === '#=' && resolved.arity === 2) {
        const result = bindLinearEquality(resolved.args[0], resolved.args[1], env);
        if (!result.ok) return false;
        changed ||= result.changed;
      }
    }
    for (const global of store.globals) {
      if (global.kind === 'nvalue') {
        const values = global.terms.map((term) => expressionValue(term, env));
        const known = new Set(values.filter((value) => value != null).map(String));
        const unresolved = values.filter((value) => value == null).length;
        const result = narrowTermDomain(env, global.count, integerRange(known.size, known.size + unresolved));
        if (!result.ok) return false;
        changed ||= result.changed;
      } else if (global.kind === 'tuplesIn') {
        for (const tuple of global.tuples) {
          const candidates = tupleCandidates(tuple, global.relation, env);
          if (candidates.length === 0) return false;
          for (let index = 0; index < tuple.length; index++) {
            const values = [...new Set(candidates.map((row) => row[index].toString()))].map(BigInt).sort(compareBigInt);
            const result = narrowTermDomain(env, tuple[index], values);
            if (!result.ok) return false;
            changed ||= result.changed;
          }
        }
      } else if (global.kind === 'globalCardinality') {
        const values = global.terms.map((term) => expressionValue(term, env));
        for (const { key, count: countTerm } of global.pairs) {
          const known = values.filter((value) => value === key).length;
          const possibleTerms = global.terms.filter((term, index) => {
            if (values[index] != null) return false;
            const resolved = deref(term, env);
            const domain = resolved.type === VAR ? domainForRoot(resolved.name, env) : null;
            return domain == null || domain.some((value) => value === key);
          });
          const countResult = narrowTermDomain(env, countTerm, integerRange(known, known + possibleTerms.length));
          if (!countResult.ok) return false;
          changed ||= countResult.changed;
          const count = expressionValue(countTerm, env);
          if (count === BigInt(known)) {
            for (const term of possibleTerms) {
              const resolved = deref(term, env);
              if (resolved.type !== VAR) continue;
              const domain = domainForRoot(resolved.name, env);
              const result = narrowTermDomain(env, term, domain.filter((value) => value !== key));
              if (!result.ok) return false;
              changed ||= result.changed;
            }
          } else if (count === BigInt(known + possibleTerms.length)) {
            for (const term of possibleTerms) {
              const result = narrowTermDomain(env, term, [key]);
              if (!result.ok) return false;
              changed ||= result.changed;
            }
          }
        }
        if (global.cost != null && values.every((value) => value != null)) {
          let total = 0n;
          for (let row = 0; row < values.length; row++) {
            const column = global.pairs.findIndex(({ key }) => key === values[row]);
            if (column < 0) return false;
            total += global.matrix[row][column];
          }
          const result = bindExpressionEquality(global.cost, numberTerm(total.toString()), env);
          if (!result.ok) return false;
          changed ||= result.changed;
        }
      } else if (global.kind === 'zcompare') {
        const order = orderAtom(global.order, env);
        const left = expressionValue(global.left, env);
        const right = expressionValue(global.right, env);
        if (left != null && right != null) {
          const resolvedOrder = atom(comparedOrder(left, right));
          if (order == null) {
            if (!unify(global.order, resolvedOrder, env)) return false;
            changed = true;
          } else if (order !== resolvedOrder.name) return false;
        } else if (order === '=') {
          const result = bindLinearEquality(global.left, global.right, env);
          if (!result.ok) return false;
          changed ||= result.changed;
        }
      } else if (global.kind === 'element') {
        const index = expressionValue(global.index, env);
        if (index != null) {
          if (index < 1n || index > BigInt(global.terms.length)) return false;
          const left = deref(global.terms[Number(index - 1n)], env);
          const right = deref(global.value, env);
          if (left.type !== VAR || right.type !== VAR || left.name !== right.name) {
            const leftWasVar = left.type === VAR;
            const rightWasVar = right.type === VAR;
            if (!unify(left, right, env)) return false;
            changed ||= leftWasVar || rightWasVar;
          }
        }
      } else if (global.kind === 'sum' && global.relation === '#=') {
        const values = global.terms.map((term) => expressionValue(term, env));
        if (!values.some((value) => value == null)) {
          const total = values.reduce((sum, value) => sum + value, 0n);
          const result = bindExpressionEquality(global.value, numberTerm(total.toString()), env);
          if (!result.ok) return false;
          changed ||= result.changed;
        }
      } else if (global.kind === 'scalarProduct' && global.relation === '#=') {
        const values = global.terms.map((term) => expressionValue(term, env));
        if (!values.some((value) => value == null)) {
          let total = 0n;
          for (let i = 0; i < values.length; i++) total += integerValue(global.coefficients[i], env) * values[i];
          const result = bindExpressionEquality(global.value, numberTerm(total.toString()), env);
          if (!result.ok) return false;
          changed ||= result.changed;
        }
      }
    }
  } while (changed);
  return true;
}

export function clpzStateConsistent(env) {
  const store = env._clpz;
  if (!store) return true;
  for (const [name, values] of store.domains) {
    const resolved = deref(variable(name), env);
    if (resolved.type === VAR) continue;
    const value = integerValue(resolved, env);
    if (!values.some((candidate) => candidate === value)) return false;
  }
  for (const constraint of store.constraints) {
    if (relationTruth(constraint, env) === false) return false;
  }
  return store.globals.every((global) => globalTruth(global, env));
}

function parseLabelingOptions(term, env) {
  const options = listArgument(term, env);
  let variableOrder = 'leftmost';
  let valueOrder = 'up';
  for (const option of options) {
    const resolved = deref(option, env);
    if (resolved.type !== ATOM) throw new PrologError('domain_error(labeling_option)', resolved);
    if (resolved.name === 'ff' || resolved.name === 'leftmost') variableOrder = resolved.name;
    else if (resolved.name === 'up' || resolved.name === 'down') valueOrder = resolved.name;
    else throw new PrologError('domain_error(labeling_option)', resolved);
  }
  return { variableOrder, valueOrder };
}

function unresolvedLabelVariables(terms, env) {
  const variables = [];
  const seen = new Set();
  for (const term of terms) {
    const resolved = deref(term, env);
    if (resolved.type === NUMBER) {
      integerValue(resolved, env);
      continue;
    }
    if (resolved.type !== VAR) throw new PrologError('type_error(integer)', resolved);
    if (!seen.has(resolved.name)) {
      seen.add(resolved.name);
      variables.push(resolved);
    }
  }
  return variables;
}

function chooseVariable(variables, env, variableOrder) {
  if (variableOrder !== 'ff') return { index: 0, values: domainForRoot(variables[0].name, env) };
  let selected = null;
  for (let index = 0; index < variables.length; index++) {
    const values = domainForRoot(variables[index].name, env);
    if (values == null) throw new PrologError('instantiation_error');
    if (selected == null || values.length < selected.values.length) selected = { index, values };
  }
  return selected;
}

function* enumerate(variables, env, options) {
  variables = unresolvedLabelVariables(variables, env);
  if (variables.length === 0) {
    if (clpzStateConsistent(env)) yield env;
    return;
  }
  const selected = chooseVariable(variables, env, options.variableOrder);
  if (selected.values == null) throw new PrologError('instantiation_error');
  const values = options.valueOrder === 'down' ? [...selected.values].reverse() : selected.values;
  const variableTerm = variables[selected.index];
  const rest = [...variables.slice(0, selected.index), ...variables.slice(selected.index + 1)];
  for (const value of values) {
    const next = env.clone();
    if (!unify(variableTerm, numberTerm(value.toString()), next) ||
        !propagate(next) || !clpzStateConsistent(next)) continue;
    yield* enumerate(rest, next, options);
  }
}

function* labelingBuiltin({ goal, env }) {
  const options = parseLabelingOptions(goal.args[0], env);
  const variables = listArgument(goal.args[1], env);
  yield* enumerate(variables, env.clone(), options);
}

function domainInfo(term, env) {
  const resolved = deref(term, env);
  if (resolved.type === NUMBER) {
    const value = integerValue(resolved, env);
    return { resolved, values: [value] };
  }
  if (resolved.type !== VAR) throw new PrologError('type_error(integer)', resolved);
  return { resolved, values: domainForRoot(resolved.name, env) };
}

function* fdVarBuiltin({ goal, env }) {
  const info = domainInfo(goal.args[0], env);
  if (info.resolved.type === VAR && info.values != null) yield env;
}

function fdBoundBuiltin(which) {
  return function* ({ goal, env }) {
    const info = domainInfo(goal.args[0], env);
    if (info.values == null) return;
    const value = which === 'inf' ? info.values[0] : info.values[info.values.length - 1];
    const next = env.clone();
    if (unify(goal.args[1], numberTerm(value.toString()), next)) yield next;
  };
}

function* fdSizeBuiltin({ goal, env }) {
  const info = domainInfo(goal.args[0], env);
  if (info.values == null) return;
  const next = env.clone();
  if (unify(goal.args[1], numberTerm(String(info.values.length)), next)) yield next;
}

function valuesToDomain(values) {
  const runs = [];
  for (const value of values) {
    const last = runs[runs.length - 1];
    if (last && value === last[1] + 1n) last[1] = value;
    else runs.push([value, value]);
  }
  const terms = runs.map(([lower, upper]) => lower === upper
    ? numberTerm(lower.toString())
    : compound('..', [numberTerm(lower.toString()), numberTerm(upper.toString())]));
  return terms.reduce((left, right) => compound('\\/', [left, right]));
}

function* fdDomBuiltin({ goal, env }) {
  const info = domainInfo(goal.args[0], env);
  if (info.values == null || info.values.length === 0) return;
  const next = env.clone();
  if (unify(goal.args[1], valuesToDomain(info.values), next)) yield next;
}
