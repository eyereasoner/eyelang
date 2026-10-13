import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';

const unknown = "I don't know anyone or anything that fits that question yet.";
const set = block => block === unknown ? [] : block.split('\n').sort();
const rule = (head, clues, backward) => backward ? `${head} if ${clues}.` : `if ${clues} then ${head}.`;

// An independent boolean reachability matrix supplies the graph oracle.
function closure(edges) {
  const nodes = [...new Set(edges.flat())];
  const matrix = nodes.map(a => nodes.map(b => edges.some(([x, y]) => x === a && y === b)));
  for (let via = 0; via < nodes.length; via++) {
    for (let from = 0; from < nodes.length; from++) {
      for (let to = 0; to < nodes.length; to++) {
        matrix[from][to] ||= matrix[from][via] && matrix[via][to];
      }
    }
  }
  return nodes.flatMap((a, i) => nodes.filter((b, j) => matrix[i][j]).map(b => `${a} reaches ${b}.`)).sort();
}

const graphs = [
  [],
  [['ada', 'ben'], ['ben', 'cara'], ['ada', 'cara'], ['dan', 'eve']],
  [['ada', 'ben'], ['ben', 'cara'], ['cara', 'ada'], ['cara', 'dan']],
  [['ada', 'ada'], ['ada', 'ben'], ['ada', 'ben'], ['ben', 'ben'], ['dan', 'eve']],
];
for (const [graph, edges] of graphs.entries()) {
  for (const [mode, baseBackward, recursiveBackward] of [
    ['forward', false, false], ['backward', true, true],
    ['forward-base', false, true], ['backward-base', true, false],
  ]) {
    test(`[inference-closure-${graph}-${mode}] SPEC §6.1: ${mode} closure agrees with independent reachability`, () => {
      const facts = edges.map(([a, b]) => `${a} connects ${b}.`);
      const rules = [
        rule('?from reaches ?to', '?from connects ?to', baseBackward),
        rule('?from reaches ?to', '?from reaches ?middle and ?middle connects ?to', recursiveBackward),
      ];
      const expected = closure(edges);
      for (const source of [
        [...facts, ...rules], [...rules.slice().reverse(), ...facts.slice().reverse()],
        [rules[1], ...facts, rules[0]],
      ]) {
        for (const queries of [
          ['who reaches what?', 'what does ada reach?', 'does dan reach eve?'],
          ['does dan reach eve?', 'what does ada reach?', 'who reaches what?'],
        ]) {
          const answers = run(source.join('\n') + queries.join('\n'));
          const all = queries.indexOf('who reaches what?');
          const fromAda = queries.indexOf('what does ada reach?');
          assert.deepEqual(set(answers[all]), expected);
          assert.deepEqual(set(answers[fromAda]), expected.filter(fact => fact.startsWith('ada reaches ')));
          assert.equal(answers[queries.indexOf('does dan reach eve?')], expected.includes('dan reaches eve.')
            ? 'yes, dan reaches eve.' : "I don't know whether dan reaches eve.");
        }
      }
    });
  }
}

test('[inference-demand-only] SPEC §6.1: unrequested backward definitions do no arithmetic or list construction', () => {
  assert.deepEqual(run(`
    the broken of ?input is 1 divided by 0 if ?input is equal to ?input.
    the growing of ?input is [tag, ?rest] if the growing of ?input is ?rest.
    ada is a person. who is a person?
  `), ['ada is a person.']);
});

test('[inference-head-inputs] SPEC §4.2: bound head inputs can drive comparisons, negation, and recursive arithmetic', () => {
  assert.deepEqual(run(`
    the sum-to of 0 is 0.
    the sum-to of ?input is ?previous plus ?input
    if ?input is greater than 0 and the sum-to of ?input minus 1 is ?previous.
    ?person is an eligible-person if ?person is not a blocked-person.
    the sum-to of 12 is ?sum?
    is ada an eligible-person?
    check that the sum-to of 12 is 78.
  `), ['the sum-to of 12 is 78.', 'yes, ada is an eligible-person.', 'check passed: the sum-to of 12 is 78.']);
});

