import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';

for (const backward of [false, true]) {
  test(`[reason-bindings-${backward}] SPEC §8: explanations show concrete local bindings and supplied premises`, () => {
    const source = `
      ada is a person.
      ${backward ? '?person is an artist if ?person is a person.' : 'if ?person is a person then ?person is an artist.'}
      is ada an artist? why?
    `;
    const answers = run(source);
    assert.equal(answers[0], 'yes, ada is an artist.');
    assert.match(answers[1], /^ada is an artist\./);
    assert.match(answers[1], /because .*ada is a person/);
    assert.match(answers[1], /ada is a person\.\n\s+you told me this\./);
    assert.doesNotMatch(answers[1], /\?person|\?0/);
    assert.equal((answers[1].match(/you told me this/g) || []).length, 1);
  });
}

test('[reason-all-answers] SPEC §8: why explains all roots, and each numbered premise precedes its consumer', () => {
  const [answer, reason] = run(`
    ada is a human. ben is a human. human implies mortal.
    if ?person is a ?kind and ?kind implies ?superkind then ?person is a ?superkind.
    who is a mortal? why?
  `);
  assert.deepEqual(answer.split('\n').sort(), ['ada is a mortal.', 'ben is a mortal.']);
  const steps = [...reason.matchAll(/^step (\d+): (.+)$/gm)];
  assert.equal(steps.length, 5);
  assert.equal(new Set(steps.map(step => step[1])).size, 5);
  assert.equal(steps.filter(step => step[2] === 'human implies mortal.').length, 1);
  for (const step of ['ada', 'ben']) {
    assert.ok(steps.some(match => match[2] === `${step} is a mortal.`));
    assert.ok(reason.includes(`?person = ${step}, ?kind = human, ?superkind = mortal`));
  }
  for (const block of reason.split(/^step /m).slice(1)) {
    const current = Number(block.match(/^\d+/)[0]);
    const premises = /because rule \d+ uses steps ([\d, ]+)\./.exec(block);
    if (premises) for (const premise of premises[1].split(', ')) {
      assert.ok(Number(premise) < current, `premise ${premise} must precede ${current}`);
    }
  }
  assert.match(reason, /That explains steps \d+, \d+\.$/);
});

test('[reason-no-truncation] SPEC §8: complete deep proofs retain all facts and exact numeric digits', () => {
  const integer = '123456789012345678901234567890123456789012345678901234567890';
  const links = Array.from({ length: 80 }, (_, i) => `if ?value is a k${i} then ?value is a k${i + 1}.`);
  const [, reason] = run(`${integer} is a k0. ${links.join('\n')} who is a k80? why?`);
  const steps = [...reason.matchAll(/^step (\d+): (.+)$/gm)];
  assert.equal(steps.length, 81);
  for (let i = 0; i <= 80; i++) assert.ok(steps.some(step => step[2] === `${integer} is a k${i}.`));
  assert.equal((reason.match(/you told me this/g) || []).length, 1);
  assert.doesNotMatch(reason, /\.\.\.|truncated|omitted/);
});

test('[reason-computed] SPEC §5.2, 8: arithmetic and inverted comparisons show checked evidence', () => {
  const [, reason] = run(`
    the input of demo is 9.
    if the input of ?case is ?value and not ?value is less than 0
    then the output of ?case is square root of ?value plus 1.
    what is the output of demo? why?
  `);
  assert.match(reason, /square root of 9 makes 3\./);
  assert.match(reason, /3 plus 1 makes 4\./);
  assert.match(reason, /9 is not less than 0\.\n\s+I checked these values\./);
  assert.doesNotMatch(reason, /no matching fact/);
});

test('[reason-absence] SPEC §8: a successful absence reports completed search and never a supplied negative fact', () => {
  const [, reason] = run('is ada not a stranger? why?');
  assert.match(reason, /there is no evidence in this program that ada is a stranger/);
  assert.match(reason, /completed program and found no matching fact/);
  assert.doesNotMatch(reason, /you told me this/);
});

