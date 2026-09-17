import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { run, format } from '../index.js';
import { exampleSource } from '../tools/example-sources.js';

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
  'proof-audit.eye': [[{ ancestor: '1' }, { ancestor: '2' }], [{ fact: 'human(socrates)' }]],
  'hanoi.eye': [[{ moves: '[[left, right], [left, center], [right, center], [left, right], [center, left], [center, right], [left, right]]' }]],
  'wolf-goat-cabbage.eye': [[
    { moves: '[goat, nothing, wolf, goat, cabbage, nothing, goat]' },
    { moves: '[goat, nothing, cabbage, goat, wolf, nothing, goat]' },
  ]],
  'critical-path-schedule.eye': [
    [{ finish: '23' }],
    ['launch', 'security_review', 'integration', 'backend', 'database', 'architecture', 'requirements'].map(task => ({ task })),
    [
      ['requirements', 0, 2], ['architecture', 2, 5], ['api_design', 2, 4], ['database', 5, 9],
      ['backend', 9, 15], ['frontend', 4, 9], ['auth', 5, 8], ['integration', 15, 19],
      ['security_review', 19, 22], ['load_test', 19, 21], ['launch', 22, 23],
    ].map(([task, start, finish]) => ({ task, start: String(start), finish: String(finish) })),
  ],
  'modular-exponentiation.eye': [
    [{ naive: '38', fast: '38' }],
    [{ case: 'seven_power_billion', value: '312556845' }, { case: 'three_power_two_power_25', value: '849572438' }, { case: 'last_12_digits', value: '940335579136' }],
  ],
  'gray-code-counter.eye': [
    [{ states: '[[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]' }],
    [{ state: '[1, 0, 1]' }],
  ],
  'good-cobbler.eye': [[{ statement: 'quoted([triple(joe, is, [good, Cobbler])])' }], []],
  'context-association.eye': [[{
    subject: 'bob', dataGraph: 'blank(g0)', signatureGraph: 'blank(g1)', metadataGraph: 'blank(g3)',
    cryptosuite: '"ecdsa-rdfc-2019"', issuer: 'iri("https://university.example/issuers/14")',
  }], []],
  'dog-license.eye': [[{ person: 'alice', license: 'dogLicense' }], [{ person: 'alice', count: '5' }, { person: 'bob', count: '2' }]],
  'property-paths.eye': [[{ person: 'alice', grandchild: 'carol' }], [{ child: 'bob', parent: 'alice' }, { child: 'carol', parent: 'bob' }]],
  'reification-and-annotations.eye': [[{ speaker: 'alice', source: 'chat' }, { speaker: 'bob', source: 'email' }], [], [{ certainty: '0.9' }]],
};

const canonical = answers => answers.map(answer => JSON.stringify(answer)).sort();
for (const [file, expected] of Object.entries(expectations)) {
  test(`example ${file}`, () => {
    const result = run(exampleSource(file));
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

test('example peano-arithmetic.eye constructs the factorial of five', () => {
  const result = run(exampleSource('peano-arithmetic.eye'));
  const decode = term => {
    let count = 0;
    while (term.kind === 'struct') {
      assert.equal(term.name, 's');
      assert.equal(term.args.length, 1);
      term = term.args[0];
      count++;
    }
    assert.equal(term.kind, 'bigint');
    assert.equal(term.value, 0n);
    return count;
  };
  assert.equal(result.queries[0].answers.length, 1);
  const { five, result: factorial } = result.queries[0].answers[0].bindings;
  assert.equal(decode(five), 5);
  assert.equal(decode(factorial), 120);
});

test('example bayes-diagnosis.eye computes source scores and threshold decisions', () => {
  const result = run(exampleSource('bayes-diagnosis.eye'));
  // Reference values from eyeleng/examples/output/bayes-diagnosis.trig.
  // Relative tolerance allows insignificant floating-point evaluation differences.
  const expected = new Map([
    ['COVID19', 0.0015470000000000002], ['Influenza', 0.00004800000000000001],
    ['AllergicRhinitis', 7.500000000000003e-7], ['BacterialPneumonia', 0.00004787999999999999],
  ]);
  assert.equal(result.queries[0].answers.length, expected.size);
  const seen = new Set();
  for (const { bindings } of result.queries[0].answers) {
    const name = bindings.disease.name, score = bindings.score;
    assert.ok(expected.has(name));
    assert.ok(!seen.has(name));
    seen.add(name);
    assert.equal(score.kind, 'number');
    assert.ok(Math.abs(score.value - expected.get(name)) <= expected.get(name) * 1e-12);
  }
  assert.deepEqual(result.queries[1].answers.map(answer => answer.bindings.disease.name), ['COVID19']);
  assert.deepEqual(result.queries[2].answers.map(({ bindings }) => [bindings.disease.name, bindings.rank.value]).sort(), [
    ['AllergicRhinitis', 'low'], ['BacterialPneumonia', 'low'], ['COVID19', 'high'], ['Influenza', 'low'],
  ]);
});

test('every example has an explicit acceptance check', () => {
  const files = fs.readdirSync(new URL('../examples/', import.meta.url)).filter(file => file.endsWith('.eye')).sort();
  const manifest = JSON.parse(fs.readFileSync(new URL('../examples/eyeleng-ports.json', import.meta.url), 'utf8'));
  const checked = new Set([...Object.keys(expectations), 'type-inference.eye', 'peano-arithmetic.eye', 'bayes-diagnosis.eye']);
  const expected = [...new Set([...checked, ...manifest.ports.map(entry => entry.port)])].sort();
  assert.deepEqual(files, expected);
});
