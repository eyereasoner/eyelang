import assert from 'node:assert/strict';

// SPEC §1 leaves answer order unspecified, but query order and multiplicity matter.
// Keep every line and its exact spelling, including integer/real distinctions.
export function assertAnswers(actual, expected) {
  const blocks = answers => answers.map(block => block.split('\n').sort());
  assert.deepEqual(blocks(actual), blocks(expected));
}
