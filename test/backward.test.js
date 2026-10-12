import test from 'node:test';
import assert from 'node:assert/strict';
import { infer, parse, run, say } from '../src/language.js';

const fibonacci = `
  the fibonacci of 0 is 0.
  the fibonacci of 1 is 1.
  the fibonacci of third is fourth plus fifth
  if third is greater than 1
  and the fibonacci of third minus 1 is fourth
  and the fibonacci of third minus 2 is fifth.
`;

test('head-if rules parse alongside forward rules, preserving quoted separators and source lines', () => {
  const program = parse(`
    milo is a cat.
    first is an animal if first is a cat.
    if first is an animal then first is a creature.
    the label of first is "if and then" if first is a creature.
  `);
  assert.deepEqual(program.rules.map(rule => Boolean(rule.backward)), [true, false, true]);
  assert.throws(() => parse('# comment\nmilo is a cat.\nsomeone is an animal if.'), /Line 3:/);
  assert.throws(() => parse('first is an animal if first is a cat if first is a pet.'), /Use if clues/);
  assert.throws(() => parse('the value of first is fourth plus fifth if first is a cat.'), /Find fourth in a clue/);
});

test('unused backward definitions do no work and do not invent unrequested answers', () => {
  const program = parse(`
    ${fibonacci}
    the broken of first is 1 divided by 0 if first is equal to first.
    what is the fibonacci of 12?
  `);
  const facts = infer(program);
  assert.equal(facts.length, 13);
  assert.equal(say(facts.at(-1).goal), 'the fibonacci of 12 is 144');
  assert.ok(facts.every(record => Number(record.goal.terms[0]) <= 12));
  assert.deepEqual(infer(parse(fibonacci)).map(record => record.goal.terms[0]), ['0', '1']);
});

test('forward and backward producers cooperate and keep their evidence', () => {
  const answers = run(`
    milo is a kitten.
    if first is a kitten then first is a cat.
    first is an animal if first is a cat.
    if first is an animal then first is a friend.
    who is a friend? why?
    check that milo is a friend.
  `);
  assert.equal(answers[0], 'milo is a friend.');
  assert.match(answers[1], /because first is an animal if first is a cat/);
  assert.match(answers[1], /because if first is a kitten then first is a cat/);
  assert.match(answers[1], /milo is a kitten\.\n\s+you told me this/);
});

test('left recursion reaches a fixed point even when recursive rules precede base rules', () => {
  const answers = run(`
    ada follows ben. ben follows cara. cara follows ada.
    first reaches second if first reaches fourth and fourth follows second.
    first reaches second if first follows second.
    what does ada reach? why?
    check that ada reaches ada.
  `);
  assert.deepEqual(new Set(answers[0].split('\n')), new Set(['ada reaches ben.', 'ada reaches cara.', 'ada reaches ada.']));
  const steps = [...answers[1].matchAll(/^step (\d+):/gm)].map(match => match[1]);
  assert.equal(steps.length, 6);
  assert.equal(new Set(steps).size, 6);
});

test('mutual recursion suspends rather than treating an active call as false', () => {
  assert.deepEqual(run(`
    milo is a seed.
    first is a cat if first is an animal.
    first is an animal if first is a cat.
    first is a cat if first is a seed.
    who is an animal?
  `), ['milo is an animal.']);
  assert.deepEqual(run(`
    first is a cat if first is an animal.
    first is an animal if first is a cat.
    is milo a cat?
  `), ["I don't know whether milo is a cat."]);
});

