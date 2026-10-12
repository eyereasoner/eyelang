import test from 'node:test';
import assert from 'node:assert/strict';
import { parse, run } from '../src/language.js';

test('why explains the preceding answer, including repeated follow-ups', () => {
  const program = `milo is a cat. if first is a cat then first is an animal.`;
  const direct = run(program + 'why is milo an animal?')[0];
  assert.deepEqual(run(program + 'who is an animal? why? why?'), [
    'milo is an animal.', direct, direct,
  ]);
  assert.throws(() => parse('why is what?'), /couldn't read/);
});

test('a follow-up refers to the latest question and handles missing answers', () => {
  assert.deepEqual(run('why?'), ['Ask a question first, then ask why.']);
  assert.deepEqual(run('milo is a cat. is milo a cat? is milo a dog? why?'), [
    'yes, milo is a cat.', "I don't know whether milo is a dog.",
    "I don't have an answer to explain yet.",
  ]);
});

test('shared reasons are shown once with references to earlier steps', () => {
  const answers = run(`
    milo is a kitten.
    if first is a kitten then first is a cat.
    if first is a kitten then first is a pet.
    if first is a cat and first is a pet then first is a friend.
    who is a friend?
    why?
  `);
  const explanation = answers[1];
  assert.equal((explanation.match(/milo is a kitten\./g) ?? []).length, 1);
  assert.equal((explanation.match(/^step \d+:/gm) ?? []).length, 4);
  let step = 0;
  for (const line of explanation.split('\n')) {
    const header = /^step (\d+):/.exec(line);
    if (header) step = Number(header[1]);
    const uses = /^  because rule \d+ uses steps ([\d, ]+)\.$/.exec(line);
    if (uses) for (const id of uses[1].split(', ')) assert.ok(Number(id) < step);
  }
  assert.match(explanation, /That explains step 4\.$/);
});

test('why explains all answers of a question together, sharing their common reasons', () => {
  const answers = run(`
    milo is a cat. milo is a pet.
    if first is a cat then first is an animal.
    if first is an animal then first is a creature.
    who is a creature?
    why?
  `);
  assert.equal(answers[0], 'milo is a creature.');
  assert.doesNotMatch(answers[1], /milo is a pet/);
  const many = run(`milo is a cat. luna is a cat. who is a cat? why?`)[1];
  assert.match(many, /step 1: milo is a cat\./);
  assert.match(many, /step 2: luna is a cat\./);
  assert.match(many, /That explains steps 1, 2\.$/);
});

test('deep explanations use numbered steps without recursive calls or growing indentation', () => {
  let program = 'milo is a kind0.';
  for (let index = 1; index <= 200; index++) {
    program += `if first is a kind${index - 1} then first is a kind${index}.`;
  }
  const explanation = run(program + 'is milo a kind200? why?')[1];
  assert.equal((explanation.match(/^step \d+:/gm) ?? []).length, 201);
  assert.match(explanation, /That explains step 201\.$/);
  assert.ok(explanation.split('\n').every(line => !line.startsWith('   ')));
});