for (const [id, source] of [
  ['comparison', 'the echo of ?input is ?input if ?input is equal to ?input. the echo of ?input is ?output?'],
  ['negative', '?person is an eligible-person if ?person is not a blocked-person. who is an eligible-person?'],
  ['calculation', 'the next of ?input is ?input plus 1 if demo is a seed. demo is a seed. the next of ?input is ?output?'],
  ['head-output', '?person likes ?friend if ?person is a person. ada is a person. what does ada like?'],
  ['head-tail', 'the value of [?head | ?tail] is ?tail if demo is a seed. demo is a seed. the value of [red | ?rest] is ?value?'],
]) {
  test(`[inference-missing-${id}] SPEC §4.2: missing runtime bindings cause an error (${id})`, () => {
    assert.throws(() => run(source), /Give \?\S+ a value/);
  });
}

test('[inference-head-calculation] SPEC §4.2: calculated heads filter requested outputs and never run after a false body', () => {
  assert.deepEqual(run(`
    the double of ?input is ?input times 2 if ?input is at least 0.
    the inverse of zero is 1 divided by 0 if zero is a nonzero-number.
    is the double of 3 equal to 6?
    is the double of 3 equal to 7?
    what is the inverse of zero?
  `), ['yes, the double of 3 is 6.', "I don't know whether the double of 3 is 7.", unknown]);
});

test('[inference-aliases] SPEC §3.5, 6.1: variant calls preserve repeated-variable constraints and structural tails', () => {
  const source = `
    the input of good is [red, red]. the input of bad is [red, blue].
    ?left pairs ?right if the input of ?case is [?left, ?right].
    the tail of [?head | ?rest] is ?rest if ?head is equal to ?head.
    ?item wraps [tag, ?item] if ?item is a seed.
    red is a seed.
  `;
  for (const queries of [
    ['?left pairs ?right?', '?same pairs ?same?', 'the tail of [red, blue] is ?tail?'],
    ['?same pairs ?same?', '?left pairs ?right?', 'the tail of [red, blue] is ?tail?'],
  ]) {
    const answers = run(source + queries.join('\n') + '?item wraps ?item?');
    assert.deepEqual(set(answers[queries.indexOf('?left pairs ?right?')]), ['red pairs blue.', 'red pairs red.']);
    assert.deepEqual(set(answers[queries.indexOf('?same pairs ?same?')]), ['red pairs red.']);
    assert.equal(answers[2], 'the tail of [red, blue] is [blue].');
    assert.equal(answers[3], unknown);
  }
});

test('[inference-run-isolation] SPEC §6.1, 8: tables and why context are local to each run', () => {
  const source = seed => `the seed of demo is ${seed}. the output of ?case is ?value plus 1 if the seed of ?case is ?value. what is the output of demo?`;
  assert.deepEqual(run(source(1)), ['the output of demo is 2.']);
  assert.deepEqual(run(source(8)), ['the output of demo is 9.']);
  assert.deepEqual(run(source(1)), ['the output of demo is 2.']);
  assert.deepEqual(run('why?'), ['Ask a question first, then ask why.']);
});

for (const backward of [false, true]) {
  test(`[inference-empty-recursion-${backward}] SPEC §6.1: unsupported positive recursion has an empty least fixed point`, () => {
    assert.deepEqual(run(`
      ${rule('?person is a cat', '?person is an animal', backward)}
      ${rule('?person is an animal', '?person is a cat', backward)}
      who is an animal? is ada a cat? is ada not a cat?
    `), [unknown, "I don't know whether ada is a cat.", 'yes, there is no evidence in this program that ada is a cat.']);
  });
  test(`[inference-negative-layers-${backward}] SPEC §6.2: absence waits for all positive producers in each layer`, () => {
    const facts = 'ada is a person. ben is a person. cara is a person. ben is a seed.';
    const rules = [
      rule('?person is a blocked-person', '?person is a seed', backward),
      rule('?person is an eligible-person', '?person is a person and ?person is not a blocked-person', backward),
      rule('?person is a held-person', '?person is a person and ?person is not an eligible-person', backward),
    ];
    for (const order of [rules, rules.slice().reverse()]) {
      const [held, eligible, ...checks] = run(`${facts} ${order.join('\n')}
        who is a held-person? who is an eligible-person?
        check that ben is a held-person. check that there are 2 eligible-persons.
      `);
      assert.equal(held, 'ben is a held-person.');
      assert.deepEqual(set(eligible), ['ada is an eligible-person.', 'cara is an eligible-person.']);
      assert.deepEqual(checks, ['check passed: ben is a held-person.', 'check passed: there are 2 eligible-persons.']);
    }
  });
}

