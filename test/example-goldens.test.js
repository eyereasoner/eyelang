import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtempSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { updateExampleGoldens } from '../scripts/example-goldens.js';

function fixture(t) {
  const directory = mkdtempSync(join(tmpdir(), 'eyelang-goldens-'));
  t.after(() => rmSync(directory, { recursive: true, force: true }));
  writeFileSync(join(directory, 'sample.pl'), 'p(a). ?- p(X). ?- why. :- assertion(p(a)).');
  return directory;
}

test('the golden updater writes full ARC transcripts for every example, including large taxonomies', t => {
  const directory = fixture(t);
  const files = ['deep-taxonomy-1000', 'deep-taxonomy-10000', 'sample'];
  for (const name of files.slice(0, -1)) {
    writeFileSync(join(directory, name + '.pl'), readFileSync(join(directory, 'sample.pl'), 'utf8'));
  }
  assert.equal(updateExampleGoldens(directory), files.length);
  assert.deepEqual(readdirSync(join(directory, 'output')).sort(), files.map(name => name + '.txt'));
  const expected = [
    '% Answer\n?- p(X).\nX = a.',
    '% Reason\nHere is why. Each step is shown once.\nstep 1: p(a).\n  you told me this.\nThat explains step 1.',
    '% Check\ncheck passed: p(a).\n',
  ].join('\n\n');
  for (const name of files) assert.equal(readFileSync(join(directory, 'output', name + '.txt'), 'utf8'), expected);
});

test('a failed example prevents the updater from overwriting existing goldens', t => {
  const directory = fixture(t);
  updateExampleGoldens(directory);
  const path = join(directory, 'output/sample.txt');
  const saved = readFileSync(path, 'utf8');
  writeFileSync(join(directory, 'sample.pl'), 'p(b). ?- p(X). ?- why. :- assertion(p(b)).');
  writeFileSync(join(directory, 'z-failing.pl'), ':- assertion(missing).');
  assert.throws(() => updateExampleGoldens(directory), /Check failed: missing/);
  assert.equal(readFileSync(path, 'utf8'), saved);
  assert.deepEqual(readdirSync(join(directory, 'output')), ['sample.txt']);
});
