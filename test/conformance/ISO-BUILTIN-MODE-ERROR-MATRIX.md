# ISO Part 1 built-in mode/error audit

This matrix turns the broad built-in audit in `ISO-COMPLIANCE.md` into smaller,
release-gated units. The normative baseline is ISO/IEC 13211-1:1995 plus
Technical Corrigenda 1:2007, 2:2012, and 3:2017.

A `covered` row has an executable assertion for the prescribed successful mode,
failure behavior, or error condition. `not applicable` records a conditional
standard branch that cannot occur under EyeProlog's documented processor
choices. The table is intentionally explicit about what has and has not been
closed: this tranche row-audits 8.2-8.5 and 8.15-8.17; 8.6-8.14 remain under
the broader audit and will be expanded in later passes.

The focused assertions added for this matrix live in `test/run-iso-strict.mjs`;
existing file-based cases remain additional independent evidence.

## 8.2 — term unification

| Clause / predicate | Prescribed row | Status | Executable evidence |
| --- | --- | --- | --- |
| 8.2.1 `(=)/2` | `?term, ?term`; succeeds/fails according to Prolog unification; no prescribed errors | covered | existing unification corpus and `term_modes_and_ordering` |
| 8.2.2 `unify_with_occurs_check/2` | `?term, ?term`; succeeds/fails and never reports a prescribed error | covered | strict row-audit success assertion plus unification corpus |
| 8.2.3 `(\=)/2` | `@term, @term`; succeeds/fails for the defined NSTO cases; no prescribed errors | covered | unification/control corpus |
| Cor.2 8.2.4 `subsumes_term/2` | `@term, @term`; succeeds/fails without binding its arguments; no prescribed errors | covered | strict row-audit success assertion and Corrigendum 2 term-predicate cases |

## 8.3 — type testing

All Part 1 type tests have a single input-term mode and no prescribed errors.
The Corrigendum 2 additions have the same shape.

| Predicate | Prescribed row | Status | Executable evidence |
| --- | --- | --- | --- |
| `var/1` | input term; semidet; no errors | covered | `type_var_success` and term-mode cases |
| `atom/1` | input term; semidet; no errors | covered | `type_atom_success` |
| `integer/1` | input term; semidet; no errors | covered | `type_integer_success` |
| `float/1` | input term; semidet; no errors | covered | `type_float_success` |
| `atomic/1` | input term; semidet; no errors | covered | `type_atomic_atom_success`, `type_atomic_number_success` |
| `compound/1` | input term; semidet; no errors | covered | `type_compound_success` |
| `nonvar/1` | input term; semidet; no errors | covered | `type_nonvar_success` |
| `number/1` | input term; semidet; no errors | covered | `type_number_integer_success`, `type_number_float_success` |
| Cor.2 `callable/1` | input term; semidet; no errors | covered | `type_callable_atom_success`, `type_callable_compound_success` |
| Cor.2 `ground/1` | input term; semidet; no errors | covered | `type_ground_success` |
| Cor.2 `acyclic_term/1` | input term; semidet; no errors | covered | Corrigendum 2 term-predicate coverage |

## 8.4 — term comparison and sorting

