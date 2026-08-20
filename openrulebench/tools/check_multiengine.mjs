#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.dirname(path.dirname(fileURLToPath(import.meta.url)));
const ENGINES = ['eyeprolog', 'trealla', 'scryer', 'swipl'];
const TABLED = new Map([['tc.pl', 1], ['sg.pl', 1], ['modsg.pl', 2], ['wordnet.pl', 3], ['wine.pl', 225]]);
const WFS = new Set(['win_cycle.pl', 'magicset.pl']);
const SWI_WFS_TABLES = new Map([['win_cycle.pl', 1], ['magicset.pl', 3]]);
const listProlog = (engine) => fs.readdirSync(path.join(ROOT, engine)).filter((name) => name.endsWith('.pl')).sort();
const base = listProlog('eyeprolog');
const errors = [];

for (const engine of ENGINES) {
  const names = listProlog(engine);
  if (JSON.stringify(names) !== JSON.stringify(base)) errors.push(`${engine}: file set differs`);
  for (const name of names) {
    const text = fs.readFileSync(path.join(ROOT, engine, name), 'utf8');
    if (!/^%% goal:\s*.+$/m.test(text)) errors.push(`${engine}/${name}: no goal`);
    if ((text.match(/\(/g) ?? []).length !== (text.match(/\)/g) ?? []).length) errors.push(`${engine}/${name}: paren imbalance`);
    const tableCount = (text.match(/^:- table /gm) ?? []).length;
    let expected;
    if (engine === 'trealla' || engine === 'scryer') expected = TABLED.get(name) ?? 0;
    else if (engine === 'swipl') expected = TABLED.get(name) ?? SWI_WFS_TABLES.get(name) ?? 0;
    else expected = 0;
    if (tableCount !== expected) errors.push(`${engine}/${name}: table directives=${tableCount}, expected=${expected}`);
    if (WFS.has(name)) {
      if (engine === 'eyeprolog' || engine === 'swipl') {
        if (!text.includes('tnot(')) errors.push(`${engine}/${name}: missing tnot/1 WFS adaptation`);
        const code = text.split(/\r?\n/).filter((line) => !line.trimStart().startsWith('%')).join('\n');
        if (code.includes('\\+')) errors.push(`${engine}/${name}: still contains negation-as-failure`);
      } else if (tableCount) {
        errors.push(`${engine}/${name}: WFS file should not be fake-tabled`);
      }
    }
  }
}

if (errors.length) {
  process.stdout.write(`${errors.join('\n')}\n`);
  process.exitCode = 1;
} else {
  process.stdout.write(`OK: ${base.length} benchmarks x ${ENGINES.length} engines; table/WFS adaptations verified.\n`);
}
