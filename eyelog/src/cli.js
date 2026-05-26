import fs from 'node:fs/promises';
import process from 'node:process';
import { Env, copyResolved, termIsGround, termToString } from './term.js';
import { Program } from './program.js';
import { Solver } from './solver.js';
import { parseQueryGoal } from './parser.js';

const VERSION = '0.1.0';

export async function main(argv) {
  const options = { files: [], query: null, explain: false, stats: false, version: false };
  for (let i = 0; i < argv.length; i++) {
    const arg = argv[i];
    if (arg === '--version') options.version = true;
    else if (arg === '--explain') options.explain = true;
    else if (arg === '--stats') options.stats = true;
    else if (arg === '--query') {
      if (i + 1 >= argv.length) throw new Error('--query requires an argument');
      options.query = argv[++i];
    } else if (arg === '-h' || arg === '--help') {
      usage(process.stdout);
      return;
    } else {
      options.files.push(arg);
    }
  }
  if (options.version) {
    process.stdout.write(`eyelog ${VERSION}\n`);
    return;
  }
  if (options.files.length === 0) options.files.push('-');
  const sourceParts = [];
  let usedStdin = false;
  for (const file of options.files) {
    if (file === '-') {
      if (usedStdin) throw new Error("stdin input '-' can only be used once");
      usedStdin = true;
      sourceParts.push(await readStdin());
    } else if (/^https?:\/\//.test(file)) {
      const response = await fetch(file);
      if (!response.ok) throw new Error(`could not fetch URL: ${file}`);
      sourceParts.push(await response.text());
    } else {
      sourceParts.push(await fs.readFile(file, 'utf8'));
    }
  }
  const program = Program.parse(sourceParts.join('\n'));
  if (options.query != null) runQuery(program, options.query, options);
  else runDefault(program, options);
}

function runQuery(program, query, options) {
  const goal = parseQueryGoal(query);
  const solver = new Solver(program);
  for (const env of solver.solve([goal], new Env(), 0)) {
    process.stdout.write(`${termToString(goal, env, true)}.\n`);
    if (options.explain) process.stdout.write('% why\n% explanation output is not implemented yet\n');
  }
  if (options.stats) printStats(solver.stats);
}

function runDefault(program, options) {
  const facts = program.sourceFactLines();
  const lines = new Set();
  let lastStats = null;
  for (const goal of program.materializationGoals()) {
    const solver = new Solver(program);
    for (const env of solver.solve([goal], new Env(), 0)) {
      const resolved = copyResolved(goal, env);
      if (!termIsGround(resolved)) continue;
      const line = `${termToString(resolved, new Env(), true)}.\n`;
      if (!facts.has(line)) lines.add(line);
    }
    lastStats = solver.stats;
  }
  for (const line of [...lines].sort()) process.stdout.write(line);
  if (options.stats && lastStats) printStats(lastStats);
}

function usage(stream) {
  stream.write('usage: eyelog [--version] [--explain] [--stats] [--query GOAL] [file-or-url.pl|- ...]\n');
}

function readStdin() {
  return new Promise((resolve, reject) => {
    let data = '';
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', (chunk) => { data += chunk; });
    process.stdin.on('end', () => resolve(data));
    process.stdin.on('error', reject);
  });
}

function printStats(stats) {
  process.stderr.write('eyelog stats:\n');
  for (const [key, value] of Object.entries(stats)) process.stderr.write(`  ${key}: ${value}\n`);
}
