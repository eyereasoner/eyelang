# eyelang Specification

```text
Document: eyelang-spec-0001
Category: Experimental
Language version: 5.0.4
Date: 2026-10-15
```

## Status of This Memo

This project specification is not an IETF RFC. It defines the implemented
experimental eyelang subset of Prolog syntax. It does not claim full ISO Prolog
conformance or compatibility with every Prolog program.

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
human(socrates).                         % ground fact
mortal(Person) :- human(Person).          % clause
?- mortal(Who).                           % query
?- human(X), mortal(X).                   % conjunction
?- why.                                  % explain previous answers
?- why(mortal(socrates)).                 % explain a goal
:- assertion(mortal(socrates)).           % executable check
:- table fibonacci/2, ackermann/2.        % tabled predicate declarations
```

All statements MUST end in `.`, followed by whitespace, a comment, or end of file. The interpreter MUST parse the entire source,
load all facts, complete requested inference, answer queries in source order,
and evaluate checks in source order. A query MAY use later facts or clauses.
Checks MUST NOT assert facts. Queries and checks MUST request the backward
computation they need. `why` follow-ups refer to the preceding ordinary query,
even when checks or other follow-ups intervene.

`why/0`, `why/1`, `assertion/1`, and `aggregate_all/3` have the special top-level
meanings described here; they are not ordinary user-defined control predicates.
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
value. Supported backslash escapes are `\n`, `\r`, `\t`, `\b`, `\f`, `\\`, `\'`, `\"`, and Unicode `\uXXXX` / `\UXXXXXXXX`.
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
Unification MUST perform an occurs check and MUST NOT create cyclic terms.
Ground facts are loaded directly. Unit clauses containing variables, such as
`append([], List, List).`, MUST act as demand-driven clauses with an empty
body; their calls MUST supply enough bindings to produce ground answers. Compound arithmetic syntax in a fact is an
ordinary compound term and MUST NOT be implicitly evaluated.

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

## 5. Arithmetic and builtins

Arithmetic supports these binary operators, from lower to higher precedence:

| Operators | Associativity |
| --- | --- |
| `\/`, `xor`, `/\`, `<<`, `>>` | Left |
| `+`, `-` | Left |
| `*`, `/`, `//`, `div`, `rem`, `mod` | Left |
| `**`, `^` | `**` non-associative; `^` right |

Unary `+`, `-`, and `\` are supported; powers bind more tightly than unary
signs. Parentheses override precedence. Prefix functions use ordinary argument
syntax: `sqrt(9)`, `min(A, B)`. The implemented arithmetic functions are:

```text
abs/1 sign/1 sqrt/1 log/1 exp/1 sin/1 cos/1 tan/1 asin/1 acos/1 atan/1
floor/1 ceiling/1 round/1 truncate/1 float_integer_part/1 float_fractional_part/1
min/2 max/2 gcd/2 atan2/2 angle/2 xor/2
```

`pi` and `e` are real constants only in arithmetic evaluation. Addition,
subtraction, multiplication, and `^` with two integers and a nonnegative
exponent MUST be exact. `/` and `**` MUST produce real results. Other
transcendental operations use JavaScript binary64 Math functions in radians.
`atan2(Y, X)` has the usual signed result; the eyelang extension `angle(X, Y)`
normalizes `atan2(Y, X)` to `[0, 2*pi)`.

`//`, `div`, `rem`, `mod`, `gcd`, and bit operations MUST require integers.
`//` truncates toward zero; `div` floors. `rem` has the dividend's sign;
`mod` has the divisor's sign. With `-7` and `3`, the four results are `-2`,
`-3`, `-1`, and `2`. Zero divisors MUST fail. Bit operations MUST use unbounded
signed two's-complement semantics. Shift counts MUST be nonnegative.
`gcd` returns the nonnegative greatest common divisor, including zero for
`gcd(0, 0)`.

