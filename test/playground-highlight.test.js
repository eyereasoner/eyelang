import test from 'node:test';
import assert from 'node:assert/strict';
import { highlight } from '../src/playground-highlight.js';

function plain(html) {
  return html.replace(/<\/?span(?: class="syntax-[a-z]+")?>/g, '')
    .replace(/&(amp|lt|gt);/g, (_, name) => ({ amp: '&', lt: '<', gt: '>' })[name]);
}

test('Prolog coloring distinguishes terms, numbers, comments, and operators without changing text', () => {
  const source = '% a comment\nhuman(socrates).\nmortal(Person) :- human(Person).\n?- X is -1.25e+3, X >= 2.\n?- point(1, 2) =.. Parts.\n';
  const html = highlight(source);
  assert.equal(plain(html), source);
  for (const [kind, text] of [
    ['comment', '% a comment'], ['predicate', 'human'], ['atom', 'socrates'],
    ['variable', 'Person'], ['operator', ':-'], ['operator', '?-'],
    ['operator', 'is'], ['operator', '=..'], ['number', '1.25e+3'],
  ]) assert.ok(html.includes('<span class="syntax-' + kind + '">' + text + '</span>'));
});

test('quoted atoms, doubled quotes, escapes, Unicode, and multiline comments keep their lexical context', () => {
  const source = "label('it''s % not a comment', \"a\\\"b /* text */\", 'Élodie').\n/* block\n comment */\n";
  const html = highlight(source);
  assert.equal(plain(html), source);
  assert.ok(html.includes('<span class="syntax-atom">\'it\'\'s % not a comment\'</span>'));
  assert.ok(html.includes('<span class="syntax-string">"a\\"b /* text */"</span>'));
  assert.ok(html.includes('<span class="syntax-comment">/* block\n comment */</span>'));
});

test('incomplete edits and exact large integers remain intact', () => {
  for (const source of ["p('unfinished", 'p("unfinished\\', '/* unfinished\n', '?- Value is 900719925474099312345678901234567890.']) {
    assert.equal(plain(highlight(source)), source);
  }
  assert.ok(highlight('900719925474099312345678901234567890').includes(
    '<span class="syntax-number">900719925474099312345678901234567890</span>'));
});

test('program and output HTML is escaped, including markup inside strings and comments', () => {
  const source = 'text("<img src=x onerror=alert(1)> &lt;").\n% </pre><script>alert(1)</script>';
  for (const arc of [false, true]) {
    const html = highlight(source, { arc });
    assert.equal(plain(html), source);
    assert.doesNotMatch(html, /<img|<script|<\/pre>/);
  }
});

test('visible ranges preserve comment and quoted-term context across their boundaries', () => {
  for (const source of [
    'p(a).\n/* first\nsecond\nthird */\np(b).',
    "p('first\nsecond\nthird').",
    'p("first\nsecond\nthird").',
    '% first second third\np(a).',
  ]) {
    const start = source.indexOf('second');
    const end = start + 6;
    const html = highlight(source, { start, end });
    assert.equal(plain(html), 'second');
    assert.match(html, /^<span class="syntax-(comment|atom|string)">second<\/span>$/);
  }
});

test('large programs can color a small tail window without rendering their prefix', () => {
  const source = '% header\n' + 'p(X) :- q(X).\n'.repeat(100000) + '/* tail comment */';
  const start = source.length - 12;
  const html = highlight(source, { start, end: source.length });
  assert.equal(plain(html), source.slice(start));
  assert.ok(html.length < 100);
  assert.match(html, /syntax-comment/);
});

test('ARC coloring distinguishes headings, certificates, reports, and assertion labels', () => {
  const source = "% Reason\ncertificate(eyelang, 1).\n% step 1\nstep(mortal(socrates), rule(2), ['='('Person', socrates)], [human(socrates)]).\n% Check\ncheck passed: mortal(socrates).\nverdict(checked).";
  const html = highlight(source, { arc: true });
  assert.equal(plain(html), source);
  assert.ok(html.includes('<span class="syntax-section">% Reason</span>'));
  assert.ok(html.includes('<span class="syntax-comment">% step 1</span>'));
  assert.ok(html.includes('<span class="syntax-predicate">step</span>'));
  assert.ok(html.includes('<span class="syntax-label">check passed:</span>'));
  assert.ok(html.includes('<span class="syntax-predicate">verdict</span>'));
  assert.ok(html.includes('<span class="syntax-atom">checked</span>'));
});
