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

The repository contains examples across several styles and domains. Each example name links to its source file.

### Core logic and graph reasoning

- [`ancestor.pl`](examples/ancestor.pl) — recursive ancestry.
- [`path-discovery.pl`](examples/path-discovery.pl), [`graph-reachability.pl`](examples/graph-reachability.pl), and [`cyclic-path.pl`](examples/cyclic-path.pl) — reachability and guarded recursive closure.
- [`diamond-property.pl`](examples/diamond-property.pl) — graph property reasoning.
- [`four-color-map.pl`](examples/four-color-map.pl) — EYE-inspired four-colour EU map validation.
- [`sat-dpll.pl`](examples/sat-dpll.pl) — finite 8-variable CNF satisfiability search with model collection.
- [`service-impact.pl`](examples/service-impact.pl) — dependency-impact closure.
- [`dijkstra.pl`](examples/dijkstra.pl), [`dijkstra-risk-path.pl`](examples/dijkstra-risk-path.pl), and [`dijkstra-findall-sort.pl`](examples/dijkstra-findall-sort.pl) — path search with accumulated costs; the `findall`/`sort` variant mirrors a common Prolog frontier pattern.
- [`eulerian-path.pl`](examples/eulerian-path.pl) — Eulerian circuit search with canonicalized graph data.

### Data, RDF-shaped output, and formula data

- [`annotation.pl`](examples/annotation.pl) — formula-valued triples and formula enumeration.
- [`context-association.pl`](examples/context-association.pl) — naming formula data.
- [`derived-rule.pl`](examples/derived-rule.pl) — rule-derived test facts.
- [`proof-contrapositive.pl`](examples/proof-contrapositive.pl) — proof-by-contrapositive encoded with implication facts.
- [`nixon-diamond.pl`](examples/nixon-diamond.pl) — classic conflicting defaults represented as explicit conflict triples.
- [`skolem-functions.pl`](examples/skolem-functions.pl) — deterministic generated resources as ordinary terms.
- [`odrl-dpv-risk-ranked.pl`](examples/odrl-dpv-risk-ranked.pl) and [`odrl-dpv-healthcare-risk-ranked.pl`](examples/odrl-dpv-healthcare-risk-ranked.pl) — policy/risk examples with ranked output.
- [`access-control-policy.pl`](examples/access-control-policy.pl) — all-of/any-of/none-of policy checks without aggregation built-ins.

### Search and puzzles

- [`n-queens.pl`](examples/n-queens.pl) — enumerates all 8-queen solutions using a commented diagonal-set search encoding; `queens/2` can also enumerate larger boards such as 10 queens.
- [`sudoku.pl`](examples/sudoku.pl) — solves a Sudoku puzzle.
- [`zebra.pl`](examples/zebra.pl) — classic zebra puzzle.
- [`wolf-goat-cabbage.pl`](examples/wolf-goat-cabbage.pl) — river-crossing plans.
- [`hamiltonian-path.pl`](examples/hamiltonian-path.pl) and [`hamiltonian-cycle.pl`](examples/hamiltonian-cycle.pl) — Hamiltonian path and larger 8-vertex cycle search.
- [`cryptarithmetic-send-more-money.pl`](examples/cryptarithmetic-send-more-money.pl) — SEND + MORE = MONEY plus DONALD + GERALD = ROBERT with column-pruned digit search.
- [`exact-cover-sudoku.pl`](examples/exact-cover-sudoku.pl) — 9x9 Sudoku expressed as candidate-row, column, and box exact covers.
- [`monkey-bananas.pl`](examples/monkey-bananas.pl) and [`blocks-world-planning.pl`](examples/blocks-world-planning.pl) — planning examples without cut, including a five-block/five-move blocks-world search.

### Arithmetic and mathematics

