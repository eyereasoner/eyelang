# Eyelog Handbook

This handbook is the practical companion to the Eyelog language specification.
For the normative Prolog-like language definition, including lexical syntax, terms, clauses, goals, Herbrand semantics, built-ins, memoization declarations, `triple/3`, and conformance boundaries, read [SPEC.md](SPEC.md).

This document focuses on using the current implementation: running examples, using the browser playground, writing maintainable example files, testing, performance, and release workflow.

## Contents

- [1. Running Eyelog](#1-running-eyelog)
- [2. Browser playground](#2-browser-playground)
- [3. Writing example programs](#3-writing-example-programs)
- [4. Example catalog](#4-example-catalog)
- [5. Golden outputs and tests](#5-golden-outputs-and-tests)
- [6. Development and release](#6-development-and-release)
- [7. Performance notes](#7-performance-notes)
- [8. Current implementation limits](#8-current-implementation-limits)

## 1. Running Eyelog

Build only the native command-line executable:

```sh
make cli
```

Run an example:

```sh
bin/eyelog examples/ancestor.pl
```

Ask a direct query:

```sh
bin/eyelog --query 'triple(pat, ancestor, X)' examples/ancestor.pl
```

The command-line usage is:

```text
usage: eyelog [--version] [--query GOAL] [file-or-url.pl|- ...]
```

Inputs are parsed into one program before solving, so facts and rules can be split across files:

```sh
bin/eyelog facts.pl rules.pl
```

Use `-` to read one input from standard input:

```sh
printf 'triple(stdin, works, true).\n' | bin/eyelog -
```

For interactive standard input, terminate the program with end-of-file after the final period. On Linux, macOS, and WSL this is normally **Ctrl-D** on an empty line:

```text
triple(a, b, c).
<Enter>
<Ctrl-D>
```

Native builds can also load `http://` or `https://` inputs by invoking `curl` or `wget`:

```sh
bin/eyelog https://raw.githubusercontent.com/eyereasoner/eyelog/refs/heads/main/examples/ancestor.pl
```

Without `--query`, the executable asks for the public output relation:

```prolog
triple(S, P, O)
```

and prints distinct answers as Prolog facts. The language-level convention for `triple/3` is specified in [SPEC.md](SPEC.md#11-triple3-convention). The formal least-model reading is specified in [SPEC.md](SPEC.md#8-herbrand-semantics).

## 2. Browser playground

Build the WebAssembly assets:

```sh
make browser
```

Serve the repository over HTTP:

```sh
make serve
```

Then open:

```text
http://localhost:8000/playground.html
```

Opening the playground directly as a `file://` URL usually fails because browsers block module workers or `.wasm` loading from local files.

The playground:

- uses a vertical, mobile-friendly layout;
- shows the current version from `VERSION`;
- preloads the WebAssembly engine in a worker as soon as the page opens;
- keeps the Run button usable while preload is still finishing;
- supports example loading, URL loading, background programs, and optional `--query`;
- syntax-colors input and output on a uniform light background;
- keeps stdout and stderr separate;
- autosaves the editor in local storage;
- can stop a run by terminating the worker;
- creates share links.

Readable URL-based share links use the `?url=...` form:

```text
https://eyereasoner.github.io/eyelog/playground?url=https://raw.githubusercontent.com/eyereasoner/eyelog/refs/heads/main/examples/matrix.pl
```

Edited inline programs use compact hash links. On insecure HTTP origins where the modern Clipboard API is unavailable, the playground falls back to textarea copy and then to a manual copy prompt.

After changing C source, the Makefile, or browser build settings, rebuild stale browser assets with:

```sh
make clean browser
```

The generated `dist/browser/` files are local build products and should not be committed.

## 3. Writing example programs

Most examples use this structure:

1. input data as facts;
2. helper predicates for computation or search;
3. concise `triple/3` rules as the public report layer.

For example:

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, ancestor, Y) :- ancestor(X, Y).
```

Keep the public output small and explanatory. For calculation examples, prefer reporting the final result plus a few reason/status triples rather than every intermediate value.

Use helper predicates for internal state and use `triple/3` for the visible result:

```prolog
score(case1, 0.92).
threshold(case1, 0.80).

triple(case1, status, accepted) :-
  score(case1, Score),
  threshold(case1, Threshold),
  gt(Score, Threshold).

triple(case1, reason, "score exceeds threshold") :-
  score(case1, Score),
  threshold(case1, Threshold),
  gt(Score, Threshold).
```

For exact language rules, Herbrand semantics, built-in modes, list syntax, quoted atoms, strings, numbers, and conformance details, use [SPEC.md](SPEC.md) as the source of truth.

## 4. Example catalog

The repository contains examples across several styles and domains.

### Core logic and graph reasoning

- `ancestor.pl` — recursive ancestry.
- `path-discovery.pl` and `cyclic-path.pl` — reachability and guarded recursive closure.
- `diamond-property.pl` — graph property reasoning.
- `service-impact.pl` — dependency-impact closure.
- `dijkstra.pl` and `dijkstra-risk-path.pl` — path search with accumulated costs.

### Data, RDF-shaped output, and formula data

- `annotation.pl` — formula-valued triples and formula enumeration.
- `context-association.pl` — naming formula data.
- `derived-rule.pl` — rule-derived test facts.
- `skolem-functions.pl` — deterministic generated resources as ordinary terms.
- `odrl-dpv-risk-ranked.pl` and `odrl-dpv-healthcare-risk-ranked.pl` — policy/risk examples with ranked output.

### Search and puzzles

- `n-queens.pl` — enumerates all 8-queen solutions.
- `sudoku.pl` — solves a Sudoku puzzle.
- `zebra.pl` — classic zebra puzzle.
- `wolf-goat-cabbage.pl` — river-crossing plans.
- `hamiltonian-path.pl` — Hamiltonian path enumeration.
- `monkey-bananas.pl` — planning example.

### Arithmetic and mathematics

- `fibonacci.pl`, `ackermann.pl`, `collatz-1000.pl`, `goldbach-1000.pl` — integer-heavy examples.
- `fundamental-theorem-arithmetic.pl` — factorization-style reasoning.
- `quadratic-formula.pl` — roots of quadratic equations.
- `statistics-summary.pl` — mean and population variance.
- `vector-similarity.pl` — cosine similarity.
- `least-squares-regression.pl` — regression fit summary.
- `matrix.pl` — determinant, multiplication, and Cholesky-style matrix computations.

### Science, technology, and engineering

- `ideal-gas-law.pl`, `radioactive-decay.pl`, `pendulum-period.pl` — basic physics/science calculations.
- `competitive-enzyme-kinetics.pl` — enzyme inhibition status.
- `electrical-rc-filter.pl`, `beam-deflection.pl`, `heat-loss.pl` — engineering calculations.
- `buck-converter-design.pl` — converter ripple design.
- `cache-performance.pl`, `canary-release.pl`, `network-sla.pl`, `hamming-code.pl` — technology-domain checks.
- `lldm.pl` — concise leg-length discrepancy alarm report.

### Other demonstrations

- `bayes-diagnosis.pl` and `bayes-therapy.pl` — probability-style decision examples.
- `bmi.pl` and `age.pl` — healthcare-flavored examples.
- `complex.pl`, `fft8-numeric.pl`, `gd-step-certified.pl` — numeric examples.
- `kaprekar.pl`, `takeuchi.pl`, `turing.pl`, `superdense-coding.pl` — algorithmic demonstrations.
- `illegitimate-reasoning.pl` — fallacy detection with concise reason triples.

## 5. Golden outputs and tests

Each example that is part of the regression suite has a matching golden output file under `examples/output/`.

Run all tests:

```sh
make test
```

The test runner:

- builds and exercises the native CLI;
- checks API behavior such as version, query mode, multiple inputs, stdin, URL input, and syntax coverage;
- compares each example with its golden output;
- runs targeted checks for larger examples where exact output contains many lines.

When adding or changing an example:

1. keep the default `triple/3` output concise;
2. run the example manually;
3. write or update `examples/output/<name>.pl`;
4. add one or two targeted checks to `test/run.sh` if the example has an important invariant;
5. run `make test`.

Example update loop:

```sh
bin/eyelog examples/my-example.pl > examples/output/my-example.pl
make test
```

## 6. Development and release

Common build commands:

```sh
make cli       # native executable only
make browser   # WebAssembly playground assets
make           # CLI and browser assets
make all       # same as make
make clean
make test
```

The default `make` / `make all` target builds both native and browser assets. That requires a C compiler and Emscripten's `emcc`. Use `make cli` when you only need the native executable.

For releases, update `VERSION`; the build embeds that value in `bin/eyelog --version` and the playground displays it in the UI.

The release helper is typically invoked with a short sentence:

```sh
./mkeyelog "Minor release: support multiple CLI inputs, stdin, and file-or-URL loading."
```

GitHub Pages builds the browser playground through the repository workflow. The workflow installs Emscripten before building browser assets.

## 7. Performance notes

Eyelog is a compact top-down Horn-clause engine. The following habits keep examples practical:

- place selective goals early in rule bodies;
- use helper predicates to make joins explicit;
- use `memoize(Name, Arity).` for repeated recursive or deterministic subcomputations;
- keep public `triple/3` output focused;
- prefer built-ins such as `nth0/3` and `set_nth0/4` over hand-written deep recursive list traversal when appropriate;
- avoid intentionally enumerating huge unconstrained spaces unless that is the point of the example.

The implementation indexes user clauses by predicate and by bound scalar arguments. This helps all predicates, not just `triple/3`, especially when a goal has a bound atom/string/number argument.

The browser build has stricter call-stack limits than native execution. Several examples use native built-ins and iterative internals to reduce WebAssembly stack pressure, but deeply recursive search can still be more demanding in the browser than on the command line.

## 8. Current implementation limits

The language profile is intentionally smaller than ISO Prolog; see [SPEC.md](SPEC.md#13-non-goals-and-known-omissions) for the normative conformance boundary.

Current practical limits include:

- no full ISO reader or operator-declaration system;
- no infix arithmetic such as `X is 1 + 2`; use explicit arithmetic built-ins;
- no cut, DCGs, modules, dynamic database predicates, or portable ISO library claim;
- top-down search can diverge for left-recursive or insufficiently constrained programs;
- floating-point examples use host double precision, not exact decimal arithmetic;
- URL loading in the native CLI depends on `curl` or `wget` being available;
- URL loading in the browser is subject to normal browser CORS rules.

Use `SPEC.md` for language-level guarantees and this handbook for repository workflow and practical examples.
