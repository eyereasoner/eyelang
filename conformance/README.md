# SEE conformance suite

This directory contains the executable conformance cases for the SEE language and reference engine. The normative language description is in [`../SPEC.md`](../SPEC.md).

The suite is intentionally file-based so another implementation can run the same programs and compare exact standard output. A case consists of:

- `conformance/cases/<profile>/<name>.pl` — input program;
- optional `conformance/cases/<profile>/<name>.query` — query text passed to `see --query`;
- `conformance/expected/<profile>/<name>.out` — exact expected standard output.

The current runner compares only standard output. Standard error, performance, resource limits, and explanation tree formatting are outside this suite.

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

The runner executes cases through the public CLI path `bin/see`, so the suite checks the same entry point used from the shell.

## Profiles

`core` covers the portable core language profile from `../SPEC.md`: lexical syntax, facts, definite clauses, first-order terms, lists, conjunction, unification through user predicates, left-to-right goal-directed proof search, and normal answer printing.

`extension` covers the standard built-in and host behavior exercised by the current reference implementation: arithmetic, comparison, strings, list relations, aggregation, formula-term helpers, `memoize/2`, `materialize/2`, and default no-query derived output.

The profile name `extension` is a test-suite grouping name. It does not mean that these cases are outside the SEE specification; most of them correspond to the standard built-in profile and standard host profile in `../SPEC.md`.

## Why output

`see --why` is intentionally not compared by this conformance suite yet. The specification treats why output as non-normative and answer-set preserving, so stable conformance first compares ordinary answers. A future suite can add proof-fact checks if the `why/2`, `proof/3`, `source/3`, `binding/3`, and `uses/2` vocabulary becomes normative.

## Updating expected output

There is no committed auto-accept mode. To update an expected file, run the matching case with `bin/see`, inspect the result, and replace the corresponding file under `conformance/expected/<profile>/` deliberately.
