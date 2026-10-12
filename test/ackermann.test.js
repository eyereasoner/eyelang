import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { infer, parse, run } from '../src/language.js';

const file = new URL('../examples/ackermann.eye', import.meta.url);
const source = readFileSync(file, 'utf8');
const rules = source.slice(0, source.indexOf('# Answer'));
const ask = inputs => `what is the ackermann of [${inputs.join(', ')}]?`;
const answer = (inputs, value) => `the ackermann of [${inputs.join(', ')}] is ${value}.`;

const samples = [
  [[0, 0], 1n], [[0, 6], 7n], [[1, 2], 4n], [[1, 7], 9n],
  [[2, 2], 7n], [[2, 9], 21n], [[3, 4], 125n],
  [[3, 1000], (1n << 1003n) - 3n],
  [[4, 0], 13n], [[4, 1], 65533n],
  [[4, 2], (1n << 65536n) - 3n], [[5, 0], 65533n],
];

// The defining Ackermann recurrence, independent of the hyperoperation rules.
function reference(m, n) {
  if (m === 0) return n + 1;
  if (n === 0) return reference(m - 1, 1);
  return reference(m - 1, reference(m, n - 1));
}

test('the Ackermann example computes all twelve calls exactly and passes every ARC check', () => {
  const output = run(source);
  const answers = output.filter(block => /^the ackermann of \[[\d, ]+\] is \d+\.$/.test(block));
  assert.deepEqual(answers, samples.map(([inputs, value]) => answer(inputs, value)));
  assert.equal(output.filter(block => block.startsWith('check passed:')).length, 12);
  assert.equal(samples[7][1].toString().length, 302);
  assert.equal(samples[10][1].toString().length, 19729);
});

test('backward hyperoperations agree with the standard Ackermann recurrence on a grid of inputs', () => {
  const inputs = [];
  for (let m = 0; m <= 3; m++) {
    for (let n = 0; n <= 6; n++) inputs.push([m, n]);
  }
  assert.deepEqual(run(rules + inputs.map(ask).join('\n')),
    inputs.map(([m, n]) => answer([m, n], reference(m, n))));
});

test('the three-input helper computes sums, products, powers, and higher operations for other bases', () => {
  const cases = [
    [[0, 7, 4], 8n], [[1, 7, 4], 11n], [[2, 7, 4], 28n],
    [[3, 5, 3], 243n], [[4, 0, 3], 1n], [[4, 1, 3], 3n],
    [[4, 2, 3], 27n], [[4, 3, 3], 7625597484987n],
    [[5, 0, 2], 1n], [[5, 1, 2], 2n], [[5, 2, 2], 4n], [[6, 2, 2], 4n],
  ];
  assert.deepEqual(run(rules + cases.map(([inputs]) => ask(inputs)).join('\n')),
    cases.map(([inputs, value]) => answer(inputs, value)));
});

test('unused Ackermann definitions do no work and repeated calls reuse the same fact', () => {
  assert.equal(infer(parse(rules)).length, 0);
  const program = rules + '\n' + ask([1, 2]) + '\n' + ask([1, 2]);
  assert.deepEqual(run(program), [answer([1, 2], 4), answer([1, 2], 4)]);
  const facts = infer(parse(program));
  assert.equal(facts.length, 2);
  assert.equal(facts.filter(({ goal }) => JSON.stringify(goal.terms[0]) === JSON.stringify({ list: ['1', '2'] })).length, 1);
});

test('negative inputs have no answer and unrestricted enumeration requires known inputs', () => {
  for (const inputs of [[-1, 0], [0, -1], [3, -1, 2], [4, 1, -1]]) {
    assert.deepEqual(run(rules + ask(inputs)), ["I don't know anyone or anything that fits that question yet."]);
  }
  assert.throws(() => run(rules + 'what is the ackermann of who?'), /Give first a value/);
});

test('explanations retain the exact large power and the recursive higher-operation steps', () => {
  const output = run(source);
  const large = output[11];
  assert.ok(large.includes(`2 to the power of 65536 makes ${1n << 65536n}.`));
  assert.ok(large.includes(`minus 3 makes ${samples[10][1]}.`));
  assert.match(large, /the ackermann of \[4, 4, 2\] is 65536\./);
  assert.match(large, /because the ackermann of \[first, second, third\] is fifth/);
  const higher = output[13];
  assert.match(higher, /the ackermann of \[5, 3, 2\] is 65536\./);
  assert.match(higher, /65536 minus 3 makes 65533\./);
  assert.match(higher, /^Here is why\. Each step is shown once\./);
  const steps = [...higher.matchAll(/^step (\d+):/gm)].map(match => match[1]);
  assert.equal(new Set(steps).size, steps.length);
});

test('ARC checks detect an incorrect exponentiation rule', () => {
  const broken = source.replace('second to the power of first', 'first to the power of second');
  assert.throws(() => run(broken), /Check failed: the ackermann of \[3, 4\] is 125/);
});

test('the CLI prints the full exact large answer, explanations, and successful checks', () => {
  const result = spawnSync(process.execPath, [new URL('../eyelang.js', import.meta.url).pathname, file.pathname], {
    encoding: 'utf8', timeout: 10000, maxBuffer: 4 * 1024 * 1024,
  });
  assert.ifError(result.error);
  assert.equal(result.status, 0, result.stderr);
  assert.equal(result.stderr, '');
  assert.ok(result.stdout.includes(answer([4, 2], samples[10][1])));
  assert.equal([...result.stdout.matchAll(/^check passed:/gm)].length, 12);
  assert.match(result.stdout, /That explains step \d+\./);
});
