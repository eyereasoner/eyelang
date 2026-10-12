import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { parse, run } from '../language.js';

const source = readFileSync(new URL('../examples/turing.eye', import.meta.url), 'utf8');
const program = parse(source);
const rules = program.rules.map(rule => rule.text).join('\n');
const addOne = `
  the start of add-one is scan.
  the transition of [add-one, scan, 0] is [scan, 0, right].
  the transition of [add-one, scan, 1] is [scan, 1, right].
  the transition of [add-one, scan, blank] is [carry, blank, left].
  the transition of [add-one, carry, 0] is [halt, 1, stay].
  the transition of [add-one, carry, 1] is [carry, 0, left].
  the transition of [add-one, carry, blank] is [halt, 1, stay].
  the machine of trial is add-one.
`;

test('the Turing example computes all four output tapes and explains the empty input', () => {
  const answers = run(source);
  assert.deepEqual(answers.slice(0, 8), [
    'the input of case1 is [1, 0, 1, 0, 0, 1].',
    'the input of case2 is [1, 0, 1, 1, 1, 1].',
    'the input of case3 is [1, 1, 1, 1, 1, 1].',
    'the input of case4 is [].',
    'the output of case1 is [1, 0, 1, 0, 1, 0, blank].',
    'the output of case2 is [1, 1, 0, 0, 0, 0, blank].',
    'the output of case3 is [1, 0, 0, 0, 0, 0, 0, blank].',
    'the output of case4 is [1, blank].',
  ]);
  assert.match(answers[8], /case4 runs \[scan, \[\], blank, \[\]\]/);
  assert.match(answers[8], /case4 runs \[carry, \[\], blank, \[blank\]\]/);
  assert.match(answers[8], /case4 runs \[halt, \[\], 1, \[blank\]\]/);
  assert.match(answers[8], /the input of case4 is \[\]/);
  assert.match(answers[8], /the transition of \[add-one, carry, blank\] is \[halt, 1, stay\]/);
  assert.doesNotMatch(answers[8], /case[123]/);
  assert.deepEqual(new Set(answers[9].split('\n')), new Set([1, 2, 3, 4].map(n => `case${n} is a finished-case.`)));
});

test('the machine adds one to all six-bit inputs and carries across a longer tape', () => {
  const inputs = Array.from({ length: 64 }, (_, n) => n.toString(2).padStart(6, '0'));
  inputs.push('1'.repeat(80));
  for (const bits of inputs) {
    const [answer] = run(`${addOne}
      the input of trial is [${[...bits].join(', ')}].
      ${rules}
      what is the output of trial?
    `);
    const expected = (BigInt(`0b${bits}`) + 1n).toString(2).padStart(bits.length, '0');
    assert.equal(answer, `the output of trial is [${[...expected].join(', ')}, blank].`);
  }
});

test('the same interpreter runs another transition table with non-binary symbols', () => {
  const [answer] = run(`
    the machine of trial is paint.
    the input of trial is [red, blue].
    the start of paint is begin.
    the transition of [paint, begin, red] is [back, gold, right].
    the transition of [paint, back, blue] is [finish, green, left].
    the transition of [paint, finish, gold] is [halt, black, stay].
    ${rules}
    what is the output of trial?
  `);
  assert.equal(answer, 'the output of trial is [black, green].');
});

test('left, right, and stay handle a blank tape and preserve the written symbol', () => {
  for (const [movement, expected] of [
    ['left', '[blank, gold]'], ['right', '[gold, blank]'], ['stay', '[gold]'],
  ]) {
    const [answer] = run(`
      the machine of trial is paint.
      the input of trial is [].
      the start of paint is begin.
      the transition of [paint, begin, blank] is [halt, gold, ${movement}].
      ${rules}
      what is the output of trial?
    `);
    assert.equal(answer, `the output of trial is ${expected}.`);
  }
});

test('a missing transition leaves the run unfinished without inventing an output', () => {
  const incomplete = addOne.replace('the transition of [add-one, carry, 0] is [halt, 1, stay].', '');
  assert.deepEqual(run(`
    ${incomplete}
    the input of trial is [0].
    ${rules}
    what is the output of trial?
    is trial a finished-case?
  `), ["I don't know anyone or anything that fits that question yet.", "I don't know whether trial is a finished-case."]);
});
