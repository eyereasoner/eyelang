import test from 'node:test';
import assert from 'node:assert/strict';
import { infer, parse, run } from '../../src/language.js';
import { assertAnswers } from './helpers.js';

test('text codecs convert atoms and strings in both directions without normalization', () => {
  assertAnswers(run(`
    ?- atom_codes('Aé😀', Codes).
    ?- atom_codes(Atom, [65, 233, 128512]).
    ?- string_codes("Aé😀", Codes).
    ?- string_codes(Text, [65, 233, 128512]).
    ?- atom_codes('', Codes).
    ?- string_codes(Text, []).
    ?- string_codes("é", Codes).
    ?- string_codes(Text, [0, 10, 1114111]), string_codes(Text, Codes).
    ?- atom_codes(Atom, []), string_codes(Text, []).
  `), [
    'Codes = [65, 233, 128512].', "Atom = 'Aé😀'.",
    'Codes = [65, 233, 128512].', 'Text = "Aé😀".',
    'Codes = [].', 'Text = "".', 'Codes = [101, 769].',
    'Text = "\\u0000\\n􏿿", Codes = [0, 10, 1114111].', "Atom = '', Text = \"\".",
  ]);
});

test('text codecs unify output patterns, constrain bound outputs, and preserve text types', () => {
  assertAnswers(run(`
    ?- atom_codes(cat, [First | Rest]).
    ?- string_codes("cat", [99, Middle, 116]).
    ?- atom_codes(cat, [100, 111, 103]).
    ?- string_codes("cat", [99, 97]).
    ?- atom_codes(cat, wrong).
    ?- atom_codes(cat, [99, 97, 116.0]).
    ?- atom_codes(cat, Codes), string_codes(Text, Codes).
  `), ['First = 99, Rest = [97, 116].', 'Middle = 97.', 'false.', 'false.', 'false.', 'false.',
    'Codes = [99, 97, 116], Text = "cat".']);
});

test('text codecs reject unsupported input modes, types, and Unicode values with source lines', () => {
  for (const name of ['atom_codes', 'string_codes']) {
    for (const args of ['Text, Codes', 'Text, [65 | Rest]', 'Text, [Code]', 'Text, missing']) {
      assert.throws(() => run(`\n?- ${name}(${args}).`), /Line 2: .*needs a bound .* or a bound proper list/);
    }
    for (const code of ['65.0', 'a', '"A"', 'f(65)']) {
      assert.throws(() => run(`?- ${name}(Text, [${code}]).`), /needs integer character codes/);
    }
    for (const code of ['-1', '1114112', '55296', '57343', '9999999999999999999999999999999999999999']) {
      assert.throws(() => run(`?- ${name}(Text, [${code}]).`), /needs Unicode scalar values/);
    }
    const badText = name === 'atom_codes' ? "'\\uD800'" : '"\\uDFFF"';
    assert.throws(() => run(`?- ${name}(${badText}, Codes).`), /needs Unicode scalar values/);
    for (const value of ['42', '42.0', '[]', 'f(a)', name === 'atom_codes' ? '"a"' : 'a']) {
      assert.throws(() => run(`?- ${name}(${value}, Codes).`), /needs (an atom|a string) as its first argument/);
    }
  }
});

test('long Unicode text conversion does not depend on the JavaScript argument limit', () => {
  const text = '😀é'.repeat(70000);
  assertAnswers(run(`?- string_codes(${JSON.stringify(text)}, _Codes), string_codes(_Text, _Codes), _Text = ${JSON.stringify(text)}.`), ['true.']);
});

test('term parts round-trip scalars and compounds without evaluating arithmetic', () => {
  assertAnswers(run(`
    ?- point(2, f(a)) =.. Parts.
    ?- Term =.. [point, 2, f(a)].
    ?- (2 + 3) =.. Parts.
    ?- Term =.. ['+', 2, 3].
    ?- 42 =.. Parts.
    ?- 42.0 =.. Parts.
    ?- "hello" =.. Parts.
    ?- a =.. Parts.
    ?- Term =.. ["hello"].
    ?- Term =.. [42.0].
    ?- Term =.. [a].
    ?- f(a) =.. [g, a].
  `), ['Parts = [point, 2, f(a)].', 'Term = point(2, f(a)).', "Parts = ['+', 2, 3].",
    'Term = (2 + 3).', 'Parts = [42].', 'Parts = [42.0].', 'Parts = ["hello"].',
    'Parts = [a].', 'Term = "hello".', 'Term = 42.0.', 'Term = a.', 'false.']);
});

