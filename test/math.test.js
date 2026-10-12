import test from 'node:test';
import assert from 'node:assert/strict';
import { parse, run } from '../src/language.js';

function result(expression) {
  const [answer] = run(`
    milo is a calculator.
    if first is a calculator then the result of first is ${expression}.
    what is the result of milo?
  `);
  return answer.slice('the result of milo is '.length, -1);
}

test('decimals and scientific notation remain inside sentences and preserve error lines', () => {
  assert.deepEqual(run(`
    the value of small is -1.25e-7.
    the value of whole is 2.0. the value of zero is -0.0.
    what is the value of small?
    what is the value of whole?
    what is the value of zero?
  `), ['the value of small is -1.25e-7.', 'the value of whole is 2.', 'the value of zero is 0.']);
  assert.throws(() => parse('the value of small is 1.25.\nthis is broken.'), /Line 2:/);
  assert.throws(() => parse('the value of bad is 1e309.'), /finite real number/);
  assert.deepEqual(run('the value of milo is 1. 2 is a step. who is a step?'), ['2 is a step.']);
});

test('operators respect precedence, parentheses, and right-associative powers', () => {
  assert.equal(result('2 plus 3 times 4'), '14');
  assert.equal(result('(2 plus 3) times 4'), '20');
  assert.equal(result('20 divided by 5 times 2 minus 3'), '5');
  assert.equal(result('2 to the power of 3 to the power of 2'), '512');
  assert.equal(result('(2 to the power of 3) to the power of 2'), '64');
  assert.equal(result('0 minus 2 to the power of 2'), '-4');
  assert.equal(result('2 to the power of -3'), '0.125');
  assert.equal(result('1 divided by 2 plus 0.25'), '0.75');
});

test('integer multiplication, powers, and exact division retain every digit', () => {
  assert.equal(result('9007199254740993 times 3'), '27021597764222979');
  assert.equal(result('2 to the power of 100'), '1267650600228229401496703205376');
  assert.equal(result('27021597764222979 divided by 3'), '9007199254740993');
});

test('real functions use radians and may be composed with arithmetic', () => {
  assert.equal(result('square root of 9 plus absolute value of -4'), '7');
  assert.equal(result('natural log of exponential of 2'), '2');
  assert.equal(result('sine of 0 plus cosine of 0'), '1');
  assert.equal(Number(result('arc sine of 1')), Math.PI / 2);
  assert.equal(result('arc cosine of 1'), '0');
  assert.equal(result('square root of (9 plus 7)'), '4');
});

test('angles cover all four quadrants and the axes in the range zero to two pi', () => {
  for (const [x, y, angle] of [
    [1, 1, Math.PI / 4], [-1, 1, 3 * Math.PI / 4],
    [-1, -1, 5 * Math.PI / 4], [1, -1, 7 * Math.PI / 4],
    [1, 0, 0], [0, 1, Math.PI / 2], [-1, 0, Math.PI], [0, -1, 3 * Math.PI / 2],
  ]) {
    assert.equal(Number(result(`angle of ${x} with ${y}`)), angle);
  }
  assert.equal(result('angle of 1 with -5e-324'), '0');
});

test('computed clues wait for earlier inputs and explanations include each calculation', () => {
  const answers = run(`
    the value of milo is 9. the root of milo is 3.
    if the value of first is fourth
    and the root of first is square root of fourth
    then the result of first is fourth divided by 2.
    what is the result of milo? why?
  `);
  assert.equal(answers[0], 'the result of milo is 4.5.');
  assert.match(answers[1], /square root of 9 makes 3\./);
  assert.match(answers[1], /9 divided by 2 makes 4.5\./);
  assert.throws(() => parse(`
    if the root of first is square root of fourth then first is a calculator.
  `), /Find fourth in an earlier clue/);
  assert.throws(() => parse('what is the root of square root of what?'), /Use known numbers/);
  assert.throws(() => parse('the root of milo is square root of 9.'), /Put calculations in a rule or question/);
});

test('invalid calculations report errors rather than deriving non-finite results', () => {
  assert.throws(() => result('1 divided by 0'), /divide by zero/);
  for (const expression of [
    'square root of -1', 'natural log of 0', 'arc sine of 2',
    'arc cosine of -2', 'exponential of 1000', '1e308 times 1e308',
    '-1 to the power of 0.5', `angle of ${'9'.repeat(400)} with 1`,
  ]) assert.throws(() => result(expression), /finite real number/);
  assert.throws(() => result('sine of orange'), /I can only use numbers/);
  for (const expression of ['(2 plus 3', '2 plus', '2 times (3 plus)', 'sine of', 'angle of 1', '2 3']) {
    assert.throws(() => result(expression), /Line 3:/);
  }
});
