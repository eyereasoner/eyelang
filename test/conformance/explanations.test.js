import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';

// SPEC §8 (evidence and explanation context), §9 (checks), and §10 (ARC output).

test('short explanations use numbered rules, supporting facts, and local bindings', () => {
  const answers = run('human(socrates). mortal(Person) :- human(Person). ?- mortal(Who). ?- why.');
  assert.equal(answers[0], 'Who = socrates.');
  assert.equal(answers[1], [
    'Here is why. Each step is shown once.',
    'rule 1: mortal(Person) :- human(Person).',
    'step 1: human(socrates).',
    '  you told me this.',
    'step 2: mortal(socrates).',
    '  because rule 1 uses steps 1.',
    '  with Person = socrates.',
    'That explains step 2.',
  ].join('\n'));
});

test('unit clauses use numbered rules without empty supporting-step references', () => {
  const output = run('same(X, X). ?- same(a, Value). ?- why.');
  assert.equal(output[0], 'Value = a.');
  assert.equal(output[1], [
    'Here is why. Each step is shown once.',
    'rule 1: same(X, X).',
    'step 1: same(a, a).',
    '  because rule 1.',
    '  with X = a.',
    'That explains step 1.',
  ].join('\n'));
});

test('short proofs show shared supporting steps once before their consumers', () => {
  const output = run(`
    source(a).
    left(X) :- source(X).
    right(X) :- source(X).
    both(X) :- left(X), right(X).
    ?- both(Who). ?- why.
  `);
  assert.equal(output[0], 'Who = a.');
  assert.equal(output[1], [
    'Here is why. Each step is shown once.',
    'rule 1: left(X) :- source(X).',
    'rule 2: right(X) :- source(X).',
    'rule 3: both(X) :- left(X), right(X).',
    'step 1: source(a).',
    '  you told me this.',
    'step 2: left(a).',
    '  because rule 1 uses steps 1.',
    '  with X = a.',
    'step 3: right(a).',
    '  because rule 2 uses steps 1.',
    '  with X = a.',
    'step 4: both(a).',
    '  because rule 3 uses steps 2, 3.',
    '  with X = a.',
    'That explains step 4.',
  ].join('\n'));
});

test('§8: explicit why explains every matching answer and sets consecutive follow-up context', () => {
  const output = run(`
    supplied(a). supplied(b).
    derived(X) :- supplied(X).
    ?- why(derived(Who)). ?- why. ?- why.
  `);
  assert.equal(output.length, 3);
  for (const value of ['a', 'b']) {
    assert.match(output[0], new RegExp(`derived\\(${value}\\)\\.`));
    assert.match(output[0], new RegExp(`supplied\\(${value}\\)\\.`));
  }
  assert.equal(output[1], output[0]);
  assert.equal(output[2], output[0]);
});

test('§8: why accepts a grouped conjunction and records unsuccessful explicit goals', () => {
  const output = run(`
    supplied(a). supplied(b). derived(X) :- supplied(X).
    ?- why((derived(Who), Who = a)). ?- why.
    ?- why(missing(a)). ?- why.
  `);
  assert.match(output[0], /derived\(a\)\./);
  assert.doesNotMatch(output[0], /derived\(b\)\./);
  assert.equal(output[1], output[0]);
  assert.equal(output[2], 'false.');
  assert.equal(output[3], 'There is no successful answer to explain.');
});

test('§9: checks only test existence, do not add facts, and run in written order', () => {
  assert.deepEqual(run(`
    p(a). p(b).
    :- assertion(p(_)).
    ?- p(c).
    :- assertion((X = a, p(X))).
    ?- why.
  `), ['false.', 'There is no successful answer to explain.',
    'check passed: p(_).', 'check passed: X = a, p(X).']);
  assert.throws(() => run(':- assertion(missing).\n:- assertion(X is 1/0).'),
    /^Error: Line 1: Check failed: missing\./);
});

test('§8: explanations retain every digit of exact computed values', () => {
  const output = run(`
    value(9007199254740993).
    doubled(Total) :- value(Value), Total is Value*2.
    ?- doubled(Total). ?- why.
  `);
  assert.equal(output[0], 'Total = 18014398509481986.');
  assert.match(output[1], /doubled\(18014398509481986\)/);
  assert.match(output[1], /\(9007199254740993 \* 2\) = 18014398509481986\./);
});

test('explanations show concrete arithmetic, completed absence, and aggregate contributors', () => {
  const answers = run(String.raw`
    score(ada,7). score(ben,10).
    next(X,N) :- score(X,V), N is V+1.
    ready(X) :- score(X,V), \+ blocked(X).
    ?- next(ada,N). ?- why.
    ?- ready(ada). ?- why.
    ?- aggregate_all(sum(V),score(X,V),N). ?- why.
  `);
  assert.match(answers[1], /\(7 \+ 1\) = 8\./);
  assert.match(answers[1], /rule 1: next\(X, N\) :- score\(X, V\), N is \(V \+ 1\)\./);
  assert.match(answers[1], /with X = ada, V = 7, N = 8\./);
  assert.match(answers[3], /completed program and found no matching fact/);
  assert.match(answers[5], /sum over 2 distinct matching tuples/);
  assert.match(answers[5], /score\(ada, 7\)/);
  assert.match(answers[5], /score\(ben, 10\)/);
});

