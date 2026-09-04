# ISO Part 2 and Part 3 compatibility scope

EyeProlog's release-facing `--iso-strict` claim is deliberately limited to
ISO/IEC 13211-1:1995 together with Technical Corrigenda 1:2007, 2:2012, and
3:2017. This note records the separate status of the normal-profile facilities
that overlap ISO/IEC 13211-2:2000 (modules) and ISO/IEC TS 13211-3:2025 (definite
clause grammar rules). It is a scope ledger, not an independent certification.

## Part 2 modules

Normal mode implements a procedure-oriented module compatibility layer:
`module/2`, `use_module/1-2`, `meta_predicate/1`, explicit `Module:Goal`
qualification, exports/imports, nonterminal indicators, and module-aware meta
calls are covered by the regression and conformance corpora.

The requirements clarified by the 2013 ISO/IEC 13211-2 module amendment draft
(WG17 N251) now have a dedicated executable ledger in
`ISO-PART2-AMENDMENT-2013.md`: module/2 exports, selective and full imports, the
module-source behavior of ensure_loaded/1, the amendment's meta_predicate
directive spelling, and visible caller-module qualification of `:`
meta-arguments. The focused runner is part of the release gate.

This amendment coverage is intentionally narrower than a complete Part 2
conformance claim. In particular, the Part 1 strict registry does not enable
module directives or the Part 2 `:` operator, and the project does not infer
full Part 2 coverage from interoperability with Scryer, Trealla, or Logtalk. A
future complete Part 2 claim would require a clause-by-clause audit of the
unchanged ISO/IEC 13211-2:2000 module-interface and re-export facilities as well
as the amendment.

## Part 3 definite clause grammars

Normal mode expands grammar rules to ordinary predicates and supports terminal
sequences, sequencing, alternatives, semicontexts, embedded goals, cut,
`call//1`, `phrase//1`, `phrase/2-3`, module-qualified nonterminals, and the
implementation-dependent negation/if-then choices documented in the reference.
`--iso-strict` leaves `-->/2` as ordinary Part 1 operator syntax and excludes
Part 3 grammar expansion and `phrase/2-3` from the strict registry.

One compatibility difference is explicit: EyeProlog currently reports
`type_error(list)` when its `phrase/2-3` terminal-sequence validation rejects a
non-list. The Part 3 terminal-sequence specification uses its own terminal
sequence error category. EyeProlog retains the list-shaped error for its normal
interoperability profile, so this behavior must not be presented as evidence of
complete Part 3 conformance.

The Part 3 implementation otherwise keeps sequence validation, grammar-body
callability, variable-body instantiation errors, `phrase/3` steadfastness, and
grammar expansion under focused executable tests. Changes intended to advance a
formal Part 3 claim should update this ledger and the corresponding error cases
rather than silently changing the compatibility profile.

## Release boundary

- Part 1 + Corrigenda 1-3: release-facing strict-core conformance target.
- Part 2: 2013 amendment requirements release-gated; broader Part 2 remains a normal-mode compatibility profile, not a complete certification.
- Part 3: normal-mode compatibility profile, tested but not certified complete.

This separation keeps Part 1 conformance evidence independent of useful module
and DCG extensions while making known Part 2/Part 3 scope limits visible.
