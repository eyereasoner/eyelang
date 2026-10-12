import test from 'node:test';
import assert from 'node:assert/strict';
import { request } from 'node:http';
import { readFileSync, readdirSync } from 'node:fs';
import { createPlaygroundServer } from '../src/playground-server.js';

async function withServer(t) {
  const server = createPlaygroundServer();
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  t.after(() => new Promise(resolve => server.close(resolve)));
  return (path, method = 'GET') => new Promise((resolve, reject) => {
    const req = request({ host: '127.0.0.1', port: server.address().port, path, method, agent: false }, response => {
      let body = '';
      response.setEncoding('utf8');
      response.on('data', chunk => { body += chunk; });
      response.on('end', () => resolve({ status: response.statusCode, headers: response.headers, body }));
    });
    req.on('error', reject);
    req.end();
  });
}

test('the playground serves its page, browser modules, examples, and documentation', async t => {
  const get = await withServer(t);
  for (const [path, type, content] of [
    ['/', 'text/html', '<title>eyelang playground</title>'],
    ['/src/playground.js', 'text/javascript', 'new Worker('],
    ['/src/playground-worker.js', 'text/javascript', "import { run } from './language.js'"],
    ['/src/language.js', 'text/javascript', 'export function run('],
    ['/examples/socrates.eye', 'text/plain', 'human implies mortal.'],
    ['/SPEC.md', 'text/plain', '# eyelang Language Specification'],
  ]) {
    const response = await get(path);
    assert.equal(response.status, 200, path);
    assert.equal(response.headers['content-type'], `${type}; charset=utf-8`);
    assert.ok(response.body.includes(content), path);
  }
  const head = await get('/playground.html', 'HEAD');
  assert.equal(head.status, 200);
  assert.equal(head.body, '');
});

test('the playground server handles missing assets, malformed URLs, and unsupported methods', async t => {
  const get = await withServer(t);
  for (const path of ['/missing', '/examples/missing.eye', '/package.json', '/src/playground-server.js', '/language.js', '/playground.js', '/.git/config', '/%2e%2e%2fpackage.json']) {
    assert.equal((await get(path)).status, 404, path);
  }
  assert.equal((await get('/%xx')).status, 400);
  const post = await get('/playground.html', 'POST');
  assert.equal(post.status, 405);
  assert.equal(post.headers.allow, 'GET, HEAD');
});

test('the playground offers every bundled example and links to existing local assets', () => {
  const html = readFileSync(new URL('../playground.html', import.meta.url), 'utf8');
  const listed = [...html.matchAll(/<option value="([a-z0-9-]+)"/g)].map(match => `${match[1]}.eye`);
  const files = readdirSync(new URL('../examples/', import.meta.url)).filter(file => file.endsWith('.eye'));
  assert.deepEqual(listed.sort(), files.sort());
  for (const match of html.matchAll(/(?:src|href)="([^":]+\.(?:js|md))"/g)) {
    assert.doesNotThrow(() => readFileSync(new URL(`../${match[1]}`, import.meta.url)), match[1]);
  }
});
