# Specification conformance tests

Run `npm run test:conformance`, or `npm test` for all tests. No dependencies or
network services are required. The suite covers the subset in [SPEC.md](../../SPEC.md):

- `language.test.js` runs migrated regression programs with expected observations
  carried over from the previous suite. Fixtures use Prolog source, variable
  bindings, and query success/failure. Numeric rendering comparisons allow the
  earlier canonical integer spelling of integral reals.
- `inference.test.js` compares forward and tabled recursion against an independent
  transitive-closure oracle, checks variant calls, indexes, arities, and run isolation.
- `explanations.test.js` checks supplied evidence, concrete clause applications,
  arithmetic, absence, aggregation, complete proof steps, ARC grouping, and assertions.
- `cli.test.js` checks UTF-8 files/stdin, help/version, errors, exit status, source
  lines, and suppression of partial transcripts when a check fails.

Focused tests in `test/` cover the Prolog lexer, variables, compounds, unification,
lists, numeric types and operators, errors, aggregation, stratified negation,
all bundled `.pl` examples, and taxonomies through 100000 levels. Playground,
sharing, Pages paths, and version synchronization have separate integration tests.

The migrated fixtures preserve existing semantic regressions. New tests explicitly
cover the changed Prolog behavior: case sensitivity, integer/real distinction,
explicit `is/2`, arithmetic versus unification, and rounding halfway away from zero.
These finite tests do not establish completeness or termination for arbitrary programs.
