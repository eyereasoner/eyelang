# ISO/IEC 13211-1 compliance ledger

This ledger is the release-facing audit for EyeProlog's ISO/IEC 13211-1 core.
The normative baseline is ISO/IEC 13211-1:1995 together with Technical
Corrigenda 1:2007, 2:2012, and 3:2017. It complements
[ISO-MATRIX.md](ISO-MATRIX.md), which maps standard families to representative
executable tests, and the generated [`conformance-report.md`](../../conformance-report.md),
which gives current case totals.

The ledger deliberately does **not** claim independent certification. A row
marked `covered` means EyeProlog has implementation and executable tests for
that family and no known open defect in the listed behavior. A row marked
`audit` means the family is implemented and tested, but the project has not yet
mapped every normative `shall`, option combination, prescribed error, and
error-ordering alternative to an individual executable assertion.

## Processor compliance requirements

| Requirement | Status | EyeProlog evidence / remaining work |
| --- | --- | --- |
| 5.1(a) prepare conforming Prolog text | audit | Clause 6 parser/tokenizer coverage, directive coverage, syntax-error corpus, and the [complete vendored WG17 syntax matrix](WG17-SYNTAX-STATUS.md). Wider shall-by-shall text-processing audit remains open. |
| 5.1(b) execute conforming Prolog goals | audit | Clause 7-9 conformance corpus plus regression/API/example gates. A normative goal-semantics ledger is still being expanded. |
| 5.1(c) reject nonconforming text/read-terms | audit | Dedicated syntax-error cases and strict-core extension rejection. Exhaustive lexical rejection coverage remains open. |
| 5.1(d) document permitted variations | covered | The clause-by-clause [ISO 5.4 decision index](ISO-IMPLEMENTATION-DEFINED.md) records every explicit implementation-defined decision found in the Part 1 + Corrigenda baseline and separately inventories implementation-specific extension families. Rows marked `audit gap` remain conformance work, but the variation is no longer undocumented. |
| 5.1(e) offer a strictly conforming mode | covered | `--iso-strict` and API option `isoStrict: true` restrict the processor to the Part 1 + Corrigenda 1-3 core language surface, remove EyeProlog-only registry/flag/operator features, and disable automatic tabling/recursion guards. |
| 5.4 accompanying documentation | covered | *The Art of EyeProlog* remains the implementation reference; [ISO-IMPLEMENTATION-DEFINED.md](ISO-IMPLEMENTATION-DEFINED.md) is the closed clause-by-clause 5.4 decision index and points each decision to implementation evidence or an explicit audit gap. |
| 5.5 extensions preserve standard text | covered | Default mode retains EyeProlog extensions; strict core mode removes their language/runtime interpretation. Regression tests ensure the default profile remains unchanged. |

## Normative language families

