import test from 'node:test';
import assert from 'node:assert/strict';
import { parse, run } from '../src/language.js';

const names = ['first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth', 'ninth'];

test('first through ninth bind distinct values in one forward rule', () => {
  const values = names.map((_, index) => index + 1);
  const reverse = values.slice().reverse().join(', ');
  assert.deepEqual(run(`
    the values of sample is [${values.join(', ')}].
    if the values of someone is [${names.join(', ')}]
    then the reversed of someone is [${names.slice().reverse().join(', ')}].
    what is the reversed of sample?
    check that the reversed of sample is [${reverse}].
  `), [
    `the reversed of sample is [${reverse}].`,
    `check passed: the reversed of sample is [${reverse}].`,
  ]);
});

test('all twelve placeholders are distinct and do not imply numeric values', () => {
  assert.deepEqual(run(`
    the values of sample is [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].
    if the values of sample is [someone, something, number, first, second, third, fourth, fifth, sixth, seventh, eighth, ninth]
    then the total of sample is someone plus something plus number plus first plus second plus third plus fourth plus fifth plus sixth plus seventh plus eighth plus ninth plus 1.
    what is the total of sample?
  `), ['the total of sample is 79.']);
});

test('ordinal variables support backward recursion, calculated heads, and explanations', () => {
  const answers = run(`
    the length of [] is 0.
    the length of [third | eighth] is ninth plus 1
    if the length of eighth is ninth.
    what is the length of [red, blue, green]?
    why?
    check that the length of [red, blue, green] is 3.
  `);
  assert.equal(answers[0], 'the length of [red, blue, green] is 3.');
  assert.match(answers[1], /ninth plus 1/);
  assert.match(answers[1], /2 plus 1 makes 3/);
  assert.match(answers[1], /the length of \[\] is 0/);
  assert.equal(answers[2], 'check passed: the length of [red, blue, green] is 3.');
});

test('repeated ordinal variables enforce equality and their scope remains local to each rule', () => {
  assert.deepEqual(run(`
    the values of sample is [7, 7].
    the values of other is [7, 8].
    the value of red is 2.
    the value of blue is 3.
    if the values of third is [ninth, ninth] then third is a repeated-pair.
    the result of third is ninth plus 1 if the value of third is ninth.
    who is a repeated-pair?
    what is the result of red?
    what is the result of blue?
  `), ['sample is a repeated-pair.', 'the result of red is 3.', 'the result of blue is 4.']);
});

test('ordinal variables work with stratified negation and completed aggregation', () => {
  assert.deepEqual(run(`
    the score of ada is 3. the score of ben is 4. ben is a blocked-player.
    third is an eligible-player if the score of third is ninth and third is not a blocked-player.
    the doubled-score of third is eighth times 2 if the score of third is eighth.
    how many eligible-players are there?
    what is the total of all doubled-scores?
  `), ['there is 1 eligible-player.', 'the total of all doubled-scores is 14.']);
});

test('every ordinal variable obeys the same context and safety rules', () => {
  for (const name of names) {
    assert.throws(() => parse(`${name} is a cat.`), /inside an if/);
    assert.throws(() => parse(`who likes ${name}?`), /inside an if/);
    assert.throws(() => parse(`check that ${name} is a cat.`), /cannot introduce variables/);
    assert.throws(() => parse(`if milo is a cat then ${name} is a friend.`), /after if/);
    assert.throws(() => parse(`if ${name} is greater than 0 then milo is a friend.`), /before comparing/);
    assert.throws(() => parse(`if milo is not a ${name} then milo is a friend.`), /before using not/);
    assert.throws(() => parse(`if milo is a cat then the score of milo is ${name} plus 1.`), /after if/);
    assert.throws(() => parse(`the ${name} of milo is 1.`), /couldn't read/);
    assert.throws(() => parse(`milo ${name} luna.`), /couldn't read/);
  }
});

test('quoted ordinals are text, while counting words remain ordinary names', () => {
  assert.deepEqual(run(`
    one is a name.
    two is a name.
    eight is a name.
    fifty is a name.
    twenty-one is a name.
    minus-one is a name.
    the value of "ninth" is 21.
    the result of third is NINTH plus 1 if the value of third is NINTH.
    who is a name?
    what is the result of "ninth"?
  `), [
    'one is a name.\ntwo is a name.\neight is a name.\nfifty is a name.\ntwenty-one is a name.\nminus-one is a name.',
    'the result of "ninth" is 22.',
  ]);
});
