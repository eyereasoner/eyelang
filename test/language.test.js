import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { infer, parse, run, say } from '../src/language.js';

test('Socrates derives mortality through a generic kind implication and explains both clues', () => {
  const source = readFileSync(new URL('../examples/socrates.eye', import.meta.url), 'utf8');
  assert.deepEqual(run(source), [
    'socrates is a mortal.',
    'socrates is a mortal.\n' +
      '  because if first is a second and second implies third then first is a third.\n' +
      '  socrates is a human.\n    you told me this.\n' +
      '  human implies mortal.\n    you told me this.',
    'check passed: socrates is a mortal.',
    'check passed: there is 1 mortal.',
  ]);
  const extended = source.replace('check that there is 1 mortal.', 'check that there are 2 mortals.') + `
    plato is a philosopher.
    philosopher implies human.
  `;
  assert.deepEqual(new Set(run(extended)[0].split('\n')), new Set([
    'socrates is a mortal.', 'plato is a mortal.',
  ]));
  assert.throws(() => run(source.replace('human implies mortal.', '')), /Check failed: socrates is a mortal/);
});

test('a program answers who, yes, why and unknown questions', () => {
  const source = readFileSync(new URL('../examples/animals.eye', import.meta.url), 'utf8');
  assert.deepEqual(run(source), [
    'milo is an animal.\nluna is an animal.',
    'yes, milo is an animal.',
    'milo is an animal.\n  because if first is a cat then first is an animal.\n  milo is a cat.\n    you told me this.',
    "I don't know whether milo is a dog.",
    'check passed: milo is an animal.',
    'check passed: luna is an animal.',
    'check passed: there are 2 animals.',
    'check passed: milo is not a dog.',
  ]);
});

test('joining clues keeps repeated variables consistent across both premises', () => {
  const answers = run(`
    milo likes luna. milo likes rex. ada likes rex.
    luna is a cat. rex is a dog.
    if first likes second and second is a cat then first is a friend.
    who is a friend?
    why is milo a friend?
  `);
  assert.equal(answers[0], 'milo is a friend.');
  assert.match(answers[1], /milo likes luna\./);
  assert.match(answers[1], /luna is a cat\./);
  assert.doesNotMatch(answers[1], /rex/);
});

test('rules reach a fixed point even when declared in reverse dependency order', () => {
  assert.deepEqual(run(`
    if first is an animal then first is a creature.
    if first is a cat then first is an animal.
    milo is a cat.
    who is a creature?
    why is milo a creature?
  `).map(answer => answer.split('\n')[0]), ['milo is a creature.', 'milo is a creature.']);
});

test('cycles finish and retain explanations founded on supplied facts', () => {
  const source = `
    if first is a cat then first is an animal.
    if first is an animal then first is a cat.
    milo is a cat. milo is a cat.
    who is a cat?
    why is milo an animal?
  `;
  assert.equal(infer(parse(source)).length, 2);
  assert.equal(run(source)[0], 'milo is a cat.');
  assert.match(run(source)[1], /you told me this\./);
  assert.deepEqual(run(`
    if first is a cat then first is an animal.
    if first is an animal then first is a cat.
    is milo a cat?
  `), ["I don't know whether milo is a cat."]);
});

test('a repeated variable requires the same name in both places', () => {
  assert.deepEqual(run(`
    milo likes luna. luna likes luna.
    if first likes first then first is a self-admirer.
    who is a self-admirer?
  `), ['luna is a self-admirer.']);
});

test('duplicates and alternate derivations produce one answer', () => {
  assert.deepEqual(run(`
    milo is a cat. milo is a cat. milo is a pet.
    if first is a cat then first is an animal.
    if first is a pet then first is an animal.
    who is an animal?
  `), ['milo is an animal.']);
});

test('questions about actions work for subjects, objects, yes and why', () => {
  assert.deepEqual(run(`
    milo likes luna. luna knows milo.
    who likes luna?
    what does milo like?
    who does luna know?
    does milo like luna?
    why does milo like luna?
  `), [
    'milo likes luna.', 'milo likes luna.', 'luna knows milo.',
    'yes, milo likes luna.', 'milo likes luna.\n  you told me this.',
  ]);
});

