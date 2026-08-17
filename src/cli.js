// Command-line interface for EyeProlog.
// It loads programs from files, URLs, or stdin, then runs requested goals.
import fs from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';
import { goalsFromSource } from './goal-metadata.js';
import { memoryStatistics } from './platform.js';

let engineModule = null;
let explanationModule = null;

export async function main(argv) {
  if (argv.length === 0) {
    const engine = await loadEngine();
    const { runRepl } = await import('./repl.js');
    const exitCode = await runRepl(engine, {
      input: process.stdin,
      output: process.stdout,
      errorOutput: process.stderr,
    });
    if (exitCode !== 0) process.exitCode = exitCode;
    return;
  }

  const options = {
    files: [],
    proof: false,
    quads: false,
    stats: false,
    isoStrict: false,
    portable: false,
    autoload: true,
    version: false,
    warnings: false,
    goals: [],
  };

  let endOptions = false;

  for (let i = 0; i < argv.length; i++) {
    const arg = argv[i];

    if (!endOptions && arg === '--') {
      endOptions = true;
    } else if (!endOptions && (arg === '--help' || arg === '-h')) {
      await usage(process.stdout);
      return;
    } else if (!endOptions && (arg === '--proof' || arg === '-p')) {
      options.proof = true;
    } else if (!endOptions && (arg === '--quads' || arg === '-q')) {
      options.quads = true;
    } else if (!endOptions && (arg === '--stats' || arg === '-s')) {
      options.stats = true;
    } else if (!endOptions && arg === '--iso-strict') {
      options.isoStrict = true;
    } else if (!endOptions && arg === '--portable') {
      options.portable = true;
    } else if (!endOptions && arg === '--no-autoload') {
      options.autoload = false;
    } else if (!endOptions && (arg === '--version' || arg === '-v')) {
      options.version = true;
    } else if (!endOptions && (arg === '--warnings' || arg === '-w')) {
      options.warnings = true;
    } else if (!endOptions && (arg === '--goal' || arg === '-g')) {
      const goal = argv[++i];
      if (goal == null) throw new Error(`option ${arg} requires a goal`);
      options.goals.push(goal);
    } else if (!endOptions && arg.startsWith('-') && !arg.startsWith('--') && arg.length > 2) {
      const flags = arg.slice(1);
      for (const flag of flags) {
        if (!'hpqsvw'.includes(flag)) throw new Error(`unknown option: ${arg}`);
      }
      if (flags.includes('h')) {
        await usage(process.stdout);
        return;
      }
      if (flags.includes('p')) options.proof = true;
      if (flags.includes('q')) options.quads = true;
      if (flags.includes('s')) options.stats = true;
      if (flags.includes('v')) options.version = true;
      if (flags.includes('w')) options.warnings = true;
    } else if (!endOptions && arg.startsWith('-') && arg !== '-') {
      throw new Error(`unknown option: ${arg}`);
    } else {
      options.files.push(arg);
    }
  }

  if (options.version) {
    process.stdout.write(`eyeprolog ${await packageVersion()}\n`);
    return;
  }

  if (options.isoStrict && options.quads) {
    throw new Error('--iso-strict cannot be combined with --quads');
  }

  if (options.isoStrict && options.files.length === 0 && options.goals.length === 0 &&
      !options.proof && !options.stats && !options.warnings) {
    const engine = await loadEngine();
    const { runRepl } = await import('./repl.js');
    const exitCode = await runRepl(engine, {
      input: process.stdin,
      output: process.stdout,
      errorOutput: process.stderr,
      isoStrict: true,
    });
    if (exitCode !== 0) process.exitCode = exitCode;
    return;
  }

  if (options.files.length === 0) {
    options.files.push('-');
  }

  const sourceParts = [];
  let usedStdin = false;

  for (const file of options.files) {
    if (file === '-') {
      if (usedStdin) throw new Error("stdin input '-' can only be used once");
      usedStdin = true;
      sourceParts.push({ text: await readStdin(), filename: '<stdin>' });
    } else if (/^https?:\/\//.test(file)) {
      const response = await fetch(file);
      if (!response.ok) throw new Error(`could not fetch URL: ${file}`);
      sourceParts.push({ text: await response.text(), filename: file });
    } else {
      sourceParts.push({
        text: await fs.readFile(file, 'utf8'),
        filename: path.basename(file) || file,
        baseDir: path.dirname(path.resolve(file)),
      });
    }
  }

  if (options.goals.length === 0 && !options.quads) {
    for (const source of sourceParts) options.goals.push(...goalsFromSource(source.text));
  }

  // The ISO Prolog working-example quad files assume the Prologue predicates
  // are available as system predicates and therefore contain no use_module/1
  // directive. Import their portable EyeProlog counterparts in quad mode.
  if (options.quads) {
    sourceParts.unshift({
      text: ':- use_module(library(prologue)).\n',
      filename: '<quad-prelude>',
    });
  }

  const engine = await loadEngine();
  let program = engine.Program.parseSources(sourceParts, {
    sourceMetadata: options.proof || options.isoStrict,
    isoStrict: options.isoStrict,
    autoload: options.autoload,
    autoloadGoals: options.goals,
  });

  const portabilityFailures = program.interopPortabilityWarnings ?? [];
  if (options.warnings || (options.portable && portabilityFailures.length > 0)) printWarnings(program);
  if (options.portable && portabilityFailures.length > 0) {
    process.exitCode = 1;
    return;
  }

  if (!options.quads || options.goals.length > 0) await runDefault(engine, program, options);
  if (options.quads) {
    const result = engine.runQuads(program, { initialize: options.goals.length === 0 });
    process.stdout.write(result.stdout);
    if (result.failed > 0) process.exitCode = 1;
  }
}