| Standard area | Status | Current evidence |
| --- | --- | --- |
| Clause 6 — tokens, terms, lists, operators, quoted text | audit | Complete vendored WG17 syntax matrix, `lexical_and_curly_terms`, `scryer_lexical_terms`, operator suites, syntax-error cases, quoted-layout/escape error cases, writer/read-back regressions, and strict ASCII PCS/collation boundary tests. The implementation-defined 6.5/6.6 character-model decisions are now closed; wider shall-by-shall lexical mapping remains open. |
| 7.1-7.3 — term types, term order, unification | audit | Standard-order, identity, finite-tree and occurs-check suites, Corrigendum 2 term predicates, plus strict checks for the required `variable < float < integer < atom < compound` type order, PCS-based atom collation, and the finite `max_arity` representation boundary used by term construction. |
| 7.4 — Prolog text and directives | audit | All Part 1 directive indicators are parsed; include/ensure-loaded/operator/flag/character-conversion behavior has executable coverage. Preparation-time `char_conversion/2` affects later unquoted source text and respects `char_conversion=off`. Strict preparation now enforces declaration-before-clause ordering for `dynamic/1`, `multifile/1`, and `discontiguous/1`, cross-text `multifile/1`, discontiguous clause grouping, empty declared procedures, include textual-replacement behavior, and one-time initialization per prepared program. The remaining shall-by-shall mapping is still open. |
| 7.5-7.6 — database and term/clause conversion | audit | Dynamic database and logical-update-view suites. Strict mode restores Part 1 private-static/public-dynamic `clause/2` access; focused strict checks now cover `current_predicate/1`, `clause/2`, `asserta/1`, `assertz/1`, `retract/1`, Corrigendum 2 `retractall/1`, and `abolish/1` errors plus empty-procedure lifetime. The remaining clause-conversion shall-by-shall mapping is still open. |
| 7.7 — execution and backtracking | audit | Control/search suites. Strict mode disables EyeProlog automatic tabling, cycle guards, and recursive numeric shortcuts so core execution uses ordinary clause selection/backtracking. |
| 7.8 — control constructs and exceptions | audit | call, cut, conjunction, disjunction (including failed branches after callee-local cuts), if-then, catch/throw, renamed-copy tests. |
| 7.9 — expression evaluation | audit | Arithmetic/evaluation/error suites, including Corrigenda. Strict mode now also pins direct-variable precedence, arithmetic operand type errors, float-only rounding conversions, zero-to-negative-power undefined errors, and the Part 1 mixed integer/float comparison conversion rule. Exceptional-value/error-precedence mapping remains to be exhaustively enumerated. |
| 7.10 — input/output concepts | audit | Stream, character/byte I/O, read/write options, operator-sensitive write-back, and Corrigendum 3 writer cases. The audit now also covers write-mode creation/truncation, append creation, repositioned overwrite, flushing, EOF actions, close/current-stream handling, strict stream-position terms, stream-property validation, stream-term requirements, and text-vs-binary permission errors. The full option/mode cross-product is still being mapped. |
| 7.11 — flags | covered | The complete Part 1 flag set, selected defaults, standard value domains, changeability, `current_prolog_flag/2`, and `set_prolog_flag/2` error behavior have dedicated strict tests. EyeProlog selects `bounded=false` and `integer_rounding_function=toward_zero`; valid alternative values of those fixed flags reach `permission_error(modify,flag,...)`, while `max_integer` and `min_integer` have no current value. Strict mode excludes the EyeProlog `occurs_check` extension. |
| 7.12 — errors | audit | ISO `error(Error, Context)` envelope, type/domain/permission/representation/evaluation/syntax families and focused error cases. Exact ISO 8.14.1-8.14.4 error precedence is covered for `read_term/3`, `write_term/3`, `op/3`, and `current_op/3`; the continuing audit has corrected additional 8.11-8.13 stream/character/byte errors, Corrigendum 2 `keysort/2` errors, atomic-conversion list-shape precedence, `arg/3`, `atom_concat/3`, `sub_atom/5`, `char_conversion/2`, and arithmetic culprit/precedence reporting. A complete one-row-per-prescribed-error ordering map remains open. |
| 8.2-8.17 — built-in predicates | audit | Predicate-family coverage is mapped in ISO-MATRIX.md; Corrigendum 2 additions (`subsumes_term/2`, `term_variables/2`, `call/2..8`, `false/0`) are in the strict registry. The audit now includes corrected `keysort/2` variable/non-pair errors, stricter 8.11-8.13 stream and character/byte modes/errors, the 8.14 option/error-order subfamily, closed 8.17 flags, and additional prescribed precedence for `arg/3`, `atom_concat/3`, `sub_atom/5`, number/atom list conversions, and `char_conversion/2`. The remaining mode/error matrix is not yet one-row-per-standard-row. |
| Clause 9 — evaluable functors | audit | Integer/float/rounding/transcendental/bitwise suites and corrigendum cases. Strict mode excludes the EyeProlog-only evaluable atom `e`, retains Corrigendum 2 arithmetic additions, reports unknown zero-arity evaluables with the required `F/0` culprit shape, enforces the Part 1 numeric/integer operand errors and float-only rounding modes, and uses the Part 1 integer-to-float conversion rule for mixed arithmetic comparisons. Normal mode retains EyeProlog's exact mixed-type comparison extension. Host floating-point representation choices remain documented implementation-defined behavior; exhaustive exceptional-value precedence remains open. |
| Corrigendum 1 | covered | Double-quoted atom/operator-priority corrections have dedicated cases. |
| Corrigendum 2 | covered | Added predicates/functors, catch corrections, bar/operator and uninstantiation corrections have dedicated cases. |
| Corrigendum 3 | covered | Writer options, `variable_names/1`, canonical list output and negative-power corrections have dedicated cases. |