test('follow-up explanations retain context across checks and across consecutive why queries', () => {
  const factProof = 'Here is why. Each step is shown once.\nstep 1: p(a).\n  you told me this.\nThat explains step 1.';
  assert.deepEqual(run('p(a). ?- p(X). :- assertion(p(a)). ?- why. ?- why.').slice(1,3),
    [factProof, factProof]);
  assert.deepEqual(run('?- why. ?- missing. ?- why.'), ['Ask a query first, then ask ?- why.', 'false.', 'There is no successful answer to explain.']);
  assert.deepEqual(run('?- why.'), ['Ask a query first, then ask ?- why.']);
});

test('numbered proofs retain local clause bindings in deep derivations', () => {
  const clauses = Array.from({length:40},(_,i)=>`p${i+1}(X) :- p${i}(X).`).join('\n');
  const why = run(`p0(a). ${clauses} ?- p40(X). ?- why.`)[1];
  assert.match(why, /^Here is why/);
  assert.equal([...why.matchAll(/^step \d+:/gm)].length, 41);
  assert.match(why, /with X = a/);
  assert.match(why, /step \d+: p40\(a\)/);
  assert.match(why, /rule \d+: p1\(X\) :- p0\(X\)/);
});

for (const depth of [0, 1, 16, 17, 255, 700]) {
  test(`numbered proof at depth ${depth} retains every line`, () => {
    const clauses = Array.from({ length: depth }, (_, index) => `p${index+1}(X) :- p${index}(X).`).join('\n');
    const why = run(`p0(a). ${clauses} ?- p${depth}(X). ?- why.`)[1];
    const expected = ['Here is why. Each step is shown once.'];
    for (let index = 1; index <= depth; index++) expected.push(`rule ${index}: p${index}(X) :- p${index-1}(X).`);
    expected.push('step 1: p0(a).', '  you told me this.');
    for (let index = 1; index <= depth; index++) expected.push(
      `step ${index+1}: p${index}(a).`,
      `  because rule ${index} uses steps ${index}.`,
      '  with X = a.',
    );
    expected.push(`That explains step ${depth+1}.`);
    assert.equal(why, expected.join('\n'));
  });
}

test('ARC grouping preserves source context and reports all empty sections', () => {
  const output = run('p(a). ?- p(X). ?- why. :- assertion(p(a)).', {arc:true});
  assert.equal(output[0], '% Answer\n?- p(X).\nX = a.');
  assert.equal(output[1], '% Reason\nHere is why. Each step is shown once.\nstep 1: p(a).\n  you told me this.\nThat explains step 1.');
  assert.match(output[2], /^% Check\ncheck passed: p\(a\)\./);
  assert.deepEqual(run('p(a).',{arc:true}), [
    '% Answer\nAdd a query such as ?- mortal(Who).',
    '% Reason\nNo explanation was requested. Add ?- why. after a query.',
    '% Check\nNo checks were requested.',
  ]);
});

test('ARC answers retain query context for reused variables, conjunctions, and boolean results', () => {
  const output = run(`
    name(shop, "Delfour"). name(product, "Tea Biscuits").
    ?- name(shop, What). ?- why.
    ?- name(product, What). ?- why.
    ?- name(shop, _). ?- missing.
    ?- name(Who, What), Who = product.
    ?- aggregate_all(count, name(Who, _), Count).
  `, { arc: true });
  assert.equal(output[0], '% Answer\n' + [
    '?- name(shop, What).\nWhat = "Delfour".',
    '?- name(product, What).\nWhat = "Tea Biscuits".',
    '?- name(shop, _).\ntrue.',
    '?- missing.\nfalse.',
    '?- name(Who, What), Who = product.\nWho = product, What = "Tea Biscuits".',
    '?- aggregate_all(count, (name(Who, _)), Count).\nCount = 2.',
  ].join('\n\n'));
  assert.equal(output[1], '% Reason\n' + [
    'Here is why. Each step is shown once.\nstep 1: name(shop, "Delfour").\n  you told me this.\nThat explains step 1.',
    'Here is why. Each step is shown once.\nstep 1: name(product, "Tea Biscuits").\n  you told me this.\nThat explains step 1.',
  ].join('\n\n'));
});

test('assertions are existential checks and fail in source order with source lines', () => {
  assert.deepEqual(run('p(a). :- assertion(p(X)). :- assertion((X is 2+2, X =:= 4)).'),
    ['check passed: p(X).', 'check passed: X is (2 + 2), X =:= 4.']);
  assert.throws(() => run('% first\n:- assertion(missing).\n:- assertion(X is 1/0).'), /^Error: Line 2: Check failed: missing/);
  assert.throws(() => run('% first\n:- assertion(X is 1/0).'), /^Error: Line 2:.*divide by zero/);
});
