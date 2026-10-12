import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../src/language.js';

const source = readFileSync(new URL('../examples/age.eye', import.meta.url), 'utf8');
const unknown = "I don't know anyone or anything that fits that question yet.";

function onDate(year, month, day, program = source) {
  return program.replace('the date of today is [2026, 10, 12].', `the date of today is [${year}, ${month}, ${day}].`);
}

function query(program, question) {
  // Changed dates and people have their own expectations.
  return run(`${program.replace(/^check that .+\.$/gm, '')}\n${question}`).at(-1);
}

test('the age example proves Pat is over 80 and passes its ARC checks', () => {
  const answers = run(source);
  assert.equal(answers[0], 'pat-h is-older-than 80.');
  assert.equal(answers[1], 'yes, test is a passed-check.');
  assert.match(answers[2], /the birthday of pat-h is \[1944, 8, 21\]/);
  assert.match(answers[2], /the date of today is \[2026, 10, 12\]/);
  assert.match(answers[2], /2026 minus 1944 makes 82/);
  assert.match(answers[2], /82 is greater than 80/);
  assert.match(answers[2], /I checked these values/);
  assert.equal(answers.slice(3).length, 5);
  assert.ok(answers.slice(3).every(answer => answer.startsWith('check passed:')));
});

test('the strict 80-year limit changes the day after the birthday', () => {
  for (const [year, month, day, passed] of [
    [2023, 12, 31, false],
    [2024, 7, 31, false],
    [2024, 8, 20, false],
    [2024, 8, 21, false],
    [2024, 8, 22, true],
    [2024, 9, 1, true],
    [2025, 1, 1, true],
  ]) {
    const program = onDate(year, month, day);
    assert.equal(query(program, 'who is-older-than 80?'), passed ? 'pat-h is-older-than 80.' : unknown,
      `${year}-${month}-${day}`);
    assert.equal(query(program, 'is test a passed-check?'), passed
      ? 'yes, test is a passed-check.' : "I don't know whether test is a passed-check.");
  }
});

test('the birthday branch explains month and day comparisons from supplied facts', () => {
  const program = onDate(2024, 8, 22);
  const why = query(program, 'why is test a passed-check?');
  for (const clue of [
    'the birthday of pat-h is [1944, 8, 21].', 'the date of today is [2024, 8, 22].',
    '8 is equal to 8.',
    '22 is greater than 21.', '80 is equal to 80.',
  ]) assert.ok(why.includes(clue), clue);
});

test('changed age limits and birth dates recompute the result', () => {
  const olderLimit = source.replace('the age-limit of test is 80.', 'the age-limit of test is 83.');
  assert.equal(query(olderLimit, 'is test a passed-check?'), "I don't know whether test is a passed-check.");
  assert.throws(() => run(olderLimit), /Check failed: test is a passed-check/);
  const younger = source.replace('the birthday of pat-h is [1944, 8, 21].', 'the birthday of pat-h is [2000, 8, 21].');
  assert.equal(query(younger, 'who is-older-than 80?'), unknown);
  assert.throws(() => run(younger), /Check failed: pat-h is-older-than 80/);
});

test('birthdays on the first and last days of a month work across year boundaries', () => {
  const december = source.replace('the birthday of pat-h is [1944, 8, 21].', 'the birthday of pat-h is [1944, 12, 31].');
  assert.equal(query(onDate(2024, 12, 31, december), 'who is-older-than 80?'), unknown);
  assert.equal(query(onDate(2025, 1, 1, december), 'who is-older-than 80?'), 'pat-h is-older-than 80.');
  const january = source.replace('the birthday of pat-h is [1944, 8, 21].', 'the birthday of pat-h is [1944, 1, 1].');
  assert.equal(query(onDate(2024, 1, 1, january), 'who is-older-than 80?'), unknown);
  assert.equal(query(onDate(2024, 1, 2, january), 'who is-older-than 80?'), 'pat-h is-older-than 80.');
});

test('the same backward rules keep each person and their birthday together', () => {
  const people = source + `
    the birthday of ada is [1940, 12, 31].
    the birthday of ben is [1944, 12, 1].
    the birthday of cara is [1944, 8, 22].
    the birthday of dan is [2000, 1, 1].
  `;
  assert.deepEqual(new Set(query(onDate(2024, 8, 22, people), 'who is-older-than 80?').split('\n')), new Set([
    'pat-h is-older-than 80.', 'ada is-older-than 80.',
  ]));
  assert.equal(query(source, 'who is-older-than 82?'), 'pat-h is-older-than 82.');
  assert.equal(query(source, 'who is-older-than 83?'), unknown);
});