test('mixed recursive routes match an independent graph search in either rule order', () => {
  const roads = [['ada', 'ben'], ['ben', 'cara'], ['cara', 'ada'], ['cara', 'dan'], ['eve', 'fox']];
  const names = [...new Set(roads.flat())];
  const expected = new Set();
  for (const start of names) {
    const visited = new Set();
    const pending = roads.filter(([from]) => from === start).map(([, to]) => to);
    while (pending.length) {
      const end = pending.pop();
      if (visited.has(end)) continue;
      visited.add(end);
      expected.add(`${start} reaches ${end}.`);
      pending.push(...roads.filter(([from]) => from === end).map(([, to]) => to));
    }
  }
  const rules = [
    'first reaches second if first reaches fourth and fourth connects second.',
    'if first connects second then first reaches second.',
  ];
  for (const order of [rules, rules.slice().reverse()]) {
    const answers = run(`${roads.map(([from, to]) => `${from} connects ${to}.`).join('\n')}
      ${order.join('\n')}
      who reaches what?
      check that not ada reaches eve.
    `);
    assert.deepEqual(new Set(answers[0].split('\n')), expected);
  }
});

test('shared variables in calls and heads keep their equality constraints', () => {
  const answers = run(`
    alice knows bob. bob knows bob. bob is a person.
    first likes second if first knows second.
    first mirrors first if first is a person.
    who likes who?
    who mirrors what?
    does alice mirror bob?
  `);
  assert.deepEqual(answers, ['bob likes bob.', 'bob mirrors bob.', "I don't know whether alice mirrors bob."]);
});

test('head unification supports nested lists, open tails, and calculated outputs', () => {
  assert.deepEqual(run(`
    the length of [] is 0.
    the length of [fourth | fifth] is third plus 1 if the length of fifth is third.
    what is the length of [red, [blue, green], gold]?
    check that the length of [red, [blue, green], gold] is 3.
    check that not the length of [red, [blue, green], gold] is 2.
  `), [
    'the length of [red, [blue, green], gold] is 3.',
    'check passed: the length of [red, [blue, green], gold] is 3.',
    'check passed: not the length of [red, [blue, green], gold] is 2.',
  ]);
});

test('head aliases can be bound by structural clues and cannot create cyclic lists', () => {
  assert.deepEqual(run(`
    [milo, luna] is a pair.
    [first, second] pairs first if [first, second] is a pair.
    who pairs what?
    milo is a person.
    first wraps [tag, first] if first is a person.
    who wraps who?
  `), ['[milo, luna] pairs milo.', "I don't know anyone or anything that fits that question yet."]);
});

test('computed head constraints filter answers without solving arithmetic backwards', () => {
  assert.deepEqual(run(`${fibonacci}
    is the fibonacci of 10 equal to 55?
    is the fibonacci of 10 equal to 54?
  `), ['yes, the fibonacci of 10 is 55.', "I don't know whether the fibonacci of 10 is 54."]);
  assert.throws(() => run(`${fibonacci} the fibonacci of who is what?`), /Give third a value/);
  assert.throws(() => run('milo is a cat. first likes second if first is a cat. what does milo like?'), /an answer must be ground/);
  assert.deepEqual(run(`
    the inverse of zero is 1 divided by 0 if zero is a nonzero-number.
    what is the inverse of zero?
  `), ["I don't know anyone or anything that fits that question yet."]);
});

test('negative consumers wait for requested backward answers, including late derived producers', () => {
  const rules = [
    'first needs rest if first is a tired-player.',
    'first is a ready-player if first is a player and first does not need rest.',
    'if first is a sleepy-player then first is a tired-player.',
  ];
  for (const order of [rules, rules.slice().reverse()]) {
    const answers = run(`
      milo is a player. luna is a player. luna is a sleepy-player.
      ${order.join('\n')}
      who is a ready-player? why?
      does luna not need rest? why?
      check that milo does not need rest.
    `);
    assert.equal(answers[0], 'milo is a ready-player.');
    assert.match(answers[1], /I checked the completed program and found no matching fact/);
    assert.equal(answers[2], 'no, the program shows that luna needs rest.');
    assert.match(answers[3], /luna is a sleepy-player/);
  }
});

test('ground negative calls finish mutually recursive positive definitions before concluding absence', () => {
  assert.deepEqual(run(`
    first is a cat if first is an animal.
    first is an animal if first is a cat.
    milo is a player.
    if first is a player and first is not a cat then first is a ready-player.
    who is a ready-player?
    is milo not a cat?
  `), ['milo is a ready-player.', 'yes, there is no evidence in this program that milo is a cat.']);
});

