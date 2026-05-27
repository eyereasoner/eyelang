#!/usr/bin/env node
// Conformance test runner.
// It executes each case through the CLI so tests cover the same path users run from the shell.
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const bin = path.join(root, 'bin', 'eyelog');
const profileArg = process.argv[2] ?? 'conformance';
const profiles = profileArg === 'conformance' ? ['core', 'extension'] : [profileArg];

const useColor = Boolean(process.stdout.isTTY);
const GREEN = useColor ? '\x1b[32m' : '';
const DIM = useColor ? '\x1b[2m' : '';
const RED = useColor ? '\x1b[31m' : '';
const RESET = useColor ? '\x1b[0m' : '';

let ok = 0;
let total = 0;
const grandStart = nowMs();
const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'eyelog-conformance.'));
const actualFile = path.join(tmp, 'actual.out');
const errFile = path.join(tmp, 'stderr.out');

try {
  for (const profile of profiles) runProfile(profile);

  const grandMs = nowMs() - grandStart;
  console.log(`\n== Conformance grand total`);
  console.log(`${GREEN}OK${RESET} ${ok}/${total} tests passed ${DIM}(${grandMs} ms)${RESET}`);
} finally {
  fs.rmSync(tmp, { recursive: true, force: true });
}

function runProfile(profile) {
  const startedAt = nowMs();
  let sectionOk = 0;
  let sectionTotal = 0;
  const casesDir = path.join(root, 'conformance', 'cases', profile);
  const expectedDir = path.join(root, 'conformance', 'expected', profile);

  sectionBegin(`Conformance ${profile}`);

  const files = fs.readdirSync(casesDir)
    .filter((name) => name.endsWith('.pl'))
    .sort();

  for (const file of files) {
    total++;
    sectionTotal++;
    const nr = String(total).padStart(3, '0');
    const name = file.slice(0, -3);
    const label = `${profile}/${name}`;
    const program = path.join(casesDir, file);
    const queryFile = path.join(casesDir, `${name}.query`);
    const expected = path.join(expectedDir, `${name}.out`);
    const args = [bin];
    if (fs.existsSync(queryFile)) args.push('--query', fs.readFileSync(queryFile, 'utf8').trim());
    args.push(program);

    const outFd = fs.openSync(actualFile, 'w');
    const errFd = fs.openSync(errFile, 'w');
    const start = nowMs();
    const result = spawnSync(process.execPath, args, {
      cwd: root,
      stdio: ['ignore', outFd, errFd],
    });
    fs.closeSync(outFd);
    fs.closeSync(errFd);
    const ms = nowMs() - start;

    if (result.status !== 0) {
      console.error(`${nr} ${RED}FAIL${RESET} ${label}`);
      const stderr = fs.readFileSync(errFile, 'utf8');
      const stdout = fs.readFileSync(actualFile, 'utf8');
      if (stderr) console.error(stderr.trimEnd());
      if (stdout) console.error(stdout.trimEnd());
      process.exit(1);
    }

    if (!fs.existsSync(expected)) {
      console.error(`${nr} ${RED}FAIL${RESET} ${label}`);
      console.error(`missing expected file: ${path.relative(root, expected)}`);
      process.exit(1);
    }

    const expectedBuffer = fs.readFileSync(expected);
    const actualBuffer = fs.readFileSync(actualFile);
    if (!expectedBuffer.equals(actualBuffer)) {
      console.error(`${nr} ${RED}FAIL${RESET} ${label}`);
      printDiff(expected, actualFile);
      process.exit(1);
    }

    ok++;
    sectionOk++;
    console.log(`${nr} ${GREEN}OK${RESET} ${GREEN}${label}${RESET} ${DIM}(${ms} ms)${RESET}`);
  }

  sectionEnd(`Conformance ${profile}`, sectionOk, sectionTotal, startedAt);
}

function sectionBegin(name) {
  console.log(`\n== ${name}`);
}

function sectionEnd(name, sectionOk, sectionTotal, startedAt) {
  const ms = nowMs() - startedAt;
  console.log(`\n== ${name} subtotal`);
  console.log(`${GREEN}OK${RESET} ${sectionOk}/${sectionTotal} tests passed ${DIM}(${ms} ms)${RESET}`);
}

function nowMs() {
  return Number(process.hrtime.bigint() / 1000000n);
}

function printDiff(expected, actual) {
  const diff = spawnSync('diff', ['-u', expected, actual], { encoding: 'utf8' });
  if (diff.stdout) {
    process.stderr.write(diff.stdout);
    return;
  }
  const expectedText = fs.readFileSync(expected, 'utf8').split('\n');
  const actualText = fs.readFileSync(actual, 'utf8').split('\n');
  const limit = Math.max(expectedText.length, actualText.length);
  for (let i = 0; i < limit; i++) {
    if (expectedText[i] !== actualText[i]) {
      console.error(`first difference at line ${i + 1}`);
      console.error(`expected: ${expectedText[i] ?? '<missing>'}`);
      console.error(`actual:   ${actualText[i] ?? '<missing>'}`);
      return;
    }
  }
}