| Clause / predicate | Prescribed row | Status | Executable evidence |
| --- | --- | --- | --- |
| 8.4.1 `(@<)/2` | two input terms; semidet; no prescribed errors | covered | standard-order corpus and strict type/collation ordering assertions |
| 8.4.1 `(@=<)/2` | two input terms; semidet; no prescribed errors | covered | standard-order corpus |
| 8.4.1 `(==)/2` | two input terms; identity test; no prescribed errors | covered | identity/term-mode corpus |
| 8.4.1 `(\==)/2` | two input terms; non-identity test; no prescribed errors | covered | identity/term-mode corpus |
| 8.4.1 `(@>)/2` | two input terms; semidet; no prescribed errors | covered | standard-order corpus |
| 8.4.1 `(@>=)/2` | two input terms; semidet; no prescribed errors | covered | standard-order corpus |
| Cor.2 8.4.2 `compare/3` | output-order mode | covered | strict `compare(<,a,b)` / comparison cases |
| Cor.2 8.4.2 `compare/3` | input-order mode | covered | comparison cases |
| Cor.2 8.4.2 error (a) | non-variable, non-atom `Order` -> atom type error | covered | strict `compare(1,3,3.0)` |
| Cor.2 8.4.2 error (b) | atom outside `<`, `=`, `>` -> order domain error | covered | strict `compare(>=,3,3.0)` |
| Cor.2 8.4.3 `sort/2` | input list -> output list | covered | strict `sort([1,1],[1])` and sorting corpus |
| Cor.2 8.4.3 `sort/2` | input list + input result list | covered | sorting corpus |
| Cor.2 8.4.3 error (a) | partial input list -> instantiation error | covered | strict `sort([1|T],_)` |
| Cor.2 8.4.3 error (b) | non-list input -> list type error | covered | strict `sort(foo,_)` |
| Cor.2 8.4.3 error (c) | non-list result -> list type error | covered | strict `sort([],foo)` |
| Cor.2 8.4.4 `keysort/2` | input pairs -> output list | covered | strict `keysort([2-b,1-a],[1-a,2-b])` and Corrigendum cases |
| Cor.2 8.4.4 `keysort/2` | input pairs + input result list | covered | Corrigendum cases |
| Cor.2 8.4.4 error (a) | partial `Pairs` -> instantiation error | covered | strict `keysort([1-a|T],_)` |
| Cor.2 8.4.4 error (b) | non-list `Pairs` -> list type error | covered | strict `keysort(foo,_)` |
| Cor.2 8.4.4 error (c) | non-list `Sorted` -> list type error | covered | strict `keysort([],foo)` |
| Cor.2 8.4.4 error (d) | variable element in `Pairs` prefix -> instantiation error | covered | strict `keysort([X],_)` |
| Cor.2 8.4.4 error (e) | non-pair element in `Pairs` prefix -> pair type error | covered | strict `keysort([foo],_)` |
| Cor.2 8.4.4 error (f) | non-pair element in `Sorted` prefix -> pair type error | covered | strict `keysort([],[foo])` |

## 8.5 — term creation and decomposition

