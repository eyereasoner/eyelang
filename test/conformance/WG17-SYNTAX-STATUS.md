# WG17 syntax traceability status

Source: [Conformity Testing I: Syntax](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing)  
Upstream inventory checked: 2026-08-15

This ledger counts an upstream case only when its WG17 identifier, query,
expected ISO disposition, and observed EyeProlog outcome are stored in the
offline executable matrix. Semantically similar parser tests are not inferred
as coverage.

## Current standing

| Measure | Count |
| --- | ---: |
| Active upstream cases | 366 |
| Executable EyeProlog dispositions | 366 (100.0%) |
| Not yet traced one-by-one | 0 |
| Deleted upstream identifiers | #20, #273 |

The matrix runs in strict ISO stream-reader mode as part of `npm test`. The
three upstream `waits` cases are checked through EyeProlog's interactive input
hook; the other 363 cases are checked for their exact stored
success output, bindings, failure, or ISO error category.

## Traceable evidence

| Executable evidence | Referenced IDs | WG17 cases |
| --- | ---: | --- |
| [complete offline executable matrix](../run-wg17-syntax.mjs) | 366 | #1–#19, #21–#272, #274–#368 |

The evidence groups overlap. Their union is **366** active cases:
#1–#19, #21–#272, #274–#368.

## Untraced upstream identifiers

None.

## Maintenance

1. Refresh the dated fixture when the upstream table changes.
2. Review any changed ISO expectation before updating an observed snapshot.
3. Keep this generated status page synchronized in the release gate.
