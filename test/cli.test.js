import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import fs from 'node:fs';
import { parse, check, parseNQuads } from '../index.js';

const cli = (args, input) => {
  const result = spawnSync(process.execPath, [fileURLToPath(new URL('../bin/eyelang.js', import.meta.url)), ...args], {
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
  assert.match(result.stdout, /answer\(1, \[binding\("x", a\)\]\)\./);
  assert.match(result.stdout, /proof\(1, p\(a\), rule\(/);
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
  assert.match(result.stdout, /answer\(1, \[binding\("a", \?v0\), binding\("b", \?v1\)\]\)\./);
});

test('CLI answer and proof output can be piped into another invocation', () => {
  for (const flags of [[], ['--proof']]) {
    const first = cli([...flags, '-'], 'p(a). ask p(?x).');
    assert.equal(first.status, 0, first.stderr);
    check(first.stdout);
    const second = cli(['--query', 'answer(1,[binding("x",?value)])', '-'], first.stdout);
    assert.equal(second.status, 0, second.stderr);
    assert.match(second.stdout, /answer\(1, \[binding\("value", a\)\]\)\./);
    parse(second.stdout);
  }
});

test('CLI --check uses Eyelang syntax unless JSON is explicitly requested', () => {
  const checked = cli(['--check', '-'], 'p(a). ask p(?x).');
  assert.equal(checked.status, 0, checked.stderr);
  check(checked.stdout);
  assert.match(checked.stdout, /checked\(rules\(1\), queries\(1\)\)\./);
  const json = cli(['--check', '--json', '-'], 'p(a).');
  assert.equal(json.status, 0, json.stderr);
  assert.equal(JSON.parse(json.stdout).rules, 1);
});

test('CLI proof auditing reads exported proofs and emits proofs of the audit', () => {
  const first = cli(['--proof', '-'], 'human(socrates). mortal(?x) if human(?x). ask mortal(socrates).');
  assert.equal(first.status, 0, first.stderr);
  const audit = fs.readFileSync(new URL('../examples/proof-audit.eye', import.meta.url), 'utf8');
  const second = cli(['--proof', '-'], `${first.stdout}\n${audit}`);
  assert.equal(second.status, 0, second.stderr);
  check(second.stdout);
  assert.match(second.stdout, /binding\("fact", human\(socrates\)\)/);
});

test('CLI imports and exports RDF 1.2 N-Quads', () => {
  const rules = fileURLToPath(new URL('../examples/rdf12-interoperability.eye', import.meta.url));
  const data = fileURLToPath(new URL('../examples/rdf12-interoperability.nq', import.meta.url));
  const imported = cli(['--rdf-input', data, rules]);
  assert.equal(imported.status, 0, imported.stderr);
  assert.match(imported.stdout, /binding\("text", "Alice"\)/);
  assert.match(imported.stdout, /binding\("source", iri\("https:\/\/example\/chat"\)\)/);
  assert.match(imported.stdout, /language\("ar", rtl\)/);

  const exported = cli(['--rdf-input', data, '--rdf-output', rules]);
  assert.equal(exported.status, 0, exported.stderr);
  assert.match(exported.stdout, /^VERSION "1\.2"/);
  assert.match(exported.stdout, /<https:\/\/example\/displayName> "Bonjour"@fr/);
  assert.match(exported.stdout, /<<\( <https:\/\/example\/alice> <https:\/\/example\/knows> <https:\/\/example\/bob> \)>>/);
  assert.doesNotThrow(() => parseNQuads(exported.stdout));
});