`floor`, `ceiling`, `round`, and `truncate` MUST return integers; `round` MUST
round halfway cases away from zero. Integer inputs MUST retain every digit.
`float_integer_part` and `float_fractional_part` MUST return real values.
`min` and `max` MUST preserve the selected operand's type and exact value,
selecting the first on equality. Mixed integer/real numeric comparisons MUST
preserve the integer operand rather than first rounding both to binary64.
Atoms, strings, and lists MUST NOT be coerced to numbers.

Builtins available in bodies, queries, and assertions are:

| Goal | Meaning |
| --- | --- |
| `true`, `false`, `fail` | Success or failure |
| `A = B`, `A \= B` | Unification or non-unifiability |
| `A == B`, `A \== B` | Structural identity or non-identity, without binding |
| `Value is Expression` | Evaluate and unify a number |
| `<`, `=<`, `>`, `>=`, `=:=`, `=\=` | Numeric comparisons; both sides are evaluated |
| `@<`, `@=<`, `@>`, `@>=` | Ordering of two bound atoms or two bound strings only |
| `between(Low, High, Value)` | Inclusive integer range; bounds must be bound |
| `contains_text(Text, Part)` | eyelang case-insensitive substring test on two bound strings |

The term-order operators implement lexicographic UTF-16 ordering only for the
two stated homogeneous types; general Prolog term ordering is outside this
subset. Unsupported arithmetic functions MUST report their name and arity.

## 6. Inference and negation

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
and unification require bound operands; negated `between/3` and aggregate goals
require a helper predicate.

The implementation MUST reject dependency cycles through negation or aggregation.
A negative consumer MUST run after its producer strata finish. Dependency
analysis distinguishes predicates by name/arity and excludes producer heads
with incompatible atomic argument constants; other argument constraints MAY
be treated conservatively. Arithmetic tests have no fact producers.
Absence means no evidence in this completed program, not a claim about the world.

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
be identified separately. Short proofs MUST show actual terms in applied
clauses; numbered proofs MUST show local bindings. Arithmetic evidence MUST
include concrete operands and results. Shared or deep proofs MUST avoid
repeated expansion and MUST NOT silently omit steps or numeric digits.
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

[README.md](https://github.com/eyereasoner/eyelang/blob/main/README.md) indexes
all executable `.pl` examples. Each example demonstrates answers, explanations,
and assertions. They include Socrates, positive cycles, routes, dates, exact
arithmetic, probabilities, Fibonacci 10000, Ackermann, complex numbers, a Turing
machine, two policy scenarios, negation, aggregation, and taxonomies up to
100000 levels. These examples demonstrate behavior, not general performance
or correctness guarantees for arbitrary inputs.

[src/language.js](https://github.com/eyereasoner/eyelang/blob/main/src/language.js)
exports `parse`, `infer`, `say`, and `run` without Node-specific dependencies.
`parse` returns facts, rules, questions, and checks; `infer` returns materialized
tuples and their evidence; `say` formats a goal; `run(source)` returns rendered
blocks. `run(source, { arc: true })` produces the three ARC sections.
Both the CLI and browser worker use this module. The
[test/](https://github.com/eyereasoner/eyelang/tree/main/test) directory contains
conformance tests with a section coverage map, behavior regressions, and
browser-interface tests.

## 12. Limits and resource considerations

This subset excludes cut, disjunction, if-then-else, arbitrary operator
declarations, nonground answers, improper or cyclic lists, general meta-calls,
DCGs, modules/imports, mutation, I/O predicates, and external calls.
It does not implement every ISO or SWI-Prolog builtin. Library-like predicates
and directives supported here do not imply the corresponding full libraries.
Stored facts, tables, explanations, and arithmetic results can be large.
The CLI defines no execution timeout; the playground uses a cancellable worker
and a labeled output preview, with complete output available for copy/save.

## 13. References

- [SWI-Prolog syntax](https://www.swi-prolog.org/man/syntax.html)
- [SWI-Prolog operators](https://www.swi-prolog.org/pldoc/man?section=opsummary)
- [SWI-Prolog arithmetic](https://www.swi-prolog.org/man/arith.html)
- [ARC: Answer, Reason, Check](https://josd.github.io/arc/)
