import test from 'node:test';
import assert from 'node:assert/strict';
import { run, check, format, LimitError, parse } from '../index.js';

const rows = source => run(source).queries.map(query => query.answers.map(answer =>
  Object.fromEntries(Object.entries(answer.bindings).map(([name, value]) => [name, format(value)]))));
const sorted = values => values.map(value => JSON.stringify(value)).sort();

test('left recursion, mutual recursion, and cycles reach a fixed point', () => {
  const [answers] = rows(`edge(a,b). edge(b,c). edge(c,a).
    path(?x,?y) if path(?x,?z), edge(?z,?y).
    path(?x,?y) if edge(?x,?y).
    ask path(a,?y).`);
  assert.deepEqual(sorted(answers), sorted([{ y: 'a' }, { y: 'b' }, { y: 'c' }]));
  assert.deepEqual(rows('p(?x) if q(?x). q(?x) if p(?x). q(a). ask p(?x).'), [[{ x: 'a' }]]);
  assert.deepEqual(rows('p(?x) if q(?x). q(?x) if p(?x). ask p(a).'), [[]]);
});

test('same answer from multiple proofs is returned once', () => {
  assert.deepEqual(rows('p(a). p(a). p(?x) if p(?x). ask p(?x).'), [[{ x: 'a' }]]);
});

test('variable sharing, fresh rule instances, and fresh answer instances', () => {
  assert.deepEqual(rows('same(?x,?x). ask same(?a,a), same(?b,b).'), [[{ a: 'a', b: 'b' }]]);
  assert.deepEqual(rows('same(?x,?x). ask same(a,b).'), [[]]);
  const [answers] = rows('same(?x,?x). ask same(?a,?b).');
  assert.equal(answers.length, 1);
  const bindings = run('same(?x,?x). ask same(?a,?b).').queries[0].answers[0].bindings;
  assert.equal(bindings.a.id, bindings.b.id);
});

test('occurs check rejects infinite terms', () => {
  assert.deepEqual(rows('ask ?x = f(?x).'), [[]]);
  assert.deepEqual(rows('ask ?x = [?x].'), [[]]);
  assert.deepEqual(rows('ask ?x = f(?y), ?y = g(?x).'), [[]]);
});

test('anonymous variables are independent and are not projected', () => {
  assert.deepEqual(rows('p(a,b). ask p(?_,?_).'), [[{}]]);
});

test('structured terms and relational list splitting', () => {
  const [answers] = rows(`append([],?ys,?ys).
    append([?x|?xs],?ys,[?x|?zs]) if append(?xs,?ys,?zs).
    ask append(?left,?right,[a,b]).`);
  assert.deepEqual(sorted(answers), sorted([
    { left: '[]', right: '[a, b]' }, { left: '[a]', right: '[b]' }, { left: '[a, b]', right: '[]' },
  ]));
});

test('arithmetic precedence, integers, floats, and expression functions', () => {
  assert.deepEqual(rows('ask let ?x = 2 + 3 * 4, let ?y = (2 + 3) * 4, let ?z = -7 // 2.'), [[{ x: '14', y: '20', z: '-3' }]]);
  assert.deepEqual(rows('ask let ?x = 9007199254740993 + 2.'), [[{ x: '9007199254740995' }]]);
  assert.deepEqual(rows('ask let ?x = 7 / 2, let ?y = sqrt(9), let ?z = abs(-3), let ?r = round(2.5).'), [[{ x: '3.5', y: '3.0', z: '3', r: '3.0' }]]);
  assert.deepEqual(rows('ask 1 = 1.0.'), [[]]);
  assert.deepEqual(rows('ask 1 <= 1.0.'), [[{}]]);
  assert.throws(() => run('ask let ?x = 1 / 0.'), /Division by zero/);
  assert.throws(() => run('ask let ?x = 9007199254740993 + 0.5.'), /too large/);
  assert.throws(() => run('ask let ?x = sqrt(-1).'), /not finite/);
  assert.throws(() => run('ask let ?x = ?missing + 1.'), /bound inputs/);
});