async function loadEngine() {
  if (engineModule == null) {
    const [term, parser, program, solver, iso, library, write, quads] = await Promise.all([
      import('./term.js'),
      import('./parser.js'),
      import('./program.js'),
      import('./solver.js'),
      import('./iso.js'),
      import('./standard-library.js'),
      import('./write.js'),
      import('./quads.js'),
    ]);
    engineModule = { ...term, ...parser, ...program, ...solver, ...iso, ...library, ...write, ...quads };
  }
  return engineModule;
}

async function loadExplanation() {
  if (explanationModule == null) explanationModule = await import('./explain.js');
  return explanationModule;
}

async function runDefault(engine, program, options) {
  const registry = options.isoStrict ? engine.getStrictIsoRegistry() : engine.getEyePrologRegistry();
  const solver = new engine.Solver(program, {
    registry,
    isoStrict: options.isoStrict,
    ioOptions: { write: (text) => process.stdout.write(String(text)) },
  });
  program = solver.program;
  const goals = options.goals.map((text) => {
    const goal = engine.parseGoalText(text, {
      doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
      operatorDefinitions: [...program.operators.values()],
      isoStrict: options.isoStrict,
    });
    if (goal.type === 'var') throw new engine.PrologError('instantiation_error');
    if (goal.type !== 'atom' && goal.type !== 'compound') throw new engine.PrologError('type_error(callable)', goal);
    return goal;
  });
  const queriedKeys = new Set(goals.map((goal) => `${goal.name}/${goal.arity}`));
  const writeOptions = {
    doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
    operators: [...program.operators.values()],
    quoted: true,
  };
  const facts = program.sourceFactLines(queriedKeys, writeOptions);
  const lines = new Set();
  const explanation = options.proof ? await loadExplanation() : null;
  try {
    solver.runInitializations();
    for (const goal of goals) {
      solver.solutionsSeen = 0;
      for (const env of solver.solve([goal], new engine.Env(), 0)) {
        if (!engine.termIsGround(goal, env)) continue;

        const currentWriteOptions = {
          doubleQuotes: solver.prologFlags.get('double_quotes')?.value?.name ?? 'chars',
          operators: [...program.operators.values()],
          quoted: true,
        };
        const line = `${engine.formatTermForWrite(goal, env, currentWriteOptions)}.\n`;
        if (facts.has(line) || lines.has(line)) continue;

        lines.add(line);

        process.stdout.write(line);
        if (options.proof) writeExplanation(explanation, program, engine.copyResolved(goal, env), registry);
      }
    }
  } catch (error) {
    if (error?.name !== 'HaltSignal') throw error;
    process.exitCode = error.code;
  } finally {
    if (options.stats) printStats(solver.stats);
  }
}

