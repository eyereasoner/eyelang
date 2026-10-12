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
    assets.push('playground-worker.js', 'language.js');
    for (const match of html.matchAll(/<option value="([a-z0-9-]+)"/g)) {
      assets.push(`examples/${match[1]}.eye`);
    }
    for (const asset of assets) {
      const deployed = new URL(asset, base);
      assert.ok(deployed.pathname.startsWith('/eyelang/'), asset);
      assert.ok((await read(deployed.pathname.slice('/eyelang/'.length))).length > 0, asset);
    }
    assert.match(html, /href="\.\/">Getting started/);
    assert.match(html, /href="SPEC\/">Language specification/);
  }

  const home = await read('index.md');
  const spec = await read('SPEC/index.md');
  assert.match(home, /^---\nlayout: default\n/);
  assert.match(home, /\[SPEC.md\]\(SPEC\/\)/);
  assert.match(spec, /^---\nlayout: default\n/);
  assert.match(spec, /# eyelang Language Specification/);
  assert.match(spec, /\]\(\.\.\/language.js\)/);
  assert.equal(JSON.parse(await read('_config.yml')).baseurl, '/eyelang');
  assert.match(await read('_layouts/default.html'), /\{\{ content \}\}/);
});
