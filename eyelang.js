#!/usr/bin/env node
import { readFileSync } from 'node:fs';
import { run } from './src/language.js';

const args = process.argv.slice(2);
if (args.length === 1 && ['-v', '--version'].includes(args[0])) {
  const { version } = JSON.parse(readFileSync(new URL('./package.json', import.meta.url), 'utf8'));
  console.log(`eyelang ${version}`);
} else if (args.includes('--help') || args.includes('-h')) {
  console.log('eyelang — an experimental symbolic logic programming language\n\nRun a program: node eyelang.js examples/socrates.pl\nRead a program from input: node eyelang.js -\nShow the version: node eyelang.js -v, --version');
} else if (args.length !== 1) {
  console.error('Give me one program to read. Try: node eyelang.js examples/socrates.pl');
  process.exitCode = 1;
} else {
  try {
    const source = readFileSync(args[0] === '-' ? 0 : args[0], 'utf8');
    console.log(run(source, { arc: true }).join('\n\n'));
  } catch (error) {
    console.error(error.code === 'ENOENT' ? `I couldn't find the program "${args[0]}".` : error.message);
    process.exitCode = 1;
  }
}
