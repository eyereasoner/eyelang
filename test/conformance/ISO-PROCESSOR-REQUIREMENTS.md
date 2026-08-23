# ISO Part 1 processor-requirements audit

This is the clause-level checklist for the processor requirements that sit
above the individual built-ins. It complements `ISO-COMPLIANCE.md`: the latter
is release-facing prose, while this file keeps each Clause 5 requirement or
extension boundary visible as its own auditable row.

The normative baseline is ISO/IEC 13211-1:1995 plus Technical Corrigenda 1-3.
`covered` means the requirement has an implementation/documentation decision
and executable evidence. `audit` means the implementation has relevant tests
but the project has not yet reduced every dependent Clause 6-9 requirement to
an explicit pass/not-applicable decision. No row here is an independent
certification claim.

## 5.1 — conforming processor obligations

| Requirement | Status | Current evidence / remaining work |
| --- | --- | --- |
| 5.1(a) prepare conforming Prolog text | audit | parser/preparation tests, directives, include behavior, preparation-time operators/flags/character conversion, and the complete vendored WG17 syntax matrix; the remaining Clause 6/7.4 shall-by-shall map is still open |
| 5.1(b) execute conforming Prolog goals | audit | Clause 7-9 suites plus the now-complete 8.2-8.17 row-audited built-in family in `ISO-BUILTIN-MODE-ERROR-MATRIX.md`; remaining Clause 7/9 processor-semantic rows are still being enumerated |
| 5.1(c) reject nonconforming text/read terms | audit | syntax-error corpus, WG17 negative syntax cases, strict extension rejection; exhaustive Clause 6 rejection mapping remains open |
| 5.1(d) specify permitted variations | covered | `ISO-IMPLEMENTATION-DEFINED.md` records the Part 1 implementation-defined choices and implementation-specific extension families |
| 5.1(e) offer a strictly conforming mode | covered | CLI `--iso-strict` and API `isoStrict: true`; registry/directive/operator/flag extension filtering plus disabled implementation-specific execution shortcuts |

## 5.2-5.4 — text, goals, and documentation

| Requirement | Status | Current evidence / remaining work |
| --- | --- | --- |
| 5.2 conforming and strictly conforming Prolog text boundary | audit | strict parser accepts Part 1 + Corrigenda syntax plus implementation-defined PCS choices and rejects implementation-specific language facilities; full Clause 6/7.4 dependency audit remains open |
| 5.3 conforming and strictly conforming Prolog goal boundary | audit | strict registry/control/evaluable filtering and Clause 7-9 regression suites; the built-in 8.2-8.17 mode/error rows are closed, while remaining general goal/control and Clause 9 semantic rows stay open |
| 5.4 accompanying documentation for implementation-defined and implementation-specific features | covered | `ISO-IMPLEMENTATION-DEFINED.md`, *The Art of EyeProlog*, strict-boundary documentation, and release-facing conformance ledgers |

## 5.5 — extension boundaries

| Requirement | Status | EyeProlog decision / evidence |
| --- | --- | --- |
| 5.5 general extension rule | covered | normal mode may provide documented extensions; strict mode removes their Part 1 interpretation rather than changing implementation-defined choices |
| 5.5.1 syntax extensions preserve standard token/text meaning | audit | WG17 syntax is a release gate and strict mode removes module/DCG/quad interpretation. Every vendored WG17 case that succeeds in the Part 1 strict reader now has an identical normal-profile observable outcome, directly checking that normal syntax extensions do not reinterpret accepted standard text. A complete one-row preservation map for every Clause 6 production remains open |
| 5.5.2 additional predefined operators | covered | strict mode starts from the Part 1 predefined operator table; normal-profile extra operators are documented and filtered |
| 5.5.3 initial character-conversion mapping | covered | identity initial mapping; user changes are exercised through preparation/execution `char_conversion/2` behavior |
| 5.5.4 additional term types | covered | the normal JavaScript API's `stringTerm(Text)` is documented as an implementation-specific sixth term type, including disjointness, ordering, clause conversion, lack of source token syntax, expression behavior, and writing; strict program/goal entry rejects that type with `representation_error(term)` |
| 5.5.5 additional directives | covered | normal module/library directives are documented implementation-specific features and are rejected by strict mode |
| 5.5.6 additional side effects | covered | normal-profile `statistics/0-2`, cleanup/library state, proof/statistics host instrumentation, and other extension effects are documented outside the Part 1 core; strict registry tests exclude the Prolog-visible statistics/cleanup extensions. Host instrumentation is an embedding observation rather than an extra strict Prolog goal effect |
| 5.5.7 additional control constructs | covered | `tnot/1` and implementation-specific execution optimizations are absent/disabled in strict mode; standard control constructs remain separately audited |
| 5.5.8 additional flags | covered | normal `occurs_check` extension is absent from strict mode; the Part 1 flag family is fully audited |
| 5.5.9 additional built-in predicates and error forms | covered | strict registry excludes normal-profile library/native additions; `ISO-BUILTIN-MODE-ERROR-MATRIX.md` closes the complete 8.2-8.17 family row-by-row; simultaneous-error choices are documented per 7.12 rather than treated as a global table-order mandate |
| 5.5.10 additional evaluable functors/types | covered | strict mode rejects the normal-profile evaluable `e` extension while retaining the full Part 1 + Corrigenda arithmetic set. The 9.1.4.2 `resultF` choice, Corrigendum 2 mixed-type `max/2`/`min/2` choice, and Clause 9.4 signed bitwise/shift choices are documented and pinned by strict tests. Post-N289 STC #75 remains separate from the published baseline; the remaining Clause 9 semantic/error audit is tracked under 5.1(b)/5.3 rather than as an open extension-boundary decision |
| 5.5.11 reserved atoms | not applicable | EyeProlog declares no reserved-atom extension; extension names remain ordinary atoms unless used in a documented syntactic/predicate/directive role |

## Exit-use rule

A top-level row stays `audit` until all of the normative clauses it depends on
have explicit pass, not-applicable, or documented implementation-defined
outcomes. This prevents a large green regression suite from being mistaken for
a completed processor-requirement audit.
