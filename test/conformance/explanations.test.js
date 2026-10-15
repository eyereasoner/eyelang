import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';

test('short explanations show actual applied clauses and distinguish supplied facts', () => {
  const answers = run('human(socrates). mortal(Person) :- human(Person). ?- mortal(Who). ?- why.');
  assert.equal(answers[0], 'Who = socrates.');
  assert.equal(answers[1], 'mortal(socrates).\n  because mortal(socrates) :- human(socrates).\n  human(socrates).\n    you told me this.');
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
  assert.match(answers[1], /next\(ada, 8\) :- score\(ada, 7\), 8 is \(7 \+ 1\)\./);
  assert.match(answers[3], /completed program and found no matching fact/);
  assert.match(answers[5], /sum over 2 distinct matching tuples/);
  assert.match(answers[5], /score\(ada, 7\)/);
  assert.match(answers[5], /score\(ben, 10\)/);
});

test('follow-up explanations retain context across checks and across consecutive why queries', () => {
  assert.deepEqual(run('p(a). ?- p(X). :- assertion(p(a)). ?- why. ?- why.').slice(1,3),
    ['p(a).\n  you told me this.', 'p(a).\n  you told me this.']);
  assert.deepEqual(run('?- why. ?- missing. ?- why.'), ['Ask a query first, then ask ?- why.', 'false.', 'There is no successful answer to explain.']);
  assert.deepEqual(run('?- why.'), ['Ask a query first, then ask ?- why.']);
});

test('numbered proofs show every shared step and local clause binding once', () => {
  const clauses = Array.from({length:40},(_,i)=>`p${i+1}(X) :- p${i}(X).`).join('\n');
  const why = run(`p0(a). ${clauses} ?- p40(X). ?- why.`)[1];
  assert.match(why, /^Here is why/);
  assert.equal([...why.matchAll(/^step \d+:/gm)].length, 41);
  assert.match(why, /with X = a/);
  assert.match(why, /step \d+: p40\(a\)/);
  assert.match(why, /rule \d+: p1\(X\) :- p0\(X\)/);
});

test('ARC grouping preserves source context and reports all empty sections', () => {
  const output = run('p(a). ?- p(X). ?- why. :- assertion(p(a)).', {arc:true});
  assert.equal(output[0], '% Answer\n?- p(X).\nX = a.');
  assert.match(output[1], /^% Reason\np\(a\)/);
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
  assert.equal(output[1], '% Reason\nname(shop, "Delfour").\n  you told me this.\n\nname(product, "Tea Biscuits").\n  you told me this.');
});

test('assertions are existential checks and fail in source order with source lines', () => {
  assert.deepEqual(run('p(a). :- assertion(p(X)). :- assertion((X is 2+2, X =:= 4)).'),
    ['check passed: p(X).', 'check passed: X is (2 + 2), X =:= 4.']);
  assert.throws(() => run('% first\n:- assertion(missing).\n:- assertion(X is 1/0).'), /^Error: Line 2: Check failed: missing/);
  assert.throws(() => run('% first\n:- assertion(X is 1/0).'), /^Error: Line 2:.*divide by zero/);
});
