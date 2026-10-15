import test from 'node:test';
import assert from 'node:assert/strict';
import { run } from '../src/language.js';

test('compounds, nested lists, repeated variables, and list tails unify structurally', () => {
  assert.deepEqual(run(`
    data(point(1, 2), [a, [b, c], d]).
    ?- data(point(X, Y), [Head | Tail]).
    ?- data(point(X, X), _).
    ?- X = point(a, [1,2]), X = point(Name, [First|Rest]).
    ?- [a | [b,c]] = [a,b,c].
  `), ['X = 1, Y = 2, Head = a, Tail = [[b, c], d].', 'false.',
    'X = point(a, [1, 2]), Name = a, First = 1, Rest = [2].', 'true.']);
});

test('append and member use ordinary Prolog unit clauses and recursive clauses', () => {
  assert.deepEqual(run(`
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
  assert.deepEqual(run(`
    ?- X = point(X).
    ?- X = [a|X].
    ?- X = Y, Y = f(X).
    ?- f(a) = g(a).
    ?- f(a) = f(a,b).
    ?- [a,b] = [a].
    ?- f(a, [X]) = f(a, [7]).
  `), ['false.', 'false.', 'false.', 'false.', 'false.', 'false.', 'X = 7.']);
});