- [`fibonacci.pl`](examples/fibonacci.pl), [`ackermann.pl`](examples/ackermann.pl), [`peano-arithmetic.pl`](examples/peano-arithmetic.pl), [`collatz-1000.pl`](examples/collatz-1000.pl), [`goldbach-1000.pl`](examples/goldbach-1000.pl) — integer-heavy examples; `peano-arithmetic.pl` mirrors the EYE Peano query `(1 * 2 + 3)! = 5!`.
- [`fundamental-theorem-arithmetic.pl`](examples/fundamental-theorem-arithmetic.pl) — factorization-style reasoning.
- [`gcd-bezout-identity.pl`](examples/gcd-bezout-identity.pl) — extended Euclidean algorithm with Bézout coefficients and checks.
- [`law-of-cosines.pl`](examples/law-of-cosines.pl) and [`heron-theorem.pl`](examples/heron-theorem.pl) — triangle geometry calculations.
- [`combinatorics-findall-sort.pl`](examples/combinatorics-findall-sort.pl) — combinations collected with `findall/3` and canonicalized with `sort/2`.
- [`quine-mccluskey.pl`](examples/quine-mccluskey.pl) — Boolean minimization with generated implicants and sorted covers.
- [`quadratic-formula.pl`](examples/quadratic-formula.pl) — roots of quadratic equations.
- [`statistics-summary.pl`](examples/statistics-summary.pl) — mean and population variance.
- [`vector-similarity.pl`](examples/vector-similarity.pl) — cosine similarity.
- [`least-squares-regression.pl`](examples/least-squares-regression.pl) — regression fit summary.
- [`matrix.pl`](examples/matrix.pl) — determinant, multiplication, and Cholesky-style matrix computations.
- [`complex-matrix-stability.pl`](examples/complex-matrix-stability.pl) — 2x2 control-system stability via trace, determinant, and discriminant.

### Science, technology, and engineering

- [`ideal-gas-law.pl`](examples/ideal-gas-law.pl), [`radioactive-decay.pl`](examples/radioactive-decay.pl), [`pendulum-period.pl`](examples/pendulum-period.pl) — basic physics/science calculations.
- [`exoplanet-validation-worlds.pl`](examples/exoplanet-validation-worlds.pl) — EYE-inspired Bayesian/heuristic world comparison for exoplanet validation.
- [`ev-range-worlds.pl`](examples/ev-range-worlds.pl) — EYE-inspired EV range estimation across optimistic, speed-aware, physics-aware, and cautious worlds.
- [`orbital-transfer-design.pl`](examples/orbital-transfer-design.pl) — Hohmann transfer delta-v and transfer-time check.
- [`competitive-enzyme-kinetics.pl`](examples/competitive-enzyme-kinetics.pl) — enzyme inhibition status.
- [`electrical-rc-filter.pl`](examples/electrical-rc-filter.pl), [`beam-deflection.pl`](examples/beam-deflection.pl), [`heat-loss.pl`](examples/heat-loss.pl) — engineering calculations.
- [`dairy-energy-balance.pl`](examples/dairy-energy-balance.pl) and [`field-nitrogen-balance.pl`](examples/field-nitrogen-balance.pl) — EYE-inspired agricultural balance calculations with explanatory status triples.
- [`buck-converter-design.pl`](examples/buck-converter-design.pl) — converter ripple design.
- [`braking-safety-worlds.pl`](examples/braking-safety-worlds.pl) — EYE-inspired alternative-world braking safety classifications.
- [`cache-performance.pl`](examples/cache-performance.pl), [`canary-release.pl`](examples/canary-release.pl), [`network-sla.pl`](examples/network-sla.pl), [`hamming-code.pl`](examples/hamming-code.pl) — technology-domain checks.
- [`lldm.pl`](examples/lldm.pl) — concise leg-length discrepancy alarm report.

### Representative applied scenarios

- [`clinical-trial-screening.pl`](examples/clinical-trial-screening.pl) — protocol-style inclusion/exclusion screening with concise reasons.
- [`epidemic-policy.pl`](examples/epidemic-policy.pl) — EYE-inspired outbreak policy selection from risk and cost factors.
- [`microgrid-dispatch.pl`](examples/microgrid-dispatch.pl) — reserve-aware battery dispatch and grid-import feasibility.
- [`manufacturing-quality-control.pl`](examples/manufacturing-quality-control.pl) — Cpk capability classification for production runs.
- [`security-incident-correlation.pl`](examples/security-incident-correlation.pl) — security signal correlation for incident escalation.
- [`deontic-logic.pl`](examples/deontic-logic.pl) — obligations, prohibitions, compensations, and violation reporting.
- [`gdpr-compliance.pl`](examples/gdpr-compliance.pl) — lawful-basis, minimisation, safeguards, and transfer checks.

### Other demonstrations

