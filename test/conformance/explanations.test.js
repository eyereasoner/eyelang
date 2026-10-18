import test from 'node:test';
import assert from 'node:assert/strict';
import { run, parse, checkProof } from '../../src/language.js';

const data = (proof, name) => parse(proof).clauses
  .filter(clause => clause.conclusion.relation === `predicate:${name}/${name === 'step' ? 4 : name === 'clause' ? 3 : 2}`)
  .map(clause => clause.conclusion.terms);
const arc = source => run(source, { arc: true });
const certificate = reason => reason.slice('% Reason\n'.length);

// SPEC §8–10: one certificate in Reason and its verification report in Check.
test('short explanations are certificates with source clauses, facts and local bindings', () => {
  const source = 'human(socrates). mortal(Person) :- human(Person). ?- mortal(Who). ?- why.';
  const [answer, reason, check] = arc(source);
  assert.equal(answer, '% Answer\n?- mortal(Who).\nWho = socrates.');
  assert.match(reason, /clause\(2, mortal\(var\('Person'\)\), \[human\(var\('Person'\)\)\]\)/);
  assert.match(reason, /step\(mortal\(socrates\), rule\(2\), \['='\('Person', socrates\)\], \[human\(socrates\)\]\)/);
  assert.equal(checkProof(source, certificate(reason), { allowTrusted: false }).valid, true);
  assert.match(check, /verdict\(checked\)/);
});

test('unit clauses cite the source and preserve repeated-variable bindings', () => {
  const source = 'same(X, X). ?- same(a, Value). ?- why.';
  const [answer, reason] = arc(source);
  assert.match(answer, /Value = a/);
  assert.match(reason, /step\(same\(a, a\), fact\(1\), \['='\('X', a\)\], \[\]\)/);
  assert.equal(checkProof(source, certificate(reason)).valid, true);
});

test('shared supporting steps appear once before their consumers', () => {
  const source = `source(a). left(X) :- source(X). right(X) :- source(X).
    both(X) :- left(X), right(X). ?- both(Who). ?- why.`;
  const proof = certificate(arc(source)[1]);
  const steps = data(proof, 'step');
  assert.equal(steps.length, 4);
  assert.deepEqual(steps.map(step => step[0].functor), ['source', 'left', 'right', 'both']);
  assert.equal(checkProof(source, proof, { allowTrusted: false }).valid, true);
});

