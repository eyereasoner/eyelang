import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { infer, parse } from '../src/language.js';

const definition = name => readFileSync(new URL(`../examples/${name}.pl`, import.meta.url), 'utf8').split('% Answer and Reason')[0];
const relation = (records, name, arity) => records.filter(record => record.goal.relation === `predicate:${name}/${arity}`).map(record => record.goal.terms);
const number = term => typeof term === 'string' ? Number(term) : term.real;
const add = ([a, b], [c, d]) => [a + c, b + d];
const multiply = ([a, b], [c, d]) => [a * c - b * d, a * d + b * c];
const magnitude = ([r, i]) => Math.hypot(r, i);
const distance = ([a, b], [c, d]) => Math.hypot(a - c, b - d);
const complex = ([r, i]) => `c(${r}, ${i})`;

function coefficients(roots, leading = [1, 0]) {
  let result = [leading];
  for (const [r, i] of roots) {
    const next = Array.from({ length: result.length + 1 }, () => [0, 0]);
    result.forEach((coefficient, index) => {
      next[index] = add(next[index], coefficient);
      next[index + 1] = add(next[index + 1], multiply(coefficient, [-r, -i]));
    });
    result = next;
  }
  return result;
}

test('polynomial formulas recover known complex roots, multiplicities, and coefficients for degrees one through four', () => {
  const rootSets = [
    [[-3, 2]], [[0, 1], [0, -1]], [[1, 0], [2, 0]], [[0, 0], [0, 0]],
    [[1, 0], [2, 0], [3, 0]], [[0, 0], [0, 0], [0, 0]],
    [[0, 1], [0, -1], [2, 0]], [[-1, 0], [-1, 0], [2, 0]],
    [[1, 0], [2, 0], [3, 0], [4, 0]], [[1, 1], [0, 1], [5, 1], [3, 2]],
    [[1, 0], [-1, 0], [0, 1], [0, -1]], [[1, 0], [1, 0], [1, 0], [1, 0]],
    [[0, 0], [0, 0], [2, 0], [-2, 0]], [[1, 0], [1, 0], [2, 0], [3, 0]],
    [[-2, 1], [1, -2], [3, 2], [-1, -1]],
  ];
  const cases = rootSets.map((roots, index) => ({ roots, coefficients: coefficients(roots, index % 2 ? [2, -1] : [1, 0]) }));
  const fixtures = cases.map((row, index) => `input(p${index}, [${row.coefficients.map(complex).join(',')}]).`).join('\n');
  const source = definition('polynomial') + fixtures + '\nactual(Name, Roots) :- input(Name, Coefficients), roots(Coefficients, Roots). ?- actual(Name, Roots).';
  const answers = relation(infer(parse(source)), 'actual', 2);
  assert.equal(answers.length, cases.length);
  for (const [name, rootsTerm] of answers) {
    const expected = cases[Number(name.atom.slice(1))];
    const actual = rootsTerm.list.map(root => root.args.map(number));
    assert.equal(actual.length, expected.roots.length);
    const unmatched = [...expected.roots];
    for (const root of actual) {
      const best = unmatched.reduce((index, candidate, next) => distance(root, candidate) < distance(root, unmatched[index]) ? next : index, 0);
      assert.ok(distance(root, unmatched[best]) < 1.0e-5, `${name.atom}: unexpected root ${root}`);
      unmatched.splice(best, 1);
      const value = expected.coefficients.reduce((accumulator, coefficient) => add(multiply(accumulator, root), coefficient), [0, 0]);
      const scale = expected.coefficients.reduce((sum, coefficient) => sum * magnitude(root) + magnitude(coefficient), 0);
      assert.ok(magnitude(value) < 1.0e-9 * Math.max(1, scale), `${name.atom}: nonzero polynomial residual`);
    }
    // Reconstructing all coefficients also checks that no repeated root is lost.
    const reconstructed = coefficients(actual, expected.coefficients[0]);
    reconstructed.forEach((value, index) => assert.ok(distance(value, expected.coefficients[index]) < 1.0e-7 * Math.max(1, magnitude(expected.coefficients[index])), `${name.atom}: coefficient ${index}`));
  }
});

test('polynomial solver rejects unsupported degrees and zero leading coefficients', () => {
  const source = definition('polynomial') + `
    invalid([]).
    invalid([c(1, 0)]).
    invalid([c(0, 0), c(1, 0)]).
    invalid([c(0, 0), c(1, 0), c(2, 0)]).
    invalid([c(0, 0), c(1, 0), c(2, 0), c(3, 0)]).
    invalid([c(0, 0), c(1, 0), c(2, 0), c(3, 0), c(4, 0)]).
    invalid([c(1, 0), c(0, 0), c(0, 0), c(0, 0), c(0, 0), c(1, 0)]).
    invalid_result(Coefficients, Roots) :- invalid(Coefficients), roots(Coefficients, Roots).
    ?- invalid_result(Coefficients, Roots).
  `;
  assert.equal(relation(infer(parse(source)), 'invalid_result', 2).length, 0);
});

