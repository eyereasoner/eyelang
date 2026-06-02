# eyelog conformance suite

This directory contains the executable conformance cases for the eyelog language and reference engine. The normative language description is in [`../SPEC.md`](../SPEC.md).

The suite is intentionally file-based so another implementation can run the same programs and compare exact standard output. A case consists of:

- `conformance/cases/<profile>/<name>.pl` — input program;
- optional `conformance/cases/<profile>/<name>.query` — query text passed to `eyelog --query`;
- `conformance/expected/<profile>/<name>.out` — exact expected standard output.

The current runner compares standard output, including answer facts and their `why/2` explanation facts. Standard error, performance, and resource limits are outside this suite.

## Running the suite

Run all tests, including conformance, regression, examples, and style checks:

```sh
npm test
```

Run only the conformance suite:

```sh
npm run test:conformance
```

Run a single conformance profile directly:

```sh
node test/run-conformance.js core
node test/run-conformance.js extension
```

The runner executes cases through the public CLI path `bin/eyelog`, so the suite checks the same entry point used from the shell.

## Profiles

`core` covers the portable core language profile from `../SPEC.md`: lexical syntax, facts, definite clauses, first-order terms, lists, conjunction, unification through user predicates, left-to-right goal-directed proof search, and answer printing with explanations.

`extension` covers the standard built-in and host behavior exercised by the current reference implementation: arithmetic, comparison, strings, list relations, aggregation, formula-term helpers, `memoize/2`, `materialize/2`, and default no-query derived output.

The profile name `extension` is a test-suite grouping name. It does not mean that these cases are outside the eyelog specification; most of them correspond to the standard built-in profile and standard host profile in `../SPEC.md`.

## Updating expected output

There is no committed auto-accept mode. To update an expected file, run the matching case with `bin/eyelog`, inspect the result, and replace the corresponding file under `conformance/expected/<profile>/` deliberately.
