#!/usr/bin/env node
import fs from 'node:fs';
import { run, check, formatResult, formatCheck, LimitError } from '../index.js';

function main(args) {
  let json = false, proof = false, checkOnly = false, query = '';
  const files = [], options = {};
  const limits = { '--max-steps': 'maxSteps', '--max-tables': 'maxTables', '--max-answers': 'maxAnswers' };
  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === '--help' || arg === '-h') {
      console.log('Usage: node bin/eyelit.js [--check] [--json] [--proof] [--query BODY] [--max-steps N] [--max-tables N] [--max-answers N] FILE...\nUse - to read standard input. Programs contain facts, rules, and ask statements.');
      return;
    }
    if (arg === '--json') json = true;
    else if (arg === '--proof') proof = true;
    else if (arg === '--check') checkOnly = true;
    else if (arg === '--query') {
      if (!args[i + 1]) throw new Error('--query requires a body');
      query = args[++i];
    } else if (limits[arg]) {
      if (!args[i + 1]) throw new Error(`${arg} requires a value`);
      options[limits[arg]] = Number(args[++i]);
    } else if (arg.startsWith('-') && arg !== '-') throw new Error(`Unknown option ${arg}`);
    else files.push(arg);
  }
  if (!files.length) throw new Error('Provide a source file or - for standard input; use --help for usage');
  let source = files.map(file => fs.readFileSync(file === '-' ? 0 : file, 'utf8')).join('\n');
  if (query) source += `\nask ${query.replace(/\.\s*$/, '')}.\n`;
  if (checkOnly) {
    const result = check(source);
    process.stdout.write(json ? `${JSON.stringify(result, null, 2)}\n` : formatCheck(result));
    return;
  }
  const result = run(source, options);
  if (json) {
    // Integers use tagged decimal strings in JSON, retaining exact values.
    console.log(JSON.stringify(result, (_, value) => typeof value === 'bigint' ? value.toString() : value, 2));
  } else {
    process.stdout.write(formatResult(result, { proof }));
  }
}

try { main(process.argv.slice(2)); }
catch (error) {
  console.error(`eyelit: ${error.message}`);
  process.exitCode = error instanceof LimitError ? 2 : 1;
}
