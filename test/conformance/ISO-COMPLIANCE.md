# ISO/IEC 13211-1 compliance ledger

This ledger is the release-facing audit for EyeProlog's ISO/IEC 13211-1 core.
The normative baseline is ISO/IEC 13211-1:1995 together with Technical
Corrigenda 1:2007, 2:2012, and 3:2017. It complements
[ISO-MATRIX.md](ISO-MATRIX.md), which maps standard families to representative
executable tests, [ISO-BUILTIN-MODE-ERROR-MATRIX.md](ISO-BUILTIN-MODE-ERROR-MATRIX.md),
which records the row-by-row built-in audit, and
[ISO-PROCESSOR-REQUIREMENTS.md](ISO-PROCESSOR-REQUIREMENTS.md), which decomposes
Clause 5 processor obligations. The generated [`conformance-report.md`](../../conformance-report.md)
gives current case totals.

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
| 5.1(e) offer a strictly conforming mode | covered | `--iso-strict` and API option `isoStrict: true` restrict the processor to the Part 1 + Corrigenda 1-3 core language surface, remove EyeProlog-only registry/flag/operator features, disable automatic tabling/recursion guards, and reject the normal-profile host `stringTerm/1` term type at strict program/goal entry. |
| 5.4 accompanying documentation | covered | *The Art of EyeProlog* remains the implementation reference; [ISO-IMPLEMENTATION-DEFINED.md](ISO-IMPLEMENTATION-DEFINED.md) is the closed clause-by-clause 5.4 decision index and points each decision to implementation evidence or an explicit audit gap. |
| 5.5 extension boundaries | audit | [ISO-PROCESSOR-REQUIREMENTS.md](ISO-PROCESSOR-REQUIREMENTS.md) now splits 5.5 into its individual extension hooks. Operators, character conversion, the normal-profile host string type, directives, control constructs, flags, and reserved atoms have explicit decisions; exhaustive syntax-preservation, side-effect, built-in, and evaluable-functor dependency mapping remains open. |

## Normative language families