| Clause / predicate | Prescribed row | Status | Executable evidence |
| --- | --- | --- | --- |
| 8.5.1 `functor/3` | decompose a non-variable term | covered | term-construction corpus |
| 8.5.1 `functor/3` | construct from `Name` and `Arity` | covered | term-construction corpus |
| 8.5.1 errors (a-b) | missing required `Name` or `Arity` when constructing -> instantiation error | covered | strict `functor(X,Y,3)` and `functor(X,foo,N)` |
| 8.5.1 error (c) | non-atomic `Name` -> atomic type error | covered | strict `functor(X,foo(a),a)` precedence case |
| 8.5.1 error (d) | non-integer `Arity` -> integer type error | covered | strict `functor(X,foo,a)` |
| 8.5.1 error (e) | positive arity with non-atom atomic name -> atom type error | covered | strict `functor(X,1.5,1)` |
| 8.5.1 error (f) | requested arity above finite `max_arity` | not applicable | EyeProlog selects `max_arity=unbounded`; finite host exhaustion is a resource condition |
| 8.5.1 error (g) | negative `Arity` -> non-negative domain error | covered | strict `functor(X,foo,-1)` |
| 8.5.2 `arg/3` | positive integer index + compound term | covered | `logtalk_arg_unification` and strict cases |
| 8.5.2 error (a) | variable index -> instantiation error | covered | strict `arg(X,foo(a),_)` |
| 8.5.2 error (b) | variable term -> instantiation error | covered | strict `arg(1,X,_)` |
| 8.5.2 error (c) | non-integer index -> integer type error | covered | strict `arg(a,foo(a),_)` |
| 8.5.2 error (d) | non-compound term -> compound type error | covered | strict `arg(0,atom,_)` precedence case |
| 8.5.2 error (e) | negative index -> non-negative domain error | covered | strict `arg(-1,foo(a),_)` |
| 8.5.3 `(=..)/2` | term -> list decomposition | covered | `logtalk_univ` and term-construction cases |
| 8.5.3 `(=..)/2` | list -> term construction | covered | `logtalk_univ` and term-construction cases |
| 8.5.3 error (a) | both arguments insufficiently instantiated | covered | strict `X=..Y` |
| 8.5.3 error (b) | partial list in construction direction | covered | strict `X=..[foo|T]` |
| 8.5.3 error (c) | non-list second argument | covered | strict `X=..foo` |
| 8.5.3 error (d) | variable list head | covered | strict `X=..[F,a]` |
| 8.5.3 error (e) | invalid compound functor/list head | covered | strict `X=..[3,a]` and singleton compound-head case |
| 8.5.3 error (f) | empty construction list | covered | strict `X=..[]` |
| 8.5.3 finite-arity representation branch | constructed list exceeds finite `max_arity` | not applicable | selected `max_arity=unbounded` |
| 8.5.4 `copy_term/2` | copy with fresh variables | covered | strict success assertion, `copy_term_fresh_variables`, `logtalk_copy_term_semantics` |
| Cor.2 8.5.5 `term_variables/2` | output witness-variable list | covered | strict `term_variables(A+B+B,[A,B])`, Logtalk-derived cases |
| Cor.2 8.5.5 `term_variables/2` | supplied partial/list result | covered | Corrigendum cases |
| Cor.2 8.5.5 error (a) | second argument neither partial list nor list -> list type error | covered | strict `term_variables(t,[X|foo])` |

## 8.15 — logic and control

| Clause / predicate | Prescribed row | Status | Executable evidence |
| --- | --- | --- | --- |
| 8.15.1 `(\+)/1` | callable goal; semidet | covered | negation corpus |
| 8.15.1 error (a) | variable goal -> instantiation error | covered | strict `\+(X)` |
| 8.15.1 error (b) | non-callable goal -> callable type error | covered | strict `\+(3)` |
| 8.15.2 `once/1` | callable goal; only first solution survives | covered | direct strict solver assertion, `once_commits_first`, `logtalk_once` |
| 8.15.2 error (a) | variable goal -> instantiation error | covered | strict `once(X)` |
| 8.15.2 error (b) | non-callable goal -> callable type error | covered | strict `once(3)` |
| 8.15.3 `repeat/0` | repeatedly succeeds; no prescribed errors | covered | `logtalk_repeat` |
| Cor.2 8.15.4 `call/2..8` | closure expansion through the standardized maximum arity | covered | direct strict closure assertion and `corrigenda_call_closure` |
| Cor.2 8.15.4 error (a) | variable closure -> instantiation error | covered | strict `call(X,a)` |
| Cor.2 8.15.4 error (b) | non-callable closure -> callable type error | covered | strict `call(3,a)` |
| Cor.2 8.15.4 finite-`max_arity` branch | resulting goal exceeds finite `max_arity` | not applicable | selected `max_arity=unbounded`; branch remains implementation-tested conditionally |
| Cor.2 8.15.4 implementation-dependent `call/N`, N>=9 | EyeProlog supplies no additional standardized closure arities | covered | strict `call(foo,a,b,c,d,e,f,g,h)` reaches procedure-existence handling rather than an extra call/N built-in |
| Cor.2 8.15.4 resulting-goal conversion error | expanded goal cannot be converted to a callable goal | covered | strict callability/error tests |
| Cor.2 8.15.5 `false/0` | always fails; no prescribed errors | covered | strict assertion and `false_builtin` |

## 8.16 — atomic term processing

