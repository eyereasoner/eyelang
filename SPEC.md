# Eyelog Language Specification

Status: language specification for the Eyelog 0.6 language family  
Audience: authors of Eyelog programs, compatible readers, translators, and test suites  
Scope: the Prolog-like language accepted by Eyelog source files

## Abstract

Eyelog is a compact Prolog-like definite-clause language for writing rule-based programs over ordinary terms, lists, and RDF-shaped `triple/3` facts. An Eyelog program is a finite sequence of facts and Horn clauses. Evaluation is goal-directed: goals are solved by unification against facts, rules, and a fixed set of built-in predicates. The language is intentionally smaller than ISO Prolog. It supports enough Prolog syntax to express Horn-clause reasoning, list processing, arithmetic examples, finite search, and RDF-style materialization, without operators, cut, modules, dynamic predicates, or a complete ISO standard library.

This document specifies the language. It does not specify a command-line interface, deployment format, browser interface, build system, or implementation strategy.

## 1. Terminology and normative language

The key words **MUST**, **MUST NOT**, **REQUIRED**, **SHOULD**, **SHOULD NOT**, **MAY**, and **OPTIONAL** are to be interpreted as described in RFC 2119 and RFC 8174 when, and only when, they appear in uppercase.

An **Eyelog processor** is any parser, interpreter, compiler, translator, or checker that claims conformance to this language specification.

A **program** is a finite sequence of clauses.

A **term** is a variable, atom, string, number, compound term, or list.

A **callable term** is a compound term whose functor and arity identify a predicate call. For example, `parent(pat, jan)` is a callable term with predicate indicator `parent/2`.

A **goal** is a callable term evaluated by proof search, or a comma term that expands to a conjunction of goals.

A **ground term** is a term containing no variables.

A **scalar term** is an atom, string, or number.

## 2. Design goals

Eyelog source is designed to be:

- small enough to parse without a full Prolog reader;
- close enough to Prolog to make Horn clauses, variables, unification, and lists familiar;
- explicit about arithmetic and comparison by using predicates such as `add/3` and `lt/2` instead of infix operators;
- friendly to RDF-shaped output through the ordinary predicate `triple/3`;
- deterministic where possible, while still allowing finite nondeterministic search through rules and selected built-ins.

Non-goals include complete ISO Prolog compatibility, operator declarations, module systems, dynamic database updates, DCGs, cut-based control, and full bottom-up RDF closure semantics.

## 3. Lexical structure

### 3.1 Character stream

An Eyelog source document is a sequence of Unicode scalar values or bytes interpreted as text by the processor. A conforming processor MUST recognize at least ASCII source text. Implementations MAY accept wider character sets in quoted atoms and strings.

Whitespace separates tokens and is otherwise insignificant, except inside quoted atoms and strings.

### 3.2 Comments

A percent sign starts a line comment outside quoted terms:

```prolog
% this is a comment
triple(a, b, c).  % this is also a comment
```

A comment continues until the next newline or the end of the source document.

### 3.3 Punctuation tokens

The following punctuation tokens have fixed meaning:

| Token | Meaning |
| --- | --- |
| `.` | clause terminator |
| `:-` | rule separator |
| `,` | argument separator, body-goal separator, or comma-term separator |
| `(` `)` | compound arguments or parenthesized comma term |
| `[` `]` | list notation |
| `|` | explicit list tail |

A colon outside the `:-` token is not part of the language. Namespace-like names SHOULD be written as plain atoms such as `rdf_type` rather than `rdf:type`.

### 3.4 Variables

A variable token starts with an uppercase ASCII letter or `_`.

Examples:

```prolog
X
Person
_Result
_123
```

The token `_` is the anonymous variable. Each occurrence of `_` denotes a fresh variable that is distinct from every other variable occurrence.

Variable names are scoped to one clause or one query goal. Variables with the same name inside a clause denote the same logical variable.

