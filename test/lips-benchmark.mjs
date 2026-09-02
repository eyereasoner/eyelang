import fs from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';
import { performance } from 'node:perf_hooks';
import { fileURLToPath } from 'node:url';
import { Program, parseGoalText, run } from '../index.js';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');

function integer(value, name, minimum) {
  const n = Number(value);
  if (!Number.isInteger(n) || n < minimum) throw new Error(`${name} must be an integer >= ${minimum}`);
  return n;
}

const options = { count: 50, runs: 5, warmup: 2, json: false };
for (let i = 2; i < process.argv.length; i++) {
  const arg = process.argv[i];
  if (arg === '--count') options.count = integer(process.argv[++i], '--count', 1);
  else if (arg === '--runs') options.runs = integer(process.argv[++i], '--runs', 1);
  else if (arg === '--warmup') options.warmup = integer(process.argv[++i], '--warmup', 0);
  else if (arg === '--json') options.json = true;
  else if (arg === '-h' || arg === '--help') {
    process.stdout.write('Usage: node test/lips-benchmark.mjs [--count N] [--runs N] [--warmup N] [--json]\n');
    process.exit(0);
  } else throw new Error(`unknown option: ${arg}`);
}

const source = await fs.readFile(path.join(root, 'examples', 'bench.pl'), 'utf8');
const program = Program.parse(source);
const dobench = parseGoalText(`dobench(${options.count})`);
const dodummy = parseGoalText(`dodummy(${options.count})`);

function execute(goal) {
  const cpuStart = process.cpuUsage();
  const wallStart = performance.now();
  const result = run(program, { goals: [goal] });
  const wallMs = performance.now() - wallStart;
  const cpu = process.cpuUsage(cpuStart);
  if (result.haltCode != null) throw new Error(`benchmark halted with code ${result.haltCode}`);
  if (!result.stdout) throw new Error('benchmark goal produced no success answer');
  return { cpuMs: (cpu.user + cpu.system) / 1000, wallMs };
}

for (let i = 0; i < options.warmup; i++) {
  execute(dodummy);
  execute(dobench);
}

const samples = [];
for (let i = 0; i < options.runs; i++) {
  const dummy = execute(dodummy);
  const bench = execute(dobench);
  const netCpuMs = bench.cpuMs - dummy.cpuMs;
  const netWallMs = bench.wallMs - dummy.wallMs;
  if (netCpuMs <= 0) throw new Error(`non-positive control-subtracted CPU time (${netCpuMs.toFixed(3)} ms); increase --count`);
  samples.push({
    dummyCpuMs: dummy.cpuMs,
    benchCpuMs: bench.cpuMs,
    netCpuMs,
    netWallMs,
    lips: 496 * options.count * 1000 / netCpuMs,
    wallLips: netWallMs > 0 ? 496 * options.count * 1000 / netWallMs : null,
  });
}

function median(values) {
  const sorted = [...values].sort((a, b) => a - b);
  const middle = Math.floor(sorted.length / 2);
  return sorted.length % 2 ? sorted[middle] : (sorted[middle - 1] + sorted[middle]) / 2;
}

const result = {
  methodology: 'Quintus 1984 naive reverse; dobench minus dodummy; 496 calls/reversal',
  count: options.count,
  runs: options.runs,
  warmup: options.warmup,
  lips: median(samples.map((sample) => sample.lips)),
  wallLips: median(samples.map((sample) => sample.wallLips).filter(Number.isFinite)),
  netCpuMs: median(samples.map((sample) => sample.netCpuMs)),
  samples,
};

if (options.json) {
  process.stdout.write(`${JSON.stringify(result, null, 2)}\n`);
} else {
  process.stdout.write(`EyeProlog classic nrev: ${Math.round(result.lips).toLocaleString('en-US')} LIPS\n`);
  process.stdout.write(`  ${options.count} reversals/run, ${options.runs} measured runs, ${options.warmup} warmups\n`);
  process.stdout.write(`  median control-subtracted CPU: ${result.netCpuMs.toFixed(1)} ms\n`);
  if (Number.isFinite(result.wallLips)) {
    process.stdout.write(`  wall-clock cross-check: ${Math.round(result.wallLips).toLocaleString('en-US')} LIPS\n`);
  }
}
