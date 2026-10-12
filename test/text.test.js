import test from 'node:test';
import assert from 'node:assert/strict';
import { infer, parse, run } from '../src/language.js';

test('quoted text preserves case, spaces, punctuation, and grammar words', () => {
  assert.deepEqual(run(`
    the message of demo is "A and B then C is it? # OK.". # A real comment
    if the message of someone is "A and B then C is it? # OK."
    then the result of someone is "YES  and then.".
    what is the result of demo?
    is the message of demo equal to "A and B then C is it? # OK."?
    is the result of demo equal to "YES  and then."?
  `), [
    'the result of demo is "YES  and then.".',
    'yes, the message of demo is "A and B then C is it? # OK.".',
    'yes, the result of demo is "YES  and then.".',
  ]);
  assert.deepEqual(run('the title of demo is "This is equal to that". is the title of demo equal to "This is equal to that"?'), [
    'yes, the title of demo is "This is equal to that".',
  ]);
});

test('quoted values work in lists, subjects, joins, and repeated variables', () => {
  assert.deepEqual(run(`
    "Milo Jr." likes ["someone", "what"].
    the items of demo is ["Red", "Red", "blue"].
    if the items of someone is [first, first | second] then the rest of someone is second.
    who likes ["someone", "what"]?
    does "Milo Jr." like ["someone", "what"]?
    what is the rest of demo?
  `), [
    '"Milo Jr." likes ["someone", "what"].',
    'yes, "Milo Jr." likes ["someone", "what"].',
    'the rest of demo is ["blue"].',
  ]);
  assert.equal(infer(parse('the value of demo is red. the value of demo is "red".')).length, 2);
});

test('JSON escapes round trip through answers and explanations without changing line numbers', () => {
  const value = 'Line one\nLine two "quoted" \\ # path';
  const literal = JSON.stringify(value);
  const answers = run(`the message of demo is ${literal}. what is the message of demo? why?`);
  assert.equal(answers[0], `the message of demo is ${literal}.`);
  assert.match(answers[1], /you told me this/);
  assert.throws(() => parse(`the message of demo is ${literal}.\nthis is broken.`), /Line 2:/);
  for (const source of ['the message of demo is "unfinished.', String.raw`the message of demo is "bad\q".`]) {
    assert.throws(() => parse(source), /Line 1:/);
  }
  assert.throws(() => run(`
    demo is a calculator.
    if someone is a calculator then the result of someone is "3" plus 1.
  `), /I can only use numbers/);
});

test('numeric comparisons are exact across large integers and approximate real values', () => {
  assert.deepEqual(run(`
    the value of demo is 1000000000000000000001.
    if the value of someone is first and first is greater than 1e21 then someone is a larger-number.
    if the value of someone is first and first is at most 1e21 then someone is a smaller-number.
    if 1e21 is equal to 1000000000000000000000 then demo is an equal-number.
    if 12 is at least 12 and 3 is less than 12 then demo is a boundary-match.
    if 0.5 plus 0.25 is equal to 0.75 then demo is a decimal-match.
    who is a larger-number?
    who is a smaller-number?
    who is an equal-number?
    who is a boundary-match?
    who is a decimal-match?
  `), [
    'demo is a larger-number.', "I don't know anyone or anything that fits that question yet.",
    'demo is an equal-number.', 'demo is a boundary-match.', 'demo is a decimal-match.',
  ]);
});

test('quoted texts compare in text order, and substring checks ignore letter case', () => {
  assert.deepEqual(run(`
    the time of demo is "2025-10-05T20:35:48.907163+00:00".
    if the time of someone is first and first is at most "2025-10-05T22:33:48.907185+00:00"
    then someone is an on-time-case.
    the message of demo is "Private MEDICAL details".
    if the message of someone is first and first contains the text "medical" then someone is a sensitive-case.
    if the message of someone is first and not first contains the text "medical" then someone is a minimal-case.
    who is an on-time-case?
    who is a sensitive-case?
    who is a minimal-case?
  `), [
    'demo is an on-time-case.', 'demo is a sensitive-case.',
    "I don't know anyone or anything that fits that question yet.",
  ]);
});

test('comparison explanations report computed evidence, including successful negated tests', () => {
  const answers = run(`
    the score of demo is 12. the message of demo is "shopping".
    if the score of someone is first and first is at least 10
    and the message of someone is second and not second contains the text "medical"
    then someone is a match.
    who is a match? why?
  `);
  assert.equal(answers[0], 'demo is a match.');
  assert.match(answers[1], /12 is at least 10\.\n\s+I checked these values\./);
  assert.match(answers[1], /"shopping" does not contain the text "medical"\.\n\s+I checked these values\./);
  assert.doesNotMatch(answers[1], /no matching fact/);
});

test('comparisons require bound variables and compatible input types', () => {
  assert.throws(() => parse('if first is less than 3 then demo is a match.'), /Find first in an earlier clue/);
  assert.throws(() => parse('if not first contains the text "private" then demo is a match.'), /Find first in an earlier clue/);
  assert.throws(() => parse('first is less than 3.'), /Line 1:/);
  assert.throws(() => parse('if demo is a player then 3 is less than 4.'), /Line 1:/);
  assert.throws(() => run('if 3 is less than "4" then demo is a match.'), /Compare two numbers or two quoted texts/);
  assert.throws(() => run('if demo contains the text "d" then demo is a match.'), /Use quoted text/);
  assert.throws(() => run('the kind of demo is "cat". if the kind of someone is first then someone is a first.'), /one word for a kind/);
});
