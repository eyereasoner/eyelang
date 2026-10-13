import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { parse, run } from '../src/language.js';

function result(expression) {
  return run(`the result of demo is ${expression} if 1 is equal to 1. what is the result of demo?`)[0]
    .slice('the result of demo is '.length, -1);
}

test('the arithmetic example answers all queries, explains division and passes its checks', () => {
  const source = readFileSync(new URL('../examples/arithmetic.eye', import.meta.url), 'utf8');
  const answers = run(source);
  assert.deepEqual(answers.slice(0, 6), [
    'the absolute of magnitude is 9007199254740993.',
    'the result of division is [-2, -3, -1, 2].',
    'the result of rounding is [-3, -2, -2, -2, -2, -0.5].',
    'the result of extrema is [1e+21, 1000000000000000000001].',
    'the result of gcd is 6.',
    'the result of bits is [4, 15, 11, -14, 104, 1].',
  ]);
  assert.match(answers[10], /-7 quotient 3 makes -2\./);
  assert.match(answers[10], /-7 floor quotient 3 makes -3\./);
  assert.match(answers[10], /-7 remainder 3 makes -1\./);
  assert.match(answers[10], /-7 modulo 3 makes 2\./);
  assert.equal(answers.slice(11).length, 14);
  assert.ok(answers.slice(11).every(block => block.startsWith('check passed:')));
  assert.throws(() => run(source.replace('the inputs of division is [-7, 3].', 'the inputs of division is [-7, -3].')),
    /Check failed: the result of division/);
});

test('absolute value, sign, rounding and parts preserve arbitrarily large canonical integers', () => {
  const huge = '9'.repeat(400);
  for (const input of ['0', '9007199254740993', huge]) {
    assert.equal(result(`absolute value of ${input}`), input);
    assert.equal(result(`absolute value of -${input}`), input);
    assert.equal(result(`sign of ${input}`), input === '0' ? '0' : '1');
    assert.equal(result(`sign of -${input}`), input === '0' ? '0' : '-1');
    for (const operation of ['floor', 'ceiling', 'round', 'truncate', 'integer part']) {
      assert.equal(result(`${operation} of ${input}`), input);
      assert.equal(result(`${operation} of -${input}`), input === '0' ? '0' : `-${input}`);
    }
    assert.equal(result(`fractional part of ${input}`), '0');
  }
});

test('floor, ceiling, round and truncate specify positive, negative and halfway behavior', () => {
  for (const [value, floor, ceiling, round, truncate] of [
    ['2.5', '2', '3', '3', '2'], ['-2.5', '-3', '-2', '-2', '-2'],
    ['2.75', '2', '3', '3', '2'], ['-2.75', '-3', '-2', '-3', '-2'],
    ['0.5', '0', '1', '1', '0'], ['-0.5', '-1', '0', '0', '0'],
  ]) {
    for (const [operation, expected] of Object.entries({ floor, ceiling, round, truncate })) {
      assert.equal(result(`${operation} of ${value}`), expected, `${operation}(${value})`);
    }
  }
  assert.equal(result('floor of 1e21'), '1000000000000000000000');
  assert.equal(result('integer part of -2.75'), '-2');
  assert.equal(result('fractional part of -2.75'), '-0.75');
  assert.equal(result('fractional part of 2.75'), '0.75');
});

