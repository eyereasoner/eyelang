import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../src/language.js';

test('the scoreboard counts derived kinds and totals equal scores from different players', () => {
  const answers = run(readFileSync(new URL('../examples/aggregation.eye', import.meta.url), 'utf8'));
  assert.equal(answers[0], 'there are 3 players.');
  assert.equal(answers[1], 'there are 3 team-members.');
  assert.equal(answers[2], 'the total of all scores is 24.');
  assert.match(answers[3], /I added all 3 matching values in the completed program/);
  for (const name of ['milo', 'luna', 'rex']) assert.match(answers[3], new RegExp(`the score of ${name} is`));
  assert.equal(answers[4], 'the smallest of all scores is 7.');
  assert.equal(answers[5], 'the largest of all scores is 10.');
});

test('empty counts and totals are zero; empty extrema are unknown', () => {
  assert.deepEqual(run(`
    how many cats are there?
    what is the total of all scores?
    what is the smallest of all scores?
    why?
    what is the largest of all scores?
  `), [
    'there are 0 cats.', 'the total of all scores is 0.', "I don't know any scores yet.",
    "I don't have an answer to explain yet.", "I don't know any scores yet.",
  ]);
});

test('aggregates see the completed derived and negated relations', () => {
  assert.deepEqual(run(`
    milo is a player. luna is a player. luna is a tired-player.
    if first is a player and first is not a resting-player then first is a ready-player.
    if first is a tired-player then first is a resting-player.
    if first is a ready-player then the score of first is 5.
    how many ready-players are there?
    what is the total of all scores?
  `), ['there is 1 ready-player.', 'the total of all scores is 5.']);
});

test('negative and large values aggregate exactly with duplicate facts counted once', () => {
  assert.deepEqual(run(`
    the score of milo is 900719925474099300000.
    the score of luna is -5. the score of luna is -5.
    what is the total of all scores?
    what is the smallest of all scores?
    what is the largest of all scores?
  `), [
    'the total of all scores is 900719925474099299995.',
    'the smallest of all scores is -5.',
    'the largest of all scores is 900719925474099300000.',
  ]);
});

test('aggregation refuses non-numeric values rather than ignoring them', () => {
  for (const operation of ['total', 'smallest', 'largest']) {
    assert.throws(() => run(`the score of milo is orange. what is the ${operation} of all scores?`), /whole numbers/);
  }
});

test('regular and common irregular plural names work with distinct membership counts', () => {
  assert.deepEqual(run(`
    ada is a person. ada is a person. ben is a person.
    milo is a puppy.
    how many people are there?
    how many puppies are there?
  `), ['there are 2 people.', 'there is 1 puppy.']);
});

test('why after a zero count reports the search, not a supplied fact', () => {
  const explanation = run('how many cats are there? why?')[1];
  assert.match(explanation, /I counted all matching names in the completed program: 0/);
  assert.doesNotMatch(explanation, /you told me this/);
});