test('explicit why certifies every answer and repeated follow-ups share one certificate', () => {
  const source = 'supplied(a). supplied(b). derived(X) :- supplied(X). ?- why(derived(Who)). ?- why. ?- why.';
  const [, reason, check] = arc(source);
  const proof = certificate(reason);
  assert.equal(data(proof, 'claim').length, 2);
  assert.equal(data(proof, 'step').length, 4);
  assert.equal([...reason.matchAll(/^certificate\(/gm)].length, 1);
  assert.equal([...check.matchAll(/^verdict\(/gm)].length, 1);
  assert.equal(checkProof(source, proof).valid, true);
});

test('why accepts conjunctions and unsuccessful follow-ups remain comments beside a certificate', () => {
  const source = `supplied(a). supplied(b). derived(X) :- supplied(X).
    ?- why((derived(Who), Who = a)). ?- why. ?- why(missing(a)). ?- why.`;
  const [, reason] = arc(source);
  assert.match(reason, /step\(derived\(a\)/);
  assert.doesNotMatch(reason, /step\(derived\(b\)/);
  assert.match(reason, /% false\./);
  assert.match(reason, /% There is no successful answer/);
  assert.equal(checkProof(source, certificate(reason)).valid, true);
});

test('checks test existence, do not add facts, and run in written order', () => {
  assert.deepEqual(run(`p(a). p(b). :- assertion(p(_)). ?- p(c).
    :- assertion((X = a, p(X))). ?- why.`), ['false.', 'There is no successful answer to explain.',
    'check passed: p(_).', 'check passed: X = a, p(X).']);
  assert.throws(() => run(':- assertion(missing).\n:- assertion(X is 1/0).'), /^Error: Line 1: Check failed: missing\./);
});

test('certificates retain every digit of exact arithmetic operands and results', () => {
  const source = `value(9007199254740993). doubled(Total) :- value(Value), Total is Value*2.
    ?- doubled(Total). ?- why.`;
  const [answer, reason, check] = arc(source);
  assert.match(answer, /Total = 18014398509481986/);
  assert.match(reason, /is\(18014398509481986, '\*'\(9007199254740993, 2\)\)/);
  assert.equal(checkProof(source, certificate(reason), { allowTrusted: false }).valid, true);
  assert.match(check, /recomputed\(1\)/);
});

test('one certificate combines arithmetic, absence, and aggregate contributors with explicit obligations', () => {
  const source = String.raw`score(ada,7). score(ben,10).
    next(X,N) :- score(X,V), N is V+1.
    ready(X) :- score(X,V), \+ blocked(X).
    ?- next(ada,N). ?- why. ?- ready(ada). ?- why.
    ?- aggregate_all(sum(V),score(X,V),N). ?- why.`;
  const [, reason, check] = arc(source);
  assert.match(reason, /is\(8, '\+'\(7, 1\)\)/);
  assert.match(reason, /absent, \[\], \[\]/);
  assert.match(reason, /collected, \[\], \[\[score\(ada, 7\)\], \[score\(ben, 10\)\]\]/);
  const report = checkProof(source, certificate(reason));
  assert.equal(report.valid, true);
  assert.deepEqual(report.trusted.map(item => item.kind).sort(), ['absent', 'collected']);
  assert.match(check, /checked_with_obligations/);
});

test('follow-ups retain context across assertions without duplicating certificates', () => {
  const source = 'p(a). ?- p(X). :- assertion(p(a)). ?- why. ?- why.';
  const [, reason, check] = arc(source);
  assert.equal(data(certificate(reason), 'claim').length, 1);
  assert.match(check, /^% Check\ncheck passed: p\(a\)\./);
  assert.equal(checkProof(source, certificate(reason)).valid, true);
  assert.deepEqual(run('?- why. ?- missing. ?- why.'), ['Ask a query first, then ask ?- why.', 'false.', 'There is no successful answer to explain.']);
  assert.deepEqual(run('?- why.'), ['Ask a query first, then ask ?- why.']);
});

for (const depth of [0, 1, 16, 17, 40, 255, 700]) {
  test(`certificate at depth ${depth} retains every source clause and supporting step`, () => {
    const clauses = Array.from({ length: depth }, (_, index) => `p${index+1}(X) :- p${index}(X).`).join('\n');
    const source = `p0(a). ${clauses} ?- p${depth}(X). ?- why.`;
    const proof = certificate(arc(source)[1]);
    const steps = data(proof, 'step');
    const cited = data(proof, 'clause');
    assert.equal(steps.length, depth + 1);
    assert.equal(cited.length, depth + 1);
    for (let index = 0; index <= depth; index++) {
      assert.equal(steps[index][0].functor, `p${index}`);
      assert.equal(steps[index][0].args[0].atom, 'a');
      assert.equal(steps[index][1].args[0], String(index + 1));
      assert.equal(steps[index][3].list.length, index === 0 ? 0 : 1);
      if (index) assert.equal(steps[index][3].list[0].functor, `p${index - 1}`);
    }
    assert.equal(checkProof(source, proof, { allowTrusted: false }).valid, true);
  });
}

test('ARC reports empty sections and only certifies requested successful explanations', () => {
  assert.deepEqual(arc('p(a).'), [
    '% Answer\nAdd a query such as ?- mortal(Who).',
    '% Reason\nNo explanation was requested. Add ?- why. after a query.',
    '% Check\nNo checks were requested.',
  ]);
  const source = 'p(a). p(b). ?- p(X). ?- why. ?- p(c). ?- why. ?- p(a).';
  const [answer, reason, check] = arc(source);
  assert.match(answer, /\?- p\(c\)\.\nfalse\./);
  assert.deepEqual(data(certificate(reason), 'claim').map(claim => claim[0].args[0]), ['1', '1']);
  assert.equal(checkProof(source, certificate(reason)).valid, true);
  assert.match(check, /claims\(2\)/);
});

test('ARC answers preserve each query context while Reason shares supplied facts', () => {
  const source = `name(shop, "Delfour"). name(product, "Tea Biscuits").
    ?- name(shop, What). ?- why. ?- name(product, What). ?- why.
    ?- name(shop, _). ?- missing. ?- name(Who, What), Who = product.
    ?- aggregate_all(count, name(Who, _), Count).`;
  const [answer, reason] = arc(source);
  assert.equal(answer, '% Answer\n' + [
    '?- name(shop, What).\nWhat = "Delfour".', '?- name(product, What).\nWhat = "Tea Biscuits".',
    '?- name(shop, _).\ntrue.', '?- missing.\nfalse.',
    '?- name(Who, What), Who = product.\nWho = product, What = "Tea Biscuits".',
    '?- aggregate_all(count, (name(Who, _)), Count).\nCount = 2.',
  ].join('\n\n'));
  assert.equal(data(certificate(reason), 'step').length, 2);
  assert.equal(checkProof(source, certificate(reason)).valid, true);
});

test('assertions fail in source order and failed runs emit no certificate', () => {
  assert.deepEqual(run('p(a). :- assertion(p(X)). :- assertion((X is 2+2, X =:= 4)).'),
    ['check passed: p(X).', 'check passed: X is (2 + 2), X =:= 4.']);
  assert.throws(() => run('% first\n:- assertion(missing).\n:- assertion(X is 1/0).'), /^Error: Line 2: Check failed: missing/);
  assert.throws(() => run('% first\n:- assertion(X is 1/0).'), /^Error: Line 2:.*divide by zero/);
});
