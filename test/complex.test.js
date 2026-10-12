import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { run } from '../language.js';

const source = readFileSync(new URL('../examples/complex.eye', import.meta.url), 'utf8');

function parts(answers) {
  return new Map(answers.slice(0, 12).map(answer => {
    const match = /^the (real|imaginary) of (\S+) is (.+)\.$/.exec(answer);
    assert.ok(match, answer);
    return [`${match[2]}:${match[1]}`, Number(match[3])];
  }));
}

function close(actual, expected) {
  assert.ok(Number.isFinite(actual) && Math.abs(actual - expected) <= 1e-14,
    `expected ${expected}, received ${actual}`);
}

test('complex powers and inverse functions compute all six pairs of components', () => {
  const values = parts(run(source));
  assert.equal(values.size, 12);
  for (const [name, real, imaginary] of [
    ['sqrt-minus-one', 0, 1], ['e-to-i-pi', -1, 0],
    ['i-to-i', 0.20787957635076193, 0],
    ['e-to-minus-half-pi', 0.20787957635177984, 0],
    ['asin-result', 1.5707963267948966, 2.3363408269090766],
    ['acos-result', 0, -2.3363408269090766],
  ]) {
    close(values.get(`${name}:real`), real);
    close(values.get(`${name}:imaginary`), imaginary);
  }
});

test('complex rules recompute powers and inverse functions when inputs change', () => {
  const changed = source
    .replace('the real of minus-one is -1.', 'the real of minus-one is -4.')
    .replace('the imaginary of i-pi is 3.141592653589793.', 'the imaginary of i-pi is 1.5707963267948966.')
    .replace('the real of input is 5.22.', 'the real of input is 1.');
  assert.throws(() => run(changed), /Check failed: e-to-i-pi is a checked-identity/);
  const values = parts(run(changed.replace(/^check that .+\.$/gm, '')));
  close(values.get('sqrt-minus-one:real'), 0);
  close(values.get('sqrt-minus-one:imaginary'), 2);
  close(values.get('e-to-i-pi:real'), 0);
  close(values.get('e-to-i-pi:imaginary'), 1);
  close(values.get('asin-result:real'), Math.PI / 2);
  close(values.get('asin-result:imaginary'), 0);
  close(values.get('acos-result:real'), 0);
  close(values.get('acos-result:imaginary'), 0);
});

test('the same inverse rules calculate real inputs inside and outside the unit interval', () => {
  for (const value of [-5.22, -2, -1, -0.5, 0, 0.5, 1, 2, 5.22, 20]) {
    const values = parts(run(source.replace('the real of input is 5.22.', `the real of input is ${value}.`)));
    const inside = Math.abs(value) <= 1;
    close(values.get('asin-result:real'), inside ? Math.asin(value) : Math.sign(value) * Math.PI / 2);
    close(values.get('asin-result:imaginary'), inside ? 0 : Math.acosh(Math.abs(value)));
    close(values.get('acos-result:real'), inside ? Math.acos(value) : value < 0 ? Math.PI : 0);
    close(values.get('acos-result:imaginary'), inside ? 0 : -Math.acosh(Math.abs(value)));
  }
});

test('why traces a complex result through arithmetic back to its supplied components', () => {
  const answers = run(source.replace(/^check that .+\.$/gm, '') + '\nwhat is the real of i-to-i? why?');
  const explanation = answers.at(-1);
  assert.match(explanation, /exponential of -1.5707963267948966 makes 0.20787957635076193\./);
  assert.match(explanation, /angle of 0 with 1 makes 1.5707963267948966\./);
  assert.match(explanation, /the real of i is 0\./);
  assert.match(explanation, /the imaginary of i is 1\./);
  assert.match(explanation, /you told me this\./);
  assert.doesNotMatch(explanation, /the real of input|the base of sqrt-minus-one/);
});