test('term parts expose proper and open list cells consistently with quoted dot syntax', () => {
  assertAnswers(run(`
    ?- [a,b] =.. Parts.
    ?- [] =.. Parts.
    ?- Term =.. [[]].
    ?- Term =.. ['.', a, [b]].
    ?- [a | Tail] =.. ['.', a, [b]], Tail = [b].
    ?- Term =.. ['.', a, Tail], Tail = [b,c].
    ?- '.'(a, '.'(b, [])) = [a,b].
    ?- '.'(a, Tail) = [a,b].
    ?- '.' =.. Parts.
    ?- '[]' =.. Parts.
  `), ["Parts = ['.', a, [b]].", 'Parts = [[]].', 'Term = [].', 'Term = [a, b].',
    'Tail = [b].', 'Term = [a, b, c], Tail = [b, c].', 'true.', 'Tail = [b].',
    "Parts = ['.'].", "Parts = ['[]']."]);
});

test('term parts allow partial arguments and aliasing while retaining the occurs check', () => {
  assertAnswers(run(`
    ?- Term =.. [pair, X, X], Term = pair(a, a).
    ?- pair(X, X) =.. [pair, a, a].
    ?- pair(X, X) =.. [pair, a, b].
    ?- Term =.. [f, Term].
    ?- Term =.. ['.', a, Term].
    ?- f(a) =.. [Name | Args].
  `), ['Term = pair(a, a), X = a.', 'X = a.', 'false.', 'false.', 'false.', 'Name = f, Args = [a].']);
});

test('term construction rejects invalid parts and improper lists', () => {
  for (const parts of ['Parts', '[]', '[f | Rest]', 'f(a)']) {
    assert.throws(() => run(`?- Term =.. ${parts}.`), /needs a nonvariable term or a nonempty proper list/);
  }
  for (const parts of ['[Name]', '[f(a)]', '[[a]]']) {
    assert.throws(() => run(`?- Term =.. ${parts}.`), /needs an atomic value or \[\]/);
  }
  for (const name of ['Name', '1', '1.0', '"f"', '[]', 'f(a)']) {
    assert.throws(() => run(`?- Term =.. [${name}, a].`), /needs a bound atom as the functor/);
  }
  assert.throws(() => run("?- Term =.. ['.', a, b]."), /part after \| must be a list or a variable/);
  assert.throws(() => run("?- Term = '.'(a, b)."), /Line 1: The part after \|/);
});

test('conversions bind forward and tabled clause outputs and contribute numbered evidence', () => {
  const source = `
    input(cat).
    decoded(Text) :- input(Atom), atom_codes(Atom, Codes), string_codes(Text, Codes).
    shape(Name, Args) :- input(Atom), Term =.. [record, Atom], Term =.. [Name | Args].
    :- table wrap/2.
    wrap(Value, Term) :- Term =.. [wrapped, Value].
    ?- decoded(Text). ?- why.
    ?- shape(Name, Args).
    ?- wrap(42, Term).
    :- assertion(decoded("cat")).
    :- assertion(shape(record, [cat])).
    :- assertion(wrap(42, wrapped(42))).
  `;
  const output = run(source);
  assert.equal(output[0], 'Text = "cat".');
  assert.match(output[1], /rule \d+: decoded\(Text\)/);
  assert.match(output[1], /step \d+: atom_codes\(cat, \[99, 97, 116\]\)/);
  assert.match(output[1], /step \d+: string_codes\("cat", \[99, 97, 116\]\)/);
  assert.equal(output[2], 'Name = record, Args = [cat].');
  assert.equal(output[3], 'Term = wrapped(42).');
  assert.equal(output.filter(block => block.startsWith('check passed:')).length, 3);
  const rules = parse(source).rules.filter(rule => rule.conclusion.relation.startsWith('predicate:'));
  assert.equal(rules.find(rule => rule.conclusion.relation === 'predicate:decoded/1').backward, false);
  assert.ok(infer(parse(source), { validateChecks: true }).length);
  assert.match(run('?- Term =.. [point, 1, 2]. ?- why.')[1], /step \d+: point\(1, 2\) =\.\. \[point, 1, 2\]/);
});

test('negated conversions require bound operands and never introduce bindings', () => {
  assertAnswers(run(String.raw`
    ?- \+ atom_codes(cat, [100]).
    ?- \+ string_codes("cat", [99,97,116]).
    ?- \+ (f(a) =.. [g,a]).
    ?- \+ (f(a) =.. [f,a]).
  `), ['true.', 'false.', 'true.', 'false.']);
  for (const goal of ['atom_codes(cat, Codes)', 'string_codes(Text, [65])', 'Term =.. [f,a]', 'f(X) =.. [f,a]']) {
    assert.throws(() => run(`?- \\+ (${goal}).`), /Negated .* needs bound operands/);
  }
});

test('new builtin indicators cannot be redefined', () => {
  for (const head of ['atom_codes(a, [97])', 'string_codes("a", [97])', "'=..'(f(a), [f,a])"]) {
    assert.throws(() => parse(`${head}.`), /A fact must name an ordinary predicate/);
    assert.throws(() => parse(`${head} :- true.`), /A rule head must name an ordinary predicate/);
  }
});
