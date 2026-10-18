import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { checkProof, parse, run } from '../src/language.js';
import { assertAnswers } from './conformance/helpers.js';

const read = file => readFileSync(new URL(`../${file}`, import.meta.url), 'utf8');
const blocks = (document, language) => [...document.matchAll(new RegExp('^```' + language + '\\n([\\s\\S]*?)\\n```', 'gm'))]
  .map(match => match[1]);
const readme = read('README.md');
const tutorial = read('TUTORIAL.md');
const spec = read('SPEC.md');
const lessons = blocks(tutorial, 'prolog');
const specPrograms = blocks(spec, 'prolog');

function answers(output) {
  return output[0].slice('% Answer\n'.length).split('\n\n')
    .map(block => block.split('\n').slice(1).join('\n'));
}

test('the README example produces its documented answer and a checked certificate', () => {
  const examples = blocks(readme, 'prolog');
  assert.equal(examples.length, 1);
  const output = run(examples[0], { arc: true });
  assertAnswers(answers(output), ['Who = socrates.']);
  assert.match(output[2], /check passed: mortal\(socrates\)\./);
  assert.match(output[2], /verdict\(checked\)\./);
  assert.equal(checkProof(examples[0], output[1].slice('% Reason\n'.length), { allowTrusted: false }).valid, true);
});

const expectations = [
  ['Where = park.'],
  ['Where = park, Fee = 0.\nWhere = cafe, Fee = 5.'],
  ['Where = park.\nWhere = museum.\nWhere = cafe.'],
  ['Where = cafe, Minutes = 17.', 'Value = 9007199254740994.'],
  ['Count = 4.', 'Total = 22.'],
  ['Where = park, First = walk, Rest = [picnic].', 'Where = park, Activities = [walk, picnic].'],
  ['Value = 6765.'],
];

test('every tutorial program has a documented success or intentional failure', () => {
  assert.equal(lessons.length, expectations.length + 1);
});

for (const [index, expected] of expectations.entries()) {
  test(`tutorial lesson ${index + 1} computes its stated answers and checks its proof`, () => {
    const source = lessons[index];
    const output = run(source, { arc: true });
    assertAnswers(answers(output), expected);
    const report = checkProof(source, output[1].slice('% Reason\n'.length));
    assert.equal(report.valid, true, JSON.stringify(report.failures));
    assert.match(output[2], /verdict\(checked(?:_with_obligations)?\)\./);
  });
}

test('the tutorial failure has the documented source line and passes after correction', () => {
  const source = lessons.at(-1);
  assert.throws(() => run(source), { message: 'Line 4: Check failed: entry_fee(cafe, 4).' });
  const corrected = source.replace('assertion(entry_fee(cafe, 4))', 'assertion(entry_fee(cafe, 5))');
  const output = run(corrected, { arc: true });
  assertAnswers(answers(output), ['Fee = 5.']);
  assert.match(output[2], /check passed: entry_fee\(cafe, 5\)\./);
  assert.match(output[2], /verdict\(checked\)\./);
});

test('the tutorial and specification certificate displays check against their source programs', () => {
  const tutorialProof = blocks(tutorial, 'text')[0];
  assert.equal(checkProof(lessons[0], tutorialProof, { allowTrusted: false }).valid, true);
  const specProof = specPrograms.find(source => source.startsWith('certificate(eyeon, 1).'));
  assert.ok(specProof);
  assert.equal(checkProof(specPrograms[0], specProof, { allowTrusted: false }).valid, true);
});

test('all specification program blocks parse and the range example returns its documented values', () => {
  assert.equal(specPrograms.length, 5);
  for (const source of specPrograms) assert.doesNotThrow(() => parse(source));
  const range = specPrograms.find(source => source.startsWith(':- table between/3.'));
  assert.ok(range);
  assertAnswers(run(range), ['Value = 2.\nValue = 3.\nValue = 4.']);
});
