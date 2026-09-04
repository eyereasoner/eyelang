import http from 'node:http';
import https from 'node:https';
import { parentPort, workerData } from 'node:worker_threads';

const HEADER_WORDS = 4;
const header = new Int32Array(workerData.shared, 0, HEADER_WORDS);
const bytes = new Uint8Array(workerData.shared, HEADER_WORDS * Int32Array.BYTES_PER_ELEMENT);
const decoder = new TextDecoder();
const encoder = new TextEncoder();

function errorRecord(error) {
  return { code: String(error?.code ?? 'EUNKNOWN'), message: String(error?.message ?? error ?? 'http error') };
}

function writeResponse(response) {
  const encoded = encoder.encode(JSON.stringify(response));
  if (encoded.length > bytes.length) {
    const fallback = encoder.encode(JSON.stringify({ ok: false, error: { code: 'EMSGSIZE', message: 'HTTP response too large for bridge' } }));
    bytes.set(fallback.subarray(0, bytes.length), 0);
    Atomics.store(header, 2, Math.min(fallback.length, bytes.length));
  } else {
    bytes.set(encoded, 0);
    Atomics.store(header, 2, encoded.length);
  }
  Atomics.store(header, 0, 2);
  Atomics.notify(header, 0, 1);
}

function requestOnce(url, method, data, requestHeaders) {
  return new Promise((resolve, reject) => {
    const target = new URL(url);
    const transport = target.protocol === 'https:' ? https : target.protocol === 'http:' ? http : null;
    if (transport == null) {
      reject(Object.assign(new Error(`unsupported URL scheme: ${target.protocol}`), { code: 'EPROTONOSUPPORT' }));
      return;
    }
    const body = data == null ? null : Buffer.from(data, 'utf8');
    const headers = Object.fromEntries(requestHeaders);
    if (body != null && !Object.keys(headers).some((name) => name.toLowerCase() === 'content-length')) {
      headers['content-length'] = String(body.length);
    }
    const req = transport.request(target, { method: method.toUpperCase(), headers }, (res) => {
      const chunks = [];
      res.on('data', (chunk) => chunks.push(Buffer.from(chunk)));
      res.on('end', () => {
        const rawHeaders = [];
        for (let i = 0; i < res.rawHeaders.length; i += 2) {
          rawHeaders.push([String(res.rawHeaders[i]).toLowerCase(), String(res.rawHeaders[i + 1] ?? '')]);
        }
        resolve({
          statusCode: Number(res.statusCode ?? 0),
          headers: rawHeaders,
          body: Buffer.concat(chunks).toString('utf8'),
          location: res.headers.location == null ? null : String(res.headers.location),
        });
      });
    });
    req.on('error', reject);
    if (body != null && body.length > 0) req.write(body);
    req.end();
  });
}

async function requestFollowingRedirects(url, method, data, headers, redirects = 5) {
  let current = url;
  let currentMethod = method;
  let currentData = data;
  for (let count = 0; ; count++) {
    const response = await requestOnce(current, currentMethod, currentData, headers);
    if (![301, 302, 303, 307, 308].includes(response.statusCode) || response.location == null || count >= redirects) {
      return { ...response, finalUrl: current };
    }
    current = new URL(response.location, current).toString();
    if (response.statusCode === 303 || ((response.statusCode === 301 || response.statusCode === 302) && currentMethod.toLowerCase() === 'post')) {
      currentMethod = 'get';
      currentData = '';
    }
  }
}

parentPort.on('message', async () => {
  if (Atomics.load(header, 0) !== 1) return;
  try {
    const length = Atomics.load(header, 1);
    const request = JSON.parse(decoder.decode(bytes.subarray(0, length)));
    if (request.op !== 'request') throw Object.assign(new Error(`unknown HTTP operation: ${request.op}`), { code: 'EINVAL' });
    const result = await requestFollowingRedirects(request.url, request.method, request.data, request.headers, request.redirects ?? 5);
    writeResponse({ ok: true, result });
  } catch (error) {
    writeResponse({ ok: false, error: errorRecord(error) });
  }
});

Atomics.store(header, 0, -1);
Atomics.notify(header, 0, 1);
