// Generated artifacts only. Run after intentional output-format changes and
// review the resulting diff. Semantic expectations live separately in tests.
import fs from 'node:fs';
import { run, formatResult } from '../index.js';
import { examplesDirectory, exampleNames, exampleSource } from './example-sources.js';

for (const directory of ['output/', 'proof/']) {
  fs.mkdirSync(new URL(directory, examplesDirectory), { recursive: true });
}
for (const name of exampleNames()) {
  const result = run(exampleSource(name));
  fs.writeFileSync(new URL(`output/${name}`, examplesDirectory), formatResult(result));
  fs.writeFileSync(new URL(`proof/${name}`, examplesDirectory), formatResult(result, { proof: true }));
}
console.log(`Updated answer and proof documents for ${exampleNames().length} examples.`);
