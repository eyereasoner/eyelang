import fs from 'node:fs';
import { run, formatResult } from '../index.js';

export const examplesDirectory = new URL('../examples/', import.meta.url);
export const exampleNames = () => fs.readdirSync(examplesDirectory).filter(name => name.endsWith('.eye')).sort();

export function exampleSource(name) {
  const source = fs.readFileSync(new URL(name, examplesDirectory), 'utf8');
  // This example consumes a result document, exercising closure in the actual
  // engine. Derive its input afresh instead of trusting the saved golden file.
  if (name === 'proof-audit.eye') {
    return `${formatResult(run(exampleSource('socrates.eye')), { proof: true })}\n${source}`;
  }
  return source;
}
