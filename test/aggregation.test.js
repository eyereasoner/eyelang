import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../src/language.js';

const scores = 'score(ada,7). score(ben,7). score(cara,10). score(ben,7).';
test('aggregates use distinct completed tuples, exact totals, and explicit output arguments', () => {
  assert.deepEqual(run(`${scores}
    ?- aggregate_all(count, score(X,V), N).
    ?- aggregate_all(sum(V), score(X,V), N).
    ?- aggregate_all(min(V), score(X,V), N).
    ?- aggregate_all(max(V), score(X,V), N).
    ?- aggregate_all(count, score(X,V), 3).
    ?- aggregate_all(count, score(X,V), 4).
  `), ['N = 3.', 'N = 24.', 'N = 7.', 'N = 10.', 'true.', 'false.']);
});

test('aggregation completes tabled producers, handles empty input, and respects outer bindings', () => {
  assert.deepEqual(run(`${scores}
    :- table copied/2. copied(X,V) :- score(X,V).
    total(N) :- aggregate_all(sum(V), copied(X,V), N).
    ?- total(N).
    ?- aggregate_all(count, missing(X), N).
    ?- aggregate_all(sum(V), missing(V), N).
    ?- aggregate_all(min(V), missing(V), N).
    ?- Person=ada, aggregate_all(sum(V), copied(Person,V), N).
    ?- aggregate_all(count, (copied(X,V), V>7), N).
  `), ['N = 24.', 'N = 0.', 'N = 0.', 'false.', 'Person = ada, N = 7.', 'N = 1.']);
});

test('aggregate sums preserve exact large integers and support finite real values', () => {
  assert.deepEqual(run(`value(a,9007199254740993). value(b,2).
    ?- aggregate_all(sum(V),value(X,V),N).
    ?- aggregate_all(sum(V),between(1,3,V),N).
    real(a,0.5). real(b,1.25). ?- aggregate_all(sum(V),real(X,V),N).
  `), ['N = 9007199254740995.', 'N = 6.', 'N = 1.75.']);
});

test('aggregate cycles and unavailable arithmetic inputs report errors', () => {
  assert.throws(() => run('p(N) :- aggregate_all(count,p(X),N). ?- p(N).'), /cycle through negation or aggregation/);
  assert.throws(() => run(':- table p/2. p(X,Y) :- Y is X+1. ?- aggregate_all(count,p(X,Y),N).'), /unbound/);
});
