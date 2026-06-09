#!/usr/bin/env node
// Conformance test runner.
// It executes each case through the CLI so tests cover the same path users run from the shell.
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { TestReporter, isMainModule } from './test-style.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const bin = path.join(root, 'bin', 'eyelang');
const profileArg = process.argv[2] ?? 'conformance';

export function runConformance(reporter = new TestReporter(), requestedProfiles = null) {
  const profiles = requestedProfiles ?? (profileArg === 'conformance' ? ['core', 'extension'] : [profileArg]);
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'eyelang-conformance.'));
  const actualFile = path.join(tmp, 'actual.out');
  const errFile = path.join(tmp, 'stderr.out');

  try {
    for (const profile of profiles) runProfile(reporter, profile, actualFile, errFile);
  } finally {
    fs.rmSync(tmp, { recursive: true, force: true });
  }
}

function runProfile(reporter, profile, actualFile, errFile) {
  const casesDir = path.join(root, 'conformance', 'cases', profile);
  const expectedDir = path.join(root, 'conformance', 'expected', profile);

  reporter.section(`Conformance ${profile}`);

  const files = fs.readdirSync(casesDir)
    .filter((name) => name.endsWith('.pl'))
    .sort();

  for (const file of files) {
    const name = file.slice(0, -3);
    const label = `${profile}/${name}`;
    reporter.test(label, () => runCase(profile, name, file, casesDir, expectedDir, actualFile, errFile));
  }

  reporter.sectionTotal(`conformance ${profile}`);
}

function runCase(profile, name, file, casesDir, expectedDir, actualFile, errFile) {
  const program = path.join(casesDir, file);
  const queryFile = path.join(casesDir, `${name}.query`);
  const expected = path.join(expectedDir, `${name}.out`);
  const args = [bin];
  if (fs.existsSync(queryFile)) args.push('--query', fs.readFileSync(queryFile, 'utf8').trim());
  args.push(program);

  const outFd = fs.openSync(actualFile, 'w');
  const errFd = fs.openSync(errFile, 'w');
  const result = spawnSync(process.execPath, args, {
    cwd: root,
    stdio: ['ignore', outFd, errFd],
  });
  fs.closeSync(outFd);
  fs.closeSync(errFd);

  if (result.status !== 0) {
    const stderr = fs.readFileSync(errFile, 'utf8');
    const stdout = fs.readFileSync(actualFile, 'utf8');
    throw new Error(`case ${profile}/${name} exited with ${result.status}\n${stderr}${stdout}`.trimEnd());
  }

  if (!fs.existsSync(expected)) {
    throw new Error(`missing expected file: ${path.relative(root, expected)}`);
  }

  const expectedBuffer = fs.readFileSync(expected);
  const actualBuffer = fs.readFileSync(actualFile);
  if (!expectedBuffer.equals(actualBuffer)) {
    throw new Error(`output mismatch for ${profile}/${name}\n${diffText(expected, actualFile)}`.trimEnd());
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
      return `first difference at line ${i + 1}\nexpected: ${expectedText[i] ?? '<missing>'}\nactual:   ${actualText[i] ?? '<missing>'}`;
    }
  }

  return 'outputs differ';
}

if (isMainModule(import.meta.url)) {
  const reporter = new TestReporter();
  try {
    runConformance(reporter);
    reporter.totalLine();
  } catch (_) {
    process.exit(1);
  }
}
