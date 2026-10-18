import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { mixedSource } from '../benchmarks/run.js';
import { infer, parse, render } from '../src/language.js';

const runner = fileURLToPath(new URL('../benchmarks/run.js', import.meta.url));

test('mixed benchmark inputs combine conversions, joins, negation, and exact aggregates with independent checks', () => {
  for (const size of [1, 510, 1030]) {
    const program = parse(mixedSource(size));
    const records = infer(program, { validateChecks: true });
    const actual = records.filter(record => record.goal.relation === 'predicate:needs_review/3');
    const expected = [];
    for (let index = 0; index < size; index++) {
      const amount = index % 1000;
      if (amount >= 500 && (index % 32) % 8 !== 0) expected.push([`r${index}`, `u${index % 32}`, amount]);
    }
    assert.deepEqual(actual.map(({ goal }) => [goal.terms[0].atom, goal.terms[1].atom, Number(goal.terms[2])]).sort(), expected.sort());
    const summaries = new Map(records.filter(record => record.goal.relation === 'predicate:summary/2')
      .map(({ goal }) => [goal.terms[0].atom, goal.terms[1]]));
    assert.equal(summaries.get('count'), String(expected.length));
    assert.equal(summaries.get('sum'), expected.reduce((total, row) => total + BigInt(row[2]), 0n).toString());
  }
});

test('completed inference can render default and ARC blocks without changing the retained evidence', () => {
  const program = parse(`
    input(2).
    result(Value) :- input(Input), Value is Input + 1.
    ?- result(Value).
    ?- why.
    :- assertion(result(3)).
  `);
  const records = infer(program, { validateChecks: true });
  const output = render(program, records);
  assert.equal(output[0], 'Value = 3.');
  assert.match(output[1], /step\(result\(3\), rule\(2\)/);
  assert.match(output[1], /\['='\('Input', 2\), '='\('Value', 3\)\]/);
  assert.equal(output[2], 'check passed: result(3).');
  const [answer, reason, check] = render(program, records, { arc: true });
  assert.equal(answer, '% Answer\n?- result(Value).\nValue = 3.');
  assert.equal(reason, '% Reason\n' + output[1]);
  assert.equal(check, '% Check\n' + output.slice(2).join('\n\n'));
  assert.match(check, /verdict\(checked\)/);
  assert.deepEqual(render(program, records), output);
});

test('benchmark CLI reports separate phases and complete ARC size without performance thresholds', () => {
  const child = spawnSync(process.execPath, [runner, '--case', 'data-quality-audit', '--runs', '1', '--json'], { encoding: 'utf8' });
  assert.equal(child.status, 0, child.stderr);
  const report = JSON.parse(child.stdout);
  assert.equal(report.runs, 1);
  assert.equal(report.node, process.version);
  assert.equal(report.results.length, 1);
  const result = report.results[0];
  assert.equal(result.name, 'data-quality-audit');
  for (const field of ['parse_ms', 'infer_ms', 'render_ms', 'inference_peak_mib', 'peak_mib']) {
    assert.ok(Number.isFinite(result[field]) && result[field] >= 0, field);
  }
  assert.ok(result.peak_mib >= result.inference_peak_mib);
  const golden = readFileSync(new URL('../examples/output/data-quality-audit.txt', import.meta.url), 'utf8');
  assert.equal(result.output_bytes, Buffer.byteLength(golden));
});

test('benchmark options reject unknown workloads and invalid run counts or sizes', () => {
  for (const args of [['--case', 'missing'], ['--runs', '0'], ['--size', '-1'], ['--runs', '1.5'], ['--unknown']]) {
    const child = spawnSync(process.execPath, [runner, ...args], { encoding: 'utf8' });
    assert.equal(child.status, 1);
    assert.match(child.stderr, /Unknown|positive safe integer/);
    assert.match(child.stderr, /Usage:/);
  }
  for (const size of [0, -1, 1.5, NaN]) assert.throws(() => mixedSource(size), /positive safe integer/);
});
