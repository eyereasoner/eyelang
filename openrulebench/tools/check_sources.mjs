#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.dirname(path.dirname(fileURLToPath(import.meta.url)));
const engines = ['eyeprolog', 'trealla', 'scryer', 'swipl'];
let failed = false;

for (const engine of engines) {
  const dir = path.join(root, engine);
  const names = fs.readdirSync(dir).filter((name) => name.endsWith('.pl')).sort();
  if (names.length !== 14) {
    process.stderr.write(`${engine}: expected 14 .pl files, found ${names.length}\n`);
    failed = true;
  }
  for (const name of names) {
    const text = fs.readFileSync(path.join(dir, name), 'utf8');
    if (!text.includes('%% goal:')) {
      process.stderr.write(`${engine}/${name}: missing %% goal:\n`);
      failed = true;
    }
    if ((text.match(/\(/g) ?? []).length !== (text.match(/\)/g) ?? []).length) {
      process.stderr.write(`${engine}/${name}: unbalanced parentheses\n`);
      failed = true;
    }
    let acc = [];
    for (const raw of text.split(/\r?\n/)) {
      const line = raw.split('%', 1)[0].trim();
      if (!line) continue;
      acc.push(line);
      if (line.endsWith('.')) acc = [];
    }
    if (acc.length) {
      process.stderr.write(`${engine}/${name}: unterminated statement near ${acc[0].slice(0, 60)}\n`);
      failed = true;
    }
  }
  process.stdout.write(`${engine}: ${names.length} sources; lexical checks ok\n`);
}

if (failed) process.exitCode = 1;
