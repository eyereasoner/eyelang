# eyelog

[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.1242549108-blue.svg)](https://doi.org/10.5281/zenodo.20342331)

`eyelog` is a small C rule engine for Prolog-style Horn clauses over ordinary terms, lists, arithmetic, strings, and finite search.

Programs write relations directly, for example `ancestor(pat, emma)` or `status(case1, accepted)`. When no `--query` is supplied, the CLI materializes distinct new binary derivations of the form `p(S, O)` and prints them as Prolog facts. Source facts are not repeated. Programs may add `materialize(Name, Arity).` declarations to focus default output on selected predicates.


Try it in the [browser playground](https://eyereasoner.github.io/eyelog/playground). The playground includes run options equivalent to CLI `--query` and `--explain`.

For the normative language definition, including lexical syntax, terms, clauses, goals, built-ins, `memoize/2`, `materialize/2`, and conformance boundaries, read [`SPEC.md`](SPEC.md).

## Contents

1. [Quick start](#quick-start)
2. [Running Eyelog](#running-eyelog)
3. [Default output](#default-output)
4. [Writing programs](#writing-programs)
5. [Formula data](#formula-data)
6. [Example catalog](#example-catalog)
7. [Golden outputs, tests, and conformance](#golden-outputs-tests-and-conformance)
8. [Development and release](#development-and-release)
9. [Performance notes](#performance-notes)
10. [Implementation limits](#implementation-limits)

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
printf 'works(stdin, true) :- eq(ok, ok).\n' | bin/eyelog -
bin/eyelog https://raw.githubusercontent.com/eyereasoner/eyelog/refs/heads/main/examples/ancestor.pl
```

The default `make` / `make all` builds both the native CLI and browser assets, so it also requires Emscripten's `emcc`. Use `make cli` when you only need the native executable.

## Running Eyelog

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

## Default output

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

## Writing programs

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

## Formula data

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

## Example catalog

The repository includes examples for recursion, graph reachability, finite search, arithmetic, list processing, optimization, policies, puzzles, and applied scientific calculations. Bundled examples use relation-style output.

Bundled example files:

- [`access-control-policy.pl`](examples/access-control-policy.pl) — Evaluates role and condition based access decisions.
- [`ackermann.pl`](examples/ackermann.pl) — Computes Ackermann-style hyperoperation values.
- [`age.pl`](examples/age.pl) — Checks whether people meet age thresholds.
- [`aliases-and-namespaces.pl`](examples/aliases-and-namespaces.pl) — Shows ordinary predicate names for vocabulary aliases.
- [`allen-interval-calculus.pl`](examples/allen-interval-calculus.pl) — Classifies interval relations with integer time offsets.
- [`ancestor.pl`](examples/ancestor.pl) — Derives ancestors from parent facts.
- [`animal.pl`](examples/animal.pl) — Classifies animals from traits.
- [`annotation.pl`](examples/annotation.pl) — Derives facts from quoted annotation data.
- [`basic-monadic.pl`](examples/basic-monadic.pl) — Runs a monadic benchmark over generated inputs.
- [`bayes-diagnosis.pl`](examples/bayes-diagnosis.pl) — Computes scaled Bayesian diagnosis posteriors.
- [`bayes-therapy.pl`](examples/bayes-therapy.pl) — Ranks therapies using Bayesian disease likelihoods.
- [`beam-deflection.pl`](examples/beam-deflection.pl) — Computes cantilever beam deflection.
- [`blocks-world-planning.pl`](examples/blocks-world-planning.pl) — Searches a finite blocks-world plan.
- [`bmi.pl`](examples/bmi.pl) — Normalizes BMI inputs and classifies weight.
- [`braking-safety-worlds.pl`](examples/braking-safety-worlds.pl) — Classifies braking safety under alternative worlds.
- [`buck-converter-design.pl`](examples/buck-converter-design.pl) — Checks buck-converter ripple design.
- [`c-core-throughput.pl`](examples/c-core-throughput.pl) — Materializes many generated throughput relations.
- [`c-core-transitive-closure.pl`](examples/c-core-transitive-closure.pl) — Computes a long transitive closure.
- [`cache-performance.pl`](examples/cache-performance.pl) — Summarizes cache latency performance.
- [`canary-release.pl`](examples/canary-release.pl) — Decides canary rollout or rollback.
- [`clinical-trial-screening.pl`](examples/clinical-trial-screening.pl) — Screens candidates for a trial.
- [`collatz-1000.pl`](examples/collatz-1000.pl) — Computes shared Collatz trajectories.
- [`combinatorics-findall-sort.pl`](examples/combinatorics-findall-sort.pl) — Collects and sorts finite combinations.
- [`competitive-enzyme-kinetics.pl`](examples/competitive-enzyme-kinetics.pl) — Computes inhibited enzyme reaction rates.
- [`complex-matrix-stability.pl`](examples/complex-matrix-stability.pl) — Checks stability of a 2x2 system.
- [`complex.pl`](examples/complex.pl) — Performs arithmetic on complex pairs.
- [`context-association.pl`](examples/context-association.pl) — Associates named contexts with their contents.
- [`control-system.pl`](examples/control-system.pl) — Evaluates control-system measurements and targets.
- [`cryptarithmetic-send-more-money.pl`](examples/cryptarithmetic-send-more-money.pl) — Solves SEND+MORE and related puzzles.
- [`cyclic-path.pl`](examples/cyclic-path.pl) — Computes paths in a cyclic graph.
- [`d3-group.pl`](examples/d3-group.pl) — Enumerates subgroups of the D3 group.
- [`dairy-energy-balance.pl`](examples/dairy-energy-balance.pl) — Classifies dairy cow energy balance.
- [`data-negotiation.pl`](examples/data-negotiation.pl) — Chooses an accepted data-negotiation offer.
- [`deep-taxonomy-10.pl`](examples/deep-taxonomy-10.pl) — Stress-tests recursive taxonomy depth 10.
- [`deep-taxonomy-100.pl`](examples/deep-taxonomy-100.pl) — Stress-tests recursive taxonomy depth 100.
- [`deep-taxonomy-1000.pl`](examples/deep-taxonomy-1000.pl) — Stress-tests recursive taxonomy depth 1000.
- [`deep-taxonomy-10000.pl`](examples/deep-taxonomy-10000.pl) — Stress-tests recursive taxonomy depth 10000.
- [`deep-taxonomy-100000.pl`](examples/deep-taxonomy-100000.pl) — Stress-tests recursive taxonomy depth 100000.
- [`delfour.pl`](examples/delfour.pl) — Derives shopping and authorization recommendations.
- [`deontic-logic.pl`](examples/deontic-logic.pl) — Reports obligations, prohibitions, and violations.
- [`derived-rule.pl`](examples/derived-rule.pl) — Derives conclusions from rule data.
- [`diamond-property.pl`](examples/diamond-property.pl) — Checks the diamond property of a relation.
- [`dijkstra-findall-sort.pl`](examples/dijkstra-findall-sort.pl) — Finds shortest paths using collected candidates.
- [`dijkstra-risk-path.pl`](examples/dijkstra-risk-path.pl) — Ranks routes by cost and trust.
- [`dijkstra.pl`](examples/dijkstra.pl) — Enumerates weighted simple paths.
- [`dining-philosophers.pl`](examples/dining-philosophers.pl) — Simulates Chandy-Misra fork exchanges.
- [`drone-corridor-planner.pl`](examples/drone-corridor-planner.pl) — Plans bounded drone corridor routes.
- [`easter-computus.pl`](examples/easter-computus.pl) — Computes Gregorian Easter dates.
- [`electrical-rc-filter.pl`](examples/electrical-rc-filter.pl) — Sizes an RC low-pass filter.
- [`epidemic-policy.pl`](examples/epidemic-policy.pl) — Chooses policies from risk and social cost.
- [`eulerian-path.pl`](examples/eulerian-path.pl) — Finds an Eulerian path using each edge once.
- [`ev-range-worlds.pl`](examples/ev-range-worlds.pl) — Estimates electric-vehicle trip feasibility.
- [`exact-cover-sudoku.pl`](examples/exact-cover-sudoku.pl) — Solves Sudoku via exact-cover-style constraints.
- [`exoplanet-validation-worlds.pl`](examples/exoplanet-validation-worlds.pl) — Validates exoplanet candidates across worlds.
- [`expression-eval.pl`](examples/expression-eval.pl) — Evaluates a small arithmetic expression tree.
- [`family-cousins.pl`](examples/family-cousins.pl) — Derives cousin and family labels.
- [`fastpow.pl`](examples/fastpow.pl) — Computes powers by repeated squaring.
- [`fft8-numeric.pl`](examples/fft8-numeric.pl) — Runs an 8-point FFT over complex pairs.
- [`fibonacci.pl`](examples/fibonacci.pl) — Computes large Fibonacci numbers by fast doubling.
- [`field-nitrogen-balance.pl`](examples/field-nitrogen-balance.pl) — Classifies field nitrogen balance.
- [`floating-point.pl`](examples/floating-point.pl) — Exercises floating-point arithmetic and comparisons.
- [`four-color-map.pl`](examples/four-color-map.pl) — Checks a four-colour map assignment.
- [`fundamental-theorem-arithmetic.pl`](examples/fundamental-theorem-arithmetic.pl) — Factors integers and reconstructs products.
- [`gcd-bezout-identity.pl`](examples/gcd-bezout-identity.pl) — Computes gcd and Bézout coefficients.
- [`gd-step-certified.pl`](examples/gd-step-certified.pl) — Certifies a gradient-descent step.
- [`gdpr-compliance.pl`](examples/gdpr-compliance.pl) — Checks GDPR-style processing compliance.
- [`goldbach-1000.pl`](examples/goldbach-1000.pl) — Finds Goldbach prime pairs up to 1000.
- [`gps.pl`](examples/gps.pl) — Finds and verifies route paths.
- [`graph-reachability.pl`](examples/graph-reachability.pl) — Derives reachable nodes in a graph.
- [`gray-code-counter.pl`](examples/gray-code-counter.pl) — Generates Gray-code counter states.
- [`hamiltonian-cycle.pl`](examples/hamiltonian-cycle.pl) — Finds a Hamiltonian cycle.
- [`hamiltonian-path.pl`](examples/hamiltonian-path.pl) — Finds a Hamiltonian path.
- [`hamming-code.pl`](examples/hamming-code.pl) — Corrects a single-bit Hamming word.
- [`hanoi.pl`](examples/hanoi.pl) — Derives the Towers of Hanoi moves.
- [`heat-loss.pl`](examples/heat-loss.pl) — Computes conductive heat loss.
- [`heron-theorem.pl`](examples/heron-theorem.pl) — Computes triangle area by Heron's theorem.
- [`ideal-gas-law.pl`](examples/ideal-gas-law.pl) — Applies the ideal gas law.
- [`illegitimate-reasoning.pl`](examples/illegitimate-reasoning.pl) — Detects suspect reasoning patterns.
- [`kaprekar.pl`](examples/kaprekar.pl) — Iterates toward Kaprekar's constant.
- [`law-of-cosines.pl`](examples/law-of-cosines.pl) — Computes a triangle side by cosine law.
- [`least-squares-regression.pl`](examples/least-squares-regression.pl) — Fits a least-squares regression line.
- [`list-collection.pl`](examples/list-collection.pl) — Demonstrates list and collection built-ins.
- [`lldm.pl`](examples/lldm.pl) — Calculates leg-length discrepancy measurements.
- [`manufacturing-quality-control.pl`](examples/manufacturing-quality-control.pl) — Evaluates process capability and quality.
- [`matrix.pl`](examples/matrix.pl) — Runs matrix operations over sample inputs.
- [`microgrid-dispatch.pl`](examples/microgrid-dispatch.pl) — Plans microgrid dispatch and reserve.
- [`monkey-bananas.pl`](examples/monkey-bananas.pl) — Solves the monkey-and-bananas puzzle.
- [`n-queens.pl`](examples/n-queens.pl) — Searches for N-queens placements.
- [`network-sla.pl`](examples/network-sla.pl) — Checks network path SLA compliance.
- [`newton-raphson.pl`](examples/newton-raphson.pl) — Finds roots by Newton-Raphson iteration.
- [`nixon-diamond.pl`](examples/nixon-diamond.pl) — Reports the classic Nixon-diamond conflict.
- [`odrl-dpv-healthcare-risk-ranked.pl`](examples/odrl-dpv-healthcare-risk-ranked.pl) — Ranks healthcare policy risks and mitigations.
- [`odrl-dpv-risk-ranked.pl`](examples/odrl-dpv-risk-ranked.pl) — Ranks data-policy risks and mitigations.
- [`orbital-transfer-design.pl`](examples/orbital-transfer-design.pl) — Designs a Hohmann orbital transfer.
- [`path-discovery.pl`](examples/path-discovery.pl) — Discovers bounded air-route paths.
- [`peano-arithmetic.pl`](examples/peano-arithmetic.pl) — Computes Peano addition, multiplication, and factorial.
- [`peasant.pl`](examples/peasant.pl) — Performs peasant multiplication and exponentiation.
- [`pendulum-period.pl`](examples/pendulum-period.pl) — Computes simple pendulum periods.
- [`polynomial.pl`](examples/polynomial.pl) — Finds complex integer polynomial roots.
- [`proof-contrapositive.pl`](examples/proof-contrapositive.pl) — Models proof by contrapositive.
- [`quadratic-formula.pl`](examples/quadratic-formula.pl) — Solves sample quadratic equations.
- [`quine-mccluskey.pl`](examples/quine-mccluskey.pl) — Minimizes Boolean terms with Quine-McCluskey.
- [`radioactive-decay.pl`](examples/radioactive-decay.pl) — Computes radioactive decay over time.
- [`sat-dpll.pl`](examples/sat-dpll.pl) — Solves a finite SAT instance.
- [`security-incident-correlation.pl`](examples/security-incident-correlation.pl) — Correlates security incidents across signals.
- [`service-impact.pl`](examples/service-impact.pl) — Analyzes service impact over cyclic dependencies.
- [`sieve.pl`](examples/sieve.pl) — Enumerates primes with a sieve-style program.
- [`skolem-functions.pl`](examples/skolem-functions.pl) — Generates deterministic functional terms.
- [`socrates.pl`](examples/socrates.pl) — Derives that Socrates is mortal.
- [`statistics-summary.pl`](examples/statistics-summary.pl) — Computes population statistics for a sample.
- [`sudoku.pl`](examples/sudoku.pl) — Solves a 9x9 Sudoku puzzle.
- [`superdense-coding.pl`](examples/superdense-coding.pl) — Models superdense-coding bit transmission.
- [`takeuchi.pl`](examples/takeuchi.pl) — Computes the recursive Takeuchi function.
- [`traveling-salesman.pl`](examples/traveling-salesman.pl) — Finds an optimal traveling-salesman tour.
- [`turing.pl`](examples/turing.pl) — Simulates a binary-increment Turing machine.
- [`vector-similarity.pl`](examples/vector-similarity.pl) — Computes dot product, norm, and cosine similarity.
- [`wolf-goat-cabbage.pl`](examples/wolf-goat-cabbage.pl) — Solves the wolf-goat-cabbage river crossing.
- [`zebra.pl`](examples/zebra.pl) — Solves the zebra logic puzzle.

## Golden outputs, tests, and conformance

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

## Development and release

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
2. update `README.md` and `SPEC.md`;
3. regenerate golden outputs if behavior changed;
4. run `make test`;
5. build browser assets if publishing the playground. The playground includes controls equivalent to CLI `--query GOAL` and `--explain`.

## Performance notes

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

## Implementation limits

Eyelog is intentionally smaller than ISO Prolog. It has no operators, cut, modules, dynamic database updates, DCGs, or complete ISO library. Negation is negation-as-failure through `not/1`. Search is goal-directed and expected to be finite for the supplied program and query. Output explanations are non-normative proof printouts and do not change answer semantics.