test('negation waits for all lower-stratum consequences, regardless of rule order', () => {
  const source = `eligible(?x) if person(?x), not blocked(?x).
    blocked(?x) if marked(?x). marked(?x) if flagged(?x).
    person(a). person(b). flagged(a). ask eligible(?x).`;
  assert.deepEqual(rows(source), [[{ x: 'b' }]]);
  assert.deepEqual(rows('p(a). ask not p(b). ask not p(a).'), [[{}], []]);
  assert.throws(() => run('p(a). ask not p(?x).'), /bound inputs/);
});

test('negation checks a completed cyclic positive relation', () => {
  assert.deepEqual(rows('p(?x) if q(?x). q(?x) if p(?x). ask not p(a).'), [[{}]]);
});

test('negative and aggregate dependency cycles are rejected before evaluation', () => {
  assert.throws(() => run('p(a) if not p(a). ask p(a).'), /not stratified/);
  assert.throws(() => run('p(a) if not q(a). q(a) if p(a).'), /not stratified/);
  assert.throws(() => run('p(?xs) if collect ?xs = ?x where { p(?x) }.'), /not stratified/);
});

test('collection projects distinct values after a completed recursive query', () => {
  assert.deepEqual(rows(`edge(a,b). edge(b,c). edge(c,a).
    path(?x,?y) if edge(?x,?y).
    path(?x,?z) if path(?x,?y), edge(?y,?z).
    ask collect ?xs = ?y where { path(a,?y) }, let ?n = count(?xs).`), [[{ xs: '[a, b, c]', n: '3' }]]);
  assert.deepEqual(rows('p(10). p(10). p(2). ask collect ?xs = ?x where { p(?x) }, sort(?xs,?sorted).'), [[{ xs: '[10, 2]', sorted: '[2, 10]' }]]);
  assert.deepEqual(rows('p(a). ask collect ?xs = ?x where { p(b), ?x = c }, let ?n = count(?xs).'), [[{ xs: '[]', n: '0' }]]);
  assert.deepEqual(rows('ask collect ?xs = item where {}.'), [[{ xs: '[item]' }]]);
  assert.throws(() => parse('ask { p(a) }.'), /Expected a value or variable/);
  assert.throws(() => parse('p if { q }.'), /Expected a value or variable/);
});

test('collection correlates outer bound variables and keeps local bindings private', () => {
  assert.deepEqual(rows(`group(a). group(b). value(a,1). value(b,2).
    ask group(?g), collect ?xs = ?x where { value(?g,?x) }.`), [[{ g: 'a', xs: '[1]' }, { g: 'b', xs: '[2]' }]]);
  assert.throws(() => run('p(?x). ask collect ?xs = ?x where { p(?x) }.'), /must be ground/);
});

test('undefined relations and built-in redefinitions are errors', () => {
  assert.throws(() => check('p(a) if missing(a).'), /Undefined relation missing\/1/);
  assert.throws(() => check('ask missing(a).'), /Undefined relation/);
  assert.throws(() => run('range(1,2,3).'), /Cannot redefine/);
});

test('limits report incomplete evaluation instead of false or partial answers', () => {
  assert.throws(() => run('n(0). n(?y) if n(?x), let ?y = ?x + 1. ask n(?x).', { maxAnswers: 25 }), LimitError);
  assert.throws(() => run('p(?x) if p(f(?x)). ask p(a).', { maxTables: 20 }), LimitError);
  assert.throws(() => run('ask range(1,1000,?x).', { maxSteps: 20 }), LimitError);
  assert.throws(() => run('p(a). ask p(a).', { maxSteps: 0 }), /positive safe integer/);
});

test('proof references form an acyclic derivation graph', () => {
  const result = run('human(socrates). mortal(?x) if human(?x). ask mortal(socrates).');
  assert.equal(result.status, 'complete');
  assert.ok(result.proofs.some(proof => proof.rule === 1 && proof.premises.length === 0));
  for (const proof of result.proofs) {
    for (const premise of proof.premises) {
      if (premise.kind === 'answer') assert.ok(premise.proof < proof.id);
    }
  }
  assert.equal(result.proofs[result.queries[0].answers[0].proof - 1].rule, 'query');
});