### 3.5 Atoms

An unquoted atom is a nonempty token that:

- is not a number;
- does not start with an uppercase ASCII letter or `_`;
- does not contain whitespace;
- does not contain one of `(`, `)`, `[`, `]`, `,`, `|`, `.`, `:`, `'`, or `"`.

Examples:

```prolog
pat
rdf_type
checkout-api
#
<=
```

The last two examples are atoms, not operators. Eyelog has no general operator system.

A single-quoted atom begins and ends with `'`:

```prolog
'atom with spaces'
'can''t'
''
```

Inside a single-quoted atom, two adjacent single quotes denote one embedded single quote. A processor SHOULD also accept common backslash escapes described in Section 3.7.

### 3.6 Strings

A string begins and ends with `"`:

```prolog
"hello"
"line\ntext"
```

Strings are scalar terms distinct from atoms. An atom `'hello'` and a string `"hello"` are not the same term.

### 3.7 Escapes in quoted terms

Inside single-quoted atoms and double-quoted strings, processors SHOULD recognize:

| Escape | Character |
| --- | --- |
| `\n` | newline |
| `\t` | horizontal tab |
| `\\` | backslash |
| `\'` | single quote, inside single-quoted atoms |
| `\"` | double quote, inside strings |

Processors MAY pass through other escaped characters as the escaped character itself.

### 3.8 Numbers

A number is one of:

```text
Digits
-Digits
Digits.Digits
-Digits.Digits
Digits Exponent
-Digits Exponent
Digits.Digits Exponent
-Digits.Digits Exponent
```

where `Exponent` is `e` or `E`, optionally followed by `+` or `-`, followed by one or more digits.

Examples:

```prolog
0
42
-7
3.14
-0.25
7.5e-7
1E+6
```

Numbers are terms. The language does not specify exact decimal arithmetic for every numeric literal. Arithmetic built-ins define their own numeric behavior in Section 9.

## 4. Surface grammar

The following grammar is descriptive. Whitespace and comments may appear between tokens.

```ebnf
program       ::= { clause } ;

clause        ::= fact | rule ;
fact          ::= head "." ;
rule          ::= head ":-" goal-list "." ;

head          ::= callable ;
goal-list     ::= goal { "," goal } ;
goal          ::= callable | comma-term ;

term          ::= variable
                | atom
                | string
                | number
                | compound
                | list
                | comma-term ;

callable      ::= atom "(" [ term { "," term } ] ")" ;
compound      ::= callable ;

comma-term    ::= "(" term "," term { "," term } ")" ;

list          ::= "[" "]"
                | "[" term { "," term } "]"
                | "[" term { "," term } "|" term "]" ;
```

A conforming Eyelog source program SHOULD use callable terms as clause heads and goals. Non-callable terms may be accepted by a permissive parser, but they have no portable proof-search meaning.

Zero-arity compound syntax is allowed:

```prolog
nil().
triple(example, value, nil()).
```

`nil()` is a compound term with arity 0. It is distinct from the atom `nil`.

## 5. Terms

### 5.1 Variables

Variables unify with terms. A repeated variable name in the same clause or query constrains all occurrences to the same value:

```prolog
same(X) :- eq(X, X).
```

The anonymous variable `_` does not impose equality between occurrences:

```prolog
edge(_, _).
```

### 5.2 Atoms

Atoms are symbolic constants. They are compared by identity for unification. Processors that print atoms SHOULD quote atoms when needed so the printed form can be read back as an Eyelog term.

### 5.3 Strings

Strings are scalar terms intended for text. They are not lists of character codes. String processing is provided by built-ins such as `str_concat/3`, `contains/2`, and `matches/2`.

### 5.4 Numbers

Numbers are scalar terms. Numeric identity for unification is textual: `1` and `1.0` are distinct terms unless related by arithmetic built-ins.

### 5.5 Compound terms

A compound term has a functor atom and zero or more arguments:

```prolog
point(3, 4)
skolem(observation, alice, glucose)
```

Compound terms are used both as data and as predicate calls. A compound term occurring as a clause head or body goal is callable. A compound term occurring inside another term is data unless explicitly called through a rule or built-in.

### 5.6 Lists

The empty list is written `[]`.

A proper list is written:

```prolog
[a, b, c]
```

A head-tail list pattern is written:

```prolog
[Head|Tail]
[a, b|Tail]
```

List syntax is notation for nested cons terms. A processor SHOULD treat `[a, b, c]` as equivalent to the nested list whose head is `a`, then `b`, then `c`, ending in `[]`.

Improper lists are allowed when a non-list tail is written explicitly:

```prolog
[a, b|tail]
```

Built-ins that require finite proper lists SHOULD fail or be undefined for improper lists.

### 5.7 Comma terms

A parenthesized comma sequence is a term with functor `,/2`:

```prolog
(triple(a, b, c), triple(d, e, f))
```

When a comma term appears as a goal, it is evaluated as a conjunction. When it appears as data, it remains a term. The `formula_triple/4` built-in can enumerate `triple/3` terms inside such formula terms.

## 6. Clauses and predicates

A predicate is identified by its name and arity, written `name/arity`.

A fact is a clause with an empty body:

```prolog
parent(pat, jan).
```

A rule is a definite Horn clause:

```prolog
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
```

The head of a rule is true when every goal in its body succeeds under a common substitution.

All variables in a clause are universally quantified over the clause. Operationally, a fresh copy of the clause variables is used each time the clause is selected during proof search.

Clauses for the same predicate MAY appear anywhere in the program. The relative order of clauses is significant for operational search and for the order in which answers may be found, but portable programs SHOULD NOT depend on answer order unless the host environment explicitly defines it.

## 7. Goals and proof search

A goal is solved against a program and an environment of variable bindings.

A conforming Eyelog processor MUST support the following conceptual proof procedure for pure user predicates:

1. Select the leftmost goal in the current conjunction.
2. If the goal is a comma term, expand it into its component goals.
3. If the goal is a built-in, evaluate it according to Section 9.
4. Otherwise, find clauses whose heads have the same predicate indicator as the goal.
5. For each such clause, using fresh clause variables, unify the goal with the clause head.
6. If unification succeeds, solve the clause body followed by the remaining goals.
7. Each successful complete derivation yields one answer substitution.

This describes the observable language behavior. A processor MAY use indexing, memoization, tabling, compilation, or other optimizations when they preserve the answers required by the language profile being used.

### 7.1 Unification

Unification makes two terms equal by binding variables.

- A variable can unify with any term.
- Two atoms unify if they are the same atom.
- Two strings unify if they are the same string.
- Two numbers unify if they have the same numeric token text.
- Two compound terms unify if they have the same functor, same arity, and pairwise unifiable arguments.
- Two lists unify according to their nested cons structure.

Eyelog does not require an occurs check. Portable programs SHOULD NOT rely on cyclic terms such as unifying `X` with `f(X)`.

### 7.2 Failure

A goal fails when no built-in rule or user clause can make it succeed.

Failure is not an exception. It is ordinary search backtracking.

### 7.3 Finite search expectation

The language permits recursive rules and generators. Program authors are responsible for writing rules whose selected goals have finite search for the intended queries. A processor MAY impose resource limits.

## 8. Logical reading

Ignoring non-monotonic and control built-ins, an Eyelog program denotes a set of definite Horn clauses over the Herbrand universe of its terms.

A fact:

```prolog
p(a).
```

asserts `p(a)`.

A rule:

```prolog
p(X) :- q(X), r(X).
```

states that `p(X)` holds whenever `q(X)` and `r(X)` hold.

The pure fragment is monotonic: adding clauses can add answers but does not invalidate existing answers. The built-ins `not/1`, `once/1`, date/time predicates, and resource-bounded predicates are operational and are not part of the pure monotonic fragment.

