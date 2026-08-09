# ISO Prolog conformance matrix

The normative baseline for the `iso/` corpus is ISO/IEC 13211-1:1995 plus
Technical Corrigenda 1:2007, 2:2012, and 3:2017. This matrix links the standard
families to executable coverage; `conformance-report.md` supplies the generated
case totals.

| Standard area | Implementation | Representative executable coverage |
| --- | --- | --- |
| Clause 6 lexical and term syntax | tokenizer, operator parser, lists, curly terms, quotes, numeric syntax, comments | `scryer_lexical_terms`, `lexical_and_curly_terms`, `double_quoted_lists`, `corrigendum1_double_quote_operator`, syntax error cases |
| Clause 7 term order and unification | finite-tree unification, identity, standard order, errors | `unification_control_information`, `swipl_occurs_check`, `term_modes_and_ordering`, `logtalk_compare_standard_order` |
| Clause 7 control and exceptions | call, cut, conjunction, disjunction, if-then-else, catch and throw | `cut_control`, `control_and_terms`, `exceptions_and_flags`, `corrigenda_catch_callability` |
| 8.2-8.5 term predicates | unification, Corrigendum 2 tests, comparison, sorting, creation and decomposition | `corrigenda_term_predicates`, `corrigenda_sort_keysort`, `logtalk_arg_unification`, `logtalk_univ`, associated error cases |
| 8.6-8.7 arithmetic predicates | `is/2` and all six arithmetic comparisons | `arithmetic`, comparison cases, isolated evaluation errors |
| 8.8-8.10 database and solutions | logical update view, dynamic mutation, all-solutions grouping | `dynamic_database`, `trealla_logical_update_view`, `corrigenda_retractall`, `grouped_solutions_and_clauses` |
| 8.11-8.14 streams and term I/O | text/binary streams, properties, units, read/write options and operators | `streams_and_term_io`, `operators`, Corrigendum 3 option cases, stream error cases |
| 8.15 logic and control | negation, once, repeat, `call/2` through `call/8`, `false/0` | `logtalk_once`, `corrigenda_call_closure`, `false_builtin` |
| 8.16 atomic processing | atoms, characters, codes and number conversion with prescribed errors | `atomic_term_processing`, focused forward/reverse cases, Logtalk-derived error cases |
| 8.17 flags and hooks | required flags, mutation permissions, halt and character conversion | `exceptions_and_flags`, `remaining_builtins_and_directives`, flag error cases |
| Clause 9 evaluable functors | integer, float, rounding, transcendental and bitwise operations | `arithmetic`, `corrigenda_arithmetic`, `corrigenda_atan2_zero`, `corrigenda_integer_negative_power` |
| ISO/IEC 13211-2 modules | module declarations, exports, imports, qualification, meta-predicate context | `modules/qualified_call`, `modules/selective_library_import`, `dcg_module_nonterminal_indicator` |
| ISO/IEC TS 13211-3 grammar rules | `-->`, terminal and partial sequences, grammar control constructs, semicontexts, nonterminal indicators, modules, `phrase/2-3`, steadfastness and errors | `dcg_terminals_and_remainder`, `dcg_control_constructs`, `dcg_partial_sequences`, `dcg_phrase_steadfastness`, `dcg_dynamic_nonterminal_indicator`, `logtalk_dcg_phrase_identity`, `logtalk_dcg_semicontexts`, DCG error and precedence cases |

Corrigendum-specific coverage includes double-quoted atom operator priority
(Cor.1); the added predicates and evaluable functors, bar-operator rules,
uninstantiation errors, and corrected `catch/3` behavior (Cor.2); and option
validation, variable-name traversal/output, canonical list output, and negative
integer powers (Cor.3).

Implementation-defined choices are documented in *The Art of EyeProlog*:
integers and arity are unbounded by the Prolog model (subject to host memory),
ordinary unification performs an occurs check, `double_quotes` defaults to
`chars`, unknown procedures default to `error`, `//` rounds toward zero,
floating-point operations use finite ECMAScript numbers, and character codes
use Unicode scalar values.

This is an executable conformance matrix, not a certification issued by an
independent standards body. Release gating runs the ISO cases together with the
full regression, API, documentation, example, and browser suites.
