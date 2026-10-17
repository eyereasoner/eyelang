import test from 'node:test';
import assert from 'node:assert/strict';
import { readFile, readdir } from 'node:fs/promises';
import { runInNewContext } from 'node:vm';
import { highlight } from '../src/playground-highlight.js';

const root = new URL('../', import.meta.url);
const script = (await readFile(new URL('src/playground.js', root), 'utf8'))
  .replace("import { highlight } from './playground-highlight.js';", '')
  .replaceAll('import.meta.url', JSON.stringify(new URL('src/playground.js', root).href));
const exampleNames = (await readdir(new URL('examples/', root)))
  .filter(name => name.endsWith('.pl')).map(name => name.slice(0, -3));
const sample = 'cat(milo). ?- cat(Who).';
const gist = 'abc123def456abc123def456abc123deff';

// Exercise the real UI handlers with a small DOM and controlled network/storage.
async function playground({ hash = '', draft, fetch: fetchOverride, token = null, clipboard = true } = {}) {
  const elements = new Map();
  const element = id => {
    if (!elements.has(id)) elements.set(id, {
      value: '', textContent: '', disabled: false, hidden: true, dataset: {}, options: [], style: {},
      scrollTop: 0, scrollLeft: 0, clientHeight: 380,
      handlers: {}, classList: { toggle() {}, remove() {} },
      addEventListener(name, handler) { this.handlers[name] = handler; },
      setAttribute() {}, removeAttribute() {}, focus() {}, select() {},
      setSelectionRange(start, end) { this.selectionStart = start; this.selectionEnd = end; },
    });
    return elements.get(id);
  };
  element('example-select').options = [{ value: '' }, ...exampleNames.map(value => ({ value }))];
  const storage = new Map(draft ? [['eyelang.playground.draft.v2', JSON.stringify(draft)]] : []);
  const copied = [];
  const opened = [];
  const prompts = [];
  const requests = [];
  const runs = [];
  const workers = [];
  const location = new URL(`https://example.org/eyelang/playground/${hash}`);
  const context = {
    document: { getElementById: element, documentElement: { dataset: {} } },
    location, URL, URLSearchParams, AbortController, highlight,
    history: { replaceState(_, __, url) { location.href = new URL(url, location).href; } },
    localStorage: { getItem: key => storage.get(key), setItem: (key, value) => storage.set(key, value) },
    navigator: { clipboard: { async writeText(text) { if (!clipboard) throw new Error('Unavailable'); copied.push(text); } } },
    setTimeout: () => 1, clearTimeout() {},
    Worker: class {
      constructor() { workers.push(this); }
      postMessage(data) { runs.push(data); }
      terminate() { this.terminated = true; }
    },
    async fetch(url, options) {
      requests.push({ url: String(url), options });
      const response = await fetchOverride?.(String(url), options);
      if (response) return response;
      if (String(url).startsWith('examples/')) {
        try { return new Response(await readFile(new URL(url, root), 'utf8')); }
        catch { return new Response('', { status: 404 }); }
      }
      throw new Error(`Unexpected request: ${url}`);
    },
  };
  context.window = { Worker: context.Worker, addEventListener() {},
    getComputedStyle: () => ({ lineHeight: '24px' }),
    requestAnimationFrame: callback => callback(),
    prompt(message) { prompts.push(message); return token; },
    open(...args) { opened.push(args); },
  };
  await runInNewContext(script, context);
  const dispatch = async (id, event = 'click') => {
    await element(id).handlers[event]({ preventDefault() {}, target: element(id) });
    // Some DOM handlers start a load without returning its promise.
    for (let i = 0; i < 20 && element('program').disabled; i++) await new Promise(resolve => setTimeout(resolve, 5));
  };
  const edit = async source => { element('program').value = source; await dispatch('program', 'input'); };
  return { element, dispatch, edit, storage, copied, opened, prompts, requests, runs, workers, location };
}

