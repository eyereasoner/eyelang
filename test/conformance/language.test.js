import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../../src/language.js';

// Expected observations were carried over from the pre-migration regression
// suite. Prolog numeric types and rounding have separate explicit tests.
const fixtures = JSON.parse(readFileSync(new URL('regressions.json', import.meta.url), 'utf8'));
const normalize = text => text.replace(/(-?\d+)\.0(?=[,\].]|$)/g, '$1');
for (const [index, fixture] of fixtures.entries()) {
  test(`Prolog migration regression ${index + 1}`, () => {
    const actual = run(fixture.source);
    fixture.expected.forEach((expected, question) => {
      if (expected === null) return;
      assert.deepEqual(actual[question].split('\n').map(normalize).sort(), expected.map(normalize).sort());
    });
  });
}