| Standard area | Status | Current evidence |
| --- | --- | --- |
| Clause 6 — tokens, terms, lists, operators, quoted text | audit | Complete vendored WG17 syntax matrix, `lexical_and_curly_terms`, `scryer_lexical_terms`, operator suites, syntax-error cases, quoted-layout/escape error cases, writer/read-back regressions, and Unicode-scalar PCS/collation boundary tests. The implementation-defined 6.5/6.6 character-model decisions are now closed; wider shall-by-shall lexical mapping remains open. |
| 7.1-7.3 — term types, term order, unification | audit | Standard-order, identity, finite-tree and occurs-check suites, Corrigendum 2 term predicates, plus strict checks for the required `variable < float < integer < atom < compound` type order, PCS-based atom collation, and the `max_arity=unbounded` compound-term model. The normal JavaScript API string term is now explicitly documented as a 5.5.4 extension and rejected at strict program/goal entry so it cannot add a sixth strict-core type. |
| 7.4 — Prolog text and directives | audit | All Part 1 directive indicators are parsed; include/ensure-loaded/operator/flag/character-conversion behavior has executable coverage. Preparation-time `char_conversion/2` affects later unquoted source text and respects `char_conversion=off`. Strict preparation now enforces declaration-before-clause ordering for `dynamic/1`, `multifile/1`, and `discontiguous/1`, cross-text `multifile/1`, discontiguous clause grouping, empty declared procedures, include textual-replacement behavior, and one-time initialization per prepared program. The remaining shall-by-shall mapping is still open. |
| 7.5-7.6 — database and term/clause conversion | audit | Dynamic database and logical-update-view suites. Strict mode restores Part 1 private-static/public-dynamic `clause/2` access; focused strict checks cover the database built-ins and empty-procedure lifetime. Runtime assertion conversion now applies 7.6.2 recursively through conjunction, disjunction, and if-then: nested variables become `call/1`, and an invalid nested branch is rejected while `asserta/1` or `assertz/1` converts the term instead of being stored for a later execution-time failure. Runtime protection includes the solver-native conjunction control construct `','/2` and, following STC #56's accepted-direction action item, `(:-)/1-2` for database modification/private access while leaving their call behavior distinct. The remaining clause-conversion shall-by-shall mapping is still open. |
| 7.7 — execution and backtracking | audit | Control/search suites. Strict mode disables EyeProlog automatic tabling, cycle guards, and recursive numeric shortcuts so core execution uses ordinary clause selection/backtracking. |
| 7.8 — control constructs and exceptions | audit | call, cut, conjunction, disjunction (including failed branches after callee-local cuts), if-then, catch/throw, renamed-copy tests. The 8.15 built-in slice (`\+/1`, `once/1`, `repeat/0`, Corrigendum 2 `call/2..8`, `false/0`) is now row-audited in [ISO-BUILTIN-MODE-ERROR-MATRIX.md](ISO-BUILTIN-MODE-ERROR-MATRIX.md); the remaining general control-construct semantics ledger stays open. |
| 7.9 — expression evaluation | audit | Arithmetic/evaluation/error suites, including Corrigenda. Strict mode now pins direct-variable precedence, 7.9.2 non-evaluable `F/N` errors (including STC #69), arithmetic numeric/integer type errors, float-only rounding conversions, the Part 1 mixed integer/float comparison conversion rule, I->F overflow before floating evaluable functors (STC #42), explicit `exp/1`/power underflow, and prescribed negative/zero power errors before later conversion overflow. Unbounded integer powers/shifts no longer leak host `RangeError`; finite-host exhaustion is normalized to `resource_error(memory)` in line with the Part 1 resource-error note and STC #21. The remaining exceptional-value/error-precedence rows are still being exhaustively enumerated. |
| 7.10 — input/output concepts | audit | Stream, character/byte I/O, read/write options, operator-sensitive write-back, and Corrigendum 3 writer cases. The audit now also covers write-mode creation/truncation, append creation, repositioned overwrite, flushing, EOF actions, close/current-stream handling, strict stream-position terms, stream-property validation, stream-term requirements, text-vs-binary permission errors, and the prescribed `alias(A)` culprit for `open/4` alias collisions. The latest 8.11/8.12 pass also makes `close/2`'s `force(true)` semantics presence-based and defers `get_code/1-2` / `peek_code/1-2` invalid in-character-code representation errors until after the earlier stream existence/mode/type/EOF/entity conditions. The full option/mode cross-product is still being mapped. |
| 7.11 — flags | covered | The complete Part 1 flag set, selected defaults, standard value domains, changeability, `current_prolog_flag/2`, and `set_prolog_flag/2` error behavior have dedicated strict tests. EyeProlog selects `bounded=false` and `integer_rounding_function=toward_zero`; valid alternative values of those fixed flags reach `permission_error(modify,flag,...)`, while `max_integer` and `min_integer` have no current value. STC #70 is recorded explicitly: EyeProlog has no separate finite procedure-arity ceiling, so the optional `max_procedure_arity` flag is absent while `max_arity` remains `unbounded`. Strict mode excludes the EyeProlog `occurs_check` extension. |
| 7.12 — errors | audit | ISO `error(Error, Context)` envelope, type/domain/permission/representation/evaluation/syntax/resource families and focused error cases. [ISO-BUILTIN-MODE-ERROR-MATRIX.md](ISO-BUILTIN-MODE-ERROR-MATRIX.md) now gives explicit prescribed mode/error rows for 8.2-8.5 and 8.15-8.17, including Corrigendum additions and selected not-applicable finite-`max_arity` branches. Exact ISO 8.14.1-8.14.4 precedence and the recent 8.11/8.12 overlaps are also covered. The one-row map remains open for 8.6-8.14 and for the remaining Clause 7/9 exceptional-order interactions. |
| 8.2-8.17 — built-in predicates | audit | Predicate-family coverage is mapped in ISO-MATRIX.md. The new [ISO-BUILTIN-MODE-ERROR-MATRIX.md](ISO-BUILTIN-MODE-ERROR-MATRIX.md) closes 8.2-8.5 and 8.15-8.17 at one row per prescribed mode/error condition (with finite-`max_arity` branches explicitly marked not applicable under EyeProlog's `unbounded` choice). The still-open row audit is therefore narrowed to 8.6-8.14, especially database/all-solutions and the remaining stream/term-I/O option cross-product. |
| Clause 9 — evaluable functors | audit | Integer/float/rounding/transcendental/bitwise suites and corrigendum cases. Strict mode excludes the EyeProlog-only evaluable atom `e`, retains Corrigendum 2 arithmetic additions, reports unknown zero-arity evaluables with the required `F/0` culprit shape, distinguishes non-evaluable `F/N` errors from numeric/integer operand errors per 7.9.2 and STC #69, and enforces float-only rounding modes, performs I->F conversion before floating functors (including overflow), reports the explicit `exp/1`, `**/2`, and Corrigendum 2 `^/2` underflow conditions, preserves the power-specific undefined conditions ahead of conversion overflow, and uses the Part 1 integer-to-float rule for mixed arithmetic comparisons. Normal mode retains EyeProlog's exact mixed-type comparison and round-to-zero arithmetic behavior as extensions. Unbounded BigInt resource exhaustion is translated into the Prolog error model rather than leaking host exceptions. Host floating-point representation choices remain documented implementation-defined behavior; the remaining exceptional-value rows are still under audit. |
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

A follow-on audit made the processor-character-set/collation choices explicit.
Issue #67 then corrected an over-strict interpretation: because PCS membership
and extended-character classification are implementation defined by Part 1,
`--iso-strict` must not replace EyeProlog's ordinary processor choice. Both
profiles now use Unicode scalar values as PCS members and collating integers;
Unicode letters/white-space/graphics receive documented extended lexical
classes, while surrogates and values above U+10FFFF remain representation
errors. Strict mode continues to reject implementation-specific facilities
without changing these implementation-defined character choices. The complete
WG17 syntax matrix remains a release gate.


The subsequent arity audit originally selected a finite `max_arity=65535`, but
issue #66 and the post-Corrigendum STC review exposed that as the wrong
abstraction: Part 1 `max_arity` is the maximum arity of **compound terms**, not
a procedure-arity limit. EyeProlog now again selects `max_arity=unbounded` and
removes the artificial 65535 checks from source parsing, `functor/3`, `=../2`,
predicate indicators, and Corrigendum 2 `call/N` closure expansion. Practical
host exhaustion remains a resource condition rather than a declared term-arity
boundary. Focused strict tests also lock the corrected 8.5 term-construction
errors, 8.8 clause-access precedence, 8.10 all-solutions goal/list precedence,
database update errors, and Corrigendum 3 variable metadata traversal/write
naming.

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

The next Corrigendum 2 pass closed the prescribed `call/2..8` max-arity
branch for processors with a finite `max_arity`, and corrected reverse
`atom_chars/2` / `atom_codes/2` improper-list culprits. After issue #66 restored
EyeProlog's selected `max_arity=unbounded`, the conditional `call/N`
`representation_error(max_arity)` branch is intentionally unreachable unless a
future processor profile selects a finite compound-term limit; closure
expansion itself remains covered by strict regressions.


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

A further Clause 9 pass closes the floating conversion and exceptional-value
boundary exposed by unbounded integers. Strict floating evaluable functors now
perform the required integer-to-float conversion before invoking the host math
operation, so an integer outside the selected finite binary64 range reports
`evaluation_error(float_overflow)` rather than producing a secondary host-math
result. The explicit underflow clauses for `exp/1`, Part 1 `**/2`, and
Corrigendum 2 `^/2` are enforced even though EyeProlog retains the
implementation-defined `round(x)` choice for generic `resultF` arithmetic. The
power audit also preserves the specified negative-base and zero/negative
exception conditions before any later I->F overflow, including Corrigendum 3's
correction to the `**/2` operand wording and Corrigendum 2's distinct rule that
`^/2` may accept an integer-valued float exponent.


A subsequent 8.11/8.12 pass closes two stream-option/error-overlap details.
For `get_code/1-2` and `peek_code/1-2`, a fixed integer which is not an
in-character code is now diagnosed only after the earlier stream
existence/direction/text-vs-binary/past-EOF and input-entity conditions, so it
cannot mask the stream error prescribed by the published table. `close/2` now
also treats `force(true)` as a presence-based option exactly as 8.11.6.1(a)
describes: a later `force(false)` does not cancel an earlier `force(true)` when
a Resource Error or System Error occurs during closure. Focused strict tests
cover both overlap families.

The next row-audit tranche makes the remaining exit criterion concrete rather
than leaving it as a broad test-count claim.
[ISO-BUILTIN-MODE-ERROR-MATRIX.md](ISO-BUILTIN-MODE-ERROR-MATRIX.md) now records
each prescribed mode/error row for the 8.2-8.5 and 8.15-8.17 slices, and
[ISO-PROCESSOR-REQUIREMENTS.md](ISO-PROCESSOR-REQUIREMENTS.md) decomposes the
Clause 5 obligations into covered, audit, and not-applicable decisions. While
doing that mapping, the 7.6.2 term-to-clause conversion audit exposed a runtime
assertion defect: variables and invalid terms nested under `;/2` or `->/2` were
not being recursively converted. `asserta/1` and `assertz/1` now convert all
three standardized binary control forms `,/2`, `;/2`, and `->/2` recursively,
so nested variables become `call/1` and a non-callable nested branch is rejected
at assertion time with the complete clause-body culprit.

The Clause 5 decomposition also exposed an embedding-only type boundary that
source-text tests could not see. EyeProlog's normal JavaScript API deliberately
exports `stringTerm(Text)` as an implementation-specific additional term type.
Its normal-profile ordering, conversion, evaluation, and writing behavior is
now documented under 5.5.4, while strict `Program` construction and strict
`Solver` goal entry reject such terms with `representation_error(term)`. This
keeps the host extension available in normal mode without allowing it to become
a sixth term type in the Part 1 strict execution domain.

## Post-Corrigendum STC cross-check

The public WG17 STC draft is tracked as useful defect-discovery material, but it
is not silently treated as a fourth published Corrigendum. The current audit
confirms EyeProlog already has the behavior implicated by the substantive STC
items on negative-number layout/operator syntax, arithmetic instantiation
precedence, EOF actions/end tokens, character/code/byte output error overlap,
clause head/body variable identity, sequential `op/3` and `set_prolog_flag/2`
preparation effects, integer-to-float transcendental evaluation, `char_code/2`
type precedence, `read_term/3` EOF handling, mixed arithmetic comparison,
`integer_rounding_function=toward_zero`, `set_prolog_flag/2` variable errors,
and `bagof/3` answer order. STC #21 is also used to keep finite-host exhaustion
of unbounded integer operations inside the Prolog resource-error model.

Issue #66 corresponds to the newer STC arity discussion: `max_arity` describes
compound terms. EyeProlog therefore selects `unbounded` and does not invent a
finite predicate/procedure ceiling merely to preserve the former 65535 value.
STC #56, which became a WG17 action item, is implemented narrowly for database
protection: `(:-)/1-2` are static/private for modification and `clause/2`
access, while ordinary calls retain their separate existence behavior. Other
draft/editorial or deliberately controversial proposals (for example deleting
standalone if-then) remain outside the Part 1 + Corrigenda 1-3 strict baseline
until standardized or adopted as an explicit compatibility extension.

## Strict-core boundary

`isoStrict: true` is intentionally a **Part 1 + Corrigenda 1-3** mode. It does
not interpret the following as core-language features:

- EyeProlog quads and the predefined infix `(?-)/2` quad operator;
- EyeProlog standard-library/native adapters and CLP(Z) predicates;
- the implementation-specific `occurs_check` Prolog flag;
- Part 2 module directives (`module/2`, `use_module/1-2`, `meta_predicate/1`);
- Part 3 grammar-rule expansion and `phrase/2-3`;
- automatic tabling, cycle guards, and recursive numeric execution shortcuts;
- EyeProlog well-founded negation via `tnot/1` and its WFS runtime statistics;
- the JavaScript API `stringTerm(Text)` additional term type (normal mode only).

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
