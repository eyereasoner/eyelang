import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';
import { assertAnswers } from './helpers.js';

// SPEC §3 (numeric terms) and §5 (arithmetic and builtins).

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
  ['+2^2', '4'], ['10-3-2', '5'], ['24//3//2', '4'],
  ['abs(-2.5)', '2.5'], ['sign(0)', '0'], ['sign(2.5)', '1'],
  ['tan(0)', '0.0'], ['asin(0)', '0.0'], ['acos(1)', '0.0'], ['atan(0)', '0.0'],
  ['min(1,1.0)', '1'], ['min(1.0,1)', '1.0'], ['max(1,1.0)', '1'], ['max(1.0,1)', '1.0'],
  [String.raw`-1 /\ (1<<100)`, '1267650600228229401496703205376'],
  [String.raw`1 \/ 2 /\ 2`, '2'], ['13 xor 6', '11'],
]) {
  test(`§5 arithmetic: ${expression}`, () => assert.equal(result(expression), `Value = ${expected}.`));
}

test('numeric types, unification, non-unifiability, and arithmetic equality are distinct', () => {
  assertAnswers(run(String.raw`
    ?- 1 = 1.0. ?- 1 =:= 1.0. ?- 1 =\= 2.
    ?- '1' = 1. ?- 'same' = same. ?- "same" = same.
    ?- 3 is 6/2. ?- 3.0 is 6/2. ?- 3 =:= 6/2.
    ?- a \= b. ?- X \= a.
  `), ['false.', 'true.', 'true.', 'false.', 'true.', 'false.',
    'false.', 'true.', 'true.', 'true.', 'false.']);
});

test('numeric comparison preserves large integer operands', () => {
  assertAnswers(run('?- 1000000000000000000001 > 1e21. ?- 1000000000000000000001 =:= 1e21. ?- 2 =< 3, 3 >= 2.'), ['true.', 'false.', 'true.']);
});

test('huge integer rounding does not convert to binary64', () => {
  const huge = '9'.repeat(400);
  for (const fn of ['abs', 'floor', 'ceiling', 'round', 'truncate']) assert.equal(result(`${fn}(${huge})`), `Value = ${huge}.`);
  assert.throws(() => result(`atan(${huge})`), /finite real/);
  assert.equal(result(`max(${huge},1e308)`), `Value = ${huge}.`);
});

for (const [expression, error] of [
  ['1/0', /divide by zero/], ['1//0', /divide by zero/], ['1 mod 0', /divide by zero/],
  ['1 div 0', /divide by zero/], ['1 rem 0', /divide by zero/],
  ['sqrt(-1)', /finite real/], ['log(0)', /finite real/], ['exp(1000)', /finite real/],
  ['1e308*1e308', /finite real/], ['asin(2)', /finite real/], ['3.5//2', /integer/],
  ['1<<(-1)', /nonnegative/], ['sin(orange)', /number/], ['unknown(2)', /function: unknown\/1/],
  ['X+1', /unbound/], ['"7"+1', /number/],
  ['[7]+1', /number/], ['gcd(2.0,1)', /integer/], ['1<<1.0', /integer/],
  ['angle(0,-1)', /function: angle\/2/], ['unknown(1,2)', /function: unknown\/2/], ['unknown(1,2,3)', /function: unknown\/3/],
]) {
  test(`invalid arithmetic is specific: ${expression}`, () => assert.throws(() => result(expression), error));
}

test('integer ranges use ordinary recursive clauses with exact arithmetic', () => {
  const source = `
    :- table between/3.
    between(Low, High, Low) :- Low =< High.
    between(Low, High, Value) :- Low < High, Next is Low + 1, between(Next, High, Value).
  `;
  assertAnswers(run(source + `
    ?- between(9007199254740993,9007199254740995,N).
    ?- between(1,3,2). ?- between(3,1,N). ?- between(1,3,4).
    ?- \\+ between(1,3,4). ?- \\+ between(1,3,2).
    ?- aggregate_all(sum(V), between(1,3,V), Sum).
  `), ['N = 9007199254740993.\nN = 9007199254740994.\nN = 9007199254740995.',
    'true.', 'false.', 'false.', 'true.', 'false.', 'Sum = 6.']);
  const output = run(source + '?- between(1,3,2). ?- why. :- assertion(between(1,3,2)).');
  assert.match(output[1], /rule \d+: between/);
  assert.match(output[1], /Next = 2/);
  assert.throws(() => run(source + '?- between(Low,3,N).'), /unbound/);
});

test('§5: ** requires parentheses when chained, while ^ associates to the right', () => {
  assert.throws(() => result('2**3**2'), /Parenthesize chained \*\*/);
  assert.equal(result('(2**3)**2'), 'Value = 64.0.');
  assert.equal(result('2**(3**2)'), 'Value = 512.0.');
});

test('§3 and §5: integer and real terms stay distinct without numeric coercion', () => {
  assertAnswers(run(`
    ?- Value = 1.0. ?- Value = 1e0. ?- Value = 1.
    ?- 9007199254740993 = 9007199254740992.0.
    ?- 9007199254740993 > 9007199254740992.0.
    ?- pi = 3.141592653589793. ?- pi =:= 3.141592653589793.
    ?- true. ?- false. ?- fail.
  `), ['Value = 1.0.', 'Value = 1.0.', 'Value = 1.', 'false.', 'true.', 'false.', 'true.', 'true.', 'false.', 'false.']);
  assert.throws(() => run('?- Value = 1e309.'), /real literal must be finite/);
});

test('§5: non-unifiability does not retain trial bindings', () => {
  assertAnswers(run(String.raw`
    ?- pair(X, a) \= pair(b, c), X = d.
    ?- pair(X, a) \= pair(b, a).
  `), ['X = d.', 'false.']);
});

test('§5: ordering is lexicographic UTF-16 for bound homogeneous atoms or strings', () => {
  assertAnswers(run(`
    ?- '😀' @< '\uE000'. ?- "😀" @< "\uE000".
    ?- a @=< a. ?- b @> a. ?- b @>= b.
    ?- "a" @=< "a". ?- "b" @> "a". ?- "b" @>= "b".
  `), Array(8).fill('true.'));
  for (const source of ['?- X @< a.', '?- 1 @< 2.', '?- [a] @< [b].']) {
    assert.throws(() => run(source), /two bound atoms or two bound strings/);
  }
  assert.throws(() => run('?- contains_text("a", Part).'), /two bound strings/);
});

test('string and atom ordering and case-insensitive text containment are explicit', () => {
  assertAnswers(run('?- "2026-01-01" @< "2026-02-01". ?- a @< b. ?- contains_text("Diabetes", "BET").'), ['true.', 'true.', 'true.']);
  assert.throws(() => run('?- a @< "b".'), /two bound atoms or two bound strings/);
  assert.throws(() => run('?- "a" < "b".'), /number/);
  assert.throws(() => run('?- contains_text(a,"a").'), /bound strings/);
});

test('identity operators are outside the supported goal syntax', () => {
  for (const operator of ['==', '\\==']) {
    assert.throws(() => run(`?- a ${operator} a.`), /Line 1:/);
  }
});
