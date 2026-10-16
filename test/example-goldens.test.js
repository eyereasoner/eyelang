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

test('the golden updater writes full ARC transcripts and skips structural-only examples', t => {
  const directory = fixture(t);
  writeFileSync(join(directory, 'deep-taxonomy-1000.pl'), 'This example must not be evaluated by the updater.');
  assert.equal(updateExampleGoldens(directory), 1);
  assert.deepEqual(readdirSync(join(directory, 'output')), ['sample.txt']);
  assert.equal(readFileSync(join(directory, 'output/sample.txt'), 'utf8'), [
    '% Answer\n?- p(X).\nX = a.',
    '% Reason\nHere is why. Each step is shown once.\nstep 1: p(a).\n  you told me this.\nThat explains step 1.',
    '% Check\ncheck passed: p(a).\n',
  ].join('\n\n'));
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