test('strings, booleans, comments, and source locations', () => {
  assert.deepEqual(rows('# comment\np("hello\\nworld",true). ask p(?text,?yes).'), [[{ text: '"hello\\nworld"', yes: 'true' }]]);
  assert.throws(() => parse('p(a)\nask p(a).'), /at 2:1/);
  assert.throws(() => parse('p("\\q").'), /Invalid string escape/);
  assert.throws(() => parse('p(1e999).'), /must be finite/);
});

test('formatted floating-point exponents remain valid source', () => {
  for (const text of ['1e21', '1e-20', '1.0', '-1e30']) {
    const result = run(`ask let ?x = ${text}.`).queries[0].answers[0].bindings.x;
    const reparsed = parse(`p(${format(result)}).`).rules[0].head.args[0];
    assert.equal(reparsed.kind, result.kind);
    assert.equal(reparsed.value, result.value);
  }
});

test('sort has a consistent order across numeric and nonnumeric kinds', () => {
  assert.deepEqual(rows('ask sort([100,true,0.0,a,100],?xs).'), [[{ xs: '[0.0, 100, a, true]' }]]);
});

test('sudoku solves a ground grid and rejects inconsistent givens', () => {
  const almostComplete = '[[0,2,3,4,5,6,7,8,9],[4,5,6,7,8,9,1,2,3],[7,8,9,1,2,3,4,5,6],[2,3,4,5,6,7,8,9,1],[5,6,7,8,9,1,2,3,4],[8,9,1,2,3,4,5,6,7],[3,4,5,6,7,8,9,1,2],[6,7,8,9,1,2,3,4,5],[9,1,2,3,4,5,6,7,8]]';
  assert.deepEqual(rows(`ask sudoku(${almostComplete},?grid).`), [[{
    grid: '[[1, 2, 3, 4, 5, 6, 7, 8, 9], [4, 5, 6, 7, 8, 9, 1, 2, 3], [7, 8, 9, 1, 2, 3, 4, 5, 6], [2, 3, 4, 5, 6, 7, 8, 9, 1], [5, 6, 7, 8, 9, 1, 2, 3, 4], [8, 9, 1, 2, 3, 4, 5, 6, 7], [3, 4, 5, 6, 7, 8, 9, 1, 2], [6, 7, 8, 9, 1, 2, 3, 4, 5], [9, 1, 2, 3, 4, 5, 6, 7, 8]]',
  }]]);
  assert.deepEqual(rows('ask sudoku([[1,1,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]],?grid).'), [[]]);
});

test('graph closures agree with an independent traversal across clause orders', () => {
  let seed = 391;
  const random = () => { seed = (seed * 1664525 + 1013904223) >>> 0; return seed / 2 ** 32; };
  for (let fixture = 0; fixture < 12; fixture++) {
    const edges = [[0, 1]];
    for (let a = 0; a < 5; a++) for (let b = 0; b < 5; b++) if (random() < 0.25) edges.push([a, b]);
    const expected = new Set(), queue = edges.filter(([a]) => a === 0).map(([, b]) => b);
    for (let i = 0; i < queue.length; i++) {
      const node = queue[i];
      if (expected.has(node)) continue;
      expected.add(node);
      queue.push(...edges.filter(([a]) => a === node).map(([, b]) => b));
    }
    const facts = edges.map(([a, b]) => `edge(n${a},n${b}).`).join('\n');
    const rules = ['path(?x,?y) if edge(?x,?y).', 'path(?x,?z) if path(?x,?y),edge(?y,?z).'];
    if (fixture % 2) rules.reverse();
    const [answers] = rows(`${rules.join('\n')}\n${facts}\nask path(n0,?y).`);
    assert.deepEqual(answers.map(answer => answer.y).sort(), [...expected].map(node => `n${node}`).sort());
  }
});
