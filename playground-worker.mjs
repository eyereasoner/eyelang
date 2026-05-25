let active = false;
let moduleUrl = null;
let modulePromise = null;
let mod = null;
let stdout = [];
let stderr = [];

function stringifyError(error) {
  if (!error) return 'Unknown error';

  const message = error.message ? String(error.message) : String(error);
  const stack = error.stack ? String(error.stack) : message;

  if (/Maximum call stack size exceeded|call stack|stack overflow/i.test(stack)) {
    return [
      stack,
      '',
      'Eyelog exhausted the browser WebAssembly stack.',
      'Rebuild the browser assets with the current Makefile:',
      '',
      '  make clean browser',
      '',
      'If this page is served from a cache, hard-refresh the browser before trying again.',
    ].join('\n');
  }

  return stack;
}

async function loadModule() {
  if (mod) return mod;
  if (!moduleUrl) throw new Error('Browser module URL was not provided.');

  if (!modulePromise) {
    modulePromise = (async () => {
      const { default: createEyelogModule } = await import(moduleUrl);
      return createEyelogModule({
        noInitialRun: true,
        locateFile: path => new URL(path, moduleUrl).href,
        print: text => stdout.push(String(text)),
        printErr: text => stderr.push(String(text)),
      });
    })();
  }

  mod = await modulePromise;
  try { mod.FS.mkdir('/work'); } catch (_) {}
  return mod;
}

async function initialize(requestId, url) {
  moduleUrl = url;
  try {
    await loadModule();
    self.postMessage({ type: 'ready', id: requestId });
  } catch (error) {
    modulePromise = null;
    mod = null;
    self.postMessage({
      type: 'init-error',
      id: requestId,
      phase: 'loading browser build',
      stderr: stringifyError(error),
    });
  }
}

async function runEyelog(request) {
  const { id, program, query, explain, stats } = request;
  if (active) {
    self.postMessage({
      type: 'result',
      id,
      exitCode: 1,
      phase: 'starting Eyelog',
      stdout: '',
      stderr: 'Eyelog is already running.',
    });
    return;
  }

  active = true;
  stdout = [];
  stderr = [];
  let exitCode = 0;
  let phase = 'initializing WebAssembly';

  try {
    const engine = await loadModule();

    phase = 'preparing input';
    try { engine.FS.unlink('/work/input.pl'); } catch (_) {}
    engine.FS.writeFile('/work/input.pl', program);

    phase = 'running Eyelog';
    const args = [];
    if (stats) args.push('--stats');
    if (explain) args.push('--explain');
    if (query && query.trim()) args.push('--query', query.trim());
    args.push('/work/input.pl');

    try {
      engine.callMain(args);
    } catch (error) {
      if (typeof error === 'number') exitCode = error;
      else if (error && typeof error.status === 'number') exitCode = error.status;
      else throw error;
    }
  } catch (error) {
    exitCode = exitCode || 1;
    stderr.push(stringifyError(error));
  } finally {
    self.postMessage({
      type: 'result',
      id,
      exitCode,
      phase,
      stdout: stdout.join('\n'),
      stderr: stderr.join('\n'),
    });
    active = false;
  }
}

self.onmessage = event => {
  const message = event.data || {};
  if (message.type === 'init') {
    initialize(message.id, message.moduleUrl);
  } else if (message.type === 'run') {
    runEyelog(message);
  }
};