## 9. Built-in predicates

Built-ins are ordinary predicate calls whose meaning is fixed by the language profile. If a predicate indicator is listed in this section, a conforming processor MUST give it the specified meaning or reject the program as using an unsupported built-in.

Unless otherwise stated, output arguments may be variables and input arguments SHOULD be sufficiently instantiated to make the operation finite.

### 9.1 Equality and unification

| Predicate | Meaning |
| --- | --- |
| `eq(X, Y)` | Succeeds by unifying `X` and `Y`. |
| `neq(X, Y)` | Succeeds when `X` and `Y` are not unifiable. |

`neq/2` is safest when both arguments are already bound enough that unifiability is determinate.

### 9.2 Arithmetic

| Predicate | Meaning |
| --- | --- |
| `add(A, B, X)` | `X` is `A + B`. |
| `sub(A, B, X)` | `X` is `A - B`. |
| `mul(A, B, X)` | `X` is `A * B`. |
| `div(A, B, X)` | `X` is `A / B`; integer quotient in integer mode. |
| `mod(A, B, X)` | `X` is the integer remainder of `A / B`. |
| `max(A, B, X)` | `X` is the larger of `A` and `B`. |
| `min(A, B, X)` | `X` is the smaller of `A` and `B`. |
| `pow(A, B, X)` | `X` is `A` raised to `B`. |
| `neg(A, X)` | `X` is `-A`. |
| `abs(A, X)` | `X` is the absolute value of `A`. |
| `sin(A, X)` | `X` is sine of `A` radians. |
| `cos(A, X)` | `X` is cosine of `A` radians. |
| `asin(A, X)` | `X` is inverse sine of `A`, in radians. |
| `acos(A, X)` | `X` is inverse cosine of `A`, in radians. |
| `rounded(A, X)` | `X` is the nearest integer to `A`. |
| `log(A, X)` | `X` is the natural logarithm of `A`. |

For `add/3`, `sub/3`, `mul/3`, `div/3`, `pow/3`, `max/3`, and `min/3`, when all relevant operands are integer tokens, processors SHOULD provide exact integer behavior. In integer mode, `div/3` is integer quotient and `pow/3` requires a non-negative integer exponent.

When a relevant operand contains a decimal point or exponent, processors SHOULD treat the operation as approximate floating-point arithmetic. The recommended profile is IEEE-754 double precision.

`mod/3` is integer-only. Transcendental functions are approximate numeric operations.

### 9.3 Comparison

| Predicate | Meaning |
| --- | --- |
| `lt(A, B)` | Succeeds when `A < B`. |
| `gt(A, B)` | Succeeds when `A > B`. |
| `le(A, B)` | Succeeds when `A <= B`. |
| `ge(A, B)` | Succeeds when `A >= B`. |

Numeric terms compare numerically. Duration strings of the form `P<years>Y<months>M<days>D`, with omitted components allowed, compare by calendar component order. Other scalar terms MAY compare lexically. Portable programs SHOULD use comparison on bound scalar terms.

### 9.4 Dates and durations

| Predicate | Meaning |
| --- | --- |
| `local_time(Date)` | Unifies `Date` with the current local date as a string `YYYY-MM-DD`. |
| `difference(End, Start, Duration)` | Computes a calendar duration string between two ISO dates. |

`difference/3` expects date strings whose first ten characters are `YYYY-MM-DD`. The result is an ISO-like duration string such as `"P81Y8M28D"`.

Programs that use `local_time/1` are time-dependent and are not pure logical programs.

### 9.5 Generators

| Predicate | Meaning |
| --- | --- |
| `between(Low, High, N)` | Enumerates integers from `Low` through `High`, inclusive. |
| `smallest_divisor_from(N, D, S)` | Finds the first divisor of `N` at or above `D`, or `N` if none is smaller. |

