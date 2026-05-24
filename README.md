# eyelog

[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.1242549108-blue.svg)](https://doi.org/10.5281/zenodo.20342331)

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.
It materializes distinct `triple/3` consequences by Horn-clause search, with duplicate suppression and guarded recursion for common cyclic closures. The CLI can also print `--explain` proof trees for query answers or materialized triples.

Its inherent potential comes from the small, general Horn-clause core: unification, goal-directed proof search, and `triple/3` materialization provide a compact foundation on which RDF reasoning, graph algorithms, transformations, and higher-level rule languages can be built. The theoretical underpinning is deliberately simple and well understood, making `eyelog` a lightweight logic kernel rather than a large specialized reasoner.

Current version: see [`VERSION`](VERSION).

Try it in the [browser playground](https://eyereasoner.github.io/eyelog/playground).

## Quick start

Build the native command-line executable:

```sh
make cli
```

Run examples, queries, multiple inputs, stdin, or a URL:

```sh
bin/eyelog examples/delfour.pl
bin/eyelog --query 'triple(pat, ancestor, X)' examples/ancestor.pl
bin/eyelog --explain examples/socrates.pl
bin/eyelog --explain --query 'type(S, mortal)' examples/socrates.pl
bin/eyelog facts.pl rules.pl
printf 'triple(stdin, works, true).\n' | bin/eyelog -
bin/eyelog https://raw.githubusercontent.com/eyereasoner/eyelog/refs/heads/main/examples/ancestor.pl
```

The default `make` / `make all` builds both the native CLI and browser assets, so it also requires Emscripten's `emcc`.

## Browser playground

Build and serve the local playground:

```sh
make browser
make serve
```

Then open <http://localhost:8000/playground.html>.

## Read further

Read the [language specification](SPEC.md) for the normative Prolog-like language definition.
Read further in the [HANDBOOK](HANDBOOK.md) for examples, browser use, indexing, tests, release workflow, and GitHub Pages deployment.
