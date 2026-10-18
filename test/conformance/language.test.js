import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { parse, run } from '../../src/language.js';
import { assertAnswers } from './helpers.js';

test('§5: every builtin listed in the specification rejects source redefinitions', () => {
  const spec = readFileSync(new URL('../../SPEC.md', import.meta.url), 'utf8');
  const table = spec.split('### 5.1. Builtin predicates and special forms')[1]
    .split('For the two text conversions')[0];
  const indicators = table.split('\n').filter(line => line.startsWith('| `'))
    .flatMap(line => [...line.split('|')[1].matchAll(/`([^`]+\/[0-9]+)`/g)].map(match => match[1]));
  const count = Number(/\*\*([0-9]+) builtin predicates\*\*/.exec(spec)[1]);
  assert.equal(new Set(indicators).size, count);
  for (const indicator of indicators) {
    const slash = indicator.lastIndexOf('/');
    const name = indicator.slice(0, slash).replaceAll('\\', '\\\\').replaceAll("'", "''");
    const arity = Number(indicator.slice(slash + 1));
    const head = `'${name}'${arity ? '(' + Array(arity).fill('a').join(', ') + ')' : ''}`;
    assert.throws(() => parse(`${head}.`), /A fact must name an ordinary predicate/, indicator);
    assert.throws(() => parse(`${head} :- true.`), /A rule head must name an ordinary predicate/, indicator);
  }
});

test('§2: queries and checks use the complete program while query blocks retain source order', () => {
  assertAnswers(run(`
    ?- mortal(Who).
    :- assertion(mortal(socrates)).
    ?- human(Who).
    mortal(Person) :- human(Person).
    human(socrates).
  `), ['Who = socrates.', 'Who = socrates.', 'check passed: mortal(socrates).']);
});

for (const separator of [' ', '\n', '% comment\n', '/* comment */']) {
  test(`§2: statement periods accept ${JSON.stringify(separator)} as a separator`, () => {
    assertAnswers(run(`ready.${separator}?- ready.`), ['true.']);
  });
}

test('§3: predicate names are case-sensitive atoms identified by name and arity', () => {
  assertAnswers(run(`
    ready. ready(a). 'Ready'(b). point(origin, 0, 0).
    ?- ready. ?- ready(X). ?- 'Ready'(X). ?- ready(a, b).
    ?- point(origin, X, Y). ?- point(origin).
    ?- 'ready'(a). ?- 'Élodie' = 'Élodie'.
  `), ['true.', 'X = a.', 'X = b.', 'false.', 'X = 0, Y = 0.', 'false.', 'true.', 'true.']);
});

test('§3: variables are local to each clause, query, and assertion', () => {
  assertAnswers(run(`
    left(a). right(b).
    selected(X) :- left(X).
    selected(X) :- right(X).
    ?- left(X). ?- right(X).
    :- assertion(left(X)). :- assertion(right(X)).
    ?- selected(a), selected(b).
  `), ['X = a.', 'X = b.', 'true.', 'check passed: left(X).', 'check passed: right(X).']);
});

test('§3 and §7: each underscore is fresh, named underscores share, and projection removes duplicate answers', () => {
  assertAnswers(run(`
    pair(a, b). pair(a, c). pair(b, b). pair(b, b).
    ?- pair(a, _). ?- pair(a, _Same), pair(b, _Same).
    ?- pair(_, _). ?- pair(_Same, _Same).
    ?- pair(a, _Same), _Same = a.
    ?- pair(Who, _Hidden).
  `), ['true.', 'true.', 'true.', 'true.', 'false.', 'Who = a.\nWho = b.']);
});

test('§3: quoted atoms, strings, doubled quotes, and comment markers retain their term types', () => {
  assertAnswers(run(String.raw`
    label('it''s', "a""b % /* literal */").
    ?- label('it\'s', Text).
    ?- 'name' = name. ?- "name" = name. ?- '7' = 7. ?- "7" = 7.
  `), ['Text = "a\\"b % /* literal */".', 'true.', 'false.', 'false.', 'false.']);
});

test('§3: supported escapes decode in both strings and atoms', () => {
  const text = '\n\r\t\b\f\\\'"é😀';
  assertAnswers(run(String.raw`?- Text = "\n\r\t\b\f\\\'\"\u00e9\U0001f600".`),
    [`Text = ${JSON.stringify(text)}.`]);
  assertAnswers(run(String.raw`?- '\u00e9\U0001f600' = 'é😀'.`), ['true.']);
});

test('§3 and §10: multiline quotes and comments preserve diagnostic source lines', () => {
  for (const prefix of ['% first\n', '/* first\nsecond */\n', 'label("first\nsecond").\n']) {
    const line = prefix.split('\n').length;
    assert.throws(() => run(`${prefix}broken(X) :- .`), new RegExp(`^Error: Line ${line}:`));
  }
});

test('§3 and §4: arithmetic arguments are compound terms until evaluated with is/2', () => {
  assertAnswers(run(`
    expression(2+3).
    ?- expression(2+3). ?- expression(5).
    ?- expression(Left+Right), Value is Left+Right.
    ?- Value is 2+3, expression(Value).
  `), ['true.', 'false.', 'Left = 2, Right = 3, Value = 5.', 'false.']);
});

test('§4 and §7: grouped conjunctions share bindings and require arithmetic inputs from the left', () => {
  assertAnswers(run('?- (X = 3, (Y is X+2, Y > X)), Z is Y*2.'), ['X = 3, Y = 5, Z = 10.']);
  assert.throws(() => run('?- Y is X+2, X = 3.'), /Arithmetic input .* is unbound/);
  assert.throws(() => run('?- 5 is X+2.'), /Arithmetic input .* is unbound/);
});

test('§4: unit clauses and computed clauses reject unresolved output variables', () => {
  assertAnswers(run('same(X, X). ?- same(a, Value). ?- same(a, b).'), ['Value = a.', 'false.']);
  assert.throws(() => run('same(X, X). ?- same(X, Y).'), /answer must be ground/);
  assert.throws(() => run('open(X) :- true. ?- open(X).'), /answer must be ground/);
});

test('§7: ground success and missing evidence return booleans without asserting negative facts', () => {
  assertAnswers(run(String.raw`
    known(a).
    ?- known(a). ?- known(b). ?- missing(X).
    ?- \+ known(b). ?- known(b).
  `), ['true.', 'false.', 'false.', 'true.', 'false.']);
});

for (const [requirement, source] of [
  ['§2: periods are mandatory', 'ready'],
  ['§2: periods require a separator', 'ready.?- ready.'],
  ['§3: compounds require an argument', 'empty().'],
  ['§3: improper list literals are excluded', 'p([a|b]).'],
  ['§3: quoted atoms must close', "p('unfinished)."],
  ['§3: block comments must close', '/* unfinished'],
  ['§3: escapes must be supported', String.raw`p("\q").`],
  ['§3: Unicode escapes must be valid', String.raw`p("\U00110000").`],
  ['§12: disjunction is excluded', 'p(a); p(b).'],
  ['§12: cut is excluded', 'p(a) :- !.'],
  ['§12: if-then-else is excluded', 'p(a) :- q(a) -> r(a).'],
  ['§12: DCGs are excluded', 'p --> q.'],
  ['§12: modules are excluded', ':- module(example, []).'],
  ['§12: imports are excluded', ':- use_module(library(lists)).'],
  ['§12: custom operators are excluded', ':- op(500, xfx, likes).'],
  ['§12: initialization is excluded', ':- initialization(main).'],
]) {
  test(requirement, () => assert.throws(() => run(source), /^Error: Line \d+:/));
}
