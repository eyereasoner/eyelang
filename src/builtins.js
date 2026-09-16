import { array, scalar, list, ground, instantiate, unify, termKey, format } from './terms.js';

export const builtinRelations = new Set(['range/3', 'length/2', 'sort/2']);

export function requireGround(value, context) {
  if (!ground(value)) throw new Error(`${context} needs bound inputs; got ${format(value)}`);
  return value;
}

function numeric(term) {
  requireGround(term, 'Arithmetic');
  if (term.kind !== 'bigint' && term.kind !== 'number') throw new Error(`Expected a number; got ${format(term)}`);
  return term.value;
}

function asFloat(value) {
  if (typeof value === 'bigint' && (value > BigInt(Number.MAX_SAFE_INTEGER) || value < BigInt(Number.MIN_SAFE_INTEGER))) {
    throw new Error('Integer is too large for implicit floating-point conversion');
  }
  return Number(value);
}

function checked(value) {
  if (typeof value === 'number' && !Number.isFinite(value)) throw new Error('Arithmetic result is not finite');
  return scalar(value);
}

function binary(op, a, b) {
  let left = numeric(a), right = numeric(b);
  if ((op === '/' || op === '//' || op === '%') && (right === 0n || right === 0)) throw new Error('Division by zero');
  if (op === '//') {
    if (typeof left !== 'bigint' || typeof right !== 'bigint') throw new Error('// requires integer operands');
    return scalar(left / right);
  }
  if (op === '/' || typeof left !== typeof right) { left = asFloat(left); right = asFloat(right); }
  switch (op) {
    case '+': return checked(left + right);
    case '-': return checked(left - right);
    case '*': return checked(left * right);
    case '/': return checked(left / right);
    case '%': return checked(left % right);
    default: throw new Error(`Unknown arithmetic operator ${op}`);
  }
}

export function evaluate(expression, env) {
  switch (expression.type) {
    case 'value': return requireGround(instantiate(expression.term, env), 'Expression');
    case 'unary': return checked(-numeric(evaluate(expression.arg, env)));
    case 'binary': return binary(expression.op, evaluate(expression.left, env), evaluate(expression.right, env));
    case 'function': {
      const args = expression.args.map(x => evaluate(x, env));
      const name = expression.name;
      if (args.length !== 1) throw new Error(`${name} expects one argument`);
      if (name === 'abs') {
        const value = numeric(args[0]);
        return checked(value < 0 ? -value : value);
      }
      if (name === 'sqrt') return checked(Math.sqrt(asFloat(numeric(args[0]))));
      if (name === 'count') return scalar(BigInt(array(args[0]).length));
      if (['sum', 'min', 'max'].includes(name)) {
        const values = array(args[0]);
        if (name === 'sum') return values.reduce((a, b) => binary('+', a, b), scalar(0n));
        if (!values.length) throw new Error(`${name} requires a nonempty list`);
        values.forEach(numeric);
        return values.reduce((a, b) => (name === 'min' ? a.value <= b.value : a.value >= b.value) ? a : b);
      }
      throw new Error(`Unknown expression function ${name}`);
    }
    default: throw new Error(`Unknown expression ${expression.type}`);
  }
}

export function compare(op, left, right, env) {
  if (op === '=') return unify(left, right, env);
  left = requireGround(instantiate(left, env), op);
  right = requireGround(instantiate(right, env), op);
  if (op === '!=') return termKey(left) !== termKey(right);
  const a = numeric(left), b = numeric(right);
  return op === '<' ? a < b : op === '>' ? a > b : op === '<=' ? a <= b : a >= b;
}

export function* builtin(call, env, tick) {
  const args = call.args.map(x => instantiate(x, env));
  if (call.name === 'range') {
    const [low, high] = args.slice(0, 2).map(numeric);
    if (typeof low !== 'bigint' || typeof high !== 'bigint') throw new Error('range needs integer bounds');
    for (let i = low; i <= high; i++) {
      tick();
      const branch = new Map(env);
      if (unify(call.args[2], scalar(i), branch)) yield branch;
    }
  } else if (call.name === 'length') {
    const values = array(requireGround(args[0], 'length'));
    const branch = new Map(env);
    if (unify(call.args[1], scalar(BigInt(values.length)), branch)) yield branch;
  } else if (call.name === 'sort') {
    const values = array(requireGround(args[0], 'sort'));
    const unique = [...new Map(values.map(value => [termKey(value), value])).values()];
    unique.sort((a, b) => {
      const aNumeric = ['bigint', 'number'].includes(a.kind);
      const bNumeric = ['bigint', 'number'].includes(b.kind);
      if (aNumeric !== bNumeric) return aNumeric ? -1 : 1;
      if (aNumeric && bNumeric) {
        if (a.value < b.value) return -1;
        if (a.value > b.value) return 1;
      }
      const left = termKey(a), right = termKey(b);
      return left < right ? -1 : left > right ? 1 : 0;
    });
    const branch = new Map(env);
    if (unify(call.args[1], list(unique), branch)) yield branch;
  }
}