test('quotients, remainders and modulo obey independent division identities across signs', () => {
  for (const a of [-17, -9, -7, -1, 0, 1, 7, 9, 17]) {
    for (const b of [-5, -3, -1, 1, 3, 5]) {
      const quotient = BigInt(result(`${a} quotient ${b}`));
      const floor = BigInt(result(`${a} floor quotient ${b}`));
      const remainder = BigInt(result(`${a} remainder ${b}`));
      const modulo = BigInt(result(`${a} modulo ${b}`));
      assert.equal(quotient, BigInt(Math.trunc(a / b)));
      assert.equal(floor, BigInt(Math.floor(a / b)));
      assert.equal(BigInt(a), quotient * BigInt(b) + remainder);
      assert.equal(BigInt(a), floor * BigInt(b) + modulo);
      assert.ok(remainder === 0n || (remainder < 0n) === (a < 0));
      assert.ok(modulo === 0n || (modulo < 0n) === (b < 0));
      assert.ok(remainder > -BigInt(Math.abs(b)) && remainder < BigInt(Math.abs(b)));
      assert.ok(modulo > -BigInt(Math.abs(b)) && modulo < BigInt(Math.abs(b)));
    }
  }
  assert.equal(result('900719925474099312345 quotient 10'), '90071992547409931234');
  assert.equal(result('900719925474099312345 remainder 10'), '5');
});

test('min and max preserve the selected value and compare huge integers with reals exactly', () => {
  const huge = '9'.repeat(400);
  for (const [a, b, minimum, maximum] of [
    ['9007199254740993', '9007199254740992.5', '9007199254740992', '9007199254740993'],
    ['1000000000000000000001', '1e21', '1e+21', '1000000000000000000001'],
    [huge, '1e308', '1e+308', huge],
    ['-7', '-2.5', '-7', '-2.5'],
  ]) {
    for (const [left, right] of [[a, b], [b, a]]) {
      assert.equal(result(`minimum of ${left} with ${right}`), minimum);
      assert.equal(result(`maximum of ${left} with ${right}`), maximum);
    }
  }
});

test('greatest common divisors are exact and nonnegative including the zero pair', () => {
  for (const [a, b, gcd] of [
    ['0', '0', '0'], ['0', '-42', '42'], ['-42', '30', '6'],
    ['90071992547409930', '270215977642229790', '90071992547409930'],
  ]) {
    assert.equal(result(`greatest common divisor of ${a} with ${b}`), gcd);
    assert.equal(result(`greatest common divisor of ${b} with ${a}`), gcd);
  }
});

test('bit operations use unbounded signed integers and arithmetic right shifts', () => {
  const huge = (1n << 200n) + 13n;
  const mask = (1n << 200n) + 6n;
  assert.equal(result(`bit intersection of ${huge} with ${mask}`), ((1n << 200n) + 4n).toString());
  assert.equal(result(`bit union of ${huge} with ${mask}`), ((1n << 200n) + 15n).toString());
  assert.equal(result(`bit xor of ${huge} with ${mask}`), '11');
  assert.equal(result('bit complement of 0'), '-1');
  assert.equal(result(`bit complement of ${huge}`), (-huge - 1n).toString());
  assert.equal(result('-7 shifted right by 1'), '-4');
  assert.equal(result('1 shifted left by 100'), '1267650600228229401496703205376');
  assert.equal(result('1 shifted left by 2 plus 1'), '8');
  assert.equal(result('(1 shifted left by 2) plus 1'), '5');
});

test('constants are explicit calculations and leave ordinary pi and e names intact', () => {
  assert.equal(result('constant pi'), '3.141592653589793');
  assert.equal(result('constant e'), '2.718281828459045');
  assert.equal(result('sine of constant pi'), String(Math.sin(Math.PI)));
  assert.equal(result('natural log of constant e'), '1');
  assert.equal(result('constant pi times 2'), String(Math.PI * 2));
  assert.deepEqual(run('pi is a name. e is a name. who is a name?'), ['pi is a name.\ne is a name.']);
  assert.throws(() => parse('the value of demo is constant pi.'), /facts give numbers directly/);
  assert.throws(() => parse('check that constant unknown is equal to 0.'), /Line 1:/);
});