test('programs ignore letter case, accept multiline rules and retain error lines', () => {
  assert.deepEqual(run(`
    # My program
    Milo is a cat.
    if first is a cat
      then first is an animal.
    Who is an animal?
  `), ['milo is an animal.']);
  assert.throws(() => parse('# first line\nmilo is a cat.\nthis is broken.'), /Line 3:/);
});

test('unknown questions are distinct from negative conclusions', () => {
  assert.deepEqual(run('who is a dog? why is milo a dog?'), [
    "I don't know anyone or anything that fits that question yet.",
    "I don't know whether milo is a dog.",
  ]);
});

test('rules cannot invent an unbound individual', () => {
  assert.throws(() => parse('if first is a cat then second is an animal.'), /Use second after if/);
  assert.throws(() => parse('first is a cat.'), /inside an if/);
});

test('unfinished programs and unsupported sentence shapes get useful errors', () => {
  for (const source of ['milo is a cat', 'milo is cat.', 'if milo is a cat.', '.', 'why who is an animal?']) {
    assert.throws(() => parse(source), /^Error: Line \d+:/);
  }
});

test('questions see the whole program, including later facts', () => {
  assert.deepEqual(run('who is a cat? milo is a cat.'), ['milo is a cat.']);
});

test('both remaining example programs run with explanations', () => {
  for (const name of ['friends', 'paths']) {
    const source = readFileSync(new URL(`../examples/${name}.eye`, import.meta.url), 'utf8');
    const answers = run(source);
    assert.ok(answers.length > 0);
    assert.ok(answers.every(answer => !answer.startsWith("I don't know")));
    assert.ok(answers.some(answer => /because /.test(answer)));
    assert.match(answers.at(-1), /^check passed:/);
  }
});

test('the command reads standard input and reports program errors with a failing exit status', () => {
  const cli = new URL('../eyelang.js', import.meta.url);
  const good = spawnSync(process.execPath, [cli.pathname, '-'], {
    input: 'milo is a cat. who is a cat?', encoding: 'utf8',
  });
  assert.equal(good.status, 0);
  assert.equal(good.stdout, '# Answer\nmilo is a cat.\n\n' +
    '# Reason\nNo explanation was requested. Add why? after a question.\n\n' +
    '# Check\nNo checks were requested.\n');
  const bad = spawnSync(process.execPath, [cli.pathname, '-'], {
    input: 'milo is cat.', encoding: 'utf8',
  });
  assert.equal(bad.status, 1);
  assert.match(bad.stderr, /Line 1:/);
});

test('all derived terms are concrete names', () => {
  const facts = infer(parse(`
    milo likes luna. luna is a cat.
    if first likes second and second is a cat then first is a friend.
  `));
  assert.ok(facts.every(record => record.goal.terms.every(term => typeof term === 'string')));
  assert.ok(facts.map(record => say(record.goal)).includes('milo is a friend'));
});

test('waiting joins consume facts added before and after a prefix becomes ready', () => {
  const source = `
    milo likes luna. milo likes rex.
    luna is a kitten. rex is a puppy.
    if first likes second and second is a pet then first helps second.
    if first is a kitten then first is a pet.
    if first is a puppy then first is a pet.
    if first helps second and second is a pet then first knows second.
    who helps what?
    who knows what?
  `;
  assert.deepEqual(run(source), [
    'milo helps luna.\nmilo helps rex.', 'milo knows luna.\nmilo knows rex.',
  ]);
});

test('recursive joins preserve all solutions and tolerate multiple property values', () => {
  const source = `
    milo likes luna. luna likes rex. rex likes milo.
    if first likes second then second likes first.
    the color of milo is orange. the color of milo is black.
    if first likes milo and the color of milo is second then the favorite of first is second.
    who likes what?
    what is the favorite of luna?
  `;
  const answers = run(source);
  assert.equal(answers[0].split('\n').length, 6);
  assert.equal(new Set(answers[0].split('\n')).size, 6);
  assert.equal(answers[1], 'the favorite of luna is orange.\nthe favorite of luna is black.');
});
