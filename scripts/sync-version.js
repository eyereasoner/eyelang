import { readFile, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

export async function syncVersion(root = fileURLToPath(new URL('../', import.meta.url))) {
  const { version } = JSON.parse(await readFile(resolve(root, 'package.json'), 'utf8'));
  const updates = [];
  for (const [file, pattern, replacement] of [
    ['SPEC.md', /^Language version: .+$/gm, `Language version: ${version}`],
    ['playground.html', /<span id="version">[^<]+<\/span>/g, `<span id="version">v${version}</span>`],
  ]) {
    const path = resolve(root, file);
    const source = await readFile(path, 'utf8');
    if ([...source.matchAll(pattern)].length !== 1) throw new Error(`Expected one version marker in ${file}.`);
    updates.push([path, source.replace(pattern, replacement)]);
  }
  for (const [path, source] of updates) await writeFile(path, source);
}

if (process.argv[1] && pathToFileURL(process.argv[1]).href === import.meta.url) {
  await syncVersion();
}