for (const [id, source] of [
  ['direct', '?person is a ready-person if ?person is not a ready-person.'],
  ['mixed', '?person is a ready-person if ?person is not a blocked-person. if ?person is a ready-person then ?person is a blocked-person.'],
  ['property-constants', 'the flag of ada is red if not the flag of ben is blue.'],
  ['verb-constants', 'ada likes ben if not cara likes dan.'],
  ['variable-kind', '?person is a ?kind if ?person has-kind ?kind. if ?person is a player and ?person is not a tired-player then ?person has-kind ready-player.'],
]) {
  test(`[inference-negative-cycle-${id}] SPEC §6.2: conservative negative-cycle analysis rejects ${id}`, () => {
    assert.throws(() => run(source), /loop through not/);
  });
}

test('[inference-negative-computed] SPEC §6.2: negated comparisons add no fact dependency cycle', () => {
  assert.deepEqual(run('ada is a person. if ?person is a person and not 1 is greater than 2 then ?person is a person. who is a person?'),
    ['ada is a person.']);
});

for (const questions of [
  ['what is the score of ada?', 'what is the total of all scores?', 'how many winners are there?'],
  ['how many winners are there?', 'what is the total of all scores?', 'what is the score of ada?'],
]) {
  test(`[inference-aggregate-order-${questions[0].startsWith('how')}] SPEC §7.2: aggregates enumerate finite definitions independently of cached calls`, () => {
    const source = `
      the input of ada is 3. the input of ben is 5. the input of cara is 5.
      the score of ?person is ?value times 2 if the input of ?person is ?value.
      ?person is a winner if the score of ?person is ?score and ?score is greater than 6.
      ${questions.join('\n')}
    `;
    const answers = run(source);
    assert.equal(answers[questions.indexOf('what is the total of all scores?')], 'the total of all scores is 26.');
    assert.equal(answers[questions.indexOf('how many winners are there?')], 'there are 2 winners.');
  });
}

test('[inference-aggregate-variable-kind] SPEC §7.2: counts enumerate a variable-kind backward head', () => {
  assert.deepEqual(run(`
    ada has-kind cat. ben has-kind cat. ada has-kind pet.
    ?person is a ?kind if ?person has-kind ?kind.
    check that there are 2 cats. check that there is 1 pet.
  `), ['check passed: there are 2 cats.', 'check passed: there is 1 pet.']);
});

test('[inference-aggregate-input] SPEC §7.2: an unrestricted aggregate must report missing backward inputs', () => {
  assert.throws(() => run('the next of ?input is ?input plus 1 if ?input is greater than 0. what is the total of all nexts?'),
    /Give \?input a value/);
});

test('[inference-check-demand] SPEC §2, 9: a check alone requests backward computation without supplying evidence', () => {
  assert.deepEqual(run('the double of ?input is ?input times 2 if ?input is at least 0. check that the double of 9 is 18.'),
    ['check passed: the double of 9 is 18.']);
  assert.throws(() => run('check that ada is a person.'), /Check failed/);
});

for (const [id, first, second] of [
  ['list', '[ada]', '[ben]'], ['nested-list', '[[ada], []]', '[[ben], []]'],
  ['text', '"Ada"', '"Ben"'], ['number-versus-text', '7', '"7"'],
]) {
  test(`[inference-structural-count-${id}] SPEC §3.5, 7.2: counts distinguish ${id} subjects structurally when plural labels overlap`, () => {
    assert.deepEqual(run(`
      ${first} is a class. ${first} is a classe. ${second} is a class.
      check that there are 2 classes.
    `), ['check passed: there are 2 classes.']);
  });
}

test('[inference-depth] SPEC §6.3: finite chains have no semantic depth cutoff', () => {
  const links = Array.from({ length: 128 }, (_, i) => `k${i} implies k${i + 1}.`);
  assert.deepEqual(run(`ada is a k0. ${links.join('\n')}
    ?person is a ?superkind if ?person is a ?kind and ?kind implies ?superkind.
    is ada a k128? check that ada is a k128.
  `), ['yes, ada is a k128.', 'check passed: ada is a k128.']);
});
