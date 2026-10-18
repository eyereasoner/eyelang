import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';
import { assertAnswers } from './helpers.js';

// SPEC §6 (aggregation dependencies) and §7 (distinct completed producer tuples).

const scores = 'score(ada,7). score(ben,7). score(cara,10). score(ben,7).';
test('aggregates use distinct completed tuples, exact totals, and explicit output arguments', () => {
  assertAnswers(run(`${scores}
    ?- aggregate_all(count, score(X,V), N).
    ?- aggregate_all(sum(V), score(X,V), N).
    ?- aggregate_all(min(V), score(X,V), N).
    ?- aggregate_all(max(V), score(X,V), N).
    ?- aggregate_all(count, score(X,V), 3).
    ?- aggregate_all(count, score(X,V), 4).
  `), ['N = 3.', 'N = 24.', 'N = 7.', 'N = 10.', 'true.', 'false.']);
});

test('§7: empty extrema fail and real extrema retain the selected term type', () => {
  assertAnswers(run(`
    value(a, 0.5). value(b, 2.0). value(c, 9007199254740993).
    ?- aggregate_all(max(V), missing(V), N).
    ?- aggregate_all(min(V), value(X,V), N).
    ?- aggregate_all(max(V), value(X,V), N).
    ?- aggregate_all(sum(V), missing(V), 0.0).
  `), ['false.', 'N = 0.5.', 'N = 9007199254740993.', 'false.']);
});

test('numeric extrema preserve exact comparisons and the selected integer or real term', () => {
  assertAnswers(run(`
    integer_first(a,1). integer_first(b,1.0).
    real_first(a,1.0). real_first(b,1).
    large(a,9007199254740993). large(b,9007199254740992.0).
    ?- aggregate_all(min(V), integer_first(K,V), N).
    ?- aggregate_all(max(V), integer_first(K,V), N).
    ?- aggregate_all(min(V), real_first(K,V), N).
    ?- aggregate_all(max(V), real_first(K,V), N).
    ?- aggregate_all(min(V), large(K,V), N).
    ?- aggregate_all(max(V), large(K,V), N).
  `), ['N = 1.', 'N = 1.', 'N = 1.0.', 'N = 1.0.',
    'N = 9007199254740992.0.', 'N = 9007199254740993.']);
});

test('§7: producer variables are local while earlier bindings constrain each aggregate', () => {
  assertAnswers(run(`
    score(ada,7). score(ada,3). score(ben,10).
    ?- Person = ada, aggregate_all(sum(Value), score(Person,Value), Total), Value = outside.
    ?- aggregate_all(count, (score(Person,Value), Value > 5), Count), Person = outside.
    ?- aggregate_all(count, score(Person,Value), Count), aggregate_all(sum(Value), score(Person,Value), Total).
    :- assertion((Person = ben, aggregate_all(sum(Value), score(Person,Value), 10))).
  `), ['Person = ada, Total = 10, Value = outside.', 'Count = 2, Person = outside.',
    'Count = 3, Total = 20.', 'check passed: Person = ben, aggregate_all(sum(Value), (score(Person, Value)), 10).']);
});

test('§6 and §7: aggregates wait for recursive producers and later strata', () => {
  assertAnswers(run(String.raw`
    :- table reach/2.
    edge(a,b). edge(b,c). edge(c,a). blocked(c).
    reach(X,Y) :- edge(X,Y).
    reach(X,Y) :- reach(X,Z), edge(Z,Y).
    count(N) :- aggregate_all(count, (reach(a,X), \+ blocked(X)), N).
    ?- count(N).
  `), ['N = 2.']);
});

test('aggregation completes tabled producers, handles empty input, and respects outer bindings', () => {
  assertAnswers(run(`${scores}
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
  assertAnswers(run(`value(a,9007199254740993). value(b,2).
    ?- aggregate_all(sum(V),value(X,V),N).
    small(1). small(2). small(3).
    ?- aggregate_all(sum(V),small(V),N).
    real(a,0.5). real(b,1.25). ?- aggregate_all(sum(V),real(X,V),N).
  `), ['N = 9007199254740995.', 'N = 6.', 'N = 1.75.']);
});

test('aggregate cycles and unavailable arithmetic inputs report errors', () => {
  assert.throws(() => run('p(N) :- aggregate_all(count,p(X),N). ?- p(N).'), /cycle through negation or aggregation/);
  assert.throws(() => run(':- table p/2. p(X,Y) :- Y is X+1. ?- aggregate_all(count,p(X,Y),N).'), /unbound/);
});