test('[reason-refuted-absence] SPEC §8: a negative no answer is explained by its positive derivation', () => {
  const [answer, reason] = run('ada is a seed. ?person needs rest if ?person is a seed. does ada not need rest? why?');
  assert.equal(answer, 'no, the program shows that ada needs rest.');
  assert.match(reason, /^ada needs rest\./);
  assert.match(reason, /ada is a seed\.\n\s+you told me this\./);
  assert.doesNotMatch(reason, /found no matching fact/);
});

for (const [operation, question, detail] of [
  ['count', 'how many people are there?', /I counted all matching names/],
  ['total', 'what is the total of all scores?', /I added all 2 matching values/],
  ['smallest', 'what is the smallest of all scores?', /I compared all 2 matching values/],
  ['largest', 'what is the largest of all scores?', /I compared all 2 matching values/],
]) {
  test(`[reason-aggregate-${operation}] SPEC §8: aggregate reasons identify every contributing fact`, () => {
    const [, reason] = run('ada is a person. ben is a person. the score of ada is 3. the score of ben is 5. ' + question + 'why?');
    assert.match(reason, detail);
    for (const person of ['ada', 'ben']) {
      assert.ok(reason.includes(operation === 'count' ? `${person} is a person.` : `the score of ${person} is`));
    }
  });
}

for (const question of ['how many people are there?', 'what is the total of all scores?']) {
  test(`[reason-empty-${question.startsWith('how')}] SPEC §8: empty aggregate explanations identify a completed empty search`, () => {
    const [, reason] = run(question + 'why?');
    assert.match(reason, /completed program/);
    assert.match(reason, /\b0\b/);
    assert.doesNotMatch(reason, /you told me this/);
  });
}

test('[reason-context] SPEC §8, 9: consecutive follow-ups retain context across interleaved checks', () => {
  const answers = run('ada is a person. who is a person? check that there is 1 person. why? why? who is a stranger? why?');
  assert.equal(answers[1], answers[2]);
  assert.match(answers[1], /^ada is a person\./);
  assert.equal(answers[4], "I don't have an answer to explain yet.");
  assert.equal(answers[5], 'check passed: there is 1 person.');
});

test('[reason-direct-context] SPEC §8: direct why establishes the context for following why questions', () => {
  const answers = run('ada is a person. why is ada a person? why? why?');
  assert.equal(answers[0], answers[1]);
  assert.equal(answers[1], answers[2]);
});

test('[arc-grouping] SPEC §10: ARC groups blocks without changing their context or written order', () => {
  const source = `
    ada is a person. ben is a person. the score of ada is 7.
    who is a person? check that there are 2 people. why?
    what is the score of ada? why? why?
    check that the total of all scores is 7.
  `;
  const plain = run(source);
  const arc = run(source, { arc: true });
  assert.deepEqual(arc, [
    '# Answer\n' + [plain[0], plain[2]].join('\n\n'),
    '# Reason\n' + [plain[1], plain[3], plain[4]].join('\n\n'),
    '# Check\n' + plain.slice(5).join('\n\n'),
  ]);
});

for (const [id, source] of [
  ['empty', ''], ['facts', 'ada is a person.'], ['answer', 'is ada a person?'],
  ['reason', 'why?'], ['check', 'check that there are 0 people.'],
]) {
  test(`[arc-empty-sections-${id}] SPEC §10: all three nonempty sections appear for ${id}`, () => {
    const arc = run(source, { arc: true });
    assert.deepEqual(arc.map(block => block.split('\n')[0]), ['# Answer', '# Reason', '# Check']);
    assert.ok(arc.every(block => block.split('\n').slice(1).join('\n').trim().length > 0));
    if (id === 'empty' || id === 'facts') assert.match(arc[0], /Add a question/);
  });
}
