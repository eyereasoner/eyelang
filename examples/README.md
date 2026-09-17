# Eyelang examples

The flat suite contains 76 native Eyelang programs. Seventy-three complete
normally; three deliberately exercise static or runtime rejection. Successful
examples have answer documents in [output](output) and explanation documents in
[proof](proof), both written as ordinary `.eye` syntax.

Run examples from the project root:

```sh
node bin/eyelang.js examples/ancestor.eye
node bin/eyelang.js examples/sudoku.eye
node bin/eyelang.js --proof examples/modular-exponentiation.eye
node bin/eyelang.js examples/proof/socrates.eye examples/proof-audit.eye
npm test
```

[suite.json](suite.json) is the complete inventory and records the three
expected-error programs. Every other example must contain at least one question
and complete with at least one successful question.

## What is exercised

- Recursion and tabling: ancestry, cyclic reachability, Fibonacci, lists, and
  grammar recognition/generation.
- Search: four queens, Hanoi, river crossing, shortest paths, and Sudoku.
- Arithmetic: Peano terms, modular exponentiation, scheduling, BMI, scoring,
  filtering, and aggregation.
- Closed reasoning: stratified negation, collections, policy decisions, and
  proof auditing.
- Structured knowledge: graph-shaped data, quoted triples, reification,
  annotations, collections, and property-path expansions.
- Scale: parameterized deep taxonomies and relational cube lookup.

The deep-taxonomy programs retain the `N` superclass spine, terminal and
incomparable `I`/`J` side branches at every level, and final `A2` superclass.
Their transitive subsumption rules use compact class terms so the 100,000-level
case remains runnable without storing an expanded answer.

The Sudoku source contains only its givens and a call to the general `sudoku/2`
engine relation. The same relation is tested on a separate puzzle. Neither
completed grid is embedded in an example or test input.

## No precomputed answers

Problem inputs may be facts; computed results must come from rules or built-ins.
The semantic tests replay plans and moves, check graph and scheduling invariants,
perturb inputs at boundary conditions, validate Sudoku constraints, compare
arithmetic against independent calculations, and inspect proof chains to ensure
the designated computed predicates were derived rather than asserted as answer
facts. Golden output files are closure fixtures, not the source of expectations.

`proof-audit.eye` is the only example whose input is assembled dynamically: the
test harness first evaluates `socrates.eye`, serializes its explanation, and then
loads that explanation with the audit rules.

Regenerate the suite and its checked documents after intentional changes:

```sh
node tools/update-example-suite.js
node tools/update-examples.js
npm test
```

Review generated answer and proof diffs. Passing a saved-output comparison alone
does not demonstrate that an algorithm is correct, which is why computational
examples also have independent semantic checks.
