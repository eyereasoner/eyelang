# Eyelog 1.0.0

Eyelog 1.0.0 is the first major source release of the compact C rule engine.

Highlights:

- Prolog-style Horn clauses over ordinary terms, lists, arithmetic, strings, and finite search.
- Default no-query output materializes distinct new binary derivations of the form `p(S, O)`.
- `materialize(Name, Arity).` declarations focus default output on selected predicates.
- `--query GOAL` runs explicit goals of any supported arity.
- `--explain` prints experimental proof trees for default output and query answers.
- Browser build support through Emscripten and the included playground.

Validation: `make test` checks the CLI, syntax, built-ins, browser-oriented examples, and all golden outputs.
