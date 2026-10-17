import { spawnSync } from 'node:child_process';
import { readFileSync } from 'node:fs';
import { performance } from 'node:perf_hooks';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { infer, parse, render } from '../src/language.js';

export const workloads = ['observability-log-correlation', 'data-quality-audit',
  'critical-path-schedule', 'weighted-interval-scheduling', 'path-discovery', 'mixed'];

export function mixedSource(size) {
  if (!Number.isSafeInteger(size) || size < 1) throw new Error('Mixed workload size must be a positive safe integer.');
  const facts = [];
  let count = 0;
  let total = 0n;
  for (let index = 0; index < size; index++) {
    const value = index % 1000;
    const user = index % 32;
    facts.push(`input(r${index}, amount(u${user}, "${value}")).`);
    if (value >= 500 && user % 8 !== 0) { count++; total += BigInt(value); }
  }
  return `
    :- table decimal/3.
    suspended(u0). suspended(u8). suspended(u16). suspended(u24).
    ${Array.from({ length: 32 }, (_, index) => `review_limit(u${index}, 500).`).join('\n')}
    ${facts.join('\n')}
    decimal([], Accumulator, Accumulator).
    decimal([Code | Rest], Accumulator, Value) :-
      Code >= 48, Code =< 57, Next is Accumulator * 10 + Code - 48,
      decimal(Rest, Next, Value).
    parsed(Row, User, Value) :-
      input(Row, Term), Term =.. [amount, User, Text],
      string_codes(Text, Codes), decimal(Codes, 0, Value).
    needs_review(Row, User, Value) :-
      parsed(Row, User, Value), review_limit(User, Limit), Value >= Limit, \\+ suspended(User).
    recommendation(Row, Decision) :-
      needs_review(Row, User, Value), Decision =.. [review, User, Value].
    summary(count, Count) :- aggregate_all(count, needs_review(Row, User, Value), Count).
    summary(sum, Total) :- aggregate_all(sum(Value), needs_review(Row, User, Value), Total).
    ?- recommendation(Row, Decision).
    ?- why.
    ?- summary(Kind, Value).
    :- assertion(summary(count, ${count})).
    :- assertion(summary(sum, ${total})).
  `;
}

function measure(name, size) {
  const source = name === 'mixed' ? mixedSource(size)
    : readFileSync(new URL(`../examples/${name}.pl`, import.meta.url), 'utf8');
  const start = performance.now();
  const program = parse(source);
  const parsed = performance.now();
  const records = infer(program, { validateChecks: true });
  const inferred = performance.now();
  const inferencePeak = process.resourceUsage().maxRSS / 1024;
  const output = render(program, records, { arc: true }).join('\n\n') + '\n';
  const rendered = performance.now();
  return {
    parse_ms: parsed - start,
    infer_ms: inferred - parsed,
    render_ms: rendered - inferred,
    inference_peak_mib: inferencePeak,
    peak_mib: process.resourceUsage().maxRSS / 1024,
    output_bytes: Buffer.byteLength(output),
  };
}

const usage = 'Usage: npm run benchmark -- [--case NAME] [--runs N] [--size N] [--json]';
function main(args) {
  if (args[0] === '--worker') {
    if (!workloads.includes(args[1])) throw new Error('Unknown benchmark workload: ' + args[1]);
    console.log(JSON.stringify(measure(args[1], Number(args[2]))));
    return;
  }
  const options = { runs: 3, size: 1000, case: null, json: false };
  for (let index = 0; index < args.length; index++) {
    const flag = args[index];
    if (flag === '--help') {
      console.log(usage + '\nWorkloads: ' + workloads.join(', '));
      return;
    }
    if (flag === '--json') { options.json = true; continue; }
    if (!['--case', '--runs', '--size'].includes(flag)) throw new Error('Unknown option: ' + flag);
    const value = args[++index];
    if (flag === '--case') {
      if (!workloads.includes(value)) throw new Error('Unknown benchmark workload: ' + value);
      options.case = value;
    } else {
      const number = Number(value);
      if (!Number.isSafeInteger(number) || number < 1) throw new Error(flag + ' needs a positive safe integer.');
      options[flag.slice(2)] = number;
    }
  }
  const selected = options.case ? [options.case] : workloads;
  const median = values => {
    const sorted = values.sort((a, b) => a - b);
    const middle = Math.floor(sorted.length / 2);
    return sorted.length % 2 ? sorted[middle] : (sorted[middle - 1] + sorted[middle]) / 2;
  };
  const results = selected.map(name => {
    const samples = [];
    for (let index = 0; index < options.runs; index++) {
      const child = spawnSync(process.execPath, [fileURLToPath(import.meta.url), '--worker', name, String(options.size)], { encoding: 'utf8' });
      if (child.error) throw child.error;
      if (child.status !== 0) throw new Error(`${name}: ${child.stderr.trim() || 'worker ended with signal ' + child.signal}`);
      samples.push(JSON.parse(child.stdout));
    }
    return {
      name,
      parse_ms: median(samples.map(sample => sample.parse_ms)),
      infer_ms: median(samples.map(sample => sample.infer_ms)),
      render_ms: median(samples.map(sample => sample.render_ms)),
      inference_peak_mib: Math.max(...samples.map(sample => sample.inference_peak_mib)),
      peak_mib: Math.max(...samples.map(sample => sample.peak_mib)),
      output_bytes: samples[0].output_bytes,
    };
  });
  const report = { node: process.version, platform: process.platform, runs: options.runs, mixed_size: options.size, results };
  if (options.json) { console.log(JSON.stringify(report, null, 2)); return; }
  console.log(`${report.node} on ${report.platform}; ${report.runs} isolated runs per workload; mixed input rows: ${report.mixed_size}.`);
  console.table(results.map(result => ({
    Workload: result.name,
    'Parse ms': result.parse_ms.toFixed(2),
    'Infer ms': result.infer_ms.toFixed(2),
    'Render ms': result.render_ms.toFixed(2),
    'Infer peak MiB': result.inference_peak_mib.toFixed(1),
    'Full peak MiB': result.peak_mib.toFixed(1),
    'ARC KiB': (result.output_bytes / 1024).toFixed(1),
  })));
  console.log('Times are medians. Memory columns are cumulative process RSS high-water marks, taking the maximum across runs.');
}

if (process.argv[1] && pathToFileURL(process.argv[1]).href === import.meta.url) {
  try { main(process.argv.slice(2)); }
  catch (error) { console.error(error.message + '\n' + usage); process.exitCode = 1; }
}
