import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';
import { assertAnswers } from './helpers.js';

// SPEC §6 (completed, stratified negation and bound negative tests).

test('negation completes forward and requested tabled producers before testing absence', () => {
  for (const tabled of ['', ':- table blocked/1, eligible/1, held/1.']) {
    assertAnswers(run(String.raw`
      ${tabled}
      person(ada). person(ben). person(cara). seed(ben).
      held(X) :- person(X), \+ eligible(X).
      eligible(X) :- person(X), \+ blocked(X).
      blocked(X) :- seed(X).
      ?- held(X). ?- eligible(X). ?- \+ blocked(ada). ?- \+ blocked(ben).
      :- assertion(held(ben)).
    `).slice(0,4), ['X = ben.', 'X = ada.\nX = cara.', 'true.', 'false.']);
  }
});

test('§6: dependency analysis distinguishes predicate arities', () => {
  assertAnswers(run(String.raw`
    seed(a). p(X, a) :- seed(X), \+ p(X).
    ?- p(a, a). ?- p(a).
  `), ['true.', 'false.']);
});

test('§6: nested negation and negated generators require helper predicates', () => {
  for (const [source, error] of [
    [String.raw`?- \+ (\+ missing(a)).`, /Nested negation/],
    [String.raw`?- \+ between(1,3,2).`, /helper predicate/],
    [String.raw`?- \+ aggregate_all(count,missing(X),0).`, /helper predicate/],
    [String.raw`?- \+ (X is 1+2).`, /bound result/],
    [String.raw`?- \+ (3 is X+2).`, /unbound/],
  ]) assert.throws(() => run(source), error);
});

test('constant argument dependencies distinguish strata and reject cycles that overlap', () => {
  assertAnswers(run(String.raw`p(a). p(b) :- \+ p(c). ?- p(b).`), ['true.']);
  assert.throws(() => run(String.raw`p(a) :- \+ p(b). p(b) :- p(a). ?- p(a).`), /cycle through negation/);
  assert.throws(() => run(String.raw`p(X) :- seed(X), \+ p(X). ?- p(a).`), /cycle through negation/);
});

test('unbound negation fails explicitly and builtin negation never binds variables', () => {
  assert.throws(() => run(String.raw`p(a). ?- \+ p(X).`), /bound inputs/);
  assertAnswers(run(String.raw`?- \+ (1>2). ?- \+ (1<2). ?- \+ (a=b).`), ['true.', 'false.', 'true.']);
  assert.throws(() => run(String.raw`?- \+ (X=a).`), /bound operands/);
  assert.throws(() => run(String.raw`?- \+ (p(a),q(a)).`), /helper predicate/);
});
