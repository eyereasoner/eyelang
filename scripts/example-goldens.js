import { mkdirSync, readFileSync, readdirSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { run } from '../src/language.js';

const examples = fileURLToPath(new URL('../examples/', import.meta.url));

export function exampleCases(directory = examples) {
  return readdirSync(directory).filter(file => file.endsWith('.pl')).sort().map(file => ({
    file,
    source: join(directory, file),
    golden: join(directory, 'output', file.replace(/\.pl$/, '.txt')),
  }));
}

export function updateExampleGoldens(directory = examples) {
  // Evaluate all examples and their assertions before replacing any goldens.
  const updates = exampleCases(directory).map(example => ({
    path: example.golden,
    text: run(readFileSync(example.source, 'utf8'), { arc: true }).join('\n\n') + '\n',
  }));
  mkdirSync(join(directory, 'output'), { recursive: true });
  for (const { path, text } of updates) writeFileSync(path, text);
  return updates.length;
}

if (process.argv[1] && pathToFileURL(process.argv[1]).href === import.meta.url) {
  console.log(`Updated ${updateExampleGoldens()} example goldens. Review git diff before accepting the changes.`);
}
