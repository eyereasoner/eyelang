# eyelang Specification

```text
Document: eyelang-spec-0001
Category: Language Specification
Language version: 5.0.28
Date: 2026-10-17
```

## Table of contents

- [Status of This Memo](#status-of-this-memo)
- [1. Conventions and conformance](#1-conventions-and-conformance)
- [2. Program model](#2-program-model)
- [3. Lexical conventions and terms](#3-lexical-conventions-and-terms)
- [4. Clauses and binding](#4-clauses-and-binding)
- [5. Builtins and arithmetic](#5-builtins-and-arithmetic)
  - [5.1. Builtin predicates and special forms](#51-builtin-predicates-and-special-forms)
  - [5.2. Arithmetic operators](#52-arithmetic-operators)
  - [5.3. Arithmetic functions and constants](#53-arithmetic-functions-and-constants)
  - [5.4. Ordinary predicates](#54-ordinary-predicates)
- [6. Inference and negation](#6-inference-and-negation)
  - [6.1. Herbrand semantics](#61-herbrand-semantics)
  - [6.2. Evaluation and negation](#62-evaluation-and-negation)
- [7. Queries and aggregation](#7-queries-and-aggregation)
- [8. Explanations](#8-explanations)
- [9. Checks](#9-checks)
- [10. Errors and command-line interface](#10-errors-and-command-line-interface)
- [11. Implementation and examples](#11-implementation-and-examples)
- [12. Limits and resource considerations](#12-limits-and-resource-considerations)

## Status of This Memo

This project specification is not an IETF RFC. It defines the subset of
Prolog implemented by eyelang. It does not claim full ISO Prolog conformance
or compatibility with every Prolog program.

## 1. Conventions and conformance

MUST, MUST NOT, SHOULD, and MAY express the requirement levels of
[RFC 2119](https://www.rfc-editor.org/rfc/rfc2119.html) and
[RFC 8174](https://www.rfc-editor.org/rfc/rfc8174.html).
A conforming implementation MUST implement the syntax and behavior below.
Answer order and the first selected successful derivation are unspecified.
A ground term contains no variables. A predicate is identified by its atom name
and arity; `parent/1` and `parent/2` are distinct predicates.

## 2. Program model

Source files are UTF-8 and conventionally use `.pl`. Programs use these forms:

```prolog
human(socrates).                        % ground fact
mortal(Person) :- human(Person).        % clause
?- mortal(Who).                         % query
?- human(X), mortal(X).                 % conjunction
?- why.                                 % explain previous answers
?- why(mortal(socrates)).               % explain a goal
:- assertion(mortal(socrates)).         % executable check
:- table fibonacci/2, ackermann/2.      % tabled predicate declarations
```

All statements MUST end in `.`, followed by whitespace, a comment, or end of
file. The interpreter MUST parse the entire source, load all facts, complete
requested inference, answer queries in source order, and evaluate checks in
source order. A query MAY use later facts or clauses.
Checks MUST NOT assert facts. Queries and checks MUST request the backward
computation they need. `why` follow-ups refer to the preceding ordinary query,
even when checks or other follow-ups intervene.

`why/0`, `why/1`, and `assertion/1` have the special
top-level meanings described here; they are not ordinary user-defined control
predicates.
`why` MAY wrap a parenthesized conjunction. Directives other than `table` and
`assertion` MUST be rejected. Query forms belong in program files in this
interpreter; other Prolog systems may require entering them at a top level.

## 3. Lexical conventions and terms

Names are case-sensitive. Unquoted atoms match `[a-z][A-Za-z0-9_]*`.
Variables match `[A-Z_][A-Za-z0-9_]*`. A variable's scope is one clause, query,
or assertion. Repeating a variable name MUST require the same term. Every `_`
MUST be a fresh variable. Names beginning with `_` MUST remain shared when
repeated, but MUST be omitted from displayed query bindings.

Single quotes delimit atoms, including Unicode names and punctuation:
`'red-fox'`, `'Élodie'`, `'7'`. Quoted and unquoted spellings of the same atom
MUST unify. Double quotes delimit strings, which MUST remain distinct from
atoms and numbers. Quotes MAY be doubled inside the corresponding quoted
value. Supported backslash escapes are `\n`, `\r`, `\t`, `\b`, `\f`, `\\`,
`\'`, `\"`, and Unicode `\uXXXX` / `\UXXXXXXXX`.
Comments start with `%` and run to the end of the line, or use `/* ... */`.
Block comments are not nested. Quoted comment markers are literal content.
Comments and multiline terms MUST preserve diagnostic source lines.

Integers are decimal digits with an optional unary sign and MUST be exact,
using arbitrary-precision arithmetic limited by available resources. Reals
have a decimal fraction or exponent and MUST use finite binary64 values.
Integers and reals are distinct terms: `1 = 1.0` fails, while `1 =:= 1.0`
succeeds. Real overflow and non-finite arithmetic MUST raise an error.

A term MAY be an atom, integer, real, string, variable, compound term such as
`point(2, 3)`, or list. Compounds have a fixed atom functor and one or more
arguments. Arity-zero predicates use a bare atom. Lists use `[]`, `[a, b]`,
and `[Head | Tail]`; tails MUST be lists or variables. Improper lists are
outside this subset. Nested compounds and lists MUST match structurally.
The quoted constructor `'.'(Head, Tail)` is equivalent to `[Head | Tail]`
and has the same tail restrictions. The empty list `[]` is distinct from
the quoted atom `'[]'`.
Unification MUST perform an occurs check and MUST NOT create cyclic terms.
Ground facts are loaded directly. Unit clauses containing variables, such as
`append([], List, List).`, MUST act as demand-driven clauses with an empty
body; their calls MUST supply enough bindings to produce ground answers.
Compound arithmetic syntax in a fact is an ordinary compound term and MUST NOT
be implicitly evaluated.

## 4. Clauses and binding

A clause has one ordinary predicate head and one or more body goals, separated
by commas. Goals MAY be grouped in parentheses. Multiple clauses for one
predicate provide alternative derivations. There is no separate forward-rule
syntax. Arithmetic expressions in ordinary arguments remain terms; use an
explicit `is/2` step to compute an argument or a result:

```prolog
:- table fibonacci/2.
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Value) :-
    N > 1,
    PreviousIndex is N - 1,
    EarlierIndex is N - 2,
    fibonacci(PreviousIndex, Previous),
    fibonacci(EarlierIndex, Earlier),
    Value is Previous + Earlier.
```

Ordinary positive goals bind variables by structural matching. `Left = Right`
unifies terms. `Left is Expression` evaluates the right side and unifies its
numeric result with the left. Arithmetic inputs MUST be bound at that point;
computations MUST NOT solve backward. A successful materialized head MUST be
ground; calls that leave output variables unresolved MUST raise an error.

## 5. Builtins and arithmetic

eyelang provides **20 builtin predicates**, **39 arithmetic operations**, and
**two arithmetic constants**. The operations comprise 18 unary/binary operator
forms and 22 named functions; `xor/2` appears in both groups and is counted once.
Special forms are listed separately below.

Arithmetic expressions are data until evaluated by `is/2`, a numeric comparison,
or an aggregate's numeric template. An arithmetic function is not a callable
goal: `sqrt(9)` alone does not compute a square root.

### 5.1. Builtin predicates and special forms

The following builtin predicates MAY appear in clause bodies, queries, and
assertions. Inputs described as bound MUST have their required values when the
goal is reached. These predicates MUST NOT be redefined by facts or clauses.

| Predicate | Syntax and behavior |
| --- | --- |
| `true/0` | `true` always succeeds, without binding variables. |
| `false/0` | `false` always fails. |
| `=/2` | `Left = Right` unifies terms structurally, with an occurs check. Either operand may contain variables. |
| `\=/2` | `Left \= Right` succeeds if the terms cannot unify at this point. Trial bindings MUST be discarded. It does not constrain later bindings: `X \= a` fails while `X` is free. |
| `is/2` | `Value is Expression` evaluates the bound expression and unifies the numeric result with `Value`. A bound result must have the same numeric term type and value. |
| `</2`, `=</2`, `>/2`, `>=/2` | Numeric less than, less than or equal, greater than, and greater than or equal. Both expressions are evaluated. |
| `=:=/2`, `=\=/2` | Numeric equality and inequality. Both expressions are evaluated; `1 =:= 1.0` succeeds. |
| `@</2`, `@=</2`, `@>/2`, `@>=/2` | Lexicographic less than, less than or equal, greater than, and greater than or equal. Both operands MUST be bound atoms, or both MUST be bound strings. Ordering compares UTF-16 code units; it does not perform locale collation or general term ordering. |
| `contains_text/2` | `contains_text(Text, Part)` requires two bound strings. It lowercases both using Unicode default case conversion, then tests literal substring containment. No Unicode normalization is performed. An empty `Part` succeeds. |
| `atom_codes/2` | `atom_codes(Atom, Codes)` relates an atom to its list of Unicode scalar values as integers. A bound atom produces codes; otherwise a bound proper list of codes produces an atom. |
| `string_codes/2` | `string_codes(String, Codes)` provides the same conversion for strings, preserving their distinction from atoms. |
| `=../2` | `Term =.. Parts` decomposes a nonvariable term into a list of its functor and arguments, or constructs a term from such a list. It does not evaluate or call the constructed term. |
| `aggregate_all/3` | `aggregate_all(Template, Goal, Result)` computes `count`, `sum(Value)`, `min(Value)`, or `max(Value)` over completed, distinct producer tuples. See Section 7 for binding, scope, and empty-result rules. |

For the two text conversions, a bound first argument MUST have the specified
text type. Its codes are unified with the second argument, which MAY contain
variables. If the first argument is a variable, the second MUST be a ground
proper list of integers from 0 through 1114111, excluding surrogate values
55296 through 57343. Text containing an unpaired surrogate MUST raise an
error. Supplementary characters occupy one code; empty text corresponds to
`[]`. Conversion MUST preserve code points without Unicode normalization.
Invalid decoding inputs and calls with neither required input supplied MUST
raise an error; a valid conversion with an incompatible output simply fails.

For `=../2`, a compound decomposes to `[Functor | Arguments]`, for example
`point(2, 3) =.. [point, 2, 3]`. An atom, number, or string decomposes to a
singleton list containing itself. The empty list decomposes to `[[]]`;
a nonempty list decomposes to `['.', Head, Tail]`. In the construction
direction, `Parts` MUST have a known, nonempty, proper list spine. A
singleton MUST contain a bound atom, number, string, or `[]`; a longer list
MUST begin with a bound atom functor. Arguments MAY contain variables that
are bound by subsequent goals. Constructing `'.'/2` MUST obey the list-tail
restrictions in Section 3. Neither direction introduces cyclic terms, and
displayed answers MUST still be ground. Missing inputs or invalid parts
MUST raise an error; incompatible terms and parts fail by unification.

The following special forms complete the language's built-in facilities;
they are not additional ordinary predicates:

| Form | Context and meaning |
| --- | --- |
| `\+ Goal` | Negation of one goal, with the completion and binding requirements in Section 6. |
| `?- why.` | Explain the preceding ordinary query's answers (Section 8). |
| `?- why(Goal).` | Query and explain `Goal`, which may be a conjunction (Section 8). |
| `:- assertion(Goal).` | Require a successful solution of `Goal` (Section 9). |
| `:- table Name/Arity, ... .` | Declare ordinary predicates demand-driven and tabled (Section 6). |

Conjunction with `,` and parenthesized goal groups are supported syntax.
The predicates above introduce no mutation or I/O effects. A failed test
produces no solution; an invalid arithmetic input or an unmet input requirement
MUST raise an error rather than silently failing.

### 5.2. Arithmetic operators

The following table is exhaustive. Rows run from lower to higher precedence;
operators on the same row share precedence. Parentheses override precedence.
All operands MUST evaluate to numbers; the integer-only operations reject reals,
even those with an integral value such as `3.0`.

| Binary operators | Associativity | Meaning |
| --- | --- | --- |
| `\/`, `xor`, `/\`, `<<`, `>>` | Left | Integer bitwise OR, XOR, AND, left shift, right shift. |
| `+`, `-` | Left | Addition and subtraction. |
| `*`, `/`, `//`, `div`, `rem`, `mod` | Left | Multiplication, real division, truncating integer quotient, flooring integer quotient, truncating remainder, flooring remainder. |
| `**`, `^` | `**` non-associative; `^` right | Real power; power preserving exact integers for integer operands and a nonnegative exponent. |

Unary `+` preserves its operand; unary `-` negates it. Unary `\` is integer
bitwise complement. Unary operators bind more tightly than multiplication and
less tightly than powers: `-2^2` evaluates to `-4`.

Addition, subtraction, and multiplication of two integers MUST be exact.
Unary signs MUST preserve the operand's numeric type. `/` and `**` MUST produce
reals. `^` MUST produce an exact integer for integer operands and a nonnegative
exponent, and a real otherwise. Other mixed integer/real arithmetic MUST convert
its operands to binary64; conversion and results MUST remain finite.

`//`, `div`, `rem`, `mod`, and bit operations MUST require integers.
`//` truncates toward zero; `div` floors. `rem` has the dividend's sign;
`mod` has the divisor's sign. With `-7` and `3`, the four results are `-2`,
`-3`, `-1`, and `2`. Division or remainder by zero MUST raise an error.
Bit operations MUST use unbounded signed two's-complement semantics.
Shift counts MUST be nonnegative; right shift preserves the sign.

### 5.3. Arithmetic functions and constants

Functions use ordinary argument syntax inside arithmetic expressions:
`sqrt(9)`, `min(A, B)`. The following table lists every supported function.
Arguments MUST evaluate to numbers, subject to the additional requirements
shown. Integer and real result types remain distinct terms.

| Function | Meaning and result |
| --- | --- |
| `abs/1` | Absolute value, preserving the integer or real type. |
| `sign/1` | Integer `-1`, `0`, or `1` according to the argument's sign. |
| `sqrt/1` | Real square root of a nonnegative argument. |
| `log/1`, `exp/1` | Real natural logarithm of a positive argument; real exponential. |
| `sin/1`, `cos/1`, `tan/1` | Real trigonometric functions, with input angles in radians. |
| `asin/1`, `acos/1`, `atan/1` | Real principal inverse trigonometric functions in radians. `asin` and `acos` require inputs in `[-1, 1]`; their result ranges are `[-pi/2, pi/2]` and `[0, pi]`. `atan` returns a value in `[-pi/2, pi/2]`. |
| `atan2/2` | `atan2(Y, X)` returns the real signed angle of `(X, Y)` in `[-pi, pi]`; `atan2(0, 0)` returns `0.0`. |
| `floor/1`, `ceiling/1` | Integer rounding toward negative and positive infinity respectively. |
| `round/1`, `truncate/1` | Integer rounding to nearest with halfway cases away from zero; integer rounding toward zero. |
| `float_integer_part/1` | Real integral part, truncated toward zero. |
| `float_fractional_part/1` | Real argument minus its truncated integral part. |
| `min/2`, `max/2` | Smaller or larger operand, preserving its type and exact value; select the first on numeric equality. |
| `gcd/2` | Nonnegative integer greatest common divisor of two integers, including `gcd(0, 0) = 0`. |
| `xor/2` | Integer bitwise XOR, equivalent to the infix `xor` operator. |

`pi` and `e` evaluate to the binary64 approximations
`3.141592653589793` and `2.718281828459045`. Outside arithmetic evaluation they
remain ordinary atoms. Transcendental functions use the JavaScript binary64
Math operations; their last result bit MAY differ between runtimes.

`floor`, `ceiling`, `round`, and `truncate` MUST retain every digit of an
integer input. `float_integer_part` and `float_fractional_part` convert integer
inputs to binary64 and MUST return reals. Numeric comparisons and `min`/`max`
MUST preserve an integer operand's exact value rather than first rounding both
operands to binary64. Atoms, strings, and lists MUST NOT be coerced to numbers.
Non-finite conversions, overflow, and real function domain errors MUST raise
an error. Unsupported arithmetic functions MUST report their name and arity.

### 5.4. Ordinary predicates

Predicates outside the listed builtin indicators and special forms have no
implicit implementation. Programs MAY define them with facts and clauses;
without a matching definition, a ground call has no solution. Term-type tests
and structural identity tests are not provided as builtins.

Integer ranges, list operations, and polar-angle normalization can be defined
using ordinary clauses. For example, with bound integer endpoints:

```prolog
:- table between/3.
between(Low, High, Low) :- Low =< High.
between(Low, High, Value) :-
    Low < High,
    Next is Low + 1,
    between(Next, High, Value).
?- between(2, 4, Value).
```

This defines an ordinary `between/3` predicate with answers `2`, `3`, and `4`.
Its arithmetic inputs MUST be bound, as with any other clause using arithmetic.

## 6. Inference and negation

### 6.1. Herbrand semantics

eyelang MUST use
[Herbrand semantics](https://logical.stanford.edu/intrologic/chapters/chapter_07.html)
for ordinary predicates, with the interpreted builtins specified in Section 5.
Ground terms denote themselves:
`socrates` denotes the atom `socrates`, and `point(2, 3)` denotes that compound
term. A functor constructs data; it does not implicitly call a function.
Distinct ground terms MUST remain distinct after the lexical normalization
and structural matching described in Section 3. For example, `socrates` and
`plato` are different values, while `socrates` and `'socrates'` are the same
atom. Asserting a relation between two terms does not make them identical.

The **Herbrand universe** is the set of finite ground terms constructible from
the language's constants and constructors, including its supported numeric
values, strings, and proper lists. Variables range over these terms. The
**Herbrand base** is the set of all ordinary predicate applications to ground
terms, such as `human(socrates)`. These applications are called ground atoms;
here, "atom" means a proposition, distinct from an atom used as a term.
A Herbrand interpretation specifies which ground atoms are true.

For positive clauses, the program's meaning MUST be the **least Herbrand
model**, relative to the specified builtins: the smallest set of ground atoms
containing the facts and closed under rule application. Clause variables are
universally quantified: whenever a ground instance of a rule's body holds,
its head holds. Thus the facts and clause in Section 2 make
`human(socrates)` and `mortal(socrates)` true. A query returns ground bindings
that make its goals true, subject to the input requirements of this subset.

Arithmetic builtins have their specified numeric interpretation. For example,
`1 + 2` remains a compound term in an ordinary argument, while `Value is 1 + 2`
binds `Value` to the integer `3`. `1 = 1.0` fails because the terms differ;
`1 =:= 1.0` succeeds by numeric comparison. Stratified negation extends the
positive semantics by testing absence only after the relevant producers
complete, as specified below. The universe can be infinite; these semantics
do not require enumerating it or guarantee that evaluation terminates.

### 6.2. Evaluation and negation

Facts and answers have set semantics. Every distinct ground tuple MUST be
stored at most once, regardless of the number of derivations. Positive
recursion MUST reach a least fixed point when its domain is finite.

The implementation evaluates range-restricted clauses forward: each head
variable and each builtin input can be bound from preceding positive goals.
It MUST evaluate other clauses using demand-driven tables. A `table` declaration
MUST make every clause of the declared predicate demand-driven, regardless of
where the declaration appears. Declarations are optional for clauses already
requiring inputs, and useful to prevent eager enumeration of recursive list
constructors. All demand-driven calls MUST be tabled. Calls differing only in
variable spelling MUST share evaluation, preserving repeated-variable
constraints. Recursive consumers MUST suspend and resume as answers arrive;
they MUST NOT recurse indefinitely through the JavaScript call stack.
Tables MUST be local to each run.

This execution model differs from conventional Prolog depth-first search:
clause order MUST NOT change the answer set for terminating positive programs
whose calls supply required inputs. Answer order, duplicate derivations, cut,
and procedural side effects are not provided.

`\+ Goal` holds when no matching ground positive answer exists after its
producers complete. Negative ordinary goals MUST be ground when reached.
Negation of a conjunction and nested negation are outside this subset; define
a helper predicate. Negated tests MUST NOT introduce bindings. Negated `is/2`
and unification require bound operands, as do negated `atom_codes/2`,
`string_codes/2`, and `=../2`; negated aggregate goals require a
helper predicate.

The implementation MUST reject dependency cycles through negation or
aggregation.
A negative consumer MUST run after its producer strata finish. Dependency
analysis distinguishes predicates by name/arity and excludes producer heads
with incompatible atomic argument constants; other argument constraints MAY
be treated conservatively. Arithmetic tests have no fact producers.
Absence means no evidence in this completed program, not a claim about the
world.

No semantic depth limit is defined. Arithmetic, compound construction, or
expanding call patterns can create infinite computation. Tabling MUST NOT be
described as guaranteeing termination for arbitrary programs. The playground
MUST allow cancellation by terminating its computation worker.

## 7. Queries and aggregation

A query MUST return all distinct tuples of its displayed variables, once each.
Variables beginning with `_` are existentially projected out. Successful queries
with no displayed variables yield `true.`; unsuccessful queries yield `false.`.
`false.` describes query failure, not an explicitly asserted negative fact.
Conjunctions share bindings and process goals from left to right.

```prolog
?- aggregate_all(count, mortal(Person), Count).
?- aggregate_all(sum(Value), score(Person, Value), Total).
?- aggregate_all(min(Value), score(Person, Value), Minimum).
?- aggregate_all(max(Value), score(Person, Value), Maximum).
```

`aggregate_all/3` MAY appear in a body, query, or assertion. Its goal MAY be a
parenthesized conjunction. It MUST complete all matching producer work before
aggregating, including demand-driven definitions. A bound result constrains the
computed answer. Existing outer bindings MAY constrain the producer call;
local producer variables MUST NOT escape into the caller.

Aggregation operates on distinct tuples of all producer variables under the
set semantics of this interpreter. It does not count repeated proof paths.
Equal values from distinct subjects contribute separately. Empty counts and
sums yield integer zero; empty minima and maxima fail. Counts and integer sums
MUST be exact; sums and extrema also support finite real arithmetic. A producer
that requires unavailable input bindings MUST report an error.

## 8. Explanations

`?- why.` MUST explain all answers of the preceding non-follow-up query.
Consecutive follow-ups MUST retain that context. Without a previous query,
it MUST prompt for a query; after an unsuccessful query, it MUST report that
there is no successful answer to explain. `?- why(Goal).` MUST explain all
successful answers to that goal and MUST become the current context.

Every derived tuple MUST retain a successful rule and its supporting evidence.
Supplied facts, completed absence searches, computed tests, and aggregates MUST
be identified separately. All successful explanations MUST use one numbered
format: each rule is listed once, and each step is shown once before the steps
that use it. This includes explanations of single supplied facts. Derived steps
MUST identify their rule, supporting step numbers, and local variable bindings
when present. Unit clauses have no supporting steps. Ordinary predicate steps
MUST show actual ground terms, and arithmetic evidence MUST include concrete
operands and results. Explanations MUST NOT silently omit steps or numeric digits.
Explanations record one selected derivation; they are not independent proof
certificates or guarantees that the search implementation is correct.

## 9. Checks

`:- assertion(Goal).` MUST test the existence of a successful solution.
A parenthesized conjunction MAY use local variables and calculations. Checks
MUST run after the query results and explanations have been prepared, in source
order, without changing explanation context. A successful check emits
`check passed: Goal.`. The first failed check MUST stop the run and identify its
source line with `Check failed: Goal.`. Runtime errors in assertions SHOULD
identify the assertion's source line. Checks use the same inference engine;
programs SHOULD use independent expected values or mathematical identities.

## 10. Errors and command-line interface

```sh
node eyelang.js examples/socrates.pl
node eyelang.js - < examples/socrates.pl
node eyelang.js --help
node eyelang.js --version
```

The CLI MUST accept exactly one path or `-` for standard input. `-h`/`--help`
and `-v`/`--version` display usage and the package version respectively.
The CLI requires Node.js 18 or later and no third-party packages.
Successful queries, including `false.`, MUST exit zero. Errors MUST go to stderr
and produce a nonzero status. The CLI MUST prepare the complete transcript
before printing it, so failed checks produce no partial successful transcript.

The CLI and playground MUST group output under `% Answer`, `% Reason`, and
`% Check`, in that order, retaining written order within each section. In
`% Answer`, each result block MUST be preceded by its query in `?- Goal.` form,
including results with no displayed variables and unsuccessful queries. Query
formatting MAY normalize whitespace and parentheses. Empty sections MUST
explain what was not requested. Section grouping MUST NOT change
preceding-query explanation context. Malformed or unfinished statements MUST
report a source line. Unsupported syntax and runtime operations MUST fail
explicitly. The earlier English-like syntax is not supported.

## 11. Implementation and examples

The [tutorial](https://eyereasoner.github.io/eyelang/TUTORIAL/)
introduces facts, rules, queries, explanations, checks, recursion, arithmetic,
aggregation, structured terms, and demand-driven tabling through runnable
programs.

The [homepage](https://eyereasoner.github.io/eyelang/) gives a brief introduction
and a command-line example. The
[playground](https://eyereasoner.github.io/eyelang/playground/) lists all
executable `.pl` examples. Each example demonstrates answers, explanations,
and assertions, with a complete transcript in
[examples/output/](https://github.com/eyereasoner/eyelang/tree/main/examples/output).
They include Socrates, positive cycles, routes and minimum
costs, Gregorian Easter dates, exact arithmetic, symbolic Peano arithmetic,
bounded Collatz trajectories, peasant multiplication and exponentiation,
probabilities, Fibonacci 10000, Ackermann, complex numbers, a Turing machine,
recursive lists, prime sieving, unification, Hanoi, expression graphs,
account state transitions, feedforward and nonlinear feedback control,
interval relations, family branches, structured classifications, schema
closure, role permissions, policy scenarios, dog-count thresholds, negation,
aggregation, and taxonomies up to 10000 levels.
Padovan numbers, Newton–Raphson roots, a Gray-code counter, turbine maintenance,
inventory totals, access conditions, ranked policy findings, eight-queen
solutions, an instrument puzzle, conflicting animal observations, population
statistics, vector similarity, annotated expression types, symbolic
differentiation, knapsack optimization, Unicode text processing, and generic
term inspection and construction also have executable examples. Service-log
correlation, record-quality audits, critical-path and weighted interval
scheduling, and bounded path discovery across a full airport graph combine
these facilities in application examples.
Additional models cover component vulnerability response, charger configuration,
bounded job-shop scheduling, recovery with redundant services, finite sign
analysis across loops, and discrete battery dispatch. Pure-math examples cover
Pell equations, Vandermonde's identity, and cosets of the permutation group S3.
These examples demonstrate
behavior, not general performance or correctness guarantees for arbitrary
inputs.

[src/language.js](https://github.com/eyereasoner/eyelang/blob/main/src/language.js)
exports `parse`, `infer`, `render`, `say`, and `run` without Node-specific dependencies.
`parse` returns facts, rules, questions, and checks; `infer` returns
materialized tuples and their evidence; `render(program, records, options)`
formats completed inference as answer, explanation, and check blocks; `say`
formats a goal. Callers of `render` MUST obtain records with
`infer(program, { validateChecks: true })` before displaying check successes.
`run(source, options)` performs parsing, checked inference, and rendering.
Both `render` and `run` accept `{ arc: true }` to group the blocks as Answer,
Reason, and Check. Both the CLI and browser worker use this module. The
[test/](https://github.com/eyereasoner/eyelang/tree/main/test) directory contains
conformance tests with a section coverage map, behavior regressions, and
browser-interface tests.

`npm run benchmark` reports parsing, checked inference, and full output-rendering
times separately, with process peak memory from isolated runs. The
[benchmark notes](https://github.com/eyereasoner/eyelang/tree/main/benchmarks)
describe the workloads and measurement limits.

## 12. Limits and resource considerations

This subset excludes cut, disjunction, if-then-else, arbitrary operator
declarations, nonground answers, improper or cyclic lists, general meta-calls,
DCGs, modules/imports, mutation, I/O predicates, and external calls.
Only the builtins and special forms listed in Section 5 are provided.
Library-like names do not imply additional predicates or complete libraries.
Stored facts, tables, explanations, and arithmetic results can be large.
The CLI defines no execution timeout; the playground uses a cancellable worker
and a labeled output preview, with complete output available for copy/save.