test('several backward absence layers finish newly requested producers in either rule order', () => {
  const rules = [
    'first is a tired-player if first is a sleepy-player.',
    'first is a ready-player if first is a player and first is not a tired-player.',
    'first is a resting-player if first is a player and first is not a ready-player.',
  ];
  for (const order of [rules, rules.slice().reverse()]) {
    assert.deepEqual(run(`
      milo is a player. luna is a player. luna is a sleepy-player.
      ${order.join('\n')}
      who is a resting-player?
      is milo not a resting-player?
      check that luna is a resting-player.
    `), [
      'luna is a resting-player.',
      'yes, there is no evidence in this program that milo is a resting-player.',
      'check passed: luna is a resting-player.',
    ]);
  }
});

test('negation cycles spanning forward and backward rules are rejected', () => {
  assert.throws(() => run(`
    milo is a player.
    first is a ready-player if first is a player and first is not a blocked-player.
    if first is a ready-player then first is a blocked-player.
    is milo a ready-player?
  `), /loop through not/);
  assert.throws(() => run('first is a ready-player if first is not a ready-player. is milo a ready-player?'), /loop through not/);
});

test('aggregate queries enumerate finite backward definitions rather than counting the cache', () => {
  const program = `
    the input-score of milo is 3.
    the input-score of luna is 4.
    the input-score of rex is 4.
    the score of first is third times 2 if the input-score of first is third.
    first is a winner if the score of first is third and third is at least 8.
  `;
  for (const queries of [
    'what is the score of milo? what is the total of all scores? how many winners are there?',
    'what is the total of all scores? how many winners are there? what is the score of milo?',
  ]) {
    const answers = run(program + queries + 'check that there are 2 winners.');
    assert.ok(answers.includes('the total of all scores is 22.'));
    assert.ok(answers.includes('there are 2 winners.'));
    assert.ok(answers.includes('the score of milo is 6.'));
  }
  assert.throws(() => run(fibonacci + 'what is the total of all fibonaccis?'), /Give third a value/);
});

test('counting variable-kind backward heads enumerates their finite relation', () => {
  assert.deepEqual(run(`
    milo has-kind cat. luna has-kind cat. milo has-kind pet.
    first is a second if first has-kind second.
    how many cats are there?
    how many pets are there?
    check that there are 2 cats.
  `), ['there are 2 cats.', 'there is 1 pet.', 'check passed: there are 2 cats.']);
});

test('checks alone request backward answers and still report their own source line on failure', () => {
  assert.deepEqual(run(fibonacci + 'check that the fibonacci of 10 is 55.'), ['check passed: the fibonacci of 10 is 55.']);
  assert.throws(() => run(fibonacci + '\ncheck that the fibonacci of 10 is 56.'), /Line \d+: Check failed/);
});

test('changed seeds recompute tabled answers and caches remain local to a run', () => {
  const changed = fibonacci.replace('the fibonacci of 0 is 0.', 'the fibonacci of 0 is 2.');
  let a = 2n;
  let b = 1n;
  for (let index = 0; index < 1000; index++) [a, b] = [b, a + b];
  assert.deepEqual(run(changed + 'what is the fibonacci of 1000?'), [`the fibonacci of 1000 is ${a}.`]);
  assert.deepEqual(run(fibonacci + 'what is the fibonacci of 10?'), ['the fibonacci of 10 is 55.']);
});

test('overlapping calls reuse the same answer and proof records', () => {
  const facts = infer(parse(fibonacci + `
    what is the fibonacci of 20?
    what is the fibonacci of 19?
    check that the fibonacci of 18 is 2584.
  `));
  assert.equal(facts.length, 21);
  const twenty = facts.find(record => record.goal.terms[0] === '20');
  const nineteen = facts.find(record => record.goal.terms[0] === '19');
  assert.equal(twenty.premises[1], nineteen);
  assert.equal(twenty.premises[2], nineteen.premises[1]);
});
