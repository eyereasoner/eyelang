import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../src/language.js';

const result = expression => run(`?- Value is ${expression}.`)[0];
for (const [expression, expected] of [
  ['2+3*4', '14'], ['(2+3)*4', '20'], ['2^3^2', '512'], ['-2^2', '-4'], ['(-2)^2', '4'],
  ['2^(-3)', '0.125'], ['2**3', '8.0'], ['9/3', '3.0'], ['9//3', '3'],
  ['9007199254740993*3', '27021597764222979'], ['27021597764222979//3', '9007199254740993'],
  ['2^100', '1267650600228229401496703205376'],
  ['-7//3', '-2'], ['-7 div 3', '-3'], ['-7 rem 3', '-1'], ['-7 mod 3', '2'],
  ['7 div -3', '-3'], ['7 mod -3', '-2'], ['gcd(-42,30)', '6'], ['gcd(0,0)', '0'],
  ['abs(-9007199254740993)', '9007199254740993'], ['sign(-9007199254740993)', '-1'],
  ['floor(-2.5)', '-3'], ['ceiling(-2.5)', '-2'], ['round(-2.5)', '-3'], ['round(2.5)', '3'],
  ['round(0.49999999999999994)', '0'], ['round(-0.49999999999999994)', '0'],
  ['truncate(-2.5)', '-2'], ['float_integer_part(-2.5)', '-2.0'], ['float_fractional_part(-2.5)', '-0.5'],
  ['min(1000000000000000000001,1e21)', '1e+21'], ['max(1000000000000000000001,1e21)', '1000000000000000000001'],
  [String.raw`13 /\ 6`, '4'], [String.raw`13 \/ 6`, '15'], ['xor(13,6)', '11'],
  [String.raw`\13`, '-14'], ['1<<100', '1267650600228229401496703205376'], ['-7>>1', '-4'],
  ['sqrt(9)', '3.0'], ['sin(0)+cos(0)', '1.0'], ['log(exp(2))', '2.0'],
  ['atan2(0,-1)', String(Math.PI)], ['pi', String(Math.PI)], ['e', String(Math.E)],
]) {
  test(`Prolog arithmetic: ${expression}`, () => assert.equal(result(expression), `Value = ${expected}.`));
}

test('numeric types, unification, identity, non-unifiability, and arithmetic equality are distinct', () => {
  assert.deepEqual(run(String.raw`
    ?- 1 = 1.0. ?- 1 =:= 1.0. ?- 1 == 1.0. ?- 1 =\= 2.
    ?- '1' = 1. ?- 'same' = same. ?- "same" = same.
    ?- 3 is 6/2. ?- 3.0 is 6/2. ?- 3 =:= 6/2.
    ?- a \= b. ?- X \= a. ?- _X == _X. ?- X \== Y, X=a, Y=b.
  `), ['false.', 'true.', 'false.', 'true.', 'false.', 'true.', 'false.',
    'false.', 'true.', 'true.', 'true.', 'false.', 'true.', 'X = a, Y = b.']);
});

test('numeric comparison preserves large integer operands', () => {
  assert.deepEqual(run('?- 1000000000000000000001 > 1e21. ?- 1000000000000000000001 =:= 1e21. ?- 2 =< 3, 3 >= 2.'), ['true.', 'false.', 'true.']);
});

test('huge integer rounding does not convert to binary64', () => {
  const huge = '9'.repeat(400);
  for (const fn of ['abs', 'floor', 'ceiling', 'round', 'truncate']) assert.equal(result(`${fn}(${huge})`), `Value = ${huge}.`);
  assert.throws(() => result(`atan(${huge})`), /finite real/);
  assert.equal(result(`max(${huge},1e308)`), `Value = ${huge}.`);
});

for (const [expression, error] of [
  ['1/0', /divide by zero/], ['1//0', /divide by zero/], ['1 mod 0', /divide by zero/],
  ['sqrt(-1)', /finite real/], ['log(0)', /finite real/], ['exp(1000)', /finite real/],
  ['1e308*1e308', /finite real/], ['asin(2)', /finite real/], ['3.5//2', /integer/],
  ['1<<(-1)', /nonnegative/], ['sin(orange)', /number/], ['unknown(2)', /function: unknown\/1/],
  ['X+1', /unbound/], ['"7"+1', /number/],
]) {
  test(`invalid arithmetic is specific: ${expression}`, () => assert.throws(() => result(expression), error));
}

test('between enumerates exact bounded integers and filters a supplied result', () => {
  assert.deepEqual(run('?- between(9007199254740993,9007199254740995,N). ?- between(1,3,2). ?- between(3,1,N). ?- between(1,3,4).'),
    ['N = 9007199254740993.\nN = 9007199254740994.\nN = 9007199254740995.', 'true.', 'false.', 'false.']);
  assert.throws(() => run('?- between(Low,3,N).'), /bound integer/);
});

test('string and atom ordering and case-insensitive text containment are explicit', () => {
  assert.deepEqual(run('?- "2026-01-01" @< "2026-02-01". ?- a @< b. ?- contains_text("Diabetes", "BET").'), ['true.', 'true.', 'true.']);
  assert.throws(() => run('?- a @< "b".'), /two bound atoms or two bound strings/);
  assert.throws(() => run('?- "a" < "b".'), /number/);
  assert.throws(() => run('?- contains_text(a,"a").'), /bound strings/);
});