function writeExplanation(explanation, program, resolved, registry) {
  const proof = explanation.whyProof(program, resolved, { registry });
  process.stdout.write(proof.text);
  if (!proof.ok) process.stdout.write(explanation.whyNoProof(resolved));
}

async function usage(stream) {
  stream.write(`eyeprolog ${await packageVersion()}

Usage:
  eyeprolog
  eyeprolog [options] [file-or-url.pl|- ...]

Interactive:
  With no arguments, start a Prolog REPL. Use eyeprolog -h for help.

Input:
  file-or-url.pl        Read an EyeProlog program from a local file or http(s) URL.
  -                     Read an EyeProlog program from standard input.

Options:
  -h, --help            Show this help text and exit.
  -p, --proof           Enable proof explanations.
  -q, --quads           Run embedded quad tests and fail if any do not hold.
  -s, --stats           Print solver and memory statistics to stderr after execution.
  --iso-strict          Use ISO/IEC 13211-1 core + Corrigenda 1-3 only;
                        reject EyeProlog language extensions and disable automatic tabling.
  --portable            Enforce the EyeProlog/Trealla/Scryer interop profile.
  --no-autoload         Disable conservative interop predicate autoloading.
  -v, --version         Show the package version and exit.
  -w, --warnings        Print non-fatal portability warnings to stderr.
  -g, --goal goal       Solve goal and print its ground answers; may be repeated.
                        If omitted, use %% goal: comments from the inputs.
  --                    Stop option parsing; following arguments are treated as files.
`);
}

function readStdin() {
  return new Promise((resolve, reject) => {
    let data = '';
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', (chunk) => {
      data += chunk;
    });
    process.stdin.on('end', () => resolve(data));
    process.stdin.on('error', reject);
  });
}

function printWarnings(program) {
  for (const warning of program.interopPortabilityWarnings ?? []) {
    if (warning.kind === 'library') {
      process.stderr.write('eyeprolog warning: non-portable library dependency\n');
      process.stderr.write(`  library(${warning.library}) is outside the EyeProlog/Trealla/Scryer interop profile\n`);
    } else if (warning.kind === 'predicate') {
      process.stderr.write('eyeprolog warning: non-portable library predicate\n');
      process.stderr.write(`  ${warning.indicator} from library(${warning.library}) is outside the interop profile\n`);
    }
  }

  const errors = program.negationStratificationErrors;
  if (errors.length === 0) return;

  process.stderr.write('eyeprolog warning: unstratified negation\n');
  for (const edge of errors) {
    process.stderr.write(`  ${edge.from} depends negatively on ${edge.to}\n`);
  }
}

function printStats(stats) {
  process.stderr.write('eyeprolog stats:\n');
  for (const [key, value] of Object.entries({ ...stats, ...memoryStatistics() })) {
    process.stderr.write(`  ${key}: ${value}\n`);
  }
}

async function packageVersion() {
  try {
    const text = await fs.readFile(new URL('../package.json', import.meta.url), 'utf8');
    const pkg = JSON.parse(text);
    if (pkg && typeof pkg.version === 'string' && pkg.version) return pkg.version;
  } catch (_) {
    // Fall through to a stable marker if package metadata is unavailable.
  }

  return 'unknown';
}