function allPairs(nodes, edges) {
  const matrix = nodes.map((a, i) => nodes.map((b, j) => i === j ? 0n : null));
  for (const [from, to, weight] of edges) {
    const i = nodes.indexOf(from); const j = nodes.indexOf(to);
    if (matrix[i][j] === null || weight < matrix[i][j]) matrix[i][j] = weight;
  }
  for (let k = 0; k < nodes.length; k++) for (let i = 0; i < nodes.length; i++) for (let j = 0; j < nodes.length; j++) {
    if (matrix[i][k] === null || matrix[k][j] === null) continue;
    const candidate = matrix[i][k] + matrix[k][j];
    if (matrix[i][j] === null || candidate < matrix[i][j]) matrix[i][j] = candidate;
  }
  return matrix;
}

test('Dijkstra paths match Floyd-Warshall distances across directed graphs, ties, zero cycles, and large integers', () => {
  const nodes = ['a', 'b', 'c', 'd'];
  const graphs = [[], [['a', 'b', 1n]],
    [['a', 'b', 1n], ['a', 'c', 1n], ['b', 'd', 2n], ['c', 'd', 2n]],
    [['a', 'a', 0n], ['a', 'b', 0n], ['b', 'a', 0n], ['b', 'c', 2n], ['a', 'c', 9n]],
    [['a', 'b', 10n], ['a', 'b', 3n], ['b', 'c', 1n], ['c', 'd', 1n], ['a', 'd', 7n]],
    [['a', 'b', 9007199254740993n], ['b', 'c', 5n], ['a', 'c', 9007199254740999n], ['c', 'd', 1n]],
  ];
  const fixtures = graphs.map((edges, index) => `graph(g${index}, [${edges.map(([a, b, w]) => `edge(${a}, ${b}, ${w})`).join(',')}]).`).join('\n');
  const requests = nodes.flatMap(start => nodes.map(goal => `request(${start}, ${goal}).`)).join('\n');
  const source = definition('dijkstra') + fixtures + '\n' + requests + `
    result(Name, Start, Goal, Path, Cost) :-
      graph(Name, Edges), request(Start, Goal), dijkstra(Edges, Start, Goal, Path, Cost).
    ?- result(Name, Start, Goal, Path, Cost).
  `;
  const results = relation(infer(parse(source)), 'result', 5);
  let count = 0;
  for (const [index, edges] of graphs.entries()) {
    const expected = allPairs(nodes, edges);
    for (let i = 0; i < nodes.length; i++) for (let j = 0; j < nodes.length; j++) {
      const matches = results.filter(([name, start, goal]) => name.atom === `g${index}` && start.atom === nodes[i] && goal.atom === nodes[j]);
      assert.equal(matches.length, expected[i][j] === null ? 0 : 1, `g${index}: ${nodes[i]} -> ${nodes[j]}`);
      if (!matches.length) continue;
      count++;
      const [, , , pathTerm, cost] = matches[0];
      const path = pathTerm.list.map(node => node.atom);
      assert.equal(BigInt(cost), expected[i][j]);
      assert.equal(path[0], nodes[i]); assert.equal(path.at(-1), nodes[j]);
      assert.equal(new Set(path).size, path.length, 'A settled path has no cycles.');
      let sum = 0n;
      for (let step = 1; step < path.length; step++) {
        const weights = edges.filter(([a, b]) => a === path[step - 1] && b === path[step]).map(([, , w]) => w);
        assert.ok(weights.length > 0, 'Each path step is an input edge.');
        sum += weights.reduce((a, b) => a < b ? a : b);
      }
      assert.equal(sum, BigInt(cost));
    }
  }
  assert.equal(results.length, count);
});

test('Dijkstra accepts finite real weights and rejects a negative edge even outside the requested component', () => {
  const source = definition('dijkstra') + `
    ?- dijkstra([edge(a, b, 0.25), edge(b, c, 0.5), edge(a, c, 1.0)], a, c, Path, Cost).
    rejected(Path, Cost) :- dijkstra([edge(a, b, 1), edge(c, d, -1)], a, b, Path, Cost).
    ?- rejected(Path, Cost).
  `;
  const records = infer(parse(source));
  const answers = relation(records, 'dijkstra', 5);
  assert.equal(answers.length, 1);
  assert.deepEqual(answers[0][3].list.map(node => node.atom), ['a', 'b', 'c']);
  assert.equal(number(answers[0][4]), 0.75);
  assert.equal(relation(records, 'rejected', 2).length, 0);
});
