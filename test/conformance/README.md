# Specification conformance tests

Run `npm run test:conformance`, or `npm test` for all tests. The conformance
suite uses Node.js with no dependencies or network services. Requirements and
expected results come from the current [SPEC.md](../../SPEC.md).

| Specification requirements | Coverage |
| --- | --- |
| §1: answer order is unspecified | `helpers.js` compares answer sets within each query block, preserving duplicate counts, query order, and exact term spelling. |
| §2: complete-program loading, statement boundaries, source order | `language.test.js`, `cli.test.js` |
| §3: atoms, strings, escapes, variable scope, projection, source lines | `language.test.js` |
| §3–4: compounds, lists, occurs check, unit clauses, ground outputs, explicit arithmetic, binding order | `terms.test.js`, `language.test.js` |
| §3, §5: exact integers, finite reals, distinct numeric types, precedence, arithmetic functions, builtins, and errors | `arithmetic.test.js` |
| §6: set semantics, fixed points, clause order, table declarations, variant calls, recursion, run isolation | `inference.test.js`, `terms.test.js` |
| §6: completed negation, stratification, arity and constant dependencies, bound negative tests | `negation.test.js`, `aggregation.test.js` |
| §7: distinct completed producer tuples, empty aggregates, exact sums, extrema, outer bindings, local variables | `aggregation.test.js` |
| §8: supplied facts, applied clauses, arithmetic, absence, aggregates, complete proof steps, explanation context | `explanations.test.js` |
| §9: existential checks, check order, source lines, checks do not assert facts | `explanations.test.js`, `cli.test.js` |
| §10: files/stdin, help/version, errors, exit status, ARC grouping and query context, no partial transcript | `cli.test.js`, `explanations.test.js` |
| §12: rejected syntax and operations outside the subset | `language.test.js`, `terms.test.js`, `arithmetic.test.js`, `negation.test.js` |

Expectations are written alongside small programs and name the behavior under
test. Integer and real spellings are compared exactly: `1` and `1.0` are
distinct terms. Reachability tests use an independent transitive-closure
algorithm for both forward and tabled inference. Tests do not require a
particular first proof when several derivations are valid.

`npm test` also runs the behavior regressions in `test/language.test.js`, every
bundled example, and taxonomy evidence checks through 100000 levels (§11).
Example transcripts are compared with saved files in `examples/output/`,
including their answers, numbered proofs, and checks. These goldens record
the current answer order and selected derivation; they do not change the
specification's ordering guarantees. Taxonomies 1000, 10000, and 100000 use
structural evidence tests instead, with taxonomy 10 and 100 covering the
transcript format. `npm run examples:update` explicitly regenerates the
goldens; review the diff before accepting changes. Ordinary tests never
rewrite them.

Playground serving and sharing, Pages paths, and version synchronization have
separate integration tests in `test/`. Worker cancellation and copying/saving
complete output from a truncated preview (§6, §12) also require an
actual-browser check when changing the playground.

These finite tests check the stated cases; they do not establish completeness
or termination for arbitrary programs.
