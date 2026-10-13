# Specification conformance tests

Run the conformance suite with Node.js 18 or later:

```sh
npm run test:conformance
```

`npm test` includes this suite alongside the example and regression tests.
No dependencies, network services, or sibling repositories are required.
Each test name has a stable case ID and references a section of [SPEC.md](../../SPEC.md).

| Specification | Coverage | Files |
| --- | --- | --- |
| §2: Program model | Whole-file evaluation, separate relation identities, checks request rather than assert | `questions-checks.json`, `inference.test.js` |
| §3.1: Source text | UTF-8, case and whitespace normalization, comments, punctuation, source lines | `lexical.json` |
| §3.2: Names and variables | Unicode names, reserved words, fixed relations, scope, repeated variables, forbidden contexts | `lexical.json` |
| §3.3–3.4: Numbers and text | Exact integer canonicalization, binary64 limits, matching versus numeric equality, JSON escapes and distinct value types | `lexical.json` |
| §3.5: Lists | Structural matching, nested lists, tail flattening, repeated variables, improper-list rejection | `lexical.json`, `inference.test.js` |
| §4: Facts and rules | Ranges, articles, safe binding order, ground answers, backward head inputs and calculations | `lexical.json`, `inference.test.js` |
| §5: Arithmetic and comparisons | Precedence, associativity, exact integers, quotients and remainders, rounding, extrema, bits, constants, real functions, domain errors, type rejection, UTF-16 text ordering, computed negation | `arithmetic.json`, `extended-arithmetic.json` |
| §6.1: Positive inference | Set semantics, demand, recursive fixed points, variant calls, repeated-variable constraints, run isolation, source and question order | `inference.test.js` |
| §6.2–6.3: Negation and scope | Completed producer layers, empty recursive components, conservative negative-cycle rejection, finite deep chains | `inference.test.js` |
| §7.1: Questions | All question shapes, yes/unknown/absence distinctions, ground calculations, controlled verb inflection | `questions-checks.json` |
| §7.2: Aggregation | Plural labels, distinct subjects and facts, exact totals and extrema, empty sets, finite backward enumeration, insufficient inputs | `questions-checks.json`, `inference.test.js` |
| §8: Explanations | Supplied and derived evidence, concrete bindings, all answer roots, completed absence, computed values, aggregates, shared steps, complete digits, follow-up context | `explanations.test.js` |
| §9: Checks | Positive, negative, computed and aggregate assertions, groundness, first failure, source lines, deferred evaluation | `questions-checks.json`, `inference.test.js`, `explanations.test.js` |
| §10: CLI and errors | File/stdin equivalence, UTF-8 paths and programs, help/version, argument errors, exit status, stderr, no partial transcripts, ARC sections | `cli.test.js`, `explanations.test.js` |

The JSON fixtures are executable source programs with independent expected
answers or required errors. `language.test.js` runs them through the public
`run` API. Fixtures contain:

- `id`, `section`, and `name`: the case identity and requirement it exercises.
- `source`: a complete eyelang program.
- `expected`: one rendered block per question and then per successful check.
- `error` and optional `line`: a diagnostic pattern and required source line
  for a rejected program, instead of `expected`.

The fixtures check reference rendering as well as language behavior. Ordinary
answer sets are compared without imposing an answer order, while preserving
block order and detecting duplicate answers. Explanation tests check the
supporting evidence and local bindings without fixing rule numbers or which
valid derivation wins. The graph tests use an independent reachability matrix
and compare forward, backward, and mixed rules under different source and
question orders. CLI tests run subprocesses and clean up their temporary files.

These finite cases exercise the normative requirements; they are not a proof
of completeness or termination for arbitrary programs. Example-specific
mathematical oracles and large-program regressions remain in the rest of `test/`.
