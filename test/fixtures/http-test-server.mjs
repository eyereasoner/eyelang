import http from 'node:http';
import { parentPort } from 'node:worker_threads';

const LARGE_BYTES = 9 * 1024 * 1024;

const server = http.createServer((req, res) => {
  const chunks = [];
  req.on('data', (chunk) => chunks.push(Buffer.from(chunk)));
  req.on('end', () => {
    if (req.url === '/redirect') {
      res.statusCode = 302;
      res.setHeader('location', '/final');
      res.end();
      return;
    }
    if (req.url === '/large') {
      res.setHeader('content-type', 'text/plain');
      res.setHeader('content-length', String(LARGE_BYTES));
      res.end(Buffer.alloc(LARGE_BYTES, 120));
      return;
    }
    const body = Buffer.concat(chunks).toString('utf8');
    const payload = JSON.stringify({
      method: req.method, path: req.url, body,
      test: req.headers['x-test'] ?? null,
      repeated: req.headers['x-repeat'] ?? null,
      contentLength: req.headers['content-length'] ?? null,
    });
    res.setHeader('content-type', 'application/json');
    res.setHeader('x-eyeprolog-test', 'yes');
    res.end(payload);
  });
});

server.listen(0, '127.0.0.1', () => parentPort.postMessage({ port: server.address().port }));
parentPort.on('message', (message) => {
  if (message === 'close') server.close(() => process.exit(0));
});
