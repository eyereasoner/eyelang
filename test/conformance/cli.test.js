import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';

const cli = fileURLToPath(new URL('../../eyelang.js', import.meta.url));
function invoke(args, input) {
  const result = spawnSync(process.execPath, [cli, ...args], { input, encoding: 'utf8', timeout: 10000 });
  assert.ifError(result.error);
  assert.equal(result.signal, null);
  return result;
}

for (const flag of ['-h', '--help']) {
  test(`[cli-help-${flag}] SPEC §10: ${flag} succeeds with usage on stdout`, () => {
    const result = invoke([flag]);
    assert.equal(result.status, 0);
    assert.match(result.stdout, /node eyelang\.js/);
    assert.equal(result.stderr, '');
  });
}
for (const flag of ['-v', '--version']) {
  test(`[cli-version-${flag}] SPEC §10: ${flag} reports the package version exactly`, () => {
    const { version } = JSON.parse(readFileSync(new URL('../../package.json', import.meta.url), 'utf8'));
    const result = invoke([flag]);
    assert.equal(result.status, 0);
    assert.equal(result.stdout, `eyelang ${version}\n`);
    assert.equal(result.stderr, '');
  });
}
for (const [id, args] of [['none', []], ['two', ['one.eye', 'two.eye']]]) {
  test(`[cli-arguments-${id}] SPEC §10: an ordinary invocation requires exactly one input`, () => {
    const result = invoke(args);
    assert.notEqual(result.status, 0);
    assert.equal(result.stdout, '');
    assert.ok(result.stderr.length > 0);
  });
}

test('[cli-file-stdin] SPEC §10: UTF-8 files and standard input produce the same complete ARC transcript', t => {
  const directory = mkdtempSync(join(tmpdir(), 'eyelang-conformance-'));
  t.after(() => rmSync(directory, { recursive: true, force: true }));
  const path = join(directory, 'école 東京.eye');
  const source = 'ÉLODIE is a person. who is a person? why? check that élodie is a person.';
  writeFileSync(path, source);
  const file = invoke([path]);
  const stdin = invoke(['-'], source);
  assert.equal(file.status, 0);
  assert.equal(stdin.status, 0);
  assert.equal(file.stderr, '');
  assert.equal(stdin.stderr, '');
  assert.equal(file.stdout, stdin.stdout);
  assert.deepEqual([...file.stdout.matchAll(/^# (Answer|Reason|Check)$/gm)].map(match => match[1]), ['Answer', 'Reason', 'Check']);
  assert.match(file.stdout, /élodie is a person/);
  assert.match(file.stdout, /you told me this/);
  assert.match(file.stdout, /check passed: élodie is a person/);
});

test('[cli-unknown-success] SPEC §10: unknown answers are successful query results', () => {
  const result = invoke(['-'], 'is ada a person?');
  assert.equal(result.status, 0);
  assert.equal(result.stderr, '');
  assert.match(result.stdout, /I don't know whether ada is a person/);
});

test('[cli-empty-prompt] SPEC §10: a program with no questions or checks prompts for a question', () => {
  const result = invoke(['-'], 'ada is a person.');
  assert.equal(result.status, 0);
  assert.match(result.stdout, /Add a question/);
  assert.match(result.stdout, /# Answer[\s\S]*# Reason[\s\S]*# Check/);
});

for (const [id, source, error] of [
  ['syntax', 'ada is a person. who is a person?\nada is person.', /Line 2:/],
  ['unfinished', 'ada is a person. who is a person?\nben is a person', /Line 2:/],
  ['check', 'ada is a person. who is a person? why?\ncheck that ada is a stranger.', /Line 2: Check failed/],
  ['check-arithmetic', 'ada is a person. who is a person?\ncheck that 1 divided by 0 is equal to 1.', /Line 2:.*divide by zero/],
  ['check-request', 'the echo of ?input is ?input if ?input is equal to ?input.\nwho is a person?\ncheck that the score of 1 divided by 0 is 0.', /Line 3:.*divide by zero/],
  ['runtime', 'if 1 is equal to 1 then the result of demo is 1 divided by 0.', /divide by zero/],
  ['cycle', '?person is a person if ?person is not a person.', /loop through not/],
]) {
  test(`[cli-error-${id}] SPEC §10: ${id} errors exit nonzero, report stderr, and emit no partial transcript`, () => {
    const result = invoke(['-'], source);
    assert.notEqual(result.status, 0);
    assert.equal(result.stdout, '');
    assert.match(result.stderr, error);
  });
}

test('[cli-missing-file] SPEC §10: a missing input file produces a nonzero status and a diagnostic', () => {
  const result = invoke([fileURLToPath(new URL('./missing-conformance-program.eye', import.meta.url))]);
  assert.notEqual(result.status, 0);
  assert.equal(result.stdout, '');
  assert.match(result.stderr, /couldn't find the program/);
});
