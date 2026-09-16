import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const cli = (args, input) => {
  const result = spawnSync(process.execPath, [fileURLToPath(new URL('../bin/eyelit.js', import.meta.url)), ...args], {
    input, encoding: 'utf8', timeout: 10_000,
  });
  assert.ifError(result.error);
  return result;
};

test('CLI stdin and exact integer JSON', () => {
  const result = cli(['--json', '-'], 'p(9007199254740993). ask p(?x).');
  assert.equal(result.status, 0, result.stderr);
  assert.deepEqual(JSON.parse(result.stdout).queries[0].answers[0].bindings.x, { kind: 'bigint', value: '9007199254740993' });
});
test('CLI query flag and proof output', () => {
  const result = cli(['--proof', '--query', 'p(?x)', '-'], 'p(a).');
  assert.equal(result.status, 0, result.stderr);
  assert.match(result.stdout, /\?x = a/);
  assert.match(result.stdout, /"conclusion"/);
});
test('CLI check rejects invalid dependencies', () => {
  const result = cli(['--check', '-'], 'p(a) if not p(a).');
  assert.equal(result.status, 1);
  assert.match(result.stderr, /not stratified/);
});
test('CLI exits 2 on incomplete evaluation and prints no false answer', () => {
  const result = cli(['--max-answers', '10', '-'], 'n(0). n(?y) if n(?x), let ?y = ?x + 1. ask n(?x).');
  assert.equal(result.status, 2);
  assert.match(result.stderr, /incomplete/);
  assert.equal(result.stdout, '');
});
test('CLI distinguishes independent residual variables with the same source name', () => {
  const result = cli(['-'], 'any(?x). ask any(?a), any(?b).');
  assert.equal(result.status, 0, result.stderr);
  assert.match(result.stdout, /\?a = \?v0, \?b = \?v1/);
});
