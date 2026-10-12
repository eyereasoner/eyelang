import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { infer, parse, run } from '../src/language.js';

const rule = `
  if third is a step
  and the fibonacci of third minus 1 is fourth
  and the fibonacci of third minus 2 is fifth
  then the fibonacci of third is fourth plus fifth.
`;
function fibonacci(steps, seeds = 'the fibonacci of 0 is 0. the fibonacci of 1 is 1.') {
  // Keep a separator between numeric sentences now that 1.2 is a decimal.
  return seeds + '\n' + steps.map(n => `${n} is a step.`).join('\n') + rule;
}

test('the example computes Fibonacci from the seeds and explains its arithmetic', () => {
  const answers = run(readFileSync(new URL('../examples/fibonacci.eye', import.meta.url), 'utf8'));
  assert.deepEqual(answers.slice(0, 11), [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55].map(
    (value, index) => `the fibonacci of ${index} is ${value}.`,
  ));
  assert.match(answers[11], /5 minus 1 makes 4\./);
  assert.match(answers[11], /5 minus 2 makes 3\./);
  assert.match(answers[11], /3 plus 2 makes 5\./);
  assert.match(answers[11], /the fibonacci of 0 is 0\.\n\s+you told me this\./);
  assert.equal(answers.length, 19);
  assert.equal(answers[12], `the fibonacci of 10000 is ${referenceFibonacci(10000)}.`);
  assert.match(answers[13], /^Here is why/);
  assert.equal(answers[18], 'check passed: the cassini of 10000 is -1.');
});

test('the same rule works with different seeds and reverse step order', () => {
  const source = fibonacci([6, 5, 4, 3, 2], 'the fibonacci of 0 is 2. the fibonacci of 1 is 1.');
  assert.deepEqual(run(source + 'what is the fibonacci of 6?'), ['the fibonacci of 6 is 18.']);
});

test('a missing earlier step yields unknown, and steps beyond the program are not invented', () => {
  const source = fibonacci([2, 4, 5]);
  assert.deepEqual(run(source + 'what is the fibonacci of 5?'), [
    "I don't know anyone or anything that fits that question yet.",
  ]);
  const complete = fibonacci([2, 3, 4, 5]);
  assert.equal(infer(parse(complete)).filter(r => r.goal.relation === 'property:fibonacci').length, 6);
});

test('whole-number arithmetic stays exact beyond JavaScript safe integers', () => {
  const source = fibonacci(Array.from({ length: 99 }, (_, i) => i + 2));
  assert.deepEqual(run(source + 'what is the fibonacci of 100?'), [
    'the fibonacci of 100 is 354224848179261915075.',
  ]);
});

test('properties and arithmetic work independently of Fibonacci', () => {
  assert.deepEqual(run(`
    the color of milo is orange.
    10 is a step.
    if third is a step then the total of third is third plus 2 minus 3.
    what is the color of milo?
    what is the total of 5 plus 5?
    is the total of 10 equal to 9?
    is the total of 10 equal to 8?
  `), [
    'the color of milo is orange.', 'the total of 10 is 9.',
    'yes, the total of 10 is 9.', "I don't know whether the total of 10 is 8.",
  ]);
});

test('negative integers and leading zeros have one exact numeric meaning', () => {
  assert.deepEqual(run(`
    000 is a step.
    if third is a step then the total of third is third minus 2.
    what is the total of -0?
    is the total of 0 equal to -2?
  `), ['the total of 0 is -2.', 'yes, the total of 0 is -2.']);
});

test('arithmetic requires numbers bound by earlier clues', () => {
  assert.throws(() => parse(`
    if the fibonacci of third minus 1 is fourth then the fibonacci of third is fourth.
  `), /Find third in an earlier clue/);
  assert.throws(() => parse('what is the total of what plus 1?'), /Use known numbers/);
  assert.throws(() => run(`
    milo is a step.
    if third is a step then the total of third is third plus 1.
  `), /I can only use numbers/);
  assert.throws(() => parse('the total of 0 is 1 plus 2.'), /Put calculations in a rule or question/);
});

