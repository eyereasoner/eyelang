// Node HTTP(S) bridge for library(http). The Prolog module owns option parsing,
// response shaping, and server-side HTTP parsing; this host adapter only performs
// the asynchronous client exchange and exposes the body as an EyeProlog stream.

import { isNode } from './platform.js';
import { PrologError } from './errors.js';
import {
  ATOM, COMPOUND, NUMBER, STRING, VAR, atom, compound, copyResolved, deref,
  listFromItems, numberTerm, properListItems, unify,
} from './term.js';
import { characterListText, chars } from './host-utils.js';

let WorkerCtor = null;
if (isNode) ({ Worker: WorkerCtor } = await import('node:worker_threads'));

const RPC_BYTES = 8 * 1024 * 1024;
const HEADER_WORDS = 4;
let bridge = null;

class HttpBridge {
  constructor() {
    this.shared = new SharedArrayBuffer(HEADER_WORDS * Int32Array.BYTES_PER_ELEMENT + RPC_BYTES);
    this.header = new Int32Array(this.shared, 0, HEADER_WORDS);
    this.bytes = new Uint8Array(this.shared, HEADER_WORDS * Int32Array.BYTES_PER_ELEMENT);
    this.encoder = new TextEncoder();
    this.decoder = new TextDecoder();
    this.worker = new WorkerCtor(new URL('./http-worker.js', import.meta.url), {
      type: 'module', workerData: { shared: this.shared },
      execArgv: typeof process !== 'undefined' ? process.execArgv.filter((arg) => !arg.startsWith('--input-type')) : [],
    });
    this.worker.unref();
    const ready = Atomics.wait(this.header, 0, 0, 5000);
    if (ready === 'timed-out' || Atomics.load(this.header, 0) !== -1) {
      this.worker.terminate();
      throw new PrologError('resource_error(http)');
    }
    Atomics.store(this.header, 0, 0);
  }
  rpc(request) {
    const encoded = this.encoder.encode(JSON.stringify(request));
    if (encoded.length > this.bytes.length) throw new PrologError('resource_error(http_message)');
    this.bytes.set(encoded, 0);
    Atomics.store(this.header, 1, encoded.length);
    Atomics.store(this.header, 2, 0);
    Atomics.store(this.header, 0, 1);
    this.worker.postMessage(1);
    Atomics.wait(this.header, 0, 1);
    const responseLength = Atomics.load(this.header, 2);
    const response = JSON.parse(this.decoder.decode(this.bytes.subarray(0, responseLength)));
    Atomics.store(this.header, 0, 0);
    if (!response.ok) {
      if (response.error?.code === 'EPROTONOSUPPORT') throw new PrologError('domain_error(http_url_scheme)');
      if (['ENOTFOUND', 'ECONNREFUSED', 'EHOSTUNREACH', 'ENETUNREACH'].includes(response.error?.code)) {
        throw new PrologError('existence_error(source_sink)');
      }
      throw new PrologError('resource_error(http)');
    }
    return response.result;
  }
}

function httpBridge() {
  if (!isNode || WorkerCtor == null || typeof SharedArrayBuffer === 'undefined' || typeof Atomics?.wait !== 'function') {
    throw new PrologError('resource_error(http)');
  }
  bridge ??= new HttpBridge();
  return bridge;
}

function textValue(term, env, { allowNumber = false } = {}) {
  const value = deref(term, env);
  if (value.type === VAR) throw new PrologError('instantiation_error');
  if (value.type === ATOM && value.name === '[]') return '';
  if (value.type === ATOM || value.type === STRING || (allowNumber && value.type === NUMBER)) return value.name;
  return characterListText(term, env);
}

function requestHeadersValue(term, env) {
  const items = properListItems(deref(term, env), env);
  if (items == null) throw new PrologError('type_error(list)', copyResolved(term, env));
  return items.map((entryTerm) => {
    const entry = deref(entryTerm, env);
    if (entry.type !== COMPOUND || entry.name !== 'header' || entry.arity !== 2) {
      throw new PrologError('domain_error(http_header)', copyResolved(entry, env));
    }
    return [textValue(entry.args[0], env), textValue(entry.args[1], env, { allowNumber: true })];
  });
}

function streamHandle(id) { return compound('$stream', [numberTerm(id)]); }

function addBodyStream(solver, body, finalUrl) {
  const stream = {
    id: solver.io.nextId++, alias: null, mode: 'read', type: 'text', content: String(body),
    position: 0, reportedPosition: 0, path: String(finalUrl ?? ''), reposition: false,
    eofAction: 'eof_code', standard: false, pastEnd: false, readable: true, writable: false,
  };
  solver.io.add(stream);
  return stream;
}

function* httpOpenBuiltin({ solver, goal, env }) {
  const url = textValue(goal.args[0], env);
  const method = textValue(goal.args[2], env);
  const data = textValue(goal.args[3], env);
  const requestHeaders = requestHeadersValue(goal.args[5], env);
  const result = httpBridge().rpc({ op: 'request', url, method, data, headers: requestHeaders, redirects: 5 });
  const stream = addBodyStream(solver, result.body, result.finalUrl);
  const headerTerms = result.headers.map(([name, value]) => compound('header', [atom(name), chars(value)]));
  const next = env.clone();
  if (unify(goal.args[1], streamHandle(stream.id), next) &&
      unify(goal.args[4], numberTerm(result.statusCode), next) &&
      unify(goal.args[6], listFromItems(headerTerms), next) &&
      unify(goal.args[7], chars(result.finalUrl), next)) {
    yield next;
  } else {
    solver.io.close(stream);
  }
}

export const httpHostBuiltins = {
  register(registry) {
    registry.add('eyeprolog__http_open', 8, httpOpenBuiltin, { deterministic: true, eyePrologLibrary: true });
  },
};
