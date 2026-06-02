#!/usr/bin/env node
// Example-output test runner.
// It compares each example byte-for-byte against examples/output so output and explanation changes cannot silently alter results.
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { TestReporter, isMainModule } from './test-style.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const bin = path.join(root, 'bin', 'eyelog');
const examplesDir = path.join(root, 'examples');
const expectedDir = path.join(examplesDir, 'output');
const fixedExampleDate = '2026-05-30';

export function runExamples(reporter = new TestReporter()) {
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'eyelog-examples.'));
  const actualFile = path.join(tmp, 'actual.out');
  const errFile = path.join(tmp, 'stderr.out');

  try {
    const files = fs.readdirSync(examplesDir)
      .filter((name) => name.endsWith('.pl'))
      .sort();

    reporter.section('Examples');
    for (const name of files) reporter.test(name, () => runExample(name, actualFile, errFile));
    reporter.sectionTotal('examples');
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
}

function runExample(name, actualFile, errFile) {
  const program = path.join(examplesDir, name);
  const expected = path.join(expectedDir, name);
  runAndCompare(name, program, expected, [], actualFile, errFile, 'output');
}

function runAndCompare(name, program, expected, args, actualFile, errFile, label) {
  const outFd = fs.openSync(actualFile, 'w');
  const errFd = fs.openSync(errFile, 'w');
  const result = spawnSync(process.execPath, [bin, ...args, program], {
    cwd: root,
    env: { ...process.env, EYELOG_LOCAL_TIME: fixedExampleDate },
    stdio: ['ignore', outFd, errFd],
  });
  fs.closeSync(outFd);
  fs.closeSync(errFd);

  if (result.status !== 0) {
    const stderr = fs.readFileSync(errFile, 'utf8');
    const stdout = fs.readFileSync(actualFile, 'utf8');
    throw new Error(`example ${name} ${label} exited with ${result.status}
${stderr}${stdout}`.trimEnd());
  }

  if (!fs.existsSync(expected)) {
    throw new Error(`missing expected ${label} file: ${path.relative(root, expected)}`);
  }

  const expectedBuffer = fs.readFileSync(expected);
  const actualBuffer = fs.readFileSync(actualFile);
  if (!expectedBuffer.equals(actualBuffer)) {
    throw new Error(`${label} mismatch for ${name}
${diffText(expected, actualFile)}`.trimEnd());
  }
}

function diffText(expected, actual) {
  const diff = spawnSync('diff', ['-u', expected, actual], { encoding: 'utf8' });
  if (diff.stdout) return diff.stdout;

  const expectedText = fs.readFileSync(expected, 'utf8').split('\n');
  const actualText = fs.readFileSync(actual, 'utf8').split('\n');
  const limit = Math.max(expectedText.length, actualText.length);
  for (let i = 0; i < limit; i++) {
    if (expectedText[i] !== actualText[i]) {
      return `first difference at line ${i + 1}
expected: ${expectedText[i] ?? '<missing>'}
actual:   ${actualText[i] ?? '<missing>'}`;
    }
  }

  return 'outputs differ';
}

if (isMainModule(import.meta.url)) {
  const reporter = new TestReporter();
  try {
    runExamples(reporter);
    reporter.totalLine();
  } catch (_) {
    process.exit(1);
  }
}