`between/3` requires finite integer bounds.

### 9.6 Lists

| Predicate | Meaning |
| --- | --- |
| `append(A, B, C)` | Relates lists where `C` is `A` followed by `B`. |
| `nth0(N, List, Value)` | Zero-based list lookup, and finite enumeration in supported modes. |
| `set_nth0(N, List, Updated, Value)` | `Updated` is `List` with item `N` replaced by `Value`. |
| `rest(List, Tail)` | `Tail` is the tail of a non-empty list. |
| `member(Item, List)` | `Item` occurs in `List`. |
| `not_member(Item, List)` | `Item` does not occur in a known finite list. |
| `reverse(List, Reversed)` | `Reversed` is `List` in reverse order. |
| `length(List, N)` | `N` is the length of a known proper list. |
| `is_list(List)` | Succeeds when `List` is a proper list. |

List built-ins are finite-list predicates. Portable programs SHOULD call them with enough instantiated arguments to avoid infinite generation.

### 9.7 Formula terms

| Predicate | Meaning |
| --- | --- |
| `formula_triple(Formula, S, P, O)` | Enumerates `triple(S, P, O)` terms inside a comma formula. |

Example:

```prolog
formula_triple((triple(a, b, c), triple(d, e, f)), S, P, O).
```

This yields the two triples in the formula term.

### 9.8 String and atom construction

| Predicate | Meaning |
| --- | --- |
| `atom_concat(A, B, C)` | Concatenates scalar text into atom `C`. |
| `str_concat(A, B, C)` | Concatenates scalar text into string `C`. |
| `contains(Text, Part)` | Succeeds when `Text` contains `Part`. |
| `not_contains(Text, Part)` | Succeeds when `Text` does not contain `Part`. |
| `matches(Text, Pattern)` | Succeeds for a simple literal or alternation pattern. |
| `not_matches(Text, Pattern)` | Negation of `matches/2`. |

`matches/2` supports a simple alternation profile such as `"diabetes|medical"`. It is not a full regular-expression language.

### 9.9 Search control

| Predicate | Meaning |
| --- | --- |
| `not(Goal)` | Negation as failure: succeeds when `Goal` has no solution. |
| `once(Goal)` | Succeeds with only the first solution of `Goal`. |

`not/1` is operational and non-monotonic. Programs SHOULD use it only when `Goal` is sufficiently bound and finite.

`once/1` is search control. It can make a program depend on clause order and answer order.

A comma term inside `not/1` or `once/1` is treated as a conjunction:

```prolog
not((visited(Node, Path), blocked(Node)))
once((member(X, List), lt(X, 10)))
```

### 9.10 Finite constraint helper

| Predicate | Meaning |
| --- | --- |
| `sudoku(Puzzle, Solution)` | Relates a 9x9 Sudoku puzzle to a completed grid solution. |

`Puzzle` may be an 81-character string using `0` or `.` for blanks, or a 9x9 grid list using `0` for blanks. `Solution` is a completed 9x9 grid list.

This built-in is part of the current Eyelog language profile but is intentionally domain-specific. Portable core programs SHOULD NOT require it unless targeting processors that advertise the finite-constraint extension profile.

## 10. Declarations

### 10.1 Memoization declaration

The fact:

```prolog
memoize(Name, Arity).
```

where `Name` is an atom and `Arity` is a non-negative integer, declares that calls to predicate `Name/Arity` MAY be memoized by the processor.

This declaration is an optimization directive. It MUST NOT change the logical answers of pure finite programs. It MAY affect termination, performance, and resource usage for recursive programs.

`memoize/2` is a declaration, not a rule for deriving ordinary output facts.

## 11. `triple/3` convention

`triple/3` is an ordinary predicate with a conventional meaning:

```prolog
triple(Subject, Predicate, Object)
```