- [`bayes-diagnosis.pl`](examples/bayes-diagnosis.pl) and [`bayes-therapy.pl`](examples/bayes-therapy.pl) — probability-style decision examples.
- [`bmi.pl`](examples/bmi.pl) and [`age.pl`](examples/age.pl) — healthcare-flavored examples.
- [`complex.pl`](examples/complex.pl), [`fft8-numeric.pl`](examples/fft8-numeric.pl), [`gd-step-certified.pl`](examples/gd-step-certified.pl) — numeric examples.
- [`basic-monadic.pl`](examples/basic-monadic.pl) — EYE-style Basic Monadic Benchmark port deriving the 1518 ten-step `cycle` triples from the ten `1tt*.ttl` inputs.
- [`d3-group.pl`](examples/d3-group.pl) — subgroup enumeration for the dihedral group of order 6.
- [`kaprekar.pl`](examples/kaprekar.pl), [`takeuchi.pl`](examples/takeuchi.pl), [`turing.pl`](examples/turing.pl), [`superdense-coding.pl`](examples/superdense-coding.pl) — algorithmic demonstrations.
- [`sat-dpll.pl`](examples/sat-dpll.pl), [`hamiltonian-cycle.pl`](examples/hamiltonian-cycle.pl), [`cryptarithmetic-send-more-money.pl`](examples/cryptarithmetic-send-more-money.pl), [`exact-cover-sudoku.pl`](examples/exact-cover-sudoku.pl), and [`blocks-world-planning.pl`](examples/blocks-world-planning.pl) — larger no-cut challenge examples covering 8-variable SAT, 8-vertex graph search, two cryptarithms, 9x9 exact cover, and five-block planning.
- [`illegitimate-reasoning.pl`](examples/illegitimate-reasoning.pl) — fallacy detection with concise reason triples.

### Eyelet-inspired Prolog ports

Several examples are deliberately adapted from the typical Prolog-style programs in Eyelet's `input/` directory. The ports remain conservative about built-ins: most clear source-level relations stay as Eyelog rules, while broadly useful finite-list and collection patterns may use the core `select/3`, `findall/3`, and `sort/2` built-ins. Operator declarations, cut, infix arithmetic, destructive update, and dynamic assertion are still avoided.

The current Eyelet/EYE-inspired set includes [`peano-arithmetic.pl`](examples/peano-arithmetic.pl), [`graph-reachability.pl`](examples/graph-reachability.pl), [`proof-contrapositive.pl`](examples/proof-contrapositive.pl), [`access-control-policy.pl`](examples/access-control-policy.pl), [`combinatorics-findall-sort.pl`](examples/combinatorics-findall-sort.pl), [`dijkstra-findall-sort.pl`](examples/dijkstra-findall-sort.pl), [`eulerian-path.pl`](examples/eulerian-path.pl), [`quine-mccluskey.pl`](examples/quine-mccluskey.pl), [`basic-monadic.pl`](examples/basic-monadic.pl), [`d3-group.pl`](examples/d3-group.pl), [`four-color-map.pl`](examples/four-color-map.pl), [`gcd-bezout-identity.pl`](examples/gcd-bezout-identity.pl), [`braking-safety-worlds.pl`](examples/braking-safety-worlds.pl), [`exoplanet-validation-worlds.pl`](examples/exoplanet-validation-worlds.pl), [`ev-range-worlds.pl`](examples/ev-range-worlds.pl), [`dairy-energy-balance.pl`](examples/dairy-energy-balance.pl), [`field-nitrogen-balance.pl`](examples/field-nitrogen-balance.pl), and [`epidemic-policy.pl`](examples/epidemic-policy.pl), plus [`nixon-diamond.pl`](examples/nixon-diamond.pl), [`deontic-logic.pl`](examples/deontic-logic.pl), [`gdpr-compliance.pl`](examples/gdpr-compliance.pl), [`complex-matrix-stability.pl`](examples/complex-matrix-stability.pl), [`law-of-cosines.pl`](examples/law-of-cosines.pl), and [`heron-theorem.pl`](examples/heron-theorem.pl). The Peano example follows the corresponding EYE Peano query, and Basic Monadic now follows the EYE ten-input benchmark answer cardinality of 1518 cycle triples.

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

### 7.1 Clause indexing

Indexing is an implementation optimization, not part of the language semantics. A correct program must not depend on which index is chosen. The language-level meaning remains the least-model/proof-search behavior described in [SPEC.md](SPEC.md); indexing only narrows the clauses that must be tried for a goal.

At load time, Eyelog groups every user clause by the predicate indicator of its head:

```text
name/arity -> candidate clauses
```

For example, all `edge/3` clauses are kept in one predicate group, all `path/2` clauses in another, and all `triple/3` clauses in another. This first-level index applies to every predicate, not only `triple/3`.

