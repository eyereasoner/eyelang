import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../src/language.js';

test('negation completes forward and requested tabled producers before testing absence', () => {
  for (const tabled of ['', ':- table blocked/1, eligible/1, held/1.']) {
    assert.deepEqual(run(String.raw`
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

test('constant argument dependencies distinguish strata and reject cycles that overlap', () => {
  assert.deepEqual(run(String.raw`p(a). p(b) :- \+ p(c). ?- p(b).`), ['true.']);
  assert.throws(() => run(String.raw`p(a) :- \+ p(b). p(b) :- p(a). ?- p(a).`), /cycle through negation/);
  assert.throws(() => run(String.raw`p(X) :- seed(X), \+ p(X). ?- p(a).`), /cycle through negation/);
});

test('unbound negation fails explicitly and builtin negation never binds variables', () => {
  assert.throws(() => run(String.raw`p(a). ?- \+ p(X).`), /bound inputs/);
  assert.deepEqual(run(String.raw`?- \+ (1>2). ?- \+ (1<2). ?- \+ (a=b).`), ['true.', 'false.', 'true.']);
  assert.throws(() => run(String.raw`?- \+ (X=a).`), /bound operands/);
  assert.throws(() => run(String.raw`?- \+ (p(a),q(a)).`), /helper predicate/);
});
