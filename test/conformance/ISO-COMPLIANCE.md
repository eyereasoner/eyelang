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
| 5.1(d) document permitted variations | audit | Major implementation-defined choices are documented in *The Art of EyeProlog*. Every occurrence of “implementation defined/dependent/specific” in Part 1 still needs a final documentation cross-check. |
| 5.1(e) offer a strictly conforming mode | covered | `--iso-strict` and API option `isoStrict: true` restrict the processor to the Part 1 + Corrigenda 1-3 core language surface, remove EyeProlog-only registry/flag/operator features, and disable automatic tabling/recursion guards. |
| 5.4 accompanying documentation | audit | The book is the implementation reference. The implementation-defined-feature inventory is not yet a closed checklist. |
| 5.5 extensions preserve standard text | covered | Default mode retains EyeProlog extensions; strict core mode removes their language/runtime interpretation. Regression tests ensure the default profile remains unchanged. |

## Normative language families

| Standard area | Status | Current evidence |
| --- | --- | --- |
| Clause 6 — tokens, terms, lists, operators, quoted text | audit | Complete vendored WG17 syntax matrix, `lexical_and_curly_terms`, `scryer_lexical_terms`, operator suites, syntax-error cases, quoted-layout/escape error cases, and writer/read-back regressions. |
| 7.1-7.3 — term types, term order, unification | audit | Standard-order, identity, finite-tree and occurs-check suites, Corrigendum 2 term predicates. |
| 7.4 — Prolog text and directives | audit | All Part 1 directive indicators are parsed; include/ensure-loaded/operator/flag/character-conversion behavior has executable coverage. Cross-text `multifile/1` and ordering constraints require explicit shall-by-shall audit. |
| 7.5-7.6 — database and term/clause conversion | audit | Dynamic database and logical-update-view suites. Strict mode restores Part 1 private-static/public-dynamic `clause/2` access. Public/private and multi-text requirements still need complete mapping. |
| 7.7 — execution and backtracking | audit | Control/search suites. Strict mode disables EyeProlog automatic tabling, cycle guards, and recursive numeric shortcuts so core execution uses ordinary clause selection/backtracking. |
| 7.8 — control constructs and exceptions | audit | call, cut, conjunction, disjunction (including failed branches after callee-local cuts), if-then, catch/throw, renamed-copy tests. |
| 7.9 — expression evaluation | audit | Arithmetic/evaluation/error suites, including Corrigenda. Exceptional-value/error-precedence matrix remains to be exhaustively enumerated. |
| 7.10 — input/output concepts | audit | Stream, character/byte I/O, read/write options, operator-sensitive write-back, Corrigendum 3 writer cases. Full option cross-product remains open. |
| 7.11 — flags | audit | Required Part 1 flags implemented. Normal and strict modes use the ISO `unknown=error` default; strict mode excludes the EyeProlog `occurs_check` extension. |
| 7.12 — errors | audit | ISO `error(Error, Context)` envelope, type/domain/permission/representation/evaluation/syntax families and focused error cases. Complete prescribed-error ordering remains open. |
| 8.2-8.17 — built-in predicates | audit | Predicate-family coverage is mapped in ISO-MATRIX.md; Corrigendum 2 additions (`subsumes_term/2`, `term_variables/2`, `call/2..8`, `false/0`) are in the strict registry. Mode/error matrix is not yet one-row-per-standard-row. |
| Clause 9 — evaluable functors | audit | Integer/float/rounding/transcendental/bitwise suites and corrigendum cases. Host floating-point representation choices remain documented implementation-defined behavior. |
| Corrigendum 1 | covered | Double-quoted atom/operator-priority corrections have dedicated cases. |
| Corrigendum 2 | covered | Added predicates/functors, catch corrections, bar/operator and uninstantiation corrections have dedicated cases. |
| Corrigendum 3 | covered | Writer options, `variable_names/1`, canonical list output and negative-power corrections have dedicated cases. |

## Strict-core boundary

`isoStrict: true` is intentionally a **Part 1 + Corrigenda 1-3** mode. It does
not interpret the following as core-language features:

- EyeProlog quads and the predefined infix `(?-)/2` quad operator;
- EyeProlog standard-library/native adapters and CLP(Z) predicates;
- the implementation-specific `occurs_check` Prolog flag;
- Part 2 module directives (`module/2`, `use_module/1-2`, `meta_predicate/1`);
- Part 3 grammar-rule expansion and `phrase/2-3`;
- automatic tabling, cycle guards, and recursive numeric execution shortcuts.

The predefined Part 1 `1200 fx` `?-` operator and `1200 xfx` `-->` operator
remain ordinary operator syntax in strict core mode. A conforming `op/3`
directive may still add an infix `?-` definition; strict mode reads that as an
ordinary term rather than as a quad.

Part 2 modules and Part 3 grammar rules remain supported and tested in the
normal EyeProlog profile. They are tracked separately in ISO-MATRIX.md rather
than being silently folded into the Part 1 strict-core claim.

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
5. every implementation-defined/dependent/specific choice required to be
   documented is linked to the implementation reference; and
6. an external conformance run has found no unexplained deviations.
