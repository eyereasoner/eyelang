# Eyelog Handbook

This handbook explains how to run and develop Eyelog. For the normative language definition, including lexical syntax, terms, clauses, goals, built-ins, `memoize/2`, `materialize/2`, and conformance boundaries, read [SPEC.md](SPEC.md).

## Contents

1. [Running Eyelog](#1-running-eyelog)
2. [Default output](#2-default-output)
3. [Writing programs](#3-writing-programs)
4. [Formula data](#4-formula-data)
5. [Example catalog](#5-example-catalog)
6. [Golden outputs and tests](#6-golden-outputs-and-tests)
7. [Development and release](#7-development-and-release)
8. [Performance notes](#8-performance-notes)
9. [Implementation limits](#9-implementation-limits)

## 1. Running Eyelog

Build the native CLI:

```sh
make cli
```

Run a program and let Eyelog print derived binary facts:

```sh
bin/eyelog examples/ancestor.pl
```

Run an explicit query:

```sh
bin/eyelog --query 'ancestor(pat, X)' examples/ancestor.pl
```

Explain default output or query answers:

```sh
bin/eyelog --explain examples/socrates.pl
bin/eyelog --query 'type(socrates, mortal)' --explain examples/socrates.pl
```

Compose multiple files, stdin, and URLs:

```sh
bin/eyelog facts.pl rules.pl
printf 'works(stdin, true) :- eq(ok, ok).\n' | bin/eyelog -
bin/eyelog https://example.test/program.pl
```

`--query GOAL` parses a single goal. Parenthesized conjunctions are accepted:

```sh
bin/eyelog --query '(ancestor(pat, X), ancestor(X, emma))' examples/ancestor.pl
```

## 2. Default output

Eyelog programs write relation predicates directly:

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
```

Without `--query`, Eyelog asks for new ground binary consequences of the shape `p(S, O)`, suppresses duplicates, excludes source facts, sorts the result, and prints Prolog facts:

```prolog
ancestor(jan, emma).
ancestor(pat, emma).
ancestor(pat, jan).
```

This default is intentionally output-oriented. It is not a complete bottom-up saturation engine. Built-ins and proof search remain goal-directed; use `--query` when you want a specific relation, arity, or non-binary answer.

### Focusing default output

Large examples often have internal helper predicates. Add `materialize(Name, Arity).` declarations to restrict no-query output to selected predicates:

```prolog
materialize(answer, 2).

seed(case1).
helper(Case, score(95)) :- seed(Case).
answer(Case, accepted) :- helper(Case, score(95)).
```

The default output is then:

```prolog
answer(case1, accepted).
```

`materialize/2` is a declaration, not a logical rule to prove. It does not affect explicit `--query` answers.

## 3. Writing programs

A good Eyelog program normally has three layers:

1. source facts;
2. helper predicates for calculation or search;
3. concise relation-style outputs, usually binary predicates such as `status(Case, Value)`, `reason(Case, Text)`, `ancestor(Person, Ancestor)`, or `cost(Path, Amount)`.

Example:

```prolog
score(case1, 95).
threshold(90).

accepted(Case) :-
  score(Case, Score),
  threshold(Threshold),
  ge(Score, Threshold).

status(Case, accepted) :- accepted(Case).
reason(Case, "score exceeds threshold") :- accepted(Case).
```

When `status/2` and `reason/2` are derived, they appear in default output. If the program has many helper binary predicates, declare the intended output predicates:

```prolog
materialize(status, 2).
materialize(reason, 2).
```

### Naming

Predicate names and atom constants use the same lexical form. Namespace-like names should be plain names such as `type`, `person_name`, or `odrl_permission`; colon names are not part of the language.

### Queries remain general

The default output focuses on materialized binary facts, but the query engine supports arbitrary goals and arities:

```sh
bin/eyelog --query 'append(A, B, [a, b])' examples/list-collection.pl
bin/eyelog --query 'ackermann(4, 2, A)' examples/ackermann.pl
bin/eyelog --query 'once(sudoku("1....7.9..3..2...8..96..5....53..9...1..8...26....4...3......1..4......7..7...3..", S))' examples/sudoku.pl
```

## 4. Formula data

Comma terms can be data as well as conjunctions. Eyelog provides relation-oriented formula utilities.

`formula_atom(Formula, Atom)` enumerates atomic formula terms inside a comma formula:

```prolog
formula_atom((name(alice, "Alice"), knows(alice, bob)), X).
```

`formula_binary(Formula, S, P, O)` enumerates binary terms and exposes their functor as an atom constant:

```prolog
formula_binary((name(alice, "Alice"), knows(alice, bob)), S, P, O).
```

This can yield `S = alice`, `P = name`, `O = "Alice"` and `S = alice`, `P = knows`, `O = bob`. The utility is useful for quoted formula data, but it does not make those formula members true in the ambient program.

## 5. Example catalog

The repository includes examples for recursion, graph reachability, finite search, arithmetic, list processing, optimization, policies, puzzles, and applied scientific calculations. Bundled examples use relation-style output.

Representative files:

- [`ancestor.pl`](examples/ancestor.pl) — transitive closure over `parent/2` and `ancestor/2`.
- [`socrates.pl`](examples/socrates.pl) — small rule explanation example.
- [`basic-monadic.pl`](examples/basic-monadic.pl) — EYE-style benchmark translated to binary `cycle/2` answers.
- [`dijkstra.pl`](examples/dijkstra.pl) and [`dijkstra-risk-path.pl`](examples/dijkstra-risk-path.pl) — formula data plus path search.
- [`bmi.pl`](examples/bmi.pl), [`matrix.pl`](examples/matrix.pl), [`sudoku.pl`](examples/sudoku.pl), and [`turing.pl`](examples/turing.pl) — arithmetic, matrix, finite-domain, and list-processing demonstrations.
- [`delfour.pl`](examples/delfour.pl), [`odrl-dpv-risk-ranked.pl`](examples/odrl-dpv-risk-ranked.pl), and [`odrl-dpv-healthcare-risk-ranked.pl`](examples/odrl-dpv-healthcare-risk-ranked.pl) — larger policy-style examples using formula data and focused `materialize/2` output.

## 6. Golden outputs, tests, and conformance

Golden outputs live in [`examples/output`](examples/output). Regenerate them after an intentional output change:

```sh
make cli
for f in examples/*.pl; do
  b=$(basename "$f")
  bin/eyelog "$f" > "examples/output/$b"
done
```

Run the full test suite:

```sh
make test
```

The test suite runs in this order: Conformance, API, Examples. Each section prints its own subtotal, followed by a grand total. The suite checks the CLI, stdin and URL inputs, query parsing, explanation output, formula utilities, selected benchmark queries, every example against its golden output, and the conformance cases derived from `SPEC.md`.

Run only one suite when you are iterating:

```sh
make test conformance
make test api
make test examples
```

The conformance suite lives in [`conformance/`](conformance/) and is split into `core` and `extension` profiles matching `SPEC.md`. Each case is a small program with optional query text and an exact expected stdout file, so other implementations can reuse the same cases.

## 7. Development and release

Common targets:

```sh
make cli       # native CLI only
make browser   # browser assets through Emscripten
make test      # clean build plus all tests
make test api  # clean build plus only the API suite
make clean
```

For a release:

1. update `VERSION`;
2. update `README.md`, `HANDBOOK.md`, and `SPEC.md`;
3. regenerate golden outputs if behavior changed;
4. run `make test`;
5. build browser assets if publishing the playground. The playground includes controls equivalent to CLI `--query GOAL` and `--explain`.

## 8. Performance notes

Eyelog indexes clauses by predicate name and arity, then by scalar argument values. It also builds two-argument composite indexes for scalar pairs. This helps queries such as:

```prolog
edge(g1, a, X).
path(a, Y).
status(Case, accepted).
```

Ground facts use a fast path that avoids freshening and copying a rule body. Recursive examples use an active-call variant guard to prevent common cyclic closures from looping. Selected predicates can be memoized with:

```prolog
memoize(path, 2).
```

For large programs, keep helper predicates selective, bind arguments early, and declare focused output predicates with `materialize/2` when default output would otherwise ask broad helper queries.

## 9. Implementation limits

Eyelog is intentionally smaller than ISO Prolog. It has no operators, cut, modules, dynamic database updates, DCGs, or complete ISO library. Negation is negation-as-failure through `not/1`. Search is goal-directed and expected to be finite for the supplied program and query. Output explanations are non-normative proof printouts and do not change answer semantics.
