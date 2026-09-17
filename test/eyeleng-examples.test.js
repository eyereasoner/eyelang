import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { run } from '../index.js';
import { examplesDirectory } from '../tools/example-sources.js';

const manifest = JSON.parse(fs.readFileSync(new URL('eyeleng-ports.json', examplesDirectory), 'utf8'));

test('the flat example collection accounts for every Eyeleng SRL example', () => {
  assert.equal(manifest.revision, 'b7c7e46f82974682974a342a7fa65e6b8a229d48');
  assert.equal(manifest.ports.length, 56);
  assert.equal(new Set(manifest.ports.map(entry => entry.source)).size, 56);
  assert.equal(new Set(manifest.ports.map(entry => entry.port)).size, 56);
  for (const entry of manifest.ports) {
    assert.equal(entry.port, entry.source.replace(/\.srl$/, '.eye'));
    assert.ok(fs.existsSync(new URL(entry.port, examplesDirectory)), entry.port);
  }
});

for (const entry of manifest.ports) {
  test(`Eyeleng port ${entry.port}`, () => {
    const source = fs.readFileSync(new URL(entry.port, examplesDirectory), 'utf8');
    if (entry.expectedError) {
      assert.throws(() => run(source), error => error.message.includes(entry.expectedError));
      return;
    }
    const result = run(source);
    assert.equal(result.status, 'complete');
    assert.ok(result.queries.length > 0, `${entry.port} has no acceptance query`);
    assert.ok(result.queries.some(query => query.answers.length > 0), `${entry.port} has no successful acceptance query`);
  });
}
