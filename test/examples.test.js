import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync, readdirSync } from 'node:fs';
import { infer, parse, run } from '../src/language.js';

const examples = new URL('../examples/', import.meta.url);
for (const file of readdirSync(examples).filter(file => file.endsWith('.pl') && !file.startsWith('deep-'))) {
  test(`bundled Prolog example: ${file}`, () => {
    const source = readFileSync(new URL(file, examples), 'utf8');
    const result = run(source, {arc:true});
    assert.match(result[0], /^% Answer\n/);
    assert.match(result[1], /^% Reason\n/);
    assert.match(result[2], /^% Check\ncheck passed:/);
    assert.doesNotMatch(result[1], /No explanation was requested/);
    assert.doesNotMatch(result[2], /No checks were requested/);
  });
}

test('Delfour answers identify the question for each substitution and ground result', () => {
  const source = readFileSync(new URL('delfour.pl', examples), 'utf8');
  const [answer] = run(source, { arc: true });
  assert.ok(answer.includes('?- \'case-name\'(delfour, What).\nWhat = "delfour".'));
  assert.ok(answer.includes('?- outcome(delfour, What).\nWhat = "Allowed".'));
  assert.ok(answer.includes("?- is_a(delfour, 'low-sugar-case').\ntrue."));
  assert.match(answer, /\?- is_a\(Who, 'passed-check'\)\.\nWho = \[delfour,/);
  assert.ok(answer.endsWith("?- is_a(delfour, 'checked-case').\ntrue."));
});

for (const depth of [10,100,1000,10000,100000]) {
  test(`taxonomy ${depth}: all classifications retain their supporting steps`, () => {
    const source = readFileSync(new URL(`deep-taxonomy-${depth}.pl`, examples), 'utf8');
    const facts = infer(parse(source)).filter(record=>record.goal.relation === 'predicate:is_a/2');
    assert.equal(facts.length, 3*depth+2);
    const classes = new Map(facts.map(record => [record.goal.terms[1].atom,record]));
    assert.equal(classes.get('n0').rule, null);
    assert.equal(classes.get('a2').premises[0], classes.get(`n${depth}`));
    for (let level=1; level<=depth; level++) {
      for (const branch of ['n','i','j']) {
        const record = classes.get(`${branch}${level}`);
        assert.equal(record.premises.length, 1);
        assert.equal(record.premises[0], classes.get(`n${level-1}`));
      }
    }
  });
}

test('Fibonacci 10000 retains every digit and verifies Cassini independently', () => {
  const source = readFileSync(new URL('fibonacci.pl', examples), 'utf8');
  const result = run(source);
  let previous=0n; let current=1n;
  for(let index=0;index<10000;index++) [previous,current]=[current,previous+current];
  assert.ok(result.includes(`What = ${previous}.`));
  assert.equal(previous.toString().length, 2090);
  assert.ok(result.some(line=>line.startsWith('check passed: cassini(10000, -1)')));
});
