// Browser worker used by playground.html.
// It keeps parsing and solving off the UI thread and returns only serializable results to the page.
let active = false;
let modulePromise = null;
let engine = null;

function stringifyError(error) {
  if (!error) return 'Unknown error';

  const message = error.message ? String(error.message) : String(error);
  const stack = error.stack ? String(error.stack) : message;

  if (/Maximum call stack size exceeded|call stack|stack overflow/i.test(stack)) {
    return [
      stack,
      '',
      'eyelang exhausted the browser JavaScript call stack.',
      'Try a smaller example in the playground, or run this program with the Node CLI.',
    ].join('\n');
  }

  return stack;
}

async function loadEngine() {
  if (engine) return engine;
  if (!modulePromise) modulePromise = import('./src/index.js');
  engine = await modulePromise;
  return engine;
}

async function initialize(requestId) {
  try {
    await loadEngine();
    self.postMessage({ type: 'ready', id: requestId });
  } catch (error) {
    modulePromise = null;
    engine = null;
    self.postMessage({
      type: 'init-error',
      id: requestId,
      phase: 'loading JavaScript engine',
      stderr: stringifyError(error),
    });
  }
}

async function runEyelang(request) {
  const { id, program, query, stats, proof = false } = request;
  if (active) {
    self.postMessage({
      type: 'result',
      id,
      exitCode: 1,
      phase: 'starting eyelang',
      stdout: '',
      stderr: 'eyelang is already running.',
    });
    return;
  }

  active = true;
  let exitCode = 0;
  let phase = 'running JavaScript engine';
  let stdout = '';
  let stderr = '';

  try {
    const {
      COMPOUND,
      Env,
      Program,
      Solver,
      copyResolved,
      parseQueryGoal,
      termIsGround,
      termToString,
      whyNoProof,
      whyProof,
    } = await loadEngine();

    phase = 'parsing input';
    const parsed = Program.parse(program || '', { filename: '<playground>', sourceMetadata: proof, markRecursive: proof });

    if (query && query.trim()) {
      phase = 'parsing query';
      const goal = parseQueryGoal(query.trim());
      phase = 'solving query';
      const solver = new Solver(parsed);
      const out = [];
      for (const env of solver.solve([goal], new Env(), 0)) {
        out.push(`${termToString(goal, env, true)}.\n`);
        if (proof) appendExplanation(out, parsed, copyResolved(goal, env), whyProof, whyNoProof);
      }
      stdout = out.join('');
      if (stats) stderr = formatStats(solver.stats);
    } else {
      phase = 'materializing output';
      const goals = parsed.materializationGoals();
      const materializedKeys = new Set(goals.map((goal) => `${goal.name}/${goal.arity}`));
      const facts = parsed.sourceFactLines(materializedKeys);
      const lines = new Set();
      const out = [];
      let lastStats = null;
      for (const goal of goals) {
        if (goal.type !== COMPOUND) continue;
        const solver = new Solver(parsed);
        for (const env of solver.solve([goal], new Env(), 0)) {
          const resolved = copyResolved(goal, env);
          if (!termIsGround(resolved)) continue;
          const line = `${termToString(resolved, new Env(), true)}.\n`;
          if (facts.has(line) || lines.has(line)) continue;
          lines.add(line);
          out.push(line);
          if (proof) appendExplanation(out, parsed, resolved, whyProof, whyNoProof);
        }
        lastStats = solver.stats;
      }
      stdout = out.join('');
      if (stats && lastStats) stderr = formatStats(lastStats);
    }
  } catch (error) {
    exitCode = 1;
    stderr = stringifyError(error);
  } finally {
    self.postMessage({
      type: 'result',
      id,
      exitCode,
      phase,
      stdout,
      stderr,
    });
    active = false;
  }
}

function appendExplanation(out, program, resolved, whyProof, whyNoProof) {
  const proof = whyProof(program, resolved);
  out.push(proof.text);
  if (!proof.ok) out.push(whyNoProof(resolved));
}

function formatStats(stats) {
  let text = 'eyelang stats:\n';
  for (const [key, value] of Object.entries(stats)) text += `  ${key}: ${value}\n`;
  return text;
}

self.onmessage = event => {
  const message = event.data || {};
  if (message.type === 'init') initialize(message.id);
  else if (message.type === 'run') runEyelang(message);
};
