import test from 'node:test';
import assert from 'node:assert/strict';
import { infer, parse, run } from '../../src/language.js';

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
      assert.deepEqual(run(source)[0].split('\n').sort(), closure(6, edges));
      const reordered = `?- reach(From,To). ${tabled ? ':- table reach/2.' : ''} ${[...facts.reverse(), ...clauses.reverse()].join('\n')}`;
      assert.deepEqual(run(reordered)[0].split('\n').sort(), closure(6, edges));
    });
  }
}

test('unfounded recursive components finish, tables are local, and repeated variables constrain calls', () => {
  assert.deepEqual(run(':- table p/1. p(X) :- p(X). ?- p(X).'), ['false.']);
  const clauses = ':- table p/2. p(X,Y) :- edge(X,Y). p(X,Y) :- p(X,Z), edge(Z,Y).';
  assert.deepEqual(run(`${clauses} edge(a,b). edge(b,a). ?- p(X,X). ?- p(a,Y).`), ['X = a.\nX = b.', 'Y = b.\nY = a.']);
  assert.deepEqual(run(`${clauses} ?- p(a,Y).`), ['false.']);
});

test('table declarations prevent enumeration of rules requiring call inputs', () => {
  const source = ':- table fib/2. fib(0,0). fib(1,1). fib(N,F) :- N>1, A is N-1, B is N-2, fib(A,X), fib(B,Y), F is X+Y.';
  assert.equal(infer(parse(source)).filter(record => record.goal.relation === 'predicate:fib/2').length, 2);
  assert.deepEqual(run(`${source} ?- fib(100,F).`), ['F = 354224848179261915075.']);
  assert.throws(() => run(`${source} ?- fib(N,F).`), /unbound/);
});

test('ordinary predicate arity and argument indexes agree across joins', () => {
  assert.deepEqual(run(`
    edge(a,b,red). edge(a,c,blue). edge(b,d,red). edge(c,e,red).
    path(X,Z,Color) :- edge(X,Y,Color), edge(Y,Z,Color).
    ?- path(From,To,red). ?- edge(a,To,blue). ?- edge(From,d,Color).
    ready. ready(X) :- X=a. ?- ready. ?- ready(X).
  `), ['From = a, To = d.', 'To = c.', 'From = b, Color = red.', 'true.', 'X = a.']);
});