| Clause / predicate | Prescribed row | Status | Executable evidence |
| --- | --- | --- | --- |
| 8.16.1 `atom_length/2` | atom -> length / check supplied length | covered | `logtalk_atom_length`, strict row audit |
| 8.16.1 error: atom variable | required atom unavailable -> instantiation error | covered | strict `atom_length(X,4)` |
| 8.16.1 error: atom type | first argument non-atom -> atom type error | covered | strict `atom_length(1.2,4)` |
| 8.16.1 error: length type | non-integer length -> integer type error | covered | strict `atom_length(atom,'4')` |
| 8.16.1 error: length domain | negative length -> non-negative domain error | covered | strict `atom_length(atom,-1)` |
| 8.16.2 `atom_concat/3` | concatenate known pieces or enumerate splits of known whole | covered | direct strict enumeration assertion and `logtalk_atom_concat` |
| 8.16.2 errors: insufficient first/whole or second/whole instantiation | instantiation error | covered | strict `atom_concat(X,small,Y)` and `atom_concat(small,X,Y)` |
| 8.16.2 errors: atom types | non-atom in each fixed position -> atom type error | covered | three strict type assertions |
| 8.16.3 `sub_atom/5` | enumerate/check source slices | covered | direct strict six-slice assertion and `logtalk_sub_atom` |
| 8.16.3 error: source variable | instantiation error | covered | strict `sub_atom(X,0,1,0,a)` |
| 8.16.3 errors: atom types | source/result non-atom -> atom type error | covered | strict source/result assertions |
| 8.16.3 errors: integer types | fixed Before/Length/After non-integer -> integer type error | covered | three strict assertions |
| 8.16.3 errors: non-negative domains | fixed Before/Length/After negative -> domain error | covered | three strict assertions |
| 8.16.4 `atom_chars/2` | atom <-> list of characters | covered | forward/reverse and Logtalk-derived cases |
| Cor.2 `atom_chars/2`: both insufficiently instantiated | instantiation error | covered | strict `atom_chars(X,Y)` |
| Cor.2 `atom_chars/2`: atom type | atom side non-atom | covered | strict `atom_chars(1,[])` |
| Cor.2 `atom_chars/2`: improper list | list type error on complete list culprit | covered | strict `atom_chars(X,[a|foo])` and focused culprit regressions |
| Cor.2 `atom_chars/2`: variable list-prefix element | instantiation error | covered | strict `atom_chars(X,[Y,a])` |
| Cor.2 `atom_chars/2`: non-character element | character type error | covered | strict `atom_chars(X,[a,1])` |
| 8.16.5 `atom_codes/2` | atom <-> list of character codes | covered | forward/reverse and Logtalk-derived cases |
| Cor.2 `atom_codes/2`: both insufficiently instantiated | instantiation error | covered | strict `atom_codes(X,Y)` |
| Cor.2 `atom_codes/2`: atom type | atom side non-atom | covered | strict `atom_codes(1,[])` |
| Cor.2 `atom_codes/2`: improper list | list type error on complete list culprit | covered | strict `atom_codes(X,[97|foo])` |
| Cor.2 `atom_codes/2`: variable prefix element | instantiation error | covered | strict `atom_codes(X,[Y,97])` |
| Cor.2 `atom_codes/2`: code type | non-integer code -> integer type error | covered | strict `atom_codes(X,[97,foo])` |
| Cor.2 `atom_codes/2`: code representation | integer outside processor character-code set -> representation error | covered | strict `atom_codes(X,[97,-1])` |
| 8.16.6 `char_code/2` | character <-> character code | covered | forward/reverse cases |
| 8.16.6 under-instantiation | both sides variable -> instantiation error | covered | strict `char_code(X,Y)` |
| 8.16.6 character type | non-character first argument takes precedence | covered | strict `char_code(ab,foo)` |
| 8.16.6 code type | non-integer code -> integer type error | covered | strict `char_code(a,foo)` |
| 8.16.6 code representation | integer outside processor character-code set -> representation error | covered | strict `char_code(a,-1)` |
| 8.16.7 `number_chars/2` | number <-> character-list number syntax | covered | number conversion corpus |
| Cor.2 `number_chars/2`: both insufficiently instantiated | instantiation error | covered | strict `number_chars(X,Y)` |
| Cor.2 `number_chars/2`: number type | fixed non-number -> number type error | covered | strict `number_chars(foo,[])` |
| Cor.2 `number_chars/2`: improper list | list type error | covered | strict `number_chars(X,[a|foo])` |
| Cor.2 `number_chars/2`: variable prefix element | instantiation error | covered | strict `number_chars(X,[Y,a])` |
| Cor.2 `number_chars/2`: non-character element | character type error | covered | strict `number_chars(X,[a,1])` |
| `number_chars/2`: invalid number syntax | syntax error | covered | strict `number_chars(X,[a])` and parenthesized-number rejection |
| 8.16.8 `number_codes/2` | number <-> code-list number syntax | covered | number conversion corpus |
| Cor.2 `number_codes/2`: both insufficiently instantiated | instantiation error | covered | strict `number_codes(X,Y)` |
| Cor.2 `number_codes/2`: number type | fixed non-number -> number type error | covered | strict `number_codes(foo,[])` |
| Cor.2 `number_codes/2`: improper list | list type error | covered | strict `number_codes(X,[49|foo])` |
| Cor.2 `number_codes/2`: variable prefix element | instantiation error | covered | strict `number_codes(X,[Y,49])` |
| Cor.2 `number_codes/2`: code type | non-integer code -> integer type error | covered | strict `number_codes(X,[49,foo])` |
| Cor.2 `number_codes/2`: code representation | integer outside processor character-code set -> representation error | covered | strict `number_codes(X,[49,-1])` |
| `number_codes/2`: invalid number syntax | syntax error | covered | strict `number_codes(X,[97])` |