const shared = app => app.element('share-url').value;
const program = app => app.element('program').value;

test('editor coloring follows edits, scrolling, and reset while preserving the program', async () => {
  const app = await playground({ hash: '#program=' + encodeURIComponent(sample) });
  const colors = app.element('program-colors');
  assert.equal(colors.innerHTML, highlight(sample));
  const source = 'p(X) :- q(X).\n'.repeat(1000) + 'tail(Last).';
  await app.edit(source);
  assert.equal(program(app), source);
  assert.ok(colors.innerHTML.length < 10000, 'only visible lines are rendered');
  app.element('program').scrollTop = 995 * 24;
  app.element('program').scrollLeft = 42;
  await app.dispatch('program', 'scroll');
  assert.match(colors.innerHTML, /Last/);
  assert.match(colors.style.transform, /^translate\(-42px,/);
  await app.dispatch('reset');
  assert.equal(program(app), sample);
  assert.equal(colors.innerHTML, highlight(sample));
});

test('colored output keeps its complete raw text for copying and terminates the worker', async () => {
  const app = await playground({ hash: '#program=' + encodeURIComponent(sample) });
  await app.dispatch('run');
  const output = '% Answer\ntext("<script>&lt;</script>").\n' + 'p(a).\n'.repeat(35000);
  app.workers[0].onmessage({ data: { output, elapsed: 10 } });
  assert.equal(app.workers[0].terminated, true);
  assert.equal(app.element('output').innerHTML, highlight(output.slice(0, 200000), { arc: true }));
  assert.doesNotMatch(app.element('output').innerHTML, /<script>/);
  assert.equal(app.element('preview-note').hidden, false);
  await app.dispatch('copy-output');
  assert.equal(app.copied.at(-1), output);
});

test('run errors remain plain text and select the source line; editing still cancels a run', async () => {
  const source = 'p(a).\n?- X is Missing + 1.';
  const app = await playground({ hash: '#program=' + encodeURIComponent(source) });
  await app.dispatch('run');
  const error = 'Line 2: Missing must be bound before arithmetic evaluation.';
  app.workers[0].onmessage({ data: { error } });
  assert.equal(app.element('output').textContent, error);
  assert.equal(app.element('program').selectionStart, 6);
  assert.equal(app.element('program').selectionEnd, source.length);
  await app.dispatch('copy-output');
  assert.equal(app.copied.at(-1), error);
  await app.dispatch('run');
  await app.edit(sample);
  assert.equal(app.workers[1].terminated, true);
  assert.equal(app.element('run').disabled, false);
  assert.equal(app.element('stop').disabled, true);
  assert.equal(app.element('program-colors').innerHTML, highlight(sample));
});

test('tutorial links prefill every lesson and run its exact program', async () => {
  const tutorial = await readFile(new URL('TUTORIAL.md', root), 'utf8');
  const sources = [...tutorial.matchAll(/```prolog\n([\s\S]*?)\n```/g)].map(match => match[1]);
  const links = [...tutorial.matchAll(/\[🚀 Try it in the playground\]\(([^)]+)\)/g)].map(match => new URL(match[1]));
  assert.equal(links.length, sources.length);
  assert.ok(links.length > 0);
  for (const [index, link] of links.entries()) {
    assert.equal(link.origin, 'https://eyereasoner.github.io');
    assert.equal(link.pathname, '/eyelang/playground/');
    assert.equal(decodeURIComponent(link.hash.slice(9)), sources[index]);
    const app = await playground({ hash: link.hash, draft: { source: 'old draft' } });
    assert.equal(program(app), sources[index], `lesson ${index+1}`);
    assert.equal(app.runs.length, 0);
    await app.dispatch('run');
    assert.equal(app.runs.length, 1);
    assert.equal(app.runs[0].source, sources[index]);
  }
});

