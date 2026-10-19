import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { mkdtemp, readFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { checkProof, parse, run } from '../src/language.js';
import { preparePages } from '../scripts/prepare-pages.js';
import { assertAnswers } from './conformance/helpers.js';

// Runnable documentation and displayed certificates.

const read = file => readFileSync(new URL(`../${file}`, import.meta.url), 'utf8');
const blocks = (document, language) => [...document.matchAll(new RegExp('^```' + language + '\\n([\\s\\S]*?)\\n```', 'gm'))]
  .map(match => match[1]);
const readme = read('README.md');
const tutorial = read('TUTORIAL.md');
const spec = read('SPEC.md');
const lessons = blocks(tutorial, 'prolog');
const specPrograms = blocks(spec, 'prolog');

function answers(output) {
  return output[0].slice('% Answer\n'.length).split('\n\n')
    .map(block => block.split('\n').slice(1).join('\n'));
}

test('the README example produces its documented answer and a checked certificate', () => {
  const examples = blocks(readme, 'prolog');
  assert.equal(examples.length, 1);
  const output = run(examples[0], { arc: true });
  assertAnswers(answers(output), ['Who = socrates.']);
  assert.match(output[2], /check passed: mortal\(socrates\)\./);
  assert.match(output[2], /verdict\(checked\)\./);
  assert.equal(checkProof(examples[0], output[1].slice('% Reason\n'.length), { allowTrusted: false }).valid, true);
});

const expectations = [
  ['Where = park.'],
  ['Where = park, Fee = 0.\nWhere = cafe, Fee = 5.'],
  ['Where = park.\nWhere = museum.\nWhere = cafe.'],
  ['Where = cafe, Minutes = 17.', 'Value = 9007199254740994.'],
  ['Count = 4.', 'Total = 22.'],
  ['Where = park, First = walk, Rest = [picnic].', 'Where = park, Activities = [walk, picnic].'],
  ['Value = 6765.'],
];

test('every tutorial program has a documented success or intentional failure', () => {
  assert.equal(lessons.length, expectations.length + 1);
});

for (const [index, expected] of expectations.entries()) {
  test(`tutorial lesson ${index + 1} computes its stated answers and checks its proof`, () => {
    const source = lessons[index];
    const output = run(source, { arc: true });
    assertAnswers(answers(output), expected);
    const report = checkProof(source, output[1].slice('% Reason\n'.length));
    assert.equal(report.valid, true, JSON.stringify(report.failures));
    assert.match(output[2], /verdict\(checked(?:_with_obligations)?\)\./);
  });
}

test('the tutorial failure has the documented source line and passes after correction', () => {
  const source = lessons.at(-1);
  assert.throws(() => run(source), { message: 'Line 4: Check failed: entry_fee(cafe, 4).' });
  const corrected = source.replace('assertion(entry_fee(cafe, 4))', 'assertion(entry_fee(cafe, 5))');
  const output = run(corrected, { arc: true });
  assertAnswers(answers(output), ['Fee = 5.']);
  assert.match(output[2], /check passed: entry_fee\(cafe, 5\)\./);
  assert.match(output[2], /verdict\(checked\)\./);
});

test('the tutorial and specification certificate displays check against their source programs', () => {
  const tutorialProof = blocks(tutorial, 'text')[0];
  assert.equal(checkProof(lessons[0], tutorialProof, { allowTrusted: false }).valid, true);
  const specProof = specPrograms.find(source => source.startsWith('certificate(eyeon, 1).'));
  assert.ok(specProof);
  assert.equal(checkProof(specPrograms[0], specProof, { allowTrusted: false }).valid, true);
});

test('all specification program blocks parse and the range example returns its documented values', () => {
  assert.equal(specPrograms.length, 5);
  for (const source of specPrograms) assert.doesNotThrow(() => parse(source));
  const range = specPrograms.find(source => source.startsWith(':- table between/3.'));
  assert.ok(range);
  assertAnswers(run(range), ['Value = 2.\nValue = 3.\nValue = 4.']);
});

// Staged GitHub Pages paths and navigation.

test('Pages serves playground dependencies under the project path and prepares rendered documentation', async t => {
  const destination = await mkdtemp(join(tmpdir(), 'eyeon-pages-'));
  t.after(() => rm(destination, { recursive: true, force: true }));
  await preparePages(destination, '/eyeon');
  const read = file => readFile(join(destination, file), 'utf8');

  for (const path of ['playground/', 'playground.html']) {
    const html = await read(path.endsWith('/') ? `${path}index.html` : path);
    const url = new URL(path, 'https://eyereasoner.github.io/eyeon/');
    const baseHref = /<base href="([^"]+)"/.exec(html)?.[1];
    const base = baseHref ? new URL(baseHref, url) : url;
    assert.equal(new URL('.', base).pathname, '/eyeon/');

    const assets = [...html.matchAll(/src="([^"]+)"/g)].map(match => match[1]);
    assets.push('src/playground-worker.js', 'src/playground-highlight.js', 'src/language.js');
    for (const match of html.matchAll(/<option value="([a-z0-9-]+)"/g)) {
      assets.push(`examples/${match[1]}.pl`);
    }
    for (const asset of assets) {
      const deployed = new URL(asset, base);
      if (deployed.origin !== url.origin) continue;
      assert.ok(deployed.pathname.startsWith('/eyeon/'), asset);
      assert.ok((await read(deployed.pathname.slice('/eyeon/'.length))).length > 0, asset);
    }
    assert.match(html, /href="\.\/">eyeon/);
    assert.match(html, /href="https:\/\/github.com\/eyereasoner\/eyeon">Repository/);
    assert.match(html, /href="playground\/">Playground/);
    assert.match(html, /href="TUTORIAL\/">Tutorial/);
    const tutorialUrl = new URL('TUTORIAL/', base);
    assert.equal(tutorialUrl.pathname, '/eyeon/TUTORIAL/');
    assert.ok((await read('TUTORIAL/index.md')).length > 0);
    assert.match(html, /href="SPEC\/">Specification/);
  }

  const home = await read('index.md');
  const spec = await read('SPEC/index.md');
  const tutorial = await read('TUTORIAL/index.md');
  assert.match(home, /^---\nlayout: default\n/);
  assert.match(home, /\[specification\]\(https:\/\/eyereasoner\.github\.io\/eyeon\/SPEC\/\)/);
  assert.match(home, /\[hands-on tutorial\]\(https:\/\/eyereasoner\.github\.io\/eyeon\/TUTORIAL\/\)/);
  assert.match(spec, /^---\nlayout: default\n/);
  assert.match(spec, /# eyeon Specification/);
  assert.match(tutorial, /^---\nlayout: default\n/);
  assert.match(tutorial, /^# .*eyeon tutorial/m);
  for (const document of [home, spec, tutorial]) {
    assert.doesNotMatch(document, /^\[(eyeon|Repository|Playground|Tutorial|Specification)\]\(/m);
    assert.doesNotMatch(document, /<!-- navigation:(start|end) -->/);
  }
  assert.match(await read('README.md'), /<!-- navigation:start -->[\s\S]*?\[Tutorial\]\(https:\/\/eyereasoner\.github\.io\/eyeon\/TUTORIAL\/\)/);
  assert.doesNotMatch(await read('SPEC.md'), /^\[(eyeon|Repository|Playground|Tutorial|Specification)\]\(/m);
  assert.equal(await read('TUTORIAL.md'), await readFile(new URL('../TUTORIAL.md', import.meta.url), 'utf8'));
  for (const [document, target, expected, file = 'index.md'] of [
    ['', 'https://eyereasoner.github.io/eyeon/TUTORIAL/', '/eyeon/TUTORIAL/'],
    ['', 'https://eyereasoner.github.io/eyeon/SPEC/', '/eyeon/SPEC/'],
    ['TUTORIAL/', 'https://eyereasoner.github.io/eyeon/SPEC/', '/eyeon/SPEC/'],
    ['TUTORIAL/', 'https://eyereasoner.github.io/eyeon/playground/', '/eyeon/playground/', 'index.html'],
  ]) {
    const url = new URL(target, `https://eyereasoner.github.io/eyeon/${document}`);
    assert.equal(url.pathname + url.hash, expected);
    const page = url.pathname.slice('/eyeon/'.length);
    assert.ok((await read(`${page}${file}`)).length > 0);
    const content = document === 'TUTORIAL/' ? tutorial : home;
    assert.ok(content.includes(`](${target})`));
  }
  assert.equal(JSON.parse(await read('_config.yml')).baseurl, '/eyeon');
  const layout = await read('_layouts/default.html');
  assert.equal([...layout.matchAll(/<nav\b/g)].length, 1);
  assert.match(layout, /\{\{ content \}\}/);
  for (const [label, path, file] of [
    ['eyeon', '/', 'index.md'],
    ['Playground', '/playground/', 'playground/index.html'],
    ['Tutorial', '/TUTORIAL/', 'TUTORIAL/index.md'],
    ['Specification', '/SPEC/', 'SPEC/index.md'],
  ]) {
    assert.ok(layout.includes(`href="{{ '${path}' | relative_url }}">${label}</a>`));
    assert.ok((await read(file)).length > 0);
  }
});
