import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtemp, readFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { preparePages } from '../scripts/prepare-pages.js';

test('Pages serves playground dependencies under the project path and prepares rendered documentation', async t => {
  const destination = await mkdtemp(join(tmpdir(), 'eyelang-pages-'));
  t.after(() => rm(destination, { recursive: true, force: true }));
  await preparePages(destination, '/eyelang');
  const read = file => readFile(join(destination, file), 'utf8');

  for (const path of ['playground/', 'playground.html']) {
    const html = await read(path.endsWith('/') ? `${path}index.html` : path);
    const url = new URL(path, 'https://eyereasoner.github.io/eyelang/');
    const baseHref = /<base href="([^"]+)"/.exec(html)?.[1];
    const base = baseHref ? new URL(baseHref, url) : url;
    assert.equal(new URL('.', base).pathname, '/eyelang/');

    const assets = [...html.matchAll(/src="([^"]+)"/g)].map(match => match[1]);
    assets.push('src/playground-worker.js', 'src/playground-highlight.js', 'src/language.js');
    for (const match of html.matchAll(/<option value="([a-z0-9-]+)"/g)) {
      assets.push(`examples/${match[1]}.pl`);
    }
    for (const asset of assets) {
      const deployed = new URL(asset, base);
      if (deployed.origin !== url.origin) continue;
      assert.ok(deployed.pathname.startsWith('/eyelang/'), asset);
      assert.ok((await read(deployed.pathname.slice('/eyelang/'.length))).length > 0, asset);
    }
    assert.match(html, /href="\.\/">eyelang/);
    assert.match(html, /href="https:\/\/github.com\/eyereasoner\/eyelang">Repository/);
    assert.match(html, /href="playground\/">Playground/);
    assert.match(html, /href="TUTORIAL\/">Tutorial/);
    const tutorialUrl = new URL('TUTORIAL/', base);
    assert.equal(tutorialUrl.pathname, '/eyelang/TUTORIAL/');
    assert.ok((await read('TUTORIAL/index.md')).length > 0);
    assert.match(html, /href="SPEC\/">Specification/);
  }

  const home = await read('index.md');
  const spec = await read('SPEC/index.md');
  const tutorial = await read('TUTORIAL/index.md');
  assert.match(home, /^---\nlayout: default\n/);
  assert.match(home, /\[specification\]\(https:\/\/eyereasoner\.github\.io\/eyelang\/SPEC\/\)/);
  assert.match(home, /\[hands-on tutorial\]\(https:\/\/eyereasoner\.github\.io\/eyelang\/TUTORIAL\/\)/);
  assert.match(spec, /^---\nlayout: default\n/);
  assert.match(spec, /# eyelang Specification/);
  assert.match(tutorial, /^---\nlayout: default\n/);
  assert.match(tutorial, /# eyelang tutorial/);
  for (const document of [home, spec, tutorial]) {
    assert.doesNotMatch(document, /^\[(eyelang|Repository|Playground|Tutorial|Specification)\]\(/m);
    assert.doesNotMatch(document, /<!-- navigation:(start|end) -->/);
  }
  assert.match(await read('README.md'), /<!-- navigation:start -->[\s\S]*?\[Tutorial\]\(https:\/\/eyereasoner\.github\.io\/eyelang\/TUTORIAL\/\)/);
  assert.doesNotMatch(await read('SPEC.md'), /^\[(eyelang|Repository|Playground|Tutorial|Specification)\]\(/m);
  assert.equal(await read('TUTORIAL.md'), await readFile(new URL('../TUTORIAL.md', import.meta.url), 'utf8'));
  for (const [document, target, expected, file = 'index.md'] of [
    ['', 'https://eyereasoner.github.io/eyelang/TUTORIAL/', '/eyelang/TUTORIAL/'],
    ['', 'https://eyereasoner.github.io/eyelang/SPEC/', '/eyelang/SPEC/'],
    ['TUTORIAL/', 'https://eyereasoner.github.io/eyelang/SPEC/', '/eyelang/SPEC/'],
    ['TUTORIAL/', 'https://eyereasoner.github.io/eyelang/playground/', '/eyelang/playground/', 'index.html'],
    ['SPEC/', 'https://eyereasoner.github.io/eyelang/', '/eyelang/'],
    ['SPEC/', 'https://eyereasoner.github.io/eyelang/TUTORIAL/', '/eyelang/TUTORIAL/'],
    ['SPEC/', 'https://eyereasoner.github.io/eyelang/playground/', '/eyelang/playground/', 'index.html'],
  ]) {
    const url = new URL(target, `https://eyereasoner.github.io/eyelang/${document}`);
    assert.equal(url.pathname + url.hash, expected);
    const page = url.pathname.slice('/eyelang/'.length);
    assert.ok((await read(`${page}${file}`)).length > 0);
    const content = document === 'SPEC/' ? spec : document === 'TUTORIAL/' ? tutorial : home;
    assert.ok(content.includes(`](${target})`));
  }
  for (const [label, path] of [['src/language.js', 'blob/main/src/language.js'], ['test/', 'tree/main/test']]) {
    assert.ok(spec.includes(`[${label}](https://github.com/eyereasoner/eyelang/${path})`), label);
  }
  assert.equal(JSON.parse(await read('_config.yml')).baseurl, '/eyelang');
  const layout = await read('_layouts/default.html');
  assert.equal([...layout.matchAll(/<nav\b/g)].length, 1);
  assert.match(layout, /\{\{ content \}\}/);
  assert.match(layout, /href="\{\{ '\/TUTORIAL\/' \| relative_url \}\}">Tutorial/);
});
