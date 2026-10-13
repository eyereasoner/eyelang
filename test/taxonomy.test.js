import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { infer, parse, run } from '../src/language.js';

function example(depth) {
  return readFileSync(new URL(`../examples/deep-taxonomy-${depth}.eye`, import.meta.url), 'utf8');
}

for (const depth of [10, 100, 1000, 10000, 100000]) {
  test(`taxonomy depth ${depth} derives every classification with its actual supporting step`, () => {
    const program = parse(example(depth));
    const facts = infer(program);
    assert.equal(facts.length, 3 * depth + 2);
    assert.ok(facts.every(({ goal }) => goal.relation === 'is a' && goal.terms[0] === 'ind'));
    const classes = new Map(facts.map(record => [record.goal.terms[1], record]));
    assert.equal(classes.size, facts.length);
    assert.equal(classes.get('n0').rule, null);
    assert.equal(classes.get('a2').premises[0], classes.get(`n${depth}`));
    for (let level = 1; level <= depth; level++) {
      for (const branch of ['n', 'i', 'j']) {
        const record = classes.get(`${branch}${level}`);
        assert.ok(record?.rule, `missing derived classification ${branch}${level}`);
        assert.equal(record.premises.length, 1);
        assert.equal(record.premises[0], classes.get(`n${level - 1}`));
      }
    }
    assert.deepEqual(program.questions, [{
      goal: { relation: 'is a', terms: [{ variable: 'who' }, 'a2'] }, why: false,
    }, { why: true, previous: true }]);
    assert.equal(program.checks.length, 5);
  });
}

test('the short taxonomy example answers its question and explains the whole chain', () => {
  const [answer, why] = run(example(10));
  assert.equal(answer, 'ind is an a2.');
  assert.match(why, /^ind is an a2\./);
  for (let level = 0; level <= 10; level++) {
    assert.match(why, new RegExp(`ind is a n${level}\\.`));
  }
  assert.match(why, /you told me this\./);
  assert.doesNotMatch(why, /ind is (?:a|an) [ij]\d/);
});

test('a missing middle link prevents the terminal classification and later side labels', () => {
  const source = example(10).replace('if ?entity is a n4 then ?entity is a n5.', '');
  assert.throws(() => run(source), /Check failed: ind is an a2/);
  const unchecked = source.replace(/^check that .+\.$/gm, '');
  assert.deepEqual(run(unchecked + '\nis ind a n5? is ind an i5? is ind a j6?'), [
    "I don't know anyone or anything that fits that question yet.",
    "I don't have an answer to explain yet.",
    "I don't know whether ind is a n5.",
    'yes, ind is an i5.',
    "I don't know whether ind is a j6.",
  ]);
});
