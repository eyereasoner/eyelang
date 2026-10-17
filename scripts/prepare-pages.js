import { cp, mkdir, readFile, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const root = fileURLToPath(new URL('../', import.meta.url));

export async function preparePages(destination, basePath = '/eyelang') {
  await mkdir(destination, { recursive: true });
  await mkdir(resolve(destination, 'src'), { recursive: true });
  for (const file of ['src/language.js', 'src/playground.js', 'src/playground-highlight.js', 'src/playground-worker.js', 'README.md', 'TUTORIAL.md', 'SPEC.md', 'LICENSE.md', 'examples']) {
    await cp(resolve(root, file), resolve(destination, file), { recursive: true });
  }
  const write = (file, text) => writeFile(resolve(destination, file), text);
  await mkdir(resolve(destination, 'playground'), { recursive: true });
  await mkdir(resolve(destination, 'SPEC'), { recursive: true });
  await mkdir(resolve(destination, 'TUTORIAL'), { recursive: true });
  await mkdir(resolve(destination, '_layouts'), { recursive: true });

  const playground = (await readFile(resolve(root, 'playground.html'), 'utf8'))
    .replace('href="https://eyereasoner.github.io/eyelang/"', 'href="./"')
    .replace('href="playground.html"', 'href="playground/"')
    .replace('href="https://eyereasoner.github.io/eyelang/TUTORIAL/"', 'href="TUTORIAL/"')
    .replace('href="https://eyereasoner.github.io/eyelang/SPEC/"', 'href="SPEC/"');
  await write('playground.html', playground);
  await write('playground/index.html', playground.replace('<head>', '<head>\n  <base href="../">'));

  const readme = (await readFile(resolve(root, 'README.md'), 'utf8'))
    .replace(/<!-- navigation:start -->[\s\S]*?<!-- navigation:end -->\n\n/, '');
  const spec = await readFile(resolve(root, 'SPEC.md'), 'utf8');
  const tutorial = await readFile(resolve(root, 'TUTORIAL.md'), 'utf8');
  await write('index.md', `---\nlayout: default\ntitle: eyelang\n---\n\n${readme}`);
  await write('SPEC/index.md', `---\nlayout: default\ntitle: eyelang Specification\n---\n\n${spec}`);
  await write('TUTORIAL/index.md', `---\nlayout: default\ntitle: eyelang tutorial\n---\n\n${tutorial}`);
  await write('_config.yml', JSON.stringify({
    title: 'eyelang', baseurl: basePath, markdown: 'kramdown',
    kramdown: { input: 'GFM', auto_ids: true },
  }, null, 2));
  await cp(resolve(root, 'scripts/pages-layout.html'), resolve(destination, '_layouts/default.html'));
}

if (process.argv[1] && pathToFileURL(process.argv[1]).href === import.meta.url) {
  await preparePages(resolve(root, '_pages'), process.env.PAGES_BASE_PATH ?? '/eyelang');
  console.log('Website prepared in _pages. Render with Jekyll to produce _site.');
}
