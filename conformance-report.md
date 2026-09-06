# EyeProlog conformance report

This report combines an executable external conformance gate with the file-based
conformance corpus under `test/conformance/`. The executable result is measured
when this report is generated; it is not inferred from fixture counts.

## Latest Neumerkel evidence

See the tracked [latest Neumerkel conformity report](test/conformance/NEUMERKEL-LATEST.md).
`npm test` fetches all seven TU Wien sources once and executes the discovered inventory.
The release workflow then synchronizes this tracked report from those exact successful
cached source bytes, avoiding a second live fetch and its race window.

## Executable conformance status

| Gate | Passed | Total | Status |
|---|---:|---:|---|
| WG17 syntax | 366 | 366 | pass |

The WG17 syntax row executes the vendored 366-case conformity-testing matrix
against EyeProlog's strict ISO reader/writer. A behavior fix such as operator-token
spelling therefore changes this report even when no corpus file is added or removed.

## File-based corpus inventory

| Category | Positive | Errors | Warnings | Proofs | Total |
|---|---:|---:|---:|---:|---:|
| aggregation | 18 | 0 | 0 | 0 | 18 |
| arithmetic | 38 | 0 | 0 | 0 | 38 |
| atoms | 23 | 8 | 0 | 0 | 31 |
| builtins | 11 | 0 | 0 | 0 | 11 |
| context | 11 | 0 | 0 | 0 | 11 |
| control | 15 | 0 | 0 | 0 | 15 |
| explicit-tabling | 6 | 0 | 0 | 0 | 6 |
| iso | 171 | 217 | 0 | 0 | 388 |
| lists | 52 | 3 | 0 | 0 | 55 |
| modules | 2 | 0 | 0 | 0 | 2 |
| negation | 8 | 0 | 19 | 0 | 27 |
| proofs | 0 | 0 | 0 | 21 | 21 |
| query | 8 | 2 | 0 | 0 | 10 |
| rules | 13 | 3 | 0 | 0 | 16 |
| stc | 5 | 6 | 0 | 0 | 11 |
| strings | 40 | 0 | 0 | 0 | 40 |
| syntax | 12 | 23 | 0 | 0 | 35 |
| terms | 26 | 3 | 0 | 0 | 29 |
| unification | 18 | 0 | 0 | 0 | 18 |
| variables | 16 | 7 | 0 | 0 | 23 |
| **Total** | **493** | **272** | **19** | **21** | **805** |

## Known deviations

These are conscious departures from a standards clause, not open defects.

### phrase/2-3 terminal-sequence type errors

ISO/IEC TS 13211-3:2023, 8.18.1.4 c and d specify that a processor which
checks the terminal-sequence arguments of `phrase/2-3` shall report
`type_error(terminal_sequence, S)`. Error clause c is required for
`phrase/2` and implementation defined for `phrase/3`.

EyeProlog checks both arguments but reports `type_error(list, S)`.
Ulrich Neumerkel's `phrase_quad.pl` corpus, which the release gate fetches
live from TU Wien, accepts only `false` or `type_error(list, S)` for quads
41 and 42, so the published TS and that corpus cannot both be satisfied.
The corpus predates the TS. Changing the error term is a one-line edit in
`phraseSolutions` (`src/iso.js`); it additionally requires relaxing quads
41-42 of the Neumerkel gate.

Note that TS 13211-3, 7.14.7.2 gives `phrase({true}, nonlist, S)` as an
example which succeeds with `S = nonlist`, which is consistent with the TS
permitting `phrase/3` to omit the check entirely. EyeProlog prefers the
stricter diagnostic that the TS also explicitly allows.

