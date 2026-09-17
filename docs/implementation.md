# Reference implementation

The interpreter uses only JavaScript and Node built-ins. The public evaluator imports no Node
modules; the CLI alone handles files and standard input. Browser packaging has
not yet been added or tested.

| File | Responsibility |
| --- | --- |
| `src/terms.js` | Tagged values, substitutions, occurs-check unification, variant keys, printing |
| `src/parser.js` | Tokens, fixed grammar, clause-local variables, expression precedence |
| `src/analyze.js` | Predicate definitions and positive/closed dependency analysis |
| `src/builtins.js` | Ground computations and finite built-in relations |
| `src/engine.js` | Demand tables, dependency queue, completed subqueries, explanations, limits |
| `src/output.js` | Native Eyelang result/check records and structured proof serialization |
| `index.js` | `run`, `check`, and public term helpers |
| `bin/eyelang.js` | Files, stdin, queries, output formats, exit status |

## Positive evaluation

Each distinct call pattern, modulo variable renaming, creates a table. A work
queue evaluates matching clauses for that table. Calling another user relation
registers a dependency and consumes its current answers. Adding an answer
reschedules the dependent tables. The queue drains at the fixed point.

Recursive relation calls never recursively invoke the JavaScript evaluator.
The implementation does use ordinary recursion to traverse terms and finite
body conjunctions. A very deeply nested term or exceptionally long body can
therefore reach a JavaScript stack limit.

This is a replay-based, demand-driven fixed-point reference algorithm. It is
not continuation-based SLG resolution, and it is not a semi-naive materializer.
It deliberately repeats clause joins when dependencies gain answers, which can
be costly for large closures. Variant tables do not perform call or answer
subsumption.

## Completed dependencies

The analyzer forbids cycles crossing negation or collection. At runtime, a
closed dependency is evaluated in an isolated table engine against the same
immutable rules, sharing work limits and proof storage. A negative ground call's
existence result is cached for the run. Collections currently recompute their
nested query on replay.

This simple design prevents negation from observing an unfinished positive
table. It does duplicate work across nested engines and can use the JavaScript
stack for long chains of closed dependencies. An eventual shared stratified
scheduler must preserve the completion boundary, not just cache partial answers.

## Validation strategy

Tests exercise recursive cycles with and without seeds, repeated proofs,
fresh variable instances, open-list relations, occurs checks, arithmetic precision,
stratification, collection scope, resource limits, residual variables, and CLI
behavior. Every example has explicit expected answers or structural assertions.

The examples are native Eyelang programs. Algorithmic examples are checked with
independent invariants and input perturbations in addition to exact answers.

Result and proof documents for all normally completing examples are saved under `examples/output`
and `examples/proof`. Closure tests parse, load, print, and reparse those documents
and compare terms modulo variable renaming. CLI tests pass exported data into a
second invocation. The proof-audit example consumes a freshly generated Socrates
proof and performs dependency analysis using Eyelang rules.

Proof records retain structured terms alongside the original human-readable API
fields. Premise terms are instantiated with the final clause environment, while
collection-local variables are freshly scoped on entry and cannot be rebound by
later goals in the enclosing clause. The writer formats a complete statement at
a time, preserving variable identity across its fields.

## Next implementation decisions

1. Continue auditing every example's required semantics, not just its name.
2. Specify static calling modes and collection variable scope more strongly.
3. Add generic finite-domain constraints with residual constraint answers.
4. Define an RDF value boundary before adding RDF syntax adapters.
5. Specify quoted scopes, existential identity, and generated-rule activation
   together with their dependency and proof implications.
6. Optimize the measured bottlenecks of representative taxonomy and search cases.

Independent proof checking needs a specified certificate format and replayable
built-in semantics; the current explanation objects do not satisfy that goal.
