# eyelog

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.
It materializes distinct `triple/3` consequences by Horn-clause search, with duplicate suppression and guarded recursion for common cyclic closures.

Current version: see [`VERSION`](VERSION).

Try it in the [browser playground](https://eyereasoner.github.io/eyelog/playground).

## Quick start

Build the native command-line executable:

```sh
make cli
```

Run an example:

```sh
bin/eyelog examples/delfour.pl
bin/eyelog --query 'triple(pat, ancestor, X)' examples/ancestor.pl
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

Read further in the [HANDBOOK](HANDBOOK.md) for language details, built-ins, examples, browser use, indexing, tests, release workflow, and GitHub Pages deployment.
