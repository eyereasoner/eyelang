#!/usr/bin/env node
import fs from 'node:fs';
import { run, check, formatResult, formatCheck, nquadsToEyelang, rdfAnswersToNQuads, LimitError } from '../index.js';

function main(args) {
  let json = false, proof = false, checkOnly = false, rdfOutput = false, query = '';
  const files = [], rdfInputs = [], options = {};
  const limits = { '--max-steps': 'maxSteps', '--max-tables': 'maxTables', '--max-answers': 'maxAnswers' };
  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === '--help' || arg === '-h') {
      console.log('Usage: node bin/eyelang.js [--check] [--json] [--proof] [--rdf-input FILE] [--rdf-output] [--query BODY] [--max-steps N] [--max-tables N] [--max-answers N] FILE...\nUse - to read standard input. --rdf-input imports RDF 1.2 N-Quads as rdf/4; --rdf-output exports the resulting rdf/4 relation.');
      return;
    }
    if (arg === '--json') json = true;
    else if (arg === '--proof') proof = true;
    else if (arg === '--check') checkOnly = true;
    else if (arg === '--rdf-output') rdfOutput = true;
    else if (arg === '--rdf-input') {
      if (!args[i + 1]) throw new Error('--rdf-input requires a file');
      rdfInputs.push(args[++i]);
    }
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
  if (rdfOutput && (json || proof || checkOnly || query)) throw new Error('--rdf-output cannot be combined with --check, --json, --proof, or --query');
  if ([...rdfInputs, ...files].filter(file => file === '-').length > 1) throw new Error('Standard input can be read only once');
  const imported = rdfInputs.map((file, index) => nquadsToEyelang(
    fs.readFileSync(file === '-' ? 0 : file, 'utf8'), { blankNodePrefix: `d${index}_` },
  )).join('\n');
  let source = `${imported}${imported ? '\n' : ''}${files.map(file => fs.readFileSync(file === '-' ? 0 : file, 'utf8')).join('\n')}`;
  if (query) source += `\nask ${query.replace(/\.\s*$/, '')}.\n`;
  if (rdfOutput) source += '\nask rdf(?subject, ?predicate, ?object, ?graph).\n';
  if (checkOnly) {
    const result = check(source);
    process.stdout.write(json ? `${JSON.stringify(result, null, 2)}\n` : formatCheck(result));
    return;
  }
  const result = run(source, options);
  if (rdfOutput) {
    process.stdout.write(rdfAnswersToNQuads(result.queries.at(-1)));
  } else if (json) {
    // Integers use tagged decimal strings in JSON, retaining exact values.
    console.log(JSON.stringify(result, (_, value) => typeof value === 'bigint' ? value.toString() : value, 2));
  } else {
    process.stdout.write(formatResult(result, { proof }));
  }
}

try { main(process.argv.slice(2)); }
catch (error) {
  console.error(`eyelang: ${error.message}`);
  process.exitCode = error instanceof LimitError ? 2 : 1;
}