Programs SHOULD use `triple/3` for RDF-shaped facts and derived public output. The language does not reserve the subject, predicate, or object positions to particular term types; any Eyelog term may appear in any position.

Example:

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, ancestor, Y) :- ancestor(X, Y).
```

A host environment MAY choose `triple(S, P, O)` as its default query and materialize distinct answers. That host behavior is outside this language specification. The language-level point is that `triple/3` is a normal predicate used as a graph-shaped output convention.

## 12. Output and read-back profile

When a processor prints Eyelog terms, it SHOULD produce text that is accepted by the term grammar in this specification.

In particular, it SHOULD:

- quote atoms that are empty or contain whitespace, punctuation reserved by the grammar, or embedded quotes;
- double embedded quotes in single-quoted atoms;
- print strings with double quotes;
- print proper lists with bracket notation;
- print improper lists with explicit tail notation;
- print numbers as numeric tokens.

Output order is not specified by the language.

## 13. Conformance profiles

### 13.1 Core profile

A processor conforms to the Eyelog core profile when it accepts and correctly evaluates:

- facts and definite Horn clauses;
- variables, atoms, quoted atoms, strings, numbers, compound terms, lists, and comma terms;
- unification and left-to-right conjunction;
- the built-ins in Sections 9.1 through 9.9, except where marked as extension-specific;
- `triple/3` as an ordinary user predicate.

### 13.2 Extension profile

A processor MAY additionally advertise support for:

- `sudoku/2`;
- host-dependent date/time behavior;
- exact large-integer arithmetic beyond minimal numeric support;
- resource limits larger than its default profile;
- host-specific query and materialization behavior.

Extensions MUST NOT change the meaning of core syntax.

## 14. Relationship to ISO Prolog

Eyelog is Prolog-like, but it is not ISO Prolog.

Eyelog intentionally supports:

- variables with uppercase or `_` initial characters;
- facts and rules using `:-`;
- comma-separated conjunctions;
- single-quoted atoms, including doubled embedded quotes;
- double-quoted strings;
- numbers;
- compound terms;
- list notation;
- `%` line comments.

Eyelog intentionally does not specify:

- operator declarations or general infix parsing;
- `is/2` arithmetic expressions;
- cut (`!`);
- disjunction (`;/2`) as syntax;
- if-then (`->/2`) as syntax;
- DCGs;
- modules;
- dynamic predicates such as `assert/1` and `retract/1`;
- ISO stream I/O;
- ISO exception terms;
- full ISO term ordering.

Programs intended for Eyelog SHOULD use explicit predicate forms such as `add(A, B, X)` and `lt(A, B)` rather than ISO Prolog arithmetic syntax such as `X is A + B` or `A < B`.

## 15. Examples

### 15.1 Transitive closure

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, ancestor, Y) :- ancestor(X, Y).
```

### 15.2 Arithmetic

```prolog
square(X, Y) :- mul(X, X, Y).
triple(three, square, Y) :- square(3, Y).
```

### 15.3 Lists

```prolog
first([Head|_Tail], Head).
triple(example, first, X) :- first([a, b, c], X).
```

### 15.4 Negation as failure

```prolog
blocked(b).
open(Node) :- not(blocked(Node)).
triple(a, status, open) :- open(a).
```

`not/1` is safe here because `Node` is bound when `blocked(Node)` is tested.

## 16. Security and portability considerations

Language processors may be embedded in browsers, servers, command-line tools, or translators. The language itself has no file I/O, network I/O, dynamic code loading, or destructive database update predicates. Host environments that provide source loading, query selection, or materialized output are responsible for their own security policy.

Portable programs SHOULD:

- avoid relying on answer order;
- keep `not/1` and list generators finite;
- avoid cyclic terms;
- avoid host-dependent `local_time/1` when reproducible output is required;
- use `triple/3` for public RDF-shaped output and helper predicates for internal computation;
- use plain vocabulary atoms such as `rdf_type` rather than colon names.