test('bundled examples use short references, including the largest taxonomy', async () => {
  const app = await playground({ hash: '#example=deep-taxonomy-10000' });
  assert.ok(program(app).length > 1000000);
  assert.equal(app.runs.length, 0, 'shared examples wait for Run');
  await app.dispatch('share');
  assert.equal(shared(app), 'https://example.org/eyelang/playground/#example=deep-taxonomy-10000');
  assert.equal(app.prompts.length, 0);
  assert.equal(app.copied.at(-1), shared(app));
});

test('edits share their actual text; undo and reset restore short example links', async () => {
  const app = await playground({ hash: '#example=socrates' });
  const original = program(app);
  await app.edit(sample);
  assert.equal(app.location.hash, '');
  await app.dispatch('share');
  assert.equal(new URL(shared(app)).hash, '#program=' + encodeURIComponent(sample));
  await app.edit(original);
  await app.dispatch('share');
  assert.ok(shared(app).endsWith('#example=socrates'));
  await app.edit(sample);
  await app.dispatch('reset');
  await app.dispatch('share');
  assert.equal(program(app), original);
  assert.ok(shared(app).endsWith('#example=socrates'));
});

test('restored pristine drafts retain references; edited and legacy drafts embed text', async () => {
  const original = await playground({ hash: '#example=socrates' });
  const draft = JSON.parse(original.storage.get('eyelang.playground.draft.v2'));
  const pristine = await playground({ draft });
  await pristine.dispatch('share');
  assert.ok(shared(pristine).endsWith('#example=socrates'));
  for (const reference of [null, undefined]) {
    const edited = await playground({ draft: { ...draft, source: sample, reference } });
    await edited.dispatch('share');
    assert.ok(shared(edited).endsWith('#program=' + encodeURIComponent(sample)));
  }
});

test('existing inline links preserve Unicode, plus signs, and quoted punctuation', async () => {
  const source = `text('café', "a+b & # ?"). ?- text('café', Text).`;
  const app = await playground({ hash: '#program=' + encodeURIComponent(source), draft: { source: sample } });
  assert.equal(program(app), source);
  assert.equal(app.runs.length, 0);
  await app.dispatch('share');
  assert.equal(decodeURIComponent(new URL(shared(app)).hash.slice(9)), source);
});

test('URL references load without running and stop being references after editing', async () => {
  const url = 'https://example.net/program.pl?name=a%2Bb';
  const app = await playground({ hash: '#url=' + encodeURIComponent(url), fetch: () => new Response(sample) });
  assert.equal(program(app), sample);
  assert.equal(app.runs.length, 0);
  await app.dispatch('share');
  assert.equal(shared(app), 'https://example.org/eyelang/playground/#url=' + encodeURIComponent(url));
  await app.edit(sample + '\n% edited');
  await app.dispatch('share');
  assert.ok(shared(app).includes('#program='));
});

test('a URL opened through the form also gets a reference link', async () => {
  const url = 'https://example.net/program.pl';
  const app = await playground({ hash: '#program=' + encodeURIComponent(sample), fetch: address => address === url ? new Response(sample) : null });
  app.element('program-url').value = url;
  await app.dispatch('url-form', 'submit');
  await app.dispatch('share');
  assert.ok(shared(app).endsWith('#url=' + encodeURIComponent(url)));
});

test('gist links load .pl content without credentials or automatic execution', async () => {
  const app = await playground({ hash: '#gist=' + gist, draft: { source: 'old draft' }, fetch: () => Response.json({ files: { 'hello.pl': { filename: 'hello.pl', content: sample } } }) });
  assert.equal(program(app), sample);
  assert.equal(app.requests[0].url, `https://api.github.com/gists/${gist}`);
  assert.equal(app.requests[0].options.headers, undefined);
  assert.equal(app.runs.length, 0);
  await app.dispatch('share');
  assert.ok(shared(app).endsWith('#gist=' + gist));
});

