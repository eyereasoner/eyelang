#!/usr/bin/env node
// Cross-implementation smoke tests for source-level Prolog interoperability.
//
// By default this runner requires Trealla (`tpl`) and Scryer (`scryer-prolog`)
// to be installed.  Pass --allow-missing for local development when only the
// EyeProlog leg is available.
import path from 'node:path';
import process from 'node:process';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const allowMissing = process.argv.includes('--allow-missing');
const sudoku = path.join(root, 'examples', 'sudoku.pl');
const goal = 'sudoku_solution(S), write(S), nl, fail; halt';
const expected = '[[5,3,4,6,7,8,9,1,2],[6,7,2,1,9,5,3,4,8],[1,9,8,3,4,2,5,6,7],[8,5,9,7,6,1,4,2,3],[4,2,6,8,5,3,7,9,1],[7,1,3,9,2,4,8,5,6],[9,6,1,5,3,7,2,8,4],[2,8,7,4,1,9,6,3,5],[3,4,5,2,8,6,1,7,9]]';

const engines = [
  {
    name: 'EyeProlog',
    command: process.execPath,
    args: [path.join(root, 'bin', 'eyeprolog.js'), '--portable', '-g', goal, sudoku],
  },
  {
    name: 'Trealla',
    command: process.env.TPL ?? 'tpl',
    args: ['-q', '-g', goal, sudoku],
  },
  {
    name: 'Scryer',
    command: process.env.SCRYER_PROLOG ?? 'scryer-prolog',
    args: ['-f', '-g', goal, sudoku],
  },
];

let failed = false;
let executed = 0;
for (const engine of engines) {
  const result = spawnSync(engine.command, engine.args, {
    cwd: root,
    encoding: 'utf8',
    timeout: 120000,
  });
  if (result.error?.code === 'ENOENT') {
    if (allowMissing && engine.name !== 'EyeProlog') {
      console.log(`SKIP ${engine.name}: ${engine.command} not installed`);
      continue;
    }
    console.error(`FAIL ${engine.name}: ${engine.command} not installed`);
    failed = true;
    continue;
  }
  executed++;
  if (result.error) {
    console.error(`FAIL ${engine.name}: ${result.error.message}`);
    failed = true;
    continue;
  }
  if (result.status !== 0) {
    console.error(`FAIL ${engine.name}: exit ${result.status}`);
    if (result.stderr) console.error(result.stderr.trim());
    failed = true;
    continue;
  }
  const lines = String(result.stdout ?? '').split(/\r?\n/).map((line) => line.trim()).filter(Boolean);
  if (!lines.includes(expected)) {
    console.error(`FAIL ${engine.name}: Sudoku output mismatch`);
    console.error(`stdout: ${JSON.stringify(result.stdout)}`);
    if (result.stderr) console.error(`stderr: ${result.stderr.trim()}`);
    failed = true;
    continue;
  }
  console.log(`OK ${engine.name}: portable Sudoku`);
}

if (failed) process.exitCode = 1;
else console.log(`OK ${executed}/${allowMissing ? engines.length : executed} available interop engines passed`);
