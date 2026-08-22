# ISO Prolog conformance matrix

The normative baseline for the `iso/` corpus is ISO/IEC 13211-1:1995 plus
Technical Corrigenda 1:2007, 2:2012, and 3:2017. This matrix links the standard
families to executable coverage; `conformance-report.md` supplies the generated
case totals. [ISO-COMPLIANCE.md](ISO-COMPLIANCE.md) tracks the processor-level
compliance audit and the remaining work before a full conformance claim.

| Standard area | Implementation | Representative executable coverage |
| --- | --- | --- |
| Clause 6 lexical and term syntax | tokenizer, operator parser, lists, curly terms, quotes, numeric syntax, comments, strict ASCII PCS/collation | `scryer_lexical_terms`, `lexical_and_curly_terms`, `double_quoted_lists`, `corrigendum1_double_quote_operator`, `wg17_syntax_high_risk`, `wg17_invalid_octal_escape`, `wg17_unterminated_quoted_token`, `wg17_literal_newline_in_quote`, `wg17_non_iso_escape`, strict PCS/collation tests in `run-iso-strict.mjs`, syntax error cases |
| Clause 7 term order and unification | finite-tree unification, identity, standard order, errors | `unification_control_information`, `swipl_occurs_check`, `term_modes_and_ordering`, `logtalk_compare_standard_order` |
| Clause 7 control and exceptions | call, cut, conjunction, disjunction, if-then-else, catch and throw | `cut_control`, `control_and_terms`, `exceptions_and_flags`, `corrigenda_catch_callability`, `throw_copies_ball` |
| 8.2-8.5 term predicates | unification, Corrigendum 2 tests, comparison, sorting, creation and decomposition | `corrigenda_term_predicates`, `corrigenda_sort_keysort`, `logtalk_arg_unification`, `logtalk_univ`, associated error cases, Corrigendum 2 `keysort/2` variable/non-pair errors, and strict `functor/3` / `=../2` error-order plus max-arity checks |
| 8.6-8.7 arithmetic predicates | `is/2` and all six arithmetic comparisons | `arithmetic`, comparison cases, isolated evaluation errors |
| 8.8-8.10 database and solutions | logical update view, dynamic mutation, all-solutions grouping | `dynamic_database`, `trealla_logical_update_view`, `corrigenda_retractall`, `grouped_solutions_and_clauses`, plus strict clause/database error and all-solutions precedence checks |
| 8.11-8.14 streams and term I/O | text/binary streams, properties, units, read/write options and operators | `streams_and_term_io`, `operators`, Corrigendum 3 option cases, stream error cases, strict 8.14.1-8.14.4 option/error-order tests, Corrigendum 3 variable metadata/write naming checks, and issue #65 checks for stream-term/property validation, text-vs-binary permissions, EOF/flush/position, and open/close semantics |
| 8.15 logic and control | negation, once, repeat, `call/2` through `call/8`, `false/0` | `logtalk_once`, `corrigenda_call_closure`, `false_builtin`, plus strict Corrigendum 2 resulting-goal `max_arity` error coverage |
| 8.16 atomic processing | atoms, characters, codes and number conversion with prescribed errors | `atomic_term_processing`, focused forward/reverse cases, parenthesized-number rejection, Logtalk-derived error cases, and strict Corrigendum 2 improper-list culprit checks for `atom_chars/2` and `atom_codes/2` |
| 8.17 flags and hooks | complete required Part 1 flag set, selected defaults, standard value domains/changeability, halt and character conversion | `exceptions_and_flags`, `remaining_builtins_and_directives`, flag error cases, and the strict complete-flag audit in `run-iso-strict.mjs` |
| Clause 9 evaluable functors | integer, float, rounding, transcendental and bitwise operations | `arithmetic`, `corrigenda_arithmetic`, `corrigenda_atan2_zero`, `corrigenda_integer_negative_power`, strict exclusion of the normal-mode `e` evaluable extension and zero-arity unknown-evaluable error checks |
| Module compatibility profile (related to ISO/IEC 13211-2 and later WG17 amendment work) | module declarations, exports, imports, qualification, meta-predicate context | `modules/qualified_call`, `modules/selective_library_import`, `dcg_module_nonterminal_indicator` |
| Part 3-oriented DCG compatibility profile | `-->`, terminal and partial sequences, grammar control constructs, semicontexts, nonterminal indicators, modules, `phrase/2-3`, steadfastness and errors | `dcg_terminals_and_remainder`, `dcg_control_constructs`, `dcg_partial_sequences`, `dcg_phrase_steadfastness`, `dcg_dynamic_nonterminal_indicator`, `logtalk_dcg_phrase_identity`, `logtalk_dcg_semicontexts`, DCG error and precedence cases |

Corrigendum-specific coverage includes double-quoted atom operator priority
(Cor.1); the added predicates and evaluable functors, bar-operator rules,
uninstantiation errors, and corrected `catch/3` behavior (Cor.2); and option
validation, variable-name traversal/output, canonical list output, and negative
integer powers (Cor.3).

Implementation-defined and implementation-specific choices are indexed
clause-by-clause in [ISO-IMPLEMENTATION-DEFINED.md](ISO-IMPLEMENTATION-DEFINED.md),
with *The Art of EyeProlog* remaining the implementation reference. In
particular, the index records the unbounded integer model, `double_quotes=chars`,
`//` rounding toward zero, the ECMAScript binary64 float policy (including the
9.1.4.2 choice to round tiny arithmetic results rather than raise underflow),
stream/character decisions, and the normal-profile extension boundary.

This is an executable conformance/compatibility matrix, not a certification issued by an
independent standards body. The Part 2/Part 3-related rows describe tested
normal-mode compatibility surfaces rather than a claim that every requirement
of those standards has been closed. Release gating runs the ISO cases and the dedicated
Part 1 strict-core suite together with the full regression, API, documentation,
example, and browser suites.
