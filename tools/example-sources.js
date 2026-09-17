import fs from 'node:fs';
import { run, formatResult, nquadsToEyelang } from '../index.js';

export const examplesDirectory = new URL('../examples/', import.meta.url);
export const allExampleNames = () => fs.readdirSync(examplesDirectory).filter(name => name.endsWith('.eye')).sort();

export function expectedExampleErrors() {
  const manifest = JSON.parse(fs.readFileSync(new URL('suite.json', examplesDirectory), 'utf8'));
  return new Map(manifest.examples.filter(entry => entry.expectedError).map(entry => [entry.file, entry.expectedError]));
}

export const exampleNames = () => {
  const failures = expectedExampleErrors();
  return allExampleNames().filter(name => !failures.has(name));
};

export function exampleSource(name) {
  const source = fs.readFileSync(new URL(name, examplesDirectory), 'utf8');
  // This example consumes a result document, exercising closure in the actual
  // engine. Derive its input afresh instead of trusting the saved golden file.
  if (name === 'proof-audit.eye') {
    return `${formatResult(run(exampleSource('socrates.eye')), { proof: true })}\n${source}`;
  }
  if (name === 'rdf12-interoperability.eye') {
    const data = fs.readFileSync(new URL('rdf12-interoperability.nq', examplesDirectory), 'utf8');
    return `${nquadsToEyelang(data, { blankNodePrefix: 'd0_' })}\n${source}`;
  }
  return source;
}
