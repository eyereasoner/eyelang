# WG17 syntax traceability status

Source: [Conformity Testing I: Syntax](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing)  
Upstream inventory checked: 2026-08-16

This ledger counts an upstream case when its WG17 identifier, query, and
expected ISO disposition are stored in the offline executable matrix. Every
case is executed against the upstream Codex expectation. Reviewed exact
EyeProlog outcomes are additional regression locks and can never override the
upstream assertion.

## Current standing

| Measure | Count |
| --- | ---: |
| Active upstream cases | 366 |
| Executable EyeProlog dispositions | 366 (100.0%) |
| Not yet traced one-by-one | 0 |
| Deleted upstream identifiers | #20, #273 |

The matrix runs in strict ISO stream-reader mode as part of `npm test`. The
3 upstream `waits` cases are checked through EyeProlog's interactive input
hook. All 366 executable cases are independently checked against the
upstream Codex expectation. 365 cases additionally retain exact reviewed
outcomes for stronger regression checking; 1 case currently relies on the upstream assertion alone.

## Traceable evidence

| Executable evidence | Referenced IDs | WG17 cases |
| --- | ---: | --- |
| [complete offline executable matrix](../run-wg17.mjs) | 366 | #1–#19, #21–#272, #274–#368 |

The evidence groups overlap. Their union is **366** active cases:
#1–#19, #21–#272, #274–#368.

## Untraced upstream identifiers

None.

## Maintenance

1. Run `npm run wg17:upgrade` to reconcile the dated fixture with upstream.
2. Review every new or changed ISO expectation before adding its expected outcome.
3. Run `npm run test:wg17` and keep this generated status page synchronized.
