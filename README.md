# eyelog

[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.1242549108-blue.svg)](https://doi.org/10.5281/zenodo.20342331)

`eyelog` is a small C rule engine for Prolog-style Horn clauses over ordinary terms, lists, arithmetic, strings, and finite search.

Programs write relations directly, for example `ancestor(pat, emma)` or `status(case1, accepted)`. When no `--query` is supplied, the CLI materializes distinct new binary derivations of the form `p(S, O)` and prints them as Prolog facts. Source facts are not repeated. Programs may add `materialize(Name, Arity).` declarations to focus default output on selected predicates.

Current version: see [`VERSION`](VERSION).

Try it in the [browser playground](https://eyereasoner.github.io/eyelog/playground).

## Quick start

Build the native command-line executable:

```sh
make cli
```

Run examples, explicit queries, multiple inputs, stdin, or a URL:

```sh
bin/eyelog examples/ancestor.pl
bin/eyelog --query 'ancestor(pat, X)' examples/ancestor.pl
bin/eyelog --explain examples/socrates.pl
bin/eyelog --explain --query 'type(socrates, mortal)' examples/socrates.pl
bin/eyelog facts.pl rules.pl
printf 'works(stdin, true) :- eq(ok, ok).
' | bin/eyelog -
bin/eyelog https://raw.githubusercontent.com/eyereasoner/eyelog/refs/heads/main/examples/ancestor.pl
```

The default `make` / `make all` builds both the native CLI and browser assets, so it also requires Emscripten's `emcc`. Use `make cli` when you only need the native executable.

## Small example

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :-
  parent(X, Y).

ancestor(X, Z) :-
  parent(X, Y),
  ancestor(Y, Z).
```

Running `bin/eyelog file.pl` prints only new derived binary facts:

```prolog
ancestor(jan, emma).
ancestor(pat, emma).
ancestor(pat, jan).
```

## Read further

Read the [language specification](SPEC.md) for the normative Prolog-like language definition.
Read the [handbook](HANDBOOK.md) for examples, browser use, tests, release workflow, performance notes, and the relation-style output model.