## Issue #65 conformance corrections

The issue #65 audit against the licensed Part 1 text and Corrigenda closed two
concrete mismatches without changing the remaining audit rows into blanket
conformance claims:

- `bounded=false` no longer exposes implementation-specific `unbounded` values
  for `max_integer` or `min_integer`; the corresponding
  `current_prolog_flag/2` queries fail as specified by 7.11.1.1;
- preparation-time `char_conversion/2` now converts later unquoted source text
  when the `char_conversion` flag is `on`, leaves quoted characters unchanged,
  and feeds the same mapping into execution-time term input.

A follow-on audit closes the processor-character-set/collation choices rather
than leaving them implicit. `--iso-strict` now selects the 128-character ASCII
PCS U+0000..U+007F, classifies C0 controls and DEL as extended layout
characters, and uses the code point itself as each collating-sequence integer.
Characters/codes outside that PCS raise representation errors in strict
parsing, term input, character conversion, and character-code predicates. The
normal profile retains Unicode scalar character data as an explicit extension.
The complete WG17 syntax matrix remains green under this narrower strict
boundary.


The subsequent audit also reconciles the processor's arity limit: EyeProlog no
longer advertises `max_arity=unbounded` while enforcing a hidden host ceiling.
The implementation-defined Part 1 value is now `65535`, and the same boundary
is used by parsing and the standard predicates whose error tables prescribe
`representation_error(max_arity)`. Focused strict tests also lock the corrected
8.5 term-construction errors, 8.8 clause-access precedence, 8.10 all-solutions
goal/list precedence, database update errors, and Corrigendum 3 variable
metadata traversal/write naming.

The public WG17 `number_chars/2` comparison used in preparation of Corrigendum
2 has additionally been checked against the current strict profile. That
external comparison is useful independent evidence, but it is not yet vendored
as an offline release gate; the exit criterion below therefore remains open.

A further issue #65 audit closes the Part 1 flag family and tightens the 8.14
term-I/O/operator error rules. The strict flag registry now distinguishes a
standard value that is valid but not selectable from a value outside the
standard domain: attempts to change fixed `bounded` or
`integer_rounding_function` to another standard value therefore reach the
required permission error. `read_term/3`, `write_term/3`, `op/3`, and
`current_op/3` now follow their prescribed error precedence, including cases
where more than one argument is erroneous. Strict `write_term/2-3` accepts only
the Part 1 plus Corrigendum 3 option surface; the normal-profile
`double_quotes/1` write option remains an explicitly documented EyeProlog
extension.


The current continuation of issue #65 expands that audit into Prolog-text,
stream, atomic-conversion, sorting, and arithmetic edge cases. Strict
preparation now enforces the Part 1 declaration constraints for `dynamic/1`,
`multifile/1`, and `discontiguous/1`, including cross-text multifile use and
one-time initialization per prepared program. Stream handling now distinguishes
text and binary permission errors, validates stream properties and stream-term
requirements, and tightens creation, truncation/append, repositioning, flush,
EOF, close, and current-stream behavior. Corrigendum 2 `keysort/2` variable and
non-pair errors are corrected. Strict arithmetic no longer exposes the
EyeProlog-only evaluable atom `e`, while the Corrigendum arithmetic additions
remain available. These corrections narrow the remaining `audit` rows but do
not by themselves close the full shall-by-shall/error-order exit criteria.

