import http from 'node:http';
import https from 'node:https';
import { parentPort, workerData } from 'node:worker_threads';

const HEADER_WORDS = 4;
const header = new Int32Array(workerData.shared, 0, HEADER_WORDS);
const bytes = new Uint8Array(workerData.shared, HEADER_WORDS * Int32Array.BYTES_PER_ELEMENT);
const decoder = new TextDecoder();
const encoder = new TextEncoder();
const bodies = new Map();
let nextBodyId = 1;

function errorRecord(error) {
  return { code: String(error?.code ?? 'EUNKNOWN'), message: String(error?.message ?? error ?? 'http error') };
}

function writeResponse(response) {
  const encoded = encoder.encode(JSON.stringify(response));
  if (encoded.length > bytes.length) {
    const fallback = encoder.encode(JSON.stringify({ ok: false, error: { code: 'EMSGSIZE', message: 'HTTP bridge message too large' } }));
    bytes.set(fallback.subarray(0, bytes.length), 0);
    Atomics.store(header, 2, Math.min(fallback.length, bytes.length));
  } else {
    bytes.set(encoded, 0);
    Atomics.store(header, 2, encoded.length);
  }
  Atomics.store(header, 0, 2);
  Atomics.notify(header, 0, 1);
}

function headerObject(requestHeaders) {
  const headers = Object.create(null);
  for (const [rawName, rawValue] of requestHeaders) {
    const name = String(rawName).toLowerCase();
    const value = String(rawValue);
    const previous = headers[name];
    if (previous == null) headers[name] = value;
    else if (Array.isArray(previous)) previous.push(value);
    else headers[name] = [previous, value];
  }
  return headers;
}

function responseHeaders(res) {
  const rawHeaders = [];
  for (let i = 0; i < res.rawHeaders.length; i += 2) {
    rawHeaders.push([String(res.rawHeaders[i]).toLowerCase(), String(res.rawHeaders[i + 1] ?? '')]);
  }
  return rawHeaders;
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
    const headers = headerObject(requestHeaders);
    if (body != null && headers['content-length'] == null) headers['content-length'] = String(body.length);
    const req = transport.request(target, { method: method.toUpperCase(), headers }, (res) => {
      resolve({
        response: res,
        statusCode: Number(res.statusCode ?? 0),
        headers: responseHeaders(res),
        location: res.headers.location == null ? null : String(res.headers.location),
      });
    });
    req.on('error', reject);
    if (body != null && body.length > 0) req.write(body);
    req.end();
  });
}

function discardResponse(response) {
  return new Promise((resolve) => {
    response.on('error', resolve);
    response.on('end', resolve);
    response.resume();
  });
}

function withoutContentLength(headers) {
  return headers.filter(([name]) => String(name).toLowerCase() !== 'content-length');
}

async function requestFollowingRedirects(url, method, data, headers, redirects = 5) {
  let current = url;
  let currentMethod = method;
  let currentData = data;
  let currentHeaders = headers;
  for (let count = 0; ; count++) {
    const result = await requestOnce(current, currentMethod, currentData, currentHeaders);
    if (![301, 302, 303, 307, 308].includes(result.statusCode) || result.location == null || count >= redirects) {
      const bodyId = nextBodyId++;
      bodies.set(bodyId, { response: result.response, iterator: result.response[Symbol.asyncIterator](), remainder: null });
      return { statusCode: result.statusCode, headers: result.headers, bodyId, finalUrl: current };
    }
    await discardResponse(result.response);
    current = new URL(result.location, current).toString();
    if (result.statusCode === 303 || ((result.statusCode === 301 || result.statusCode === 302) && currentMethod.toLowerCase() === 'post')) {
      currentMethod = 'get';
      currentData = null;
      currentHeaders = withoutContentLength(currentHeaders);
    }
  }
}

function encodeBodyChunk(state, chunk, maxBytes) {
  const data = Buffer.from(chunk);
  if (data.length <= maxBytes) return { data, remainder: null };
  return { data: data.subarray(0, maxBytes), remainder: data.subarray(maxBytes) };
}

async function readBody(bodyId, maxBytes) {
  const state = bodies.get(bodyId);
  if (state == null) return { eof: true, data: '' };
  const limit = Math.max(1, Math.min(Number(maxBytes) || 65536, 1024 * 1024));
  if (state.remainder?.length) {
    const { data, remainder } = encodeBodyChunk(state, state.remainder, limit);
    state.remainder = remainder;
    return { eof: false, data: data.toString('base64') };
  }
  const next = await state.iterator.next();
  if (next.done) {
    bodies.delete(bodyId);
    return { eof: true, data: '' };
  }
  const { data, remainder } = encodeBodyChunk(state, next.value, limit);
  state.remainder = remainder;
  return { eof: false, data: data.toString('base64') };
}

function closeBody(bodyId) {
  const state = bodies.get(bodyId);
  if (state == null) return { closed: false };
  bodies.delete(bodyId);
  state.response.destroy();
  return { closed: true };
}

async function dispatch(request) {
  switch (request.op) {
    case 'request':
      return requestFollowingRedirects(request.url, request.method, request.data, request.headers, request.redirects ?? 5);
    case 'body_read':
      return readBody(request.bodyId, request.maxBytes);
    case 'body_close':
      return closeBody(request.bodyId);
    default:
      throw Object.assign(new Error(`unknown HTTP operation: ${request.op}`), { code: 'EINVAL' });
  }
}

parentPort.on('message', async () => {
  if (Atomics.load(header, 0) !== 1) return;
  try {
    const length = Atomics.load(header, 1);
    const request = JSON.parse(decoder.decode(bytes.subarray(0, length)));
    const result = await dispatch(request);
    writeResponse({ ok: true, result });
  } catch (error) {
    writeResponse({ ok: false, error: errorRecord(error) });
  }
});

Atomics.store(header, 0, -1);
Atomics.notify(header, 0, 1);
