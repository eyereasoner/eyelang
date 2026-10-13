import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../../src/language.js';

// Fixtures are source programs and independent expected observations, not parser snapshots.
for (const file of ['lexical', 'arithmetic', 'questions-checks']) {
  const cases = JSON.parse(readFileSync(new URL(`./${file}.json`, import.meta.url), 'utf8'));
  for (const entry of cases) {
    test(`[${entry.id}] SPEC §${entry.section}: ${entry.name}`, () => {
      if (entry.error) {
        assert.throws(() => run(entry.source), error => {
          assert.ok(error instanceof Error);
          assert.match(error.message, new RegExp(entry.error, 'u'));
          if (entry.line !== undefined) assert.match(error.message, new RegExp(`^Line ${entry.line}:`));
          return true;
        });
      } else {
        const actual = run(entry.source);
        assert.equal(actual.length, entry.expected.length);
        for (let i = 0; i < actual.length; i++) {
          // The specification leaves the order within answer sets unspecified.
          assert.deepEqual(actual[i].split('\n').sort(), entry.expected[i].split('\n').sort());
        }
      }
    });
  }
}
