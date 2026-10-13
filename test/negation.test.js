import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { parse, run } from '../src/language.js';

test('the negation program waits for later rest rules and explains missing evidence', () => {
  const answers = run(readFileSync(new URL('../examples/negation.eye', import.meta.url), 'utf8'));
  assert.equal(answers[0], 'milo is a ready-player.\nrex is a ready-player.');
  assert.match(answers[1], /there is no evidence in this program that milo needs rest/);
  assert.match(answers[1], /I checked the completed program and found no matching fact/);
  assert.equal(answers[2], 'milo is an eager-player.\nrex is an eager-player.');
  assert.equal(answers[3], 'yes, there is no evidence in this program that milo needs rest.');
  assert.doesNotMatch(answers[4], /you told me this/);
  assert.equal(answers[5], 'no, the program shows that luna needs rest.');
  assert.match(answers[6], /^luna needs rest\.\n/);
  assert.match(answers[6], /luna is a tired-player/);
  assert.equal(answers[7], 'there are 2 ready-players.');
});

test('positive recursive closure finishes before a negative clue is tested', () => {
  assert.deepEqual(run(`
    milo is a player. rex is a player. luna likes milo.
    if ?x is a player and ?x does not like luna then ?x is an outsider.
    if ?x likes ?y then ?y likes ?x.
    who is an outsider?
  `), ['rex is an outsider.']);
});

test('several negative layers have the same meaning in either rule order', () => {
  const rules = [
    'if ?x is a player and ?x is not a blocked-player then ?x is a ready-player.',
    'if ?x is a player and ?x is not a resting-player then ?x is a blocked-player.',
    'if ?x is a tired-player then ?x is a resting-player.',
  ];
  const facts = 'milo is a player. luna is a player. luna is a tired-player.';
  for (const order of [rules, rules.slice().reverse()]) {
    assert.deepEqual(run(facts + order.join('\n') + 'who is a ready-player?'), ['luna is a ready-player.']);
  }
});

test('a negative clue cannot introduce a variable or be used as a fact or conclusion', () => {
  assert.throws(() => parse('if ?x is not a cat then ?x is a dog.'), /earlier positive clue/);
  assert.throws(() => parse('if ?x is a cat and ?x does not like ?y then ?x is a pet.'), /Find \?y/);
  assert.throws(() => parse('milo is not a cat.'), /couldn't read/);
  assert.throws(() => parse('if ?x is a cat then ?x is not a dog.'), /couldn't read/);
  assert.throws(() => parse('is who not a cat?'), /Name the things/);
});

test('negative recursion is rejected, including a cycle passing through positive rules', () => {
  for (const source of [
    'milo is a player. if ?x is a player and ?x is not a ready-player then ?x is a ready-player.',
    `milo is a player.
     if ?x is a player and ?x is not a blocked-player then ?x is a ready-player.
     if ?x is a ready-player then ?x is a blocked-player.`,
  ]) assert.throws(() => run(source), /loop through not/);
});

test('ground not questions use completed evidence without changing ordinary unknown answers', () => {
  assert.deepEqual(run(`
    milo is a cat.
    if ?x is a cat then ?x is an animal.
    is milo not an animal?
    is milo a dog?
    is milo not a dog?
    why?
  `).slice(0, 3), [
    'no, the program shows that milo is an animal.',
    "I don't know whether milo is a dog.",
    'yes, there is no evidence in this program that milo is a dog.',
  ]);
});

test('leading not and bound arithmetic properties work as negative clues', () => {
  assert.deepEqual(run(`
    2 is a step.
    if ?z is a step and not the score of ?z minus 1 is 0 then ?z is a chosen-step.
    who is a chosen-step?
  `), ['2 is a chosen-step.']);
});

test('why after a negative no answer shows the conflicting positive evidence', () => {
  const program = `
    luna is a tired-player.
    if ?x is a tired-player then ?x needs rest.
  `;
  const answers = run(program + 'does luna not need rest? why?');
  assert.equal(answers[0], 'no, the program shows that luna needs rest.');
  assert.match(answers[1], /^luna needs rest\./);
  assert.match(answers[1], /luna is a tired-player/);
  assert.equal(run(program + 'why does luna not need rest?')[0], answers[1]);
});
