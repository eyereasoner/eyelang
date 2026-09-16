import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { run, format } from '../index.js';

const expectations = {
  'ancestor.eye': [[{ who: 'bob' }, { who: 'carol' }, { who: 'dana' }]],
  'cyclic-reachability.eye': [[{ where: 'a' }, { where: 'b' }, { where: 'c' }]],
  'fibonacci.eye': [[{ value: '354224848179261915075' }]],
  'lists.eye': [[{ left: '[]', right: '[a, b]' }, { left: '[a]', right: '[b]' }, { left: '[a, b]', right: '[]' }], [{ x: 'a' }, { x: 'b' }]],
  'derivative.eye': [[{ derivative: 'add(mul(const(1), var(x)), mul(var(x), const(1)))' }]],
  'policy.eye': [[{ person: 'bob' }]],
  'aggregation.eye': [[{ count: '3', total: '35' }]],
  'shortest-path.eye': [[{ path: '[a, b, c, d]', cost: '5' }]],
  'four-queens.eye': [[{ rows: '[2, 4, 1, 3]' }, { rows: '[3, 1, 4, 2]' }]],
  'graph-join.eye': [[{ claim: 'iri("https://example/claim1")' }]],
  'grammar.eye': [[{ ast: 'command(open, door)' }], [{ words: '[close, window]' }]],
  'socrates.eye': [[{}]],
};

const canonical = answers => answers.map(answer => JSON.stringify(answer)).sort();
for (const [file, expected] of Object.entries(expectations)) {
  test(`example ${file}`, () => {
    const result = run(fs.readFileSync(new URL(`../examples/${file}`, import.meta.url), 'utf8'));
    const actual = result.queries.map(query => query.answers.map(answer => Object.fromEntries(
      Object.entries(answer.bindings).map(([name, value]) => [name, format(value)]),
    )));
    assert.deepEqual(actual.map(canonical), expected.map(canonical));
  });
}

test('example type-inference.eye preserves shared type variables', () => {
  const result = run(fs.readFileSync(new URL('../examples/type-inference.eye', import.meta.url), 'utf8'));
  assert.equal(format(result.queries[0].answers[0].bindings.type), 'int');
  const type = result.queries[1].answers[0].bindings.type;
  assert.equal(type.name, 'fun');
  assert.equal(type.args[0].kind, 'var');
  assert.equal(type.args[0].id, type.args[1].id);
});

test('every example has an explicit acceptance check', () => {
  const files = fs.readdirSync(new URL('../examples/', import.meta.url)).filter(file => file.endsWith('.eye')).sort();
  assert.deepEqual(files, [...Object.keys(expectations), 'type-inference.eye'].sort());
});
