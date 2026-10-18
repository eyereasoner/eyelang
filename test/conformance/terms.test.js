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

test('invalid bound list tails report an error before arithmetic or aggregation', () => {
  for (const goal of ['X is 3', 'aggregate_all(count, missing(a), X)',
    String.raw`\+ aggregate_all(count, missing(a), X)`]) {
    assert.throws(() => run(`?- X = [a | Tail], Tail = b, ${goal}.`),
      /Line 1: The part after \| must be a list or a variable/);
  }
});

test('term-test names are available for ordinary user-defined predicates', () => {
  for (const name of ['var', 'nonvar', 'ground', 'atom', 'string', 'integer',
    'float', 'number', 'atomic', 'compound', 'is_list']) {
    const output = run(`
      ${name}(accepted).
      ?- ${name}(Value). ?- why.
      :- assertion(${name}(accepted)).
    `);
    assert.equal(output[0], 'Value = accepted.');
    assert.ok(output[1].includes(`step(${name}(accepted), fact(1), [], [])`));
    assert.equal(output[2], `check passed: ${name}(accepted).`);
  }
});