The next Corrigendum 2 pass closes two smaller prescribed-error gaps.
`call/2..8` now raises `representation_error(max_arity)` when appending its
extra arguments would make the resulting goal exceed the declared `max_arity`,
rather than falling through to a procedure-existence error. Reverse
`atom_chars/2` and `atom_codes/2` now report the complete improper `List`
argument as the culprit of `type_error(list, List)`, as required by the
Corrigendum 2 replacement error clauses. Dedicated strict-core regressions pin
both behaviors.


The following Part 1 pass tightens more of the still-open prescribed-error and
arithmetic matrix. `arg/3`, `atom_concat/3`, `sub_atom/5`, `number_chars/2`,
`number_codes/2`, and `char_conversion/2` now follow the standard ordering when
multiple error conditions are simultaneously present. Corrigendum 2 partial
versus improper list distinctions are applied consistently to atomic and
number conversion. Clause 9 strict evaluation now gives the prescribed
number/integer operand diagnostics, checks direct-variable instantiation first,
enforces the float-only input modes of `floor/1`, `truncate/1`, `round/1`, and
`ceiling/1`, and reports zero raised to a negative power as undefined. Finally,
strict mixed integer/float arithmetic comparisons perform the Part 1
integer-to-float conversion (including `float_overflow`); normal EyeProlog keeps
its exact cross-type comparison as an extension. Dedicated strict regressions
cover these distinctions without changing the normal-profile arithmetic error
contract.

## Strict-core boundary

`isoStrict: true` is intentionally a **Part 1 + Corrigenda 1-3** mode. It does
not interpret the following as core-language features:

- EyeProlog quads and the predefined infix `(?-)/2` quad operator;
- EyeProlog standard-library/native adapters and CLP(Z) predicates;
- the implementation-specific `occurs_check` Prolog flag;
- Part 2 module directives (`module/2`, `use_module/1-2`, `meta_predicate/1`);
- Part 3 grammar-rule expansion and `phrase/2-3`;
- automatic tabling, cycle guards, and recursive numeric execution shortcuts;
- EyeProlog well-founded negation via `tnot/1` and its WFS runtime statistics.

The predefined Part 1 `1200 fx` `?-` operator and `1200 xfx` `-->` operator
remain ordinary operator syntax in strict core mode. A conforming `op/3`
directive may still add an infix `?-` definition; strict mode reads that as an
ordinary term rather than as a quad.

Module and DCG compatibility features remain supported and tested in the
normal EyeProlog profile. They are tracked separately in ISO-MATRIX.md rather
than being silently folded into the Part 1 strict-core claim. The project does
not currently assert that this evidence closes every requirement of ISO/IEC
13211-2:2000 or ISO/IEC TS 13211-3.

## Release gate

A release intended to advance ISO conformance must pass all of:

```sh
npm test
npm run test:iso-strict
npm run test:conformance
npm run test:wg17
```

The unified `npm test` gate includes the strict-core suite. Expected conformance
outputs are never auto-accepted.

## Exit criteria for a full conformance claim

EyeProlog should not change its public wording from “ISO profile” to “conforming
ISO/IEC 13211-1 processor” until all of the following are true:

1. every normative Part 1 processor requirement is represented in this ledger;
2. every `audit` row above has been reduced to explicit pass/not-applicable or
   documented implementation-defined choices;
3. the external WG17 conversion and variable-name conformity corpora have
   joined the now-complete syntax corpus in strict core mode, with every
   difference explained or fixed;
4. prescribed modes, errors, side effects, and relevant error precedence for
   every Part 1 built-in have executable coverage;
5. every `audit gap` recorded in the ISO 5.4 decision index is either fixed or
   explicitly excluded from the strict-conformance claim; and
6. an external conformance run has found no unexplained deviations.
