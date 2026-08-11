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
    registry.add('eyeprolog__clpz_sum', 3, sumBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_scalar_product', 4, scalarProductBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_chain', 2, chainBuiltin, { deterministic: true, eyePrologLibrary: true });
    registry.add('eyeprolog__clpz_element', 3, elementBuiltin, { deterministic: true, eyePrologLibrary: true });
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
  const resolved = deref(term, next);
  if (resolved.type === NUMBER) {
    const value = integerValue(resolved, next);
    return values.some((candidate) => candidate === value);
  }
  if (resolved.type !== VAR) throw new PrologError('type_error(integer)', resolved);
  const existing = domainForRoot(resolved.name, next);
  const narrowed = existing == null ? values : intersectValues(existing, values);
  if (narrowed.length === 0) return false;
  const domains = new Map(storeOf(next).domains);
  domains.set(resolved.name, narrowed);
  updateStore(next, { domains });
  if (narrowed.length === 1 && !unify(resolved, numberTerm(narrowed[0].toString()), next)) return false;
  return clpzStateConsistent(next);
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

function* allDistinctBuiltin({ goal, env }) {
  const next = env.clone();
  if (addGlobal(next, { kind: 'allDistinct', terms: listArgument(goal.args[0], env) })) yield next;
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
      if (global.kind === 'element') {
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