test('tangent and arc tangent use radians and reject nonfinite integer conversions', () => {
  assert.equal(result('tangent of 0'), '0');
  assert.equal(result('arc tangent of 1'), '0.7853981633974483');
  assert.equal(result('arc tangent of -1'), '-0.7853981633974483');
  for (const input of ['-10', '-0.5', '0', '0.5', '10']) {
    const back = Number(result(`tangent of arc tangent of ${input}`));
    assert.ok(Math.abs(back - Number(input)) < 1e-12);
  }
  assert.throws(() => result(`arc tangent of ${'9'.repeat(400)}`), /finite real number/);
});

test('binary prefix functions compose without splitting rules or changing argument precedence', () => {
  assert.equal(result('minimum of 2 plus 3 with 7'), '5');
  assert.equal(result('minimum of 2 with 3 plus 4'), '6');
  assert.equal(result('minimum of 2 with (3 plus 4)'), '2');
  assert.equal(result('maximum of minimum of 2 with 7 with 3'), '3');
  assert.equal(result('greatest common divisor of 12 with 8 plus 1'), '5');
  assert.deepEqual(run(`
    the input of demo is [13, 6].
    if the input of ?case is [?a, ?b] and bit intersection of ?a with ?b is equal to 4
    then ?case is a match. who is a match?
  `), ['demo is a match.']);
});

test('new expressions work in backward heads, computed clues, checks and lists with complete reasons', () => {
  const output = run(`
    the magnitude of ?number is absolute value of ?number if ?number is less than 0.
    what is the magnitude of -9007199254740993? why?
    check that the magnitude of -9007199254740993 is 9007199254740993.
    check that -7 floor quotient 3 is equal to -3.
    check that [round of -1.5, constant pi, bit complement of 0] is equal to [-1, 3.141592653589793, -1].
  `);
  assert.equal(output[0], 'the magnitude of -9007199254740993 is 9007199254740993.');
  assert.match(output[1], /absolute value of -9007199254740993 makes 9007199254740993\./);
  assert.ok(output.slice(2).every(block => block.startsWith('check passed:')));
  const reason = run('the mask of demo is bit union of 4 with 2 if 1 is equal to 1. what is the mask of demo? why?')[1];
  assert.match(reason, /bit union of 4 with 2 makes 6\./);
});

test('ground calculated question arguments render concrete yes, unknown and absence answers', () => {
  assert.deepEqual(run(`
    the value of 3 is 5.
    is the value of 1 plus 2 equal to 5?
    is the value of 1 plus 2 equal to 6?
    is (1 plus 2) not a number? why?
    is the value of constant pi equal to 1?
  `).filter((_, i) => i !== 3), [
    'yes, the value of 3 is 5.', "I don't know whether the value of 3 is 6.",
    'yes, there is no evidence in this program that 3 is a number.',
    "I don't know whether the value of 3.141592653589793 is 1.",
  ]);
});

test('integer-only operations reject fractions, invalid shift counts and all zero divisors', () => {
  for (const expression of [
    '7 quotient 2.5', '7 floor quotient 2.5', '7 remainder 2.5', '7 modulo 2.5',
    'greatest common divisor of 7 with 2.5', 'bit intersection of 1.5 with 2',
    'bit union of 1 with 2.5', 'bit xor of 1 with 2.5', 'bit complement of 1.5',
    '1 shifted left by 0.5', '1 shifted right by 0.5',
  ]) assert.throws(() => result(expression), /whole number/);
  for (const operator of ['quotient', 'floor quotient', 'remainder', 'modulo']) {
    assert.throws(() => result(`7 ${operator} 0`), /divide by zero/);
  }
  for (const direction of ['left', 'right']) {
    assert.throws(() => result(`1 shifted ${direction} by -1`), /nonnegative/);
  }
  assert.throws(() => result('minimum of "1" with 2'), /only use numbers/);
  assert.throws(() => parse('if minimum of ?input with 1 is equal to 0 then demo is a match.'), /earlier clue/);
  assert.throws(() => parse('the result of demo is round of ?input if demo is a seed.'), /Find \?input/);
});
