import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../../src/language.js';
import { assertAnswers } from './helpers.js';

// SPEC §3 (structural terms, unit clauses, and occurs check) and §4 (binding).

test('compounds, nested lists, repeated variables, and list tails unify structurally', () => {
  assertAnswers(run(`
    data(point(1, 2), [a, [b, c], d]).
    ?- data(point(X, Y), [Head | Tail]).
    ?- data(point(X, X), _).
    ?- X = point(a, [1,2]), X = point(Name, [First|Rest]).
    ?- [a | [b,c]] = [a,b,c].
  `), ['X = 1, Y = 2, Head = a, Tail = [[b, c], d].', 'false.',
    'X = point(a, [1, 2]), Name = a, First = 1, Rest = [2].', 'true.']);
});

test('append and member use ordinary Prolog unit clauses and recursive clauses', () => {
  assertAnswers(run(`
    :- table append/3, member/2.
    append([], List, List).
    append([Head | Tail], Right, [Head | Joined]) :- append(Tail, Right, Joined).
    member(Head, [Head | _]).
    member(Value, [_ | Tail]) :- member(Value, Tail).
    ?- append([a,b], [c], Result).
    ?- member(Value, [a,b,a]).
    ?- append([], [], Result).
  `), ['Result = [a, b, c].', 'Value = a.\nValue = b.', 'Result = [].']);
});

test('unification rejects cyclic terms and incompatible constructors', () => {
  assertAnswers(run(`
    ?- X = point(X).
    ?- X = [a|X].
    ?- X = Y, Y = f(X).
    ?- f(a) = g(a).
    ?- f(a) = f(a,b).
    ?- [a,b] = [a].
    ?- f(a, [X]) = f(a, [7]).
  `), ['false.', 'false.', 'false.', 'false.', 'false.', 'false.', 'X = 7.']);
});

test('integer/1 tests the current term without evaluating or binding it', () => {
  assertAnswers(run(String.raw`
    ?- integer(9007199254740993).
    ?- integer(-7).
    ?- integer(1.0).
    ?- integer('1').
    ?- integer("1").
    ?- integer(1 + 2).
    ?- integer([1]).
    ?- integer(X), X = 1.
    ?- X = 1, integer(X).
    ?- X is 1 + 2, integer(X).
    ?- \+ integer(X), X = a.
    ?- \+ integer(1).
  `), ['true.', 'true.', 'false.', 'false.', 'false.', 'false.', 'false.',
    'false.', 'X = 1.', 'X = 3.', 'X = a.', 'false.']);
});

test('integer guards retain proof evidence and participate in executable checks', () => {
  const output = run(`
    value(1). value(1.0). value(a).
    whole(X) :- value(X), integer(X).
    ?- whole(X). ?- why.
    :- assertion(whole(1)).
    :- assertion(aggregate_all(count, whole(X), 1)).
  `);
  assert.equal(output[0], 'X = 1.');
  assert.match(output[1], /step \d+: integer\(1\)\./);
  assert.throws(() => run(':- assertion(integer(1.0)).'), /Line 1: Check failed: integer\(1.0\)/);
});

for (const [name, yes, no] of [
  ['var', '_', 'pair(_)'],
  ['nonvar', 'pair(_)', '_'],
  ['ground', 'pair(a, [1, 2])', 'pair(a, [_])'],
  ['atom', "'red-fox'", '[]'],
  ['string', '"hello"', 'hello'],
  ['integer', '9007199254740993', '1.0'],
  ['float', '1.0', '1'],
  ['number', '1.0', '1 + 2'],
  ['atomic', '[]', '[a]'],
  ['compound', '[a | _]', '[]'],
  ['is_list', '[_]', '[a | _]'],
]) {
  test(`${name}/1 classifies terms and its negation without binding them`, () => {
    assertAnswers(run(String.raw`
      ?- ${name}(${yes}). ?- ${name}(${no}).
      ?- \+ ${name}(${yes}). ?- \+ ${name}(${no}).
      :- assertion(${name}(${yes})).
    `).slice(0, 4), ['true.', 'false.', 'false.', 'true.']);
  });
}

test('term tests inspect aliases, partial structures, and completed list tails at their call position', () => {
  assertAnswers(run(String.raw`
    ?- var(X), X = Y, var(Y), Y = 7, nonvar(X), integer(X).
    ?- nonvar(X), X = 7.
    ?- X = pair(Y), nonvar(X), compound(X), \+ ground(X), Y = a, ground(X).
    ?- X = [a | Tail], compound(X), \+ is_list(X), Tail = [], is_list(X), ground(X).
    ?- is_list([pair(X)]), \+ ground([pair(X)]), X = a.
    ?- atomic("hello"), number(1), number(1.0), compound(f(a)).
  `), ['X = 7, Y = 7.', 'false.', 'X = pair(a), Y = a.',
    'X = [a], Tail = [].', 'X = a.', 'true.']);
  assert.throws(() => run('?- var(X).'), /answer must be ground/);
});
