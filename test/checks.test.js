import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync, readdirSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { infer, parse, run } from '../src/language.js';

test('checks inspect the completed program without asserting facts', () => {
  const source = `
    check that milo is an animal.
    if ?x is a cat then ?x is an animal.
    milo is a cat.
    who is an animal? why?
  `;
  const program = parse(source);
  assert.equal(program.facts.length, 1);
  assert.equal(infer(program).length, 2);
  const answers = run(source);
  assert.equal(answers[0], 'milo is an animal.');
  assert.match(answers[1], /because if milo is a cat/);
  assert.equal(answers[2], 'check passed: milo is an animal.');
  assert.throws(() => run('check that milo is an animal.'), /Line 1: Check failed: milo is an animal\./);
});

test('negative checks use completed absence, including late recursive producers', () => {
  const source = `
    milo is a cat.
    check that milo is not an animal.
    if ?x is a cat then ?x is a pet.
    if ?x is a pet then ?x is an animal.
  `;
  assert.throws(() => run(source), /Line 3: Check failed/);
  assert.deepEqual(run('check that milo does not need rest.'), ['check passed: milo does not need rest.']);
  assert.throws(() => run('milo needs rest. check that milo does not need rest.'), /Check failed/);
});

test('ground calculations, quoted values, lists and comparisons can be checked', () => {
  assert.equal(run(`
    the output of trial is [1, ["A. # B"], blank].
    check that the output of trial is [1, ["A. # B"], blank].
    check that 9007199254740993 is greater than 9007199254740992.
    check that 7 times 7 is equal to 49.
    check that absolute value of (0.3 minus 0.2 minus 0.1) is at most 0.000000000001.
    check that not "Shopping" contains the text "medical".
  `).length, 5);
  assert.throws(() => run('check that 2 is less than 1.'), /Check failed/);
  assert.throws(() => run('check that "Shopping" contains the text "medical".'), /Check failed/);
  assert.throws(() => run('check that 1 divided by 0 is equal to 0.'), /Line 1:.*divide by zero/);
});

test('aggregate checks handle counts, totals, extrema, empty sets and exact large values', () => {
  const source = `
    ada is a person. ada is a person. ben is a person.
    the score of ada is 9007199254740993.
    the score of ben is -2.
    check that there are 2 people.
    check that there are 0 cats.
    check that the total of all scores is 9007199254740991.
    check that the smallest of all scores is -2.
    check that the largest of all scores is 9007199254740993.
    check that the total of all missing-values is 0.
  `;
  assert.equal(run(source).length, 6);
  assert.deepEqual(run('ada is a person. check that there is 1 person.'), ['check passed: there is 1 person.']);
  assert.throws(() => run(source.replace('there are 2 people', 'there are 3 people')), /Check failed/);
  assert.throws(() => run('check that the smallest of all scores is 0.'), /Check failed/);
  assert.throws(() => run('check that the largest of all scores is 0.'), /Check failed/);
});

test('checks require named ground conditions and a full stop, with source lines preserved', () => {
  for (const condition of ['?x is a cat', 'the score of what is 7', '[?a | ?b] is a tape', '?z is less than 2']) {
    assert.throws(() => parse(`check that ${condition}.`), /Name the things in a check|Use who and what in a question/);
  }
  assert.throws(() => parse('check that milo is a cat?'), /Finish a check with \./);
  assert.throws(() => run('# a comment\n\ncheck that milo is a cat.'), /Line 3: Check failed/);
});

test('checks leave follow-up explanations attached to the preceding answer', () => {
  const answers = run('milo is a cat. who is a cat? check that there is 1 cat. why? why?');
  assert.equal(answers[0], 'milo is a cat.');
  assert.match(answers[1], /you told me this/);
  assert.equal(answers[1], answers[2]);
  assert.equal(answers[3], 'check passed: there is 1 cat.');
});

test('every example contains an active explanation and executable checks', () => {
  const examples = new URL('../examples/', import.meta.url);
  for (const file of readdirSync(examples).filter(file => file.endsWith('.eye'))) {
    const program = parse(readFileSync(new URL(file, examples), 'utf8'));
    assert.ok(program.questions.some(question => question.why), `${file} needs a reason`);
    assert.ok(program.checks.length > 0, `${file} needs a check`);
  }
});

test('bundled checks detect broken sample data and a wrong inverse formula', () => {
  for (const [file, before, after] of [
    ['animals', 'milo is a cat.', 'milo is a dog.'],
    ['friends', 'luna is a cat.', 'luna is a dog.'],
    ['paths', 'cara follows ada.', 'cara follows ben.'],
    ['aggregation', 'the score of rex is 10.', 'the score of rex is 11.'],
    ['negation', 'luna is a tired-player.', 'rex is a tired-player.'],
    ['turing', 'the input of case1 is [1, 0, 1, 0, 0, 1].', 'the input of case1 is [0].'],
    ['delfour', 'the files-written of delfour is 6.', 'the files-written of delfour is 5.'],
    ['complex', 'then the real of ?function is arc sine of ?difference.', 'then the real of ?function is arc cosine of ?difference.'],
  ]) {
    const source = readFileSync(new URL(`../examples/${file}.eye`, import.meta.url), 'utf8');
    assert.notEqual(source.replace(before, after), source);
    assert.throws(() => run(source.replace(before, after)), /Check failed/, file);
  }
});

test('the command reports failed checks with a nonzero exit status', () => {
  const result = spawnSync(process.execPath, [new URL('../eyelang.js', import.meta.url).pathname, '-'], {
    input: 'milo is a cat. who is a cat? check that milo is a dog.', encoding: 'utf8',
  });
  assert.equal(result.status, 1);
  assert.match(result.stderr, /Line 1: Check failed: milo is a dog/);
  assert.equal(result.stdout, '');
});