test('truncated gist files fetch the complete raw program', async () => {
  const raw = `https://gist.githubusercontent.com/person/${gist}/raw/program.pl`;
  const app = await playground({ hash: '#gist=' + gist, fetch: address => address === raw ? new Response(sample) : Response.json({ files: { 'program.pl': { truncated: true, content: 'partial', raw_url: raw } } }) });
  assert.equal(program(app), sample);
  assert.equal(app.requests.length, 2);
});

test('creating a gist sends the snapshot and token only to GitHub, then shares its ID', async () => {
  const app = await playground({ hash: '#program=' + encodeURIComponent(sample), token: ' test-token ', fetch: () => Response.json({ id: gist }, { status: 201 }) });
  await app.dispatch('create-gist');
  const request = app.requests.at(-1);
  assert.equal(request.url, 'https://api.github.com/gists');
  assert.equal(request.options.method, 'POST');
  assert.equal(request.options.headers.Authorization, 'Bearer test-token');
  const body = JSON.parse(request.options.body);
  assert.equal(body.public, false);
  assert.equal(body.files['program.pl'].content, sample);
  assert.ok(shared(app).endsWith('#gist=' + gist));
  assert.equal([...app.storage.values()].join('').includes('test-token'), false);
  await app.dispatch('share');
  assert.equal(app.requests.length, 1, 'reuse the created gist without another upload');
});

test('blank token opens the manual Gist flow and converts a pasted URL to a short link', async () => {
  const app = await playground({ hash: '#program=' + encodeURIComponent(sample), token: '' });
  await app.dispatch('create-gist');
  assert.equal(app.copied.at(-1), sample);
  assert.equal(app.opened[0][0], 'https://gist.github.com/');
  assert.equal(app.element('gist-panel').hidden, false);
  assert.equal(app.requests.length, 0);
  app.element('gist-url').value = `https://gist.github.com/person/${gist}`;
  await app.dispatch('gist-form', 'submit');
  assert.ok(shared(app).endsWith('#gist=' + gist));
});

test('oversized edited programs offer Gist sharing; cancellation uploads nothing', async () => {
  const app = await playground({ hash: '#program=' + encodeURIComponent(sample) });
  await app.edit('# large\n'.repeat(500));
  await app.dispatch('share');
  assert.match(app.prompts[0], /too large/);
  assert.match(app.element('editor-status').textContent, /cancelled/);
  assert.equal(app.requests.length, 0);
  assert.equal(app.element('share-panel').hidden, true);
});

test('clipboard failures leave inline links visible and manual Gist instructions usable', async () => {
  const app = await playground({ hash: '#program=' + encodeURIComponent(sample), clipboard: false, token: '' });
  await app.dispatch('share');
  assert.equal(app.element('share-panel').hidden, false);
  assert.match(app.element('editor-status').textContent, /Copy the link below/);
  await app.dispatch('create-gist');
  assert.equal(app.element('gist-panel').hidden, false);
  assert.match(app.element('editor-status').textContent, /Copy your program/);
});

test('invalid references and failed Gist creation identify the URL or HTTP error', async () => {
  const invalid = await playground({ hash: '#example=../outside' });
  assert.equal(invalid.element('source-name').textContent, 'socrates.pl');
  assert.match(invalid.element('editor-status').textContent, /Couldn't read/);
  const denied = await playground({ hash: '#program=' + encodeURIComponent(sample), token: 'bad-token', fetch: () => new Response('', { status: 401 }) });
  await denied.dispatch('create-gist');
  assert.match(denied.element('editor-status').textContent, /HTTP 401/);
  assert.equal(denied.element('create-gist').disabled, false);
  denied.element('gist-url').value = 'https://example.org/not-a-gist';
  await denied.dispatch('gist-form', 'submit');
  assert.match(denied.element('editor-status').textContent, /GitHub Gist URL or ID/);
});