// An independent algorithm: doubling identities, rather than the program's
// step-by-step addition. Compare every digit, not just the size of the result.
function referenceFibonacci(index) {
  let a = 0n;
  let b = 1n;
  for (const bit of index.toString(2)) {
    const even = a * (2n * b - a);
    const odd = a * a + b * b;
    [a, b] = bit === '0' ? [even, odd] : [odd, even + odd];
  }
  return a.toString();
}

test('the command prints Fibonacci 10000 and explains all its steps exactly once', () => {
  const cli = new URL('../eyelang.js', import.meta.url);
  const program = new URL('../examples/fibonacci.eye', import.meta.url);
  const source = readFileSync(program, 'utf8');
  const input = parse(source).questions.at(-1)?.previous ? source : `${source}\nwhy?`;
  const result = spawnSync(process.execPath, [cli.pathname, '-'], {
    input, encoding: 'utf8', timeout: 20000, maxBuffer: 128 * 1024 * 1024,
  });
  assert.ifError(result.error);
  assert.equal(result.status, 0, result.stderr);
  const expected = referenceFibonacci(10000);
  assert.equal(expected.length, 2090);
  assert.deepEqual([...result.stdout.matchAll(/^# (Answer|Reason|Check)$/gm)].map(match => match[1]), ['Answer', 'Reason', 'Check']);
  const [answerSection, reasonSection, checkSection] = result.stdout.split(/\n\n# (?:Reason|Check)\n/);
  const answers = answerSection.replace(/^# Answer\n/, '').split('\n\n');
  assert.equal(answers.length, 12);
  assert.equal(answers[11], `the fibonacci of 10000 is ${expected}.`);
  const explanation = reasonSection.split('\n\n')[1];
  assert.match(explanation, /^Here is why\. Each step is shown once\./);
  const records = [...explanation.matchAll(/^step (\d+): the fibonacci of (\d+) is (\d+)\.$/gm)];
  assert.equal(records.length, 10001);
  const values = new Map(records.map(record => [Number(record[2]), record[3]]));
  assert.equal(values.size, 10001);
  let a = 0n;
  let b = 1n;
  for (let index = 0; index <= 10000; index++) {
    assert.equal(values.get(index), a.toString(), `wrong explanation at Fibonacci ${index}`);
    [a, b] = [b, a + b];
  }
  const steps = [...explanation.matchAll(/^step (\d+):/gm)].map(record => record[1]);
  assert.equal(steps.length, 20000);
  assert.equal(new Set(steps).size, 20000);
  assert.match(explanation, /That explains step 20000\.$/);
  assert.equal(checkSection.split('\n\n').length, 5);
  assert.match(checkSection, /check passed: the cassini of 10000 is -1\.\n$/);
  assert.equal(result.stderr, '');
});

test('large changed-seed programs still use the supplied rule', () => {
  const source = `
    the fibonacci of 0 is 2. the fibonacci of 1 is 1.
    every number from 2 to 1000 is a step.
    ${rule}
    what is the fibonacci of 1000?
  `;
  const lucas = (BigInt(referenceFibonacci(999)) + BigInt(referenceFibonacci(1001))).toString();
  assert.deepEqual(run(source), [`the fibonacci of 1000 is ${lucas}.`]);
});

test('number ranges are inclusive, canonical and validate their endpoints and kind', () => {
  assert.deepEqual(run('every number from -01 to 01 is a step. who is a step?'), [
    '-1 is a step.\n0 is a step.\n1 is a step.',
  ]);
  assert.deepEqual(run('every number from 2 to 2 is a step. who is a step?'), ['2 is a step.']);
  assert.throws(() => parse('every number from 10 to 2 is a step.'), /smaller number/);
  assert.throws(() => parse('every number from 1 to 2 is a second.'), /inside an if/);
});
