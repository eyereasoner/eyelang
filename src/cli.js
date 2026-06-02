// Command-line interface for eyelog.
// It loads programs from files, URLs, or stdin, then either materializes derived output or evaluates an explicit query.
import fs from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';
import { Env, copyResolved, termIsGround, termToString } from './term.js';
import { Program } from './program.js';
import { Solver } from './solver.js';
import { parseQueryGoal } from './parser.js';
import { whyNoProof, whyProof } from './explain.js';

const VERSION = await packageVersion();

export async function main(argv) {
  if (argv.length === 0) {
    usage(process.stdout);
    return;
  }

  const options = {
    files: [],
    query: null,
    stats: false,
    version: false,
  };

  let endOptions = false;

  for (let i = 0; i < argv.length; i++) {
    const arg = argv[i];

    if (!endOptions && arg === '--') {
      endOptions = true;
    } else if (!endOptions && (arg === '--version' || arg === '-v')) {
      options.version = true;
    } else if (!endOptions && (arg === '--help' || arg === '-h')) {
      usage(process.stdout);
      return;
    } else if (!endOptions && arg === '--stats') {
      options.stats = true;
    } else if (!endOptions && arg === '--query') {
      if (i + 1 >= argv.length) throw new Error('--query requires an argument');
      options.query = argv[++i];
    } else if (!endOptions && arg.startsWith('-') && arg !== '-') {
      throw new Error(`unknown option: ${arg}`);
    } else {
      options.files.push(arg);
    }
  }

  if (options.version) {
    process.stdout.write(`eyelog ${VERSION}\n`);
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
      sourceParts.push({ text: await fs.readFile(file, 'utf8'), filename: path.basename(file) || file });
    }
  }

  const program = Program.parseSources(sourceParts);

  if (options.query != null) runQuery(program, options.query, options);
  else runDefault(program, options);
}

function runQuery(program, query, options) {
  const goal = parseQueryGoal(query);
  const solver = new Solver(program);

  for (const env of solver.solve([goal], new Env(), 0)) {
    process.stdout.write(`${termToString(goal, env, true)}.\n`);

    const resolved = copyResolved(goal, env);
    const proof = whyProof(program, resolved);
    process.stdout.write(proof.text);
    if (!proof.ok) {
      process.stdout.write(whyNoProof(resolved));
    }
  }

  if (options.stats) printStats(solver.stats);
}

function runDefault(program, options) {
  const goals = program.materializationGoals();
  const materializedKeys = new Set(goals.map((goal) => `${goal.name}/${goal.arity}`));
  const facts = program.sourceFactLines(materializedKeys);
  const lines = new Set();
  let lastStats = null;

  for (const goal of goals) {
    const solver = new Solver(program);

    for (const env of solver.solve([goal], new Env(), 0)) {
      if (!termIsGround(goal, env)) continue;

      const line = `${termToString(goal, env, true)}.\n`;
      if (facts.has(line) || lines.has(line)) continue;

      lines.add(line);

      const resolved = copyResolved(goal, env);
      process.stdout.write(line);
      const proof = whyProof(program, resolved);
      process.stdout.write(proof.text);
      if (!proof.ok) {
        process.stdout.write(whyNoProof(resolved));
      }
    }

    lastStats = solver.stats;
  }

  if (options.stats && lastStats) printStats(lastStats);
}

function usage(stream) {
  stream.write(`eyelog ${VERSION}

Usage:
  eyelog [options] [file-or-url.pl|- ...]

Input:
  file-or-url.pl        Read an eyelog program from a local file or http(s) URL.
  -                     Read an eyelog program from standard input.

Options:
  -h, --help            Show this help text and exit.
  -v, --version         Show the package version and exit.
      --query GOAL      Run GOAL as a query instead of materializing output predicates.
      --stats           Print solver statistics to stderr after execution.
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

function printStats(stats) {
  process.stderr.write('eyelog stats:\n');
  for (const [key, value] of Object.entries(stats)) {
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