## 8.17 — flags and hooks

The complete Part 1 flag family had already been closed before this tranche;
these rows make the corresponding built-in modes/errors explicit here so the
built-in matrix does not have a gap at 8.17.

| Clause / predicate | Prescribed row | Status | Executable evidence |
| --- | --- | --- | --- |
| 8.17.1 `set_prolog_flag/2` | set a supported, changeable flag value | covered | strict flag audit |
| 8.17.1 errors | variable/name type/domain, value type/domain, and non-changeable-flag permission distinctions | covered | `covers the Part 1 flag defaults, value domains, and changeability` plus file-based flag errors |
| 8.17.2 `current_prolog_flag/2` | enumerate/query current standard flags | covered | strict complete flag audit |
| 8.17.2 flag-name type error | fixed non-atom name -> atom type error | covered | strict `current_prolog_flag(1,_)` |
| 8.17.2 unknown-flag domain error | fixed unsupported flag name -> Prolog-flag domain error | covered | strict `current_prolog_flag(no_such_iso_flag,_)` |
| 8.17.3 `halt/0` | terminate with implementation-defined successful host status | covered | `halt` conformance case / host runner tests |
| 8.17.4 `halt/1` | integer host status | covered | halt conformance/runner tests |
| 8.17.4 variable status | instantiation error | covered | strict `halt(X)` |
| 8.17.4 non-integer status | integer type error | covered | strict `halt(a)` |

## Remaining row-audit work

This file deliberately does not relabel the whole 8.2-8.17 family as complete.
The next row-by-row passes are:

- 8.6-8.7 arithmetic predicates and expression-evaluation interactions;
- 8.8-8.10 database and all-solutions predicates, including all conditional
  static/private/dynamic branches;
- 8.11-8.14 streams, character/byte I/O, options, and term I/O, including the
  remaining option/mode cross-product.

Clause 9 exceptional-value rows and Clause 6/7 processor semantics remain
tracked separately in `ISO-COMPLIANCE.md` and `ISO-PROCESSOR-REQUIREMENTS.md`.
