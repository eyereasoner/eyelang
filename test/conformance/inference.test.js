import test from 'node:test';
import assert from 'node:assert/strict';
import { infer, parse, run } from '../../src/language.js';
import { assertAnswers } from './helpers.js';

// SPEC §1 (unspecified answer order), §6 (set semantics, fixed points, and tables).

function closure(size, edges) {
  const reachable = Array.from({ length: size }, () => Array(size).fill(false));
  for (const [from, to] of edges) reachable[from][to] = true;
  for (let middle = 0; middle < size; middle++) {
    for (let from = 0; from < size; from++) {
      for (let to = 0; to < size; to++) reachable[from][to] ||= reachable[from][middle] && reachable[middle][to];
    }
  }
  return reachable.flatMap((row, from) => row.flatMap((yes, to) => yes ? [`From = n${from}, To = n${to}.`] : [])).sort();
}

for (let seed = 0; seed < 8; seed++) {
  const edges = [];
  for (let from = 0; from < 6; from++) for (let to = 0; to < 6; to++) {
    if ((from * 7 + to * 11 + seed * 13) % 5 < 2) edges.push([from, to]);
  }
  for (const tabled of [false, true]) {
    test(`positive fixed point agrees with independent reachability: graph ${seed}, tabled ${tabled}`, () => {
      const clauses = ['reach(X,Y) :- edge(X,Y).', 'reach(X,Y) :- edge(X,Z), reach(Z,Y).'];
      const facts = edges.map(([from, to]) => `edge(n${from},n${to}).`);
      const source = `${tabled ? ':- table reach/2.' : ''}\n${[...clauses.reverse(), ...facts, ...facts].join('\n')}\n?- reach(From,To).`;
      const expected = [closure(6, edges).join('\n')];
      assertAnswers(run(source), expected);
      const reordered = `?- reach(From,To). ${tabled ? ':- table reach/2.' : ''} ${[...facts.reverse(), ...clauses.reverse()].join('\n')}`;
      assertAnswers(run(reordered), expected);
    });
  }
}

test('unfounded recursive components finish, tables are local, and repeated variables constrain calls', () => {
  assertAnswers(run(':- table p/1. p(X) :- p(X). ?- p(X).'), ['false.']);
  const clauses = ':- table p/2. p(X,Y) :- edge(X,Y). p(X,Y) :- p(X,Z), edge(Z,Y).';
  assertAnswers(run(`${clauses} edge(a,b). edge(b,a). ?- p(X,X). ?- p(a,Y).`), ['X = a.\nX = b.', 'Y = b.\nY = a.']);
  assertAnswers(run(`${clauses} ?- p(a,Y).`), ['false.']);
});

test('§6: range-restricted clauses run forward without a query and duplicate proofs store one tuple', () => {
  const program = parse(`
    edge(a,b). edge(a,b). edge(b,c). shortcut(a,c).
    reach(X,Y) :- edge(X,Y).
    reach(X,Y) :- edge(X,Z), reach(Z,Y).
    reach(X,Y) :- shortcut(X,Y).
  `);
  const reached = infer(program).filter(record => record.goal.relation === 'predicate:reach/2');
  assert.deepEqual(reached.map(record => record.goal.terms.map(term => term.atom).join(',')).sort(),
    ['a,b', 'a,c', 'b,c']);
});

test('§6: clauses needing call inputs use tables without an explicit declaration', () => {
  assertAnswers(run(`
    next(Input, Output) :- Output is Input+1.
    ?- next(41, Value). ?- next(41, 42). ?- next(41, 43).
    :- assertion(next(99, 100)).
  `), ['Value = 42.', 'true.', 'false.', 'check passed: next(99, 100).']);
  assert.throws(() => run('next(Input, Output) :- Output is Input+1. ?- next(Input, 42).'), /unbound/);
});

test('§6: table declarations apply to every clause even when declared after queries', () => {
  const source = `
    upto(0).
    upto(N) :- N > 0, Previous is N-1, upto(Previous).
    ?- upto(2048). ?- upto(-1).
    :- table upto/1.
  `;
  assertAnswers(run(source), ['true.', 'false.']);
});

test('table declarations prevent enumeration of rules requiring call inputs', () => {
  const source = ':- table fib/2. fib(0,0). fib(1,1). fib(N,F) :- N>1, A is N-1, B is N-2, fib(A,X), fib(B,Y), F is X+Y.';
  assert.equal(infer(parse(source)).filter(record => record.goal.relation === 'predicate:fib/2').length, 2);
  assertAnswers(run(`${source} ?- fib(100,F).`), ['F = 354224848179261915075.']);
  assert.throws(() => run(`${source} ?- fib(N,F).`), /unbound/);
});

test('ordinary predicate arity and argument indexes agree across joins', () => {
  assertAnswers(run(`
    edge(a,b,red). edge(a,c,blue). edge(b,d,red). edge(c,e,red).
    path(X,Z,Color) :- edge(X,Y,Color), edge(Y,Z,Color).
    ?- path(From,To,red). ?- edge(a,To,blue). ?- edge(From,d,Color).
    ready. ready(X) :- X=a. ?- ready. ?- ready(X).
  `), ['From = a, To = d.', 'To = c.', 'From = b, Color = red.', 'true.', 'X = a.']);
});
