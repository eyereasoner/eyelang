import http from 'node:http';
import { parentPort } from 'node:worker_threads';

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
    const body = Buffer.concat(chunks).toString('utf8');
    const payload = JSON.stringify({ method: req.method, path: req.url, body, test: req.headers['x-test'] ?? null });
    res.setHeader('content-type', 'application/json');
    res.setHeader('x-eyeprolog-test', 'yes');
    res.end(payload);
  });
});

server.listen(0, '127.0.0.1', () => parentPort.postMessage({ port: server.address().port }));
parentPort.on('message', (message) => {
  if (message === 'close') server.close(() => process.exit(0));
});
