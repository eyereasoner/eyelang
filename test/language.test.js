import test from 'node:test';
import assert from 'node:assert/strict';
import { infer, parse, run, say } from '../src/language.js';

test('facts and clauses use Prolog syntax, arbitrary arities, and case-sensitive atoms', () => {
  assert.deepEqual(run(`
    human(socrates). mortal(Person) :- human(Person).
    ready. point(origin, 0, 0). point(origin).
    label('Ada', "Ada"). label(ada, 'Ada').
    ?- mortal(Who). ?- ready. ?- point(origin, X, Y).
    ?- point(origin). ?- point(origin, X). ?- label(ada, "Ada").
  `), ['Who = socrates.', 'true.', 'X = 0, Y = 0.', 'true.', 'false.', 'false.']);
});

test('false is a builtin while fail is an ordinary user-defined predicate', () => {
  assert.deepEqual(run(String.raw`?- false. ?- \+ false. ?- fail.`), ['false.', 'true.', 'false.']);
  const output = run('fail :- true. ?- fail. ?- why. :- assertion(fail).');
  assert.equal(output[0], 'true.');
  assert.match(output[1], /rule 1: fail :- true\./);
  assert.equal(output[2], 'check passed: fail.');
  assert.throws(() => parse('false.'), /A fact must name an ordinary predicate/);
  assert.throws(() => parse('false :- true.'), /A rule head must name an ordinary predicate/);
  assert.throws(() => run(':- assertion(false).'), /Line 1: Check failed: false\./);
});

test('comments, quotes, escapes, decimal dots, and multiline clauses preserve source lines', () => {
  assert.deepEqual(run(`
    % comment with a period . and ?-
    /* block .\n comment */
    label('café', "a.b % /* ?- ").
    label('it''s', 'can''t').
    value(-1.25e-7).
    copy(X) :-\n label('café', X).
    ?- copy(Text). ?- value(N). ?- label('it''s', X).
  `), ['Text = "a.b % /* ?- ".', 'N = -1.25e-7.', "X = 'can''t'."]);
  assert.throws(() => parse('% first\n/* second\n third */\np(a) :- .'), /^Error: Line 4:/);
  assert.throws(() => parse('% first\np(1e309).'), /^Error: Line 2:.*finite/);
  assert.deepEqual(run(String.raw`?- X = "\u00e9\n\t".`), ['X = "é\\n\\t".']);
});

test('parser lookahead spans grouped goals while preserving later clauses and diagnostics', () => {
  const source = `
    value(2).
    ?- ((value(X), (X+1) =:= 3)), (2+3)*4 =:= 20.
    ?- aggregate_all(count, ((value(X), X > 0)), N).
    ?- why.
    ?- why.
    value(3).
    :- assertion((value(2), value(3))).
  `;
  const result = run(source);
  assert.equal(result[0], 'X = 2.');
  assert.equal(result[1], 'N = 2.');
  assert.equal(result[2], result[3]);
  assert.equal(result[4], 'check passed: value(2), value(3).');
  assert.throws(() => parse(`${source}\nbroken(\n`), /^Error: Line 11:/);
});

test('rule text remains readable, enumerable, and writable when formatted on demand', () => {
  const program = parse('copy(X) :- source(X). source(a). ?- copy(X).');
  const rule = program.rules[0];
  assert.ok(Object.keys(rule).includes('text'));
  assert.equal(rule.text, 'copy(X) :- source(X).');
  assert.equal(rule.text, 'copy(X) :- source(X).');
  rule.text = 'custom rule text';
  assert.equal(rule.text, 'custom rule text');
  const other = parse('p(X) :- q(X).').rules[0];
  other.text = 'replacement before formatting';
  assert.equal(other.text, 'replacement before formatting');
});

test('variables share one clause or query scope, and anonymous variables are fresh', () => {
  assert.deepEqual(run(`
    pair(a, a). pair(a, b). pair(b, b).
    same(X) :- pair(X, X).
    other(X) :- pair(a, X).
    ?- same(X). ?- other(X). ?- pair(_, _).
    ?- pair(_Left, _Right). ?- pair(_Same, _Same).
    ?- X = Y, Y = a. ?- missing(_, _).
  `), ['X = a.\nX = b.', 'X = a.\nX = b.', 'true.', 'true.', 'true.', 'X = a, Y = a.', 'false.']);
});

test('unit clauses with variables accept bound inputs and require ground answers', () => {
  assert.deepEqual(run('same(X, X). ?- same(a, Y). ?- same(a, b).'), ['Y = a.', 'false.']);
  assert.throws(() => run('same(X, X). ?- same(X, Y).'), /answer must be ground/);
});

test('queries see later clauses, while table declarations apply to the complete predicate', () => {
  const program = parse('?- mortal(X). mortal(X) :- human(X). human(socrates). :- table mortal/1.');
  assert.ok(program.rules.find(rule => rule.conclusion.relation === 'predicate:mortal/1').backward);
  assert.deepEqual(run('?- mortal(X). mortal(X) :- human(X). human(socrates). :- table mortal/1.'), ['X = socrates.']);
  assert.equal(say(infer(parse("p('red-fox', point(1, 2), [a,b])."))[0].goal), "p('red-fox', point(1, 2), [a, b])");
});

test('arithmetic in ordinary arguments remains a compound term', () => {
  assert.deepEqual(run('stored(1+2). ?- stored(X). ?- stored(3). ?- X is 1+2, stored(X).'), ['X = (1 + 2).', 'false.', 'false.']);
});

for (const source of [
  'milo is a cat.', 'if ?x is a cat then ?x is an animal.',
  'who is a cat?', 'why?', 'check that milo is a cat.', '# old comment\np(a).',
  ':- table', ':- table p/', 'p(a)', 'p(a) :- .', 'p().', 'p(a); p(b).', 'p(a) :- !.',
  ':- use_module(library(lists)).', ':- initialization(main).',
  ':- op(500, xfx, likes).', 'p([a|b]).', "p('unfinished).", '/* unfinished',
  'p(1.2.3).', 'p(a) :- call(q(a)). -> q(a).',
]) {
  test(`unsupported or unfinished syntax reports a line: ${source.slice(0, 55)}`, () => {
    assert.throws(() => parse(source), /^Error: Line \d+:/);
  });
}

test('quoted user predicates cannot collide with generated query or aggregate predicates', () => {
  assert.deepEqual(run("'$query1'(intruder). p(a). ?- p(X)."), ['X = a.']);
  assert.deepEqual(run("'$aggregate1'(intruder). p(a). ?- aggregate_all(count,p(X),N)."), ['N = 1.']);
  assert.deepEqual(run('?- is(X,2+3).'), ['X = 5.']);
  assert.throws(() => parse('p(a).q(b).'), /period must be followed/);
});
