#!/usr/bin/env node
import { readFileSync } from 'node:fs';
import { run } from './language.js';

const args = process.argv.slice(2);
if (args.includes('--help') || args.includes('-h')) {
  console.log('eyelang — a simple symbolic logic programming language\n\nRun a program: node eyelang.js examples/socrates.eye\nRead a program from input: node eyelang.js -');
} else if (args.length !== 1) {
  console.error('Give me one program to read. Try: node eyelang.js examples/socrates.eye');
  process.exitCode = 1;
} else {
  try {
    const source = readFileSync(args[0] === '-' ? 0 : args[0], 'utf8');
    const answers = run(source);
    if (!answers.length) console.log('I have read your program. Add a question ending with ?');
    else console.log(answers.join('\n\n'));
  } catch (error) {
    console.error(error.code === 'ENOENT' ? `I couldn't find the program "${args[0]}".` : error.message);
    process.exitCode = 1;
  }
}
