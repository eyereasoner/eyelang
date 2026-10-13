import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { runInNewContext } from 'node:vm';
import { run } from '../src/language.js';

const headings = blocks => blocks.map(block => block.split('\n')[0]);

test('ARC output groups answers, reasons, and checks without changing follow-up context', () => {
  const source = `
    milo is a cat. luna is a dog.
    if ?x is a cat then ?x is an animal.
    who is an animal? why?
    check that milo is an animal.
    who is a dog? why? why?
    check that there is 1 dog.
  `;
  const plain = run(source);
  const arc = run(source, { arc: true });
  assert.deepEqual(headings(arc), ['# Answer', '# Reason', '# Check']);
  assert.equal(arc[0], '# Answer\n' + [plain[0], plain[2]].join('\n\n'));
  assert.equal(arc[1], '# Reason\n' + [plain[1], plain[3], plain[4]].join('\n\n'));
  assert.equal(arc[2], '# Check\n' + plain.slice(5).join('\n\n'));
  assert.match(arc[1], /because if milo is a cat/);
});

test('all three ARC headings remain present when questions, explanations, or checks are absent', () => {
  for (const source of ['', 'milo is a cat.', 'milo is a cat. who is a cat?',
    'milo is a cat. why is milo a cat?', 'milo is a cat. check that milo is a cat.', 'why?']) {
    const arc = run(source, { arc: true });
    assert.deepEqual(headings(arc), ['# Answer', '# Reason', '# Check']);
    assert.ok(arc.every(section => section.split('\n').slice(1).join('\n').length));
  }
  const empty = run('', { arc: true });
  assert.match(empty[0], /Add a question/);
  assert.match(empty[1], /No explanation was requested/);
  assert.match(empty[2], /No checks were requested/);
  const onlyWhy = run('why?', { arc: true });
  assert.equal(onlyWhy[1], '# Reason\nAsk a question first, then ask why.');
});

test('ARC keeps direct why, negation, unknown answers, and aggregate explanations in their sections', () => {
  const source = `
    milo is a cat.
    why is milo a cat?
    does milo not need rest? why?
    who is a dog? why?
    how many cats are there? why how many cats are there?
    check that there is 1 cat.
  `;
  const [answer, reason, check] = run(source, { arc: true });
  assert.match(answer, /yes, there is no evidence in this program that milo needs rest/);
  assert.match(answer, /don't know anyone or anything/);
  assert.match(answer, /there is 1 cat/);
  assert.doesNotMatch(answer, /you told me this|because/);
  assert.match(reason, /you told me this/);
  assert.match(reason, /no evidence/);
  assert.match(reason, /don't have an answer to explain/);
  assert.match(reason, /I counted/);
  assert.equal(check, '# Check\ncheck passed: there is 1 cat.');
});

test('ARC output preserves failed-check and syntax diagnostics', () => {
  assert.throws(() => run('milo is a cat. who is a cat?\ncheck that milo is a dog.', { arc: true }),
    /Line 2: Check failed: milo is a dog\./);
  assert.throws(() => run('milo is cat.', { arc: true }), /Line 1:/);
});

test('the playground worker returns the complete ARC transcript and keeps errors separate', () => {
  const source = readFileSync(new URL('../src/playground-worker.js', import.meta.url), 'utf8')
    .replace("import { run } from './language.js';", '');
  const messages = [];
  const self = { postMessage: message => messages.push(message) };
  runInNewContext(source, { run, self, performance });
  const socrates = readFileSync(new URL('../examples/socrates.eye', import.meta.url), 'utf8');
  self.onmessage({ data: { source: socrates } });
  assert.equal(messages[0].output, run(socrates, { arc: true }).join('\n\n'));
  assert.equal(messages[0].error, undefined);
  assert.deepEqual([...messages[0].output.matchAll(/^# (Answer|Reason|Check)$/gm)].map(match => match[1]), ['Answer', 'Reason', 'Check']);
  self.onmessage({ data: { source: 'check that milo is a dog.' } });
  assert.match(messages[1].error, /Line 1: Check failed/);
  assert.equal(messages[1].output, undefined);
});
