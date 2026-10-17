import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { pathToFileURL } from 'node:url';

const root = new URL('../', import.meta.url);
const files = new Set(['playground.html', 'src/playground.js', 'src/playground-highlight.js', 'src/playground-worker.js', 'src/language.js', 'README.md', 'TUTORIAL.md', 'SPEC.md']);

export function createPlaygroundServer() {
  return createServer(async (request, response) => {
    response.setHeader('X-Content-Type-Options', 'nosniff');
    response.setHeader('Cache-Control', 'no-store');
    if (!['GET', 'HEAD'].includes(request.method)) {
      response.writeHead(405, { Allow: 'GET, HEAD' }).end('Use GET or HEAD.');
      return;
    }
    let path;
    try { path = decodeURIComponent(new URL(request.url, 'http://localhost').pathname).slice(1) || 'playground.html'; }
    catch { response.writeHead(400).end('Invalid URL.'); return; }
    if (!files.has(path) && !/^examples\/[a-z0-9-]+\.pl$/.test(path)) {
      response.writeHead(404).end('File not found.');
      return;
    }
    try {
      const content = await readFile(new URL(path, root));
      const type = path.endsWith('.html') ? 'text/html' : path.endsWith('.js') ? 'text/javascript' : 'text/plain';
      response.writeHead(200, { 'Content-Type': `${type}; charset=utf-8` });
      response.end(request.method === 'HEAD' ? undefined : content);
    } catch { response.writeHead(404).end('File not found.'); }
  });
}

if (process.argv[1] && pathToFileURL(process.argv[1]).href === import.meta.url) {
  const server = createPlaygroundServer();
  server.on('error', error => { console.error(`Couldn't start the playground: ${error.message}`); process.exitCode = 1; });
  server.listen(Number(process.env.PORT ?? 8000), '127.0.0.1', () => {
    console.log(`Open http://127.0.0.1:${server.address().port}/playground.html`);
    console.log('Press Ctrl+C to stop the server.');
  });
}
