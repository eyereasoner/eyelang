# EyeProlog profile conformance suite

This directory contains executable tests for the EyeProlog implementation and
reasoner.
[*The Art of EyeProlog*](../../the-art-of-eyeprolog.md) is the reference for the
supported ISO Prolog profile, built-ins, extensions, and reasoner behavior.

The suite is intentionally file-based. Exact standard output, errors, warnings,
and proof output test the behavior of the JavaScript implementation.
[ISO-MATRIX.md](ISO-MATRIX.md) maps Part 1 normative clause families, all three
corrigenda, Part 2 modules, and Part 3 definite clause grammars to representative
executable cases. [WG17-SYNTAX-STATUS.md](WG17-SYNTAX-STATUS.md) records the
complete one-to-one trace for the vendored active upstream WG17 syntax cases.

“Conformance” here means conformance to EyeProlog's documented ISO compatibility
profile and implementation extensions. The default registry covers the exact
predicate indicators listed in Appendix B of the book across the supported
ISO/IEC 13211-1:1995, ISO/IEC 13211-2:2000, and ISO/IEC TS 13211-3:2025
standard families. [ISO-COMPLIANCE.md](ISO-COMPLIANCE.md) is the explicit
processor-requirement ledger for the Part 1 strict-core audit. This suite is
still not an independent certification of every processor requirement, lexical
edge, option combination, or prescribed error precedence. Cases under `iso/`
identify standards-derived behavior; other directories cover EyeProlog host
contracts and extensions.

All conformance files live under topic directories such as `arithmetic/`, `lists/`, `syntax/`, or `variables/`; new top-level numbered files should not be added. The report uses those directories as coverage categories.

A normal positive case consists of:

- `conformance/cases/<name>.pl` — input program;
- `conformance/expected/<name>.pl` — exact expected standard output, stored as EyeProlog-readable facts.

Expected-error cases consist of:

- `conformance/errors/<name>.pl` — input program that must fail during parsing or execution;
- `conformance/expected-errors/<name>.txt` — exact expected error message followed by a newline.

Expected-warning cases consist of:

- `conformance/warnings/<name>.pl` — input program run through the CLI with `--warnings`;
- `conformance/expected-warnings/<name>.pl` — exact expected standard output;
- `conformance/expected-warnings/<name>.txt` — exact expected standard error.

Expected-proof cases consist of:

- `conformance/proofs/<name>.pl` — input program run through the CLI with `--proof`;
- `conformance/expected-proofs/<name>.pl` — exact expected standard output, including both answer facts and `why/2` proof facts.

Case names may be nested in category directories such as `arithmetic/`, `strings/`, `lists/`, `terms/`, `atoms/`, `variables/`, `negation/`, or `syntax/`. Expected files mirror the same relative path.

## Running the suite

Run all tests, including conformance, regression, documentation sync, API,
examples, and book examples:

```sh
npm test
```

Run only the conformance suite:

```sh
node test/run-conformance.mjs
```

Run the Part 1 + Corrigenda strict-core processor gate:

```sh
npm run test:iso-strict
```

Run all vendored WG17 conformity matrices independently:

```sh
npm run test:wg17
```

Refresh the WG17 snapshot from the TU Wien conformity tables before a release
or whenever upstream changes:

```sh
npm run wg17:upgrade
npm run test:wg17
```

`wg17:upgrade` reconciles the upstream inventory by identifier: unchanged cases
keep their reviewed exact outcomes, removed cases disappear, and new or
semantically changed cases are executed directly against the upstream Codex
expectation. This means `npm run test:wg17` can test an upgraded snapshot
immediately without first copying EyeProlog's current behaviour into an
expected result. Normal `npm test` remains offline and uses only the committed
snapshot.

Summarize conformance coverage by category:

```sh
node test/run-conformance-report.mjs
node test/run-conformance-report.mjs conformance-report.md
```

Run matching conformance cases by passing a filename or directory fragment:

```sh
node test/run-conformance.mjs reusable
node test/run-conformance.mjs 092_scalar_string_conversions
node test/run-conformance.mjs variables/
node test/run-conformance.mjs error/variables
```

The runner executes normal programs with queries in-process through the public JavaScript API so small conformance cases avoid measuring Node startup overhead. Warning and proof cases intentionally use the CLI because warning output and `why/2` proof output are host-interface contracts.

## Scope

The corpus covers accepted syntax, typed scalar identity and explicit scalar conversions, query answers,
read-back printing, built-ins, directives, warnings, errors, proof output,
and host behavior. It verifies the book's descriptions and is not a separate
language specification.

The `iso/` category follows the mode, success/failure, and error rows in
ISO/IEC 13211-1 clauses 7 and 8. In particular, isolated negative cases keep
instantiation, type, domain, permission, representation, and evaluation errors
independently observable.

Selected cases are adapted from the ISO and standard-core suites of Logtalk,
Scryer Prolog, Trealla Prolog, and SWI-Prolog. Their upstream identifiers and licenses
are recorded in [THIRD_PARTY.md](THIRD_PARTY.md).

The corpus has 386 cases in `iso/` and 791 file-based conformance cases in
total. The separate strict-reader WG17 matrix has 366 executable dispositions.
The generated `conformance-report.md` is the authoritative source for current
category totals. Together with regression, documentation-sync, API, example,
and book-example checks, `npm test` is the release gate.

## Updating expected output

There is no committed auto-accept mode. To update an expected file, run the matching case with the conformance runner, inspect the result, and replace the corresponding file under `conformance/expected/`, `conformance/expected-errors/`, `conformance/expected-warnings/`, or `conformance/expected-proofs/` deliberately.
