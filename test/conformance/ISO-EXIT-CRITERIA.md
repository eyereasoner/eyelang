# ISO Part 1 audit exit criteria

Issue #65 is intentionally closed by evidence rather than by a single large
test count. This checklist defines what must be true before EyeProlog can remove
the remaining qualification that its strict ISO/IEC 13211-1 profile is still
under systematic audit.

The normative baseline is ISO/IEC 13211-1:1995 plus Technical Corrigenda 1-3.
Post-N289 STC drafts are review input only until standardized.

## Exit checklist

| Criterion | Status | Evidence / remaining work |
| --- | --- | --- |
| Clause 5 processor obligations have explicit dispositions | open | `ISO-PROCESSOR-REQUIREMENTS.md` still has dependent audit rows for preparation/execution/rejection and syntax preservation |
| Clause 6 lexical/syntactic requirements have explicit dispositions | open | 366-case vendored WG17 syntax gate and cross-profile preservation are green, but the production-by-production shall/rejection map is not yet complete |
| Clause 7 semantic requirements have explicit dispositions | open | 7.1-7.3 and 7.9 are now closed; 7.4-7.8, higher-level 7.10, and residual processor-level 7.12 rows remain |
| Clause 8 built-in modes/errors have explicit dispositions | covered | `ISO-BUILTIN-MODE-ERROR-MATRIX.md` closes 8.2-8.17 row by row |
| Clause 9 evaluable-functor requirements have explicit dispositions | covered | `ISO-EVALUABLE-FUNCTOR-MATRIX.md` plus the strict arithmetic regression closes the published Part 1 + Corrigenda arithmetic rows |
| Implementation-defined choices are documented | covered | `ISO-IMPLEMENTATION-DEFINED.md` is the Clause 5.4 decision index and strict tests pin the behavior that affects execution |
| Implementation-specific strict/normal boundary is documented and tested | open | major 5.5 hooks are closed; exhaustive 5.5.1 syntax-preservation mapping remains tied to the Clause 6 audit |
| Published Corrigenda 1-3 are incorporated | covered | dedicated conformance/strict tests and the compliance matrix track all three published Corrigenda |
| Current post-N289 draft is tracked without changing the published baseline silently | covered | `STC-DRAFT-STATUS.md` tracks the reviewed 2026-08-23 items #73-#76, including the deliberate published-baseline treatment of #75 |
| Independent external syntax corpus is an offline release gate | covered | vendored active WG17 syntax matrix: 366 executable dispositions, checked against upstream expectations and reviewed exact outcomes |
| Third-party standard-core regression evidence is retained with provenance | covered | adapted Logtalk, Scryer, Trealla, and SWI-Prolog cases are vendored under `iso/`; `THIRD_PARTY.md` records origin and licenses |
| Known external-corpus deviations are explained and pinned | covered for vendored gates | the Prologue `bounded=false` / `max_integer` divergence is retained as upstream material and explicitly regression-tested; WG17 rows independently validate upstream expectation before any local reviewed snapshot can pass |
| External conversion/variable-name comparisons used during the audit are reproducible offline | open | focused behavior is already covered internally, but the remaining public comparison material has not all been normalized into a vendored offline fixture |
| Optional cross-engine runs have no unexplained deviations | open / environment-dependent | external-engine runner evidence is useful corroboration but is not substituted for normative ISO rows; release environments without those engines record the gate as unavailable rather than silently passing it |
| No unexplained deviation remains in the release-facing ledger | open | may become covered only when every open normative/external item above is either fixed, declared not applicable, or documented as a permitted implementation-defined/dependent choice |

## What counts as an explained deviation

A difference from an external corpus or another Prolog implementation is not an
automatic conformance defect. It is explained only when the repository records
which of these applies and has an executable regression where applicable:

- EyeProlog was wrong and was fixed to the published baseline;
- the external expectation reflects a different permitted implementation-defined
  or implementation-dependent choice;
- the external fixture itself targets behavior outside the published baseline;
- a later STC draft proposes a change that is not yet a published Corrigendum;
- the behavior is an EyeProlog implementation-specific extension excluded from
  `--iso-strict`; or
- the condition is genuinely not applicable to EyeProlog's declared processor
  model.

An unexplained mismatch, host exception, skipped vendored row, or documentation
claim without executable support keeps the relevant exit criterion open.

## Release use

`ISO-COMPLIANCE.md` is the release-facing status ledger. This file is the exit
checklist behind it. Closing a row here must not be inferred solely from a test
count: the corresponding normative or external evidence must be identifiable
and the user-facing documentation must describe the same boundary.
