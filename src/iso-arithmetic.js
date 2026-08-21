// ISO arithmetic evaluation and comparison semantics.
import {
  ATOM, COMPOUND, NUMBER, VAR, atom, compound, deref, isDecimalInteger,
  numberTerm, numberTextFromDouble, unify,
} from './term.js';
import { PrologError } from './errors.js';

function evaluate(term, env) {
  term = deref(term, env);
  if (term.type === VAR) throw new PrologError('instantiation_error');
  if (term.type === NUMBER) {
    if (isDecimalInteger(term.name)) return { integer: true, value: BigInt(term.name) };
    const value = Number(term.name);
    if (!Number.isFinite(value)) throw new PrologError('evaluation_error(float_overflow)');
    return { integer: false, value };
  }
  if (term.type === ATOM) {
    if (term.name === 'pi') return { integer: false, value: Math.PI };
    if (term.name === 'e') return { integer: false, value: Math.E };
  }
  if (term.type !== COMPOUND) throw new PrologError('type_error(evaluable)', term);
  const args = term.args.map((arg) => evaluate(arg, env));
  return evaluateOperation(term, args);
}
function evaluateOperation(term, args) {
  const name = term.name;
  const arity = term.arity;
  if (arity === 1 && (name === '+' || name === '-')) {
    return name === '+' ? args[0] : args[0].integer
      ? { integer: true, value: -args[0].value }
      : { integer: false, value: -args[0].value };
  }
  if (arity === 1 && name === '\\') {
    if (!args[0].integer) throw new PrologError('type_error(integer)', numericTerm(args[0]));
    return { integer: true, value: ~args[0].value };
  }
  if (arity === 1 && ['abs', 'sign', 'float', 'truncate', 'round', 'ceiling', 'floor',
    'float_integer_part', 'float_fractional_part',
    'sin', 'cos', 'atan', 'asin', 'acos', 'tan', 'exp', 'log', 'sqrt'].includes(name)) {
    const a = Number(args[0].value);
    if (name === 'abs' && args[0].integer) return { integer: true, value: args[0].value < 0n ? -args[0].value : args[0].value };
    if (name === 'sign' && args[0].integer) return { integer: true, value: args[0].value < 0n ? -1n : args[0].value > 0n ? 1n : 0n };
    if (name === 'truncate' || name === 'round' || name === 'ceiling' || name === 'floor') {
      const fn = name === 'truncate' ? Math.trunc : name === 'round' ? Math.round : name === 'ceiling' ? Math.ceil : Math.floor;
      return { integer: true, value: BigInt(fn(a)) };
    }
    if (name === 'float_integer_part' || name === 'float_fractional_part') {
      if (args[0].integer) throw new PrologError('type_error(float)', numericTerm(args[0]));
      const value = name === 'float_integer_part' ? Math.trunc(a) : a - Math.trunc(a);
      return { integer: false, value };
    }
    const fn = name === 'float' ? (x) => x : name === 'abs' ? Math.abs : name === 'sign' ? Math.sign : Math[name];
    const value = fn(a);
    if (Number.isNaN(value) || (name === 'log' && a === 0)) throw new PrologError('evaluation_error(undefined)');
    if (!Number.isFinite(value)) throw new PrologError('evaluation_error(float_overflow)');
    return { integer: false, value };
  }
  if (arity !== 2) throw new PrologError('type_error(evaluable)', compound('/', [atom(name), numberTerm(arity)]));
  const bothInteger = args[0].integer && args[1].integer;
  const a = args[0].value, b = args[1].value;
  if (['//', 'div', 'mod', 'rem', '/\\', '\\/', 'xor', '<<', '>>'].includes(name) && !bothInteger) {
    const invalid = !args[0].integer ? args[0] : args[1];
    throw new PrologError('type_error(integer)', numericTerm(invalid));
  }
  if (bothInteger && name === '^') {
    if (b >= 0n) return { integer: true, value: a ** b };
    if (a === 0n) throw new PrologError('evaluation_error(undefined)');
    if (a === 1n) return { integer: true, value: 1n };
    if (a === -1n) return { integer: true, value: (-b) % 2n === 0n ? 1n : -1n };
    // Corrigendum 3: the defined real result needs a floating-point base.
    throw new PrologError('type_error(float)', numericTerm(args[0]));
  }
  if (bothInteger && ['+', '-', '*', '//', 'div', 'mod', 'rem', '/\\', '\\/', 'xor', '<<', '>>'].includes(name)) {
    if ((name === '//' || name === 'div' || name === 'mod' || name === 'rem') && b === 0n) throw new PrologError('evaluation_error(zero_divisor)');
    if (name === '+') return { integer: true, value: a + b };
    if (name === '-') return { integer: true, value: a - b };
    if (name === '*') return { integer: true, value: a * b };
    if (name === '//') return { integer: true, value: a / b };
    if (name === 'div') {
      const quotient = a / b;
      const remainder = a % b;
      return { integer: true, value: remainder !== 0n && ((a < 0n) !== (b < 0n)) ? quotient - 1n : quotient };
    }
    if (name === 'rem') return { integer: true, value: a % b };
    if (name === 'mod') return { integer: true, value: ((a % b) + b) % b };
    if (name === '/\\') return { integer: true, value: a & b };
    if (name === '\\/') return { integer: true, value: a | b };
    if (name === 'xor') return { integer: true, value: a ^ b };
    if (name === '<<') return { integer: true, value: a << b };
    if (name === '>>') return { integer: true, value: a >> b };
  }
  const x = Number(a), y = Number(b);
  if ((!Number.isFinite(x) || !Number.isFinite(y)) && name !== 'max' && name !== 'min') {
    throw new PrologError('evaluation_error(float_overflow)');
  }
  if (name === '/' && y === 0) throw new PrologError('evaluation_error(zero_divisor)');
  let value;
  if (name === 'max' || name === 'min') {
    const cmp = compareArithmeticValues(args[0], args[1]);
    const chooseLeft = name === 'max' ? cmp >= 0 : cmp <= 0;
    return chooseLeft ? args[0] : args[1];
  }
  if (name === 'atan2') {
    if (x === 0 && y === 0) throw new PrologError('evaluation_error(undefined)');
    value = Math.atan2(x, y);
  }
  else if (name === '+') value = x + y;
  else if (name === '-') value = x - y;
  else if (name === '*') value = x * y;
  else if (name === '/') value = x / y;
  else if (name === '**' || name === '^') value = Math.pow(x, y);
  else throw new PrologError('type_error(evaluable)', compound('/', [atom(name), numberTerm(arity)]));
  if (Number.isNaN(value)) throw new PrologError('evaluation_error(undefined)');
  if (!Number.isFinite(value)) throw new PrologError('evaluation_error(float_overflow)');
  return { integer: false, value };
}
export function arithmeticValueTerm(value) {
  return value.integer ? numberTerm(value.value.toString()) : numberTerm(numberTextFromDouble(value.value));
}
function numericTerm(value) {
  return arithmeticValueTerm(value);
}
export function evaluateArithmetic(term, env) {
  return evaluate(term, env);
}
function compareIntegerToFloat(integerValue, floatValue) {
  if (!Number.isFinite(floatValue)) throw new PrologError('evaluation_error(float_overflow)');

  // Do not round an unbounded integer through JavaScript Number before a
  // mixed arithmetic comparison.  Every integral IEEE-754 double can be
  // converted back to the exact integer value it represents; fractional
  // doubles necessarily have magnitude below 2^53, so their truncation is
  // also exact.  This preserves mathematical ordering across the I/F boundary
  // (STC #50), e.g. 9007199254740993 > 9007199254740992.0.
  if (Number.isInteger(floatValue)) {
    const floatInteger = BigInt(floatValue);
    return integerValue < floatInteger ? -1 : integerValue > floatInteger ? 1 : 0;
  }

  const truncated = BigInt(Math.trunc(floatValue));
  if (integerValue < truncated) return -1;
  if (integerValue > truncated) return 1;
  return floatValue > 0 ? -1 : 1;
}

export function compareArithmeticValues(left, right) {
  const a = left.value;
  const b = right.value;
  if (left.integer && right.integer) return a < b ? -1 : a > b ? 1 : 0;
  if (left.integer) return compareIntegerToFloat(a, b);
  if (right.integer) return -compareIntegerToFloat(b, a);
  return a < b ? -1 : a > b ? 1 : 0;
}
export function* isBuiltin({ goal, env }) {
  const result = arithmeticValueTerm(evaluateArithmetic(goal.args[1], env));
  const next = env.clone();
  if (unify(goal.args[0], result, next)) yield next;
}
export function arithmeticComparison(test) {
  return function* ({ goal, env }) {
    const left = evaluateArithmetic(goal.args[0], env);
    const right = evaluateArithmetic(goal.args[1], env);
    const cmp = compareArithmeticValues(left, right);
    if (test(cmp)) yield env;
  };
}
