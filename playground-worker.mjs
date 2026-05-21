let active = false;

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

self.onmessage = async event => {
  const { id, program, query, moduleUrl } = event.data;
  if (active) return;
  active = true;

  const stdout = [];
  const stderr = [];
  let exitCode = 0;
  let phase = 'loading browser build';

  try {
    const { default: createEyelogModule } = await import(moduleUrl);

    phase = 'initializing WebAssembly';
    const mod = await createEyelogModule({
      noInitialRun: true,
      locateFile: path => new URL(path, moduleUrl).href,
      print: text => stdout.push(String(text)),
      printErr: text => stderr.push(String(text)),
    });

    phase = 'preparing input';
    try { mod.FS.mkdir('/work'); } catch (_) {}
    mod.FS.writeFile('/work/input.pl', program);

    phase = 'running Eyelog';
    const args = [];
    if (query && query.trim()) args.push('--query', query.trim());
    args.push('/work/input.pl');

    try {
      mod.callMain(args);
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
      id,
      exitCode,
      phase,
      stdout: stdout.join('\n'),
      stderr: stderr.join('\n'),
    });
    active = false;
  }
};