Within each predicate group, Eyelog also builds scalar argument indexes. A head argument is indexable when it is a simple scalar term: an atom constant, string, or number. Variables and compound terms are not scalar keys. For a predicate such as `edge/3`, clauses with heads like these contribute entries to per-argument indexes:

```prolog
edge(g1, a, b).
edge(g1, b, c).
edge(g2, a, d).
```

Conceptually, the indexes look like this:

```text
edge/3 argument 0:
  g1 -> [edge(g1,a,b), edge(g1,b,c)]
  g2 -> [edge(g2,a,d)]

edge/3 argument 1:
  a  -> [edge(g1,a,b), edge(g2,a,d)]
  b  -> [edge(g1,b,c)]

edge/3 argument 2:
  b  -> [edge(g1,a,b)]
  c  -> [edge(g1,b,c)]
  d  -> [edge(g2,a,d)]
```

Rules whose head has a variable or compound at a position are kept in that argument index's fallback list, because they may still match any query value at that position:

```prolog
edge(G, X, Y) :- base_edge(G, X, Y).
```

At solve time, when a goal has one or more bound scalar arguments, Eyelog chooses the most selective available argument index: the bucket with the fewest matching clauses plus fallback clauses. A goal such as:

```prolog
edge(g1, a, X)
```

can use either the `g1` bucket for argument 0 or the `a` bucket for argument 1. Eyelog picks the smaller candidate set and still checks unification afterwards, so indexing cannot introduce incorrect answers.

Eyelog also builds two-argument scalar indexes for every pair of argument positions. For `edge/3`, that means indexes for `(0,1)`, `(0,2)`, and `(1,2)`. A goal with two bound scalar arguments can therefore use a more selective composite key:

```prolog
edge(g1, a, X)
```

can use the conceptual key `(argument 0 = g1, argument 1 = a)`, often reducing candidate clauses much more than either single argument alone. This is especially useful for join-heavy datasets such as graph, RDF-shaped, and benchmark examples.

The final filtering step is always unification. The index is only a candidate selector:

```text
select indexed candidates -> reject impossible scalar mismatches -> unify -> solve body
```

### 7.2 Ground-fact fast path

A clause with no body and a ground head is a ground fact:

```prolog
edge(g1, a, b).
```

Ground facts do not need variable freshening. Eyelog therefore unifies a selected ground fact directly with the current goal. Rules and non-ground facts still go through ordinary clause freshening, because their variables must be kept distinct for each use.

This optimization matters for fact-heavy programs. The EYE-style Basic Monadic example contains thousands of ground `edge/3` facts and derives 1518 `cycle` triples; the ground-fact fast path and two-argument indexes avoid repeatedly copying those facts as if they were general rules.

### 7.3 Writing index-friendly rules

For permutation-style search, prefer carrying explicit finite sets of used values and constraint keys. For example, the N-Queens example carries occupied columns and the two diagonal families (`Row + Column` and `Row - Column`) so each partial placement is checked before deeper recursion. The `select/3` built-in also avoids expanding a recursive selector rule at every search level.


The most useful indexing advice is the same as in many Prolog systems: put selective, already-bound goals early in a rule body. For example, this shape is usually index-friendly:

```prolog
triple(Node, status, reachable) :-
  start(Start),
  edge(Graph, Start, Node),
  allowed_graph(Graph).
```

If `Start` or `Graph` is already bound when `edge/3` is called, the argument or pair indexes can narrow the fact scan. By contrast, a very open goal such as:

```prolog
edge(Graph, From, To)
```

has no bound scalar argument and must enumerate the whole predicate group. That can be correct, but it is naturally more expensive.

For RDF-shaped data, do not assume only the subject position is important. Eyelog indexes every scalar argument, so these can all be selective:

```prolog
triple(alice, P, O).
triple(S, rdf_type, person).
triple(S, knows, bob).
```

When two positions are known, the pair index may be better still:

```prolog
triple(S, rdf_type, person).
edge(graph1, From, To).
measurement(case42, temperature, Value).
```

### 7.4 Current indexing limits

The current indexes are deliberately simple:

- they index predicate name and arity;
- they index scalar constants in individual head arguments;
- they index scalar-constant pairs in head arguments;
- they keep variable or compound head arguments in fallback lists;
- they do not index inside compound terms;
- they do not reorder goals automatically;
- they do not replace memoization for recursive computations.

For recursive closures or repeated deterministic subcomputations, use `memoize(Name, Arity).` in addition to writing selective goals.

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
