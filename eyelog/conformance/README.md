# Eyelog conformance suite

This directory contains an executable conformance suite for the Eyelog Language Specification in `SPEC.md`.

The suite is intentionally file-based so other implementations can run the same cases. A case consists of:

- `conformance/cases/<profile>/<name>.pl` — the input program;
- optional `conformance/cases/<profile>/<name>.query` — the exact query to pass with `--query`;
- optional `conformance/cases/<profile>/<name>.explain` — presence means pass `--explain`;
- `conformance/expected/<profile>/<name>.out` — exact expected standard output.

Run all conformance cases with:

```sh
make test conformance
```

or directly:

```sh
./test/run.sh conformance
```

Run a single profile with:

```sh
./test/run.sh core
./test/run.sh extension
```

Regenerate expected outputs for the current implementation with:

```sh
./test/run.sh --accept conformance
```

## Profiles

`core` covers the core language profile from `SPEC.md`: syntax, facts, definite clauses, first-order terms, lists, conjunction, unification through user predicates, goal-directed proof search, and normal answer printing.

`extension` covers the C implementation extension profile from `SPEC.md`: built-ins, aggregation helpers, formula-term helpers, `materialize/2`, and default no-query derived output.

Explanation trees are intentionally not normatively compared yet, because `SPEC.md` defines explanation output as non-normative and answer-set preserving. A future suite can add answer-set checks for `--explain` once a stable machine-readable explanation format exists.
