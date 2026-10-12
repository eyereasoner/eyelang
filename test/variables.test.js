import test from 'node:test';
import assert from 'node:assert/strict';
import { parse, run } from '../src/language.js';

const names = [
  'first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth',
  'ninth', 'tenth', 'eleventh', 'twelfth', 'thirteenth', 'fourteenth', 'fifteenth', 'sixteenth',
];

test('first through sixteenth bind distinct values in one forward rule', () => {
  const values = names.map((_, index) => index + 1);
  const reverse = values.slice().reverse().join(', ');
  assert.deepEqual(run(`
    the values of sample is [${values.join(', ')}].
    if the values of sample is [${names.join(', ')}]
    then the reversed of sample is [${names.slice().reverse().join(', ')}].
    what is the reversed of sample?
    check that the reversed of sample is [${reverse}].
  `), [
    `the reversed of sample is [${reverse}].`,
    `check passed: the reversed of sample is [${reverse}].`,
  ]);
});

test('all sixteen variables can bind names, text, lists, and numbers without type assumptions', () => {
  const values = ['ada', '"Ada Lovelace"', '[red, blue]', '17', 'ben', '"A person"', '[]', '-3',
    'cara', '"A list"', '[[green]]', '0.5', 'dan', '"Sixteen"', '[1, 2]', '9007199254740993'];
  const reverse = values.slice().reverse().join(', ');
  assert.deepEqual(run(`
    the values of sample is [${values.join(', ')}].
    if the values of sample is [${names.join(', ')}]
    then the reversed of sample is [${names.slice().reverse().join(', ')}].
    what is the reversed of sample?
  `), [`the reversed of sample is [${reverse}].`]);
});

test('ordinal variables support backward recursion, calculated heads, and explanations', () => {
  const answers = run(`
    the length of [] is 0.
    the length of [first | second] is sixteenth plus 1
    if the length of second is sixteenth.
    what is the length of [red, blue, green]?
    why?
    check that the length of [red, blue, green] is 3.
  `);
  assert.equal(answers[0], 'the length of [red, blue, green] is 3.');
  assert.match(answers[1], /sixteenth plus 1/);
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
    if the values of first is [sixteenth, sixteenth] then first is a repeated-pair.
    the result of first is sixteenth plus 1 if the value of first is sixteenth.
    who is a repeated-pair?
    what is the result of red?
    what is the result of blue?
  `), ['sample is a repeated-pair.', 'the result of red is 3.', 'the result of blue is 4.']);
});

test('ordinal variables work with stratified negation and completed aggregation', () => {
  assert.deepEqual(run(`
    the score of ada is 3. the score of ben is 4. ben is a blocked-player.
    first is an eligible-player if the score of first is second and first is not a blocked-player.
    the doubled-score of first is sixteenth times 2 if the score of first is sixteenth.
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

test('quoted ordinals are text, while former variables and counting words are ordinary names', () => {
  const ordinary = ['someone', 'something', 'number', 'one', 'two', 'eight', 'fifty', 'twenty-one', 'minus-one'];
  assert.deepEqual(run(`
    ${ordinary.map(name => `${name} is a name.`).join('\n')}
    the value of "sixteenth" is 21.
    the result of first is SIXTEENTH plus 1 if the value of first is SIXTEENTH.
    who is a name?
    what is the result of "sixteenth"?
  `), [ordinary.map(name => `${name} is a name.`).join('\n'), 'the result of "sixteenth" is 22.']);
  assert.deepEqual(run(`
    someone likes something. the value of number is 7.
    if someone likes first then the value of first is 8.
    what is the value of something?
    what is the value of number?
  `), ['the value of something is 8.', 'the value of number is 7.']);
});
