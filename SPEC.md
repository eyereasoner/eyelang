# Eyelog Language Specification

## Abstract

Eyelog is a compact Prolog-like definite-clause language for rule-based programs over ordinary terms, lists, arithmetic, strings, and finite search. An Eyelog program is a finite sequence of facts and Horn clauses. Evaluation is goal-directed: goals are solved by unification against facts, rules, and a fixed set of built-in predicates.

Relation-style binary predicates such as `parent(pat, jan)`, `ancestor(pat, emma)`, `status(case1, accepted)`, and `reason(case1, "...")` are the normal output form. A host that runs Eyelog without an explicit query materializes new ground binary consequences `p(S, O)` unless `materialize/2` declarations restrict the selected predicates.

Eyelog is intentionally smaller than ISO Prolog. It supports enough Prolog syntax to express Horn-clause reasoning, list processing, arithmetic examples, finite search, and formula data, without operators, cut, modules, dynamic predicates, DCGs, or a complete ISO standard library.

## 1. Terminology and normative language

The key words **MUST**, **MUST NOT**, **SHOULD**, **SHOULD NOT**, and **MAY** are to be interpreted as normative requirements.

A **term** is a variable, atom constant, string, number, list, or compound term.

An **atom constant** is a symbolic scalar term, such as `pat`, `type`, or `'atom with spaces'`. In this specification, the word **atom** by itself refers to an atom constant unless explicitly qualified.

An **atomic formula** is a predicate application such as `parent(pat, jan)` or `status(case1, accepted)`. In logic-programming literature, atomic formulas are often also called atoms; this specification avoids that usage where ambiguity with atom constants could arise.

A **clause** is either a fact `Head.` or a rule `Head :- Body.`.

A **goal** is an atomic formula, a built-in call, or a comma conjunction.

A **source fact** is a fact written directly in the input program. A **new derivation** is a ground consequence found through at least one rule and not merely repeated from the source facts.

## 2. Design goals

Eyelog is designed to be:

- small enough to embed and audit;
- deterministic in textual output order after duplicate suppression;
- useful for relation-style `p(S, O)` output through ordinary predicate names;
- practical for examples involving recursion, lists, arithmetic, strings, aggregation, finite search, and formula-valued data.

Non-goals include complete ISO Prolog compatibility, operator declarations, module systems, dynamic database updates, cut-based control, and full bottom-up closure semantics.

## 3. Lexical structure

### 3.1 Character stream

Input is a sequence of Unicode bytes treated as C strings by the implementation. Whitespace separates tokens and is otherwise insignificant outside quoted strings and quoted atoms.

### 3.2 Comments

A percent sign starts a line comment outside quoted strings and quoted atoms. The comment extends to the end of the line.

```prolog
parent(pat, jan).  % this is a comment
```

### 3.3 Punctuation tokens

The punctuation tokens are:

```text
(  )  [  ]  ,  |  .  :-
```

A colon outside `:-` is not part of the language. Namespace-like names SHOULD be written as plain atom constants such as `person_type` or `odrl_permission`.

### 3.4 Variables

A variable starts with an uppercase ASCII letter or underscore, followed by zero or more ASCII letters, digits, or underscores.

Examples:

```prolog
X
Person
_Thing
_
```

Each `_` anonymous variable occurrence is fresh.

### 3.5 Atom constants

A plain atom constant starts with a lowercase ASCII letter and is followed by zero or more ASCII letters, digits, or underscores:

```prolog
pat
type
case_123
```

A quoted atom constant is enclosed in single quotes. A single quote inside a quoted atom is represented by doubling it:

```prolog
'atom with spaces'
'needs''quote'
''
```

A graphic atom constant is one or more graphic characters from this set:

```text
#$&*+-/<=>?@^~\
```

### 3.6 Strings

A string is enclosed in double quotes. The implementation supports common escapes such as `\n`, `\t`, `\"`, and `\\`.

### 3.7 Numbers

Numbers are scalar terms. Integers, decimal numbers, and scientific notation are accepted:

```prolog
0
-42
0.25
1.25e-3
1.25e+3
```

Integer arithmetic built-ins use arbitrary-precision decimal strings where possible. Floating operations use the host C `double` behavior.

## 4. Surface grammar

This grammar is descriptive. Implementations MAY reject programs that exceed implementation limits.

```text
program      ::= clause*
clause       ::= term "." | term ":-" goal_list "."
goal_list    ::= term ("," term)*
term         ::= variable
              | atom
              | string
              | number
              | atom "(" [term ("," term)*] ")"
              | "[" [list_items] "]"
              | "(" term ("," term)+ ")"
list_items   ::= term ("," term)* ["|" term]
```

A clause head SHOULD be a compound term. Non-compound heads are parsed but are not useful in the current predicate index.

Zero-arity compounds are written with parentheses:

```prolog
nil().
value(example, nil()).
```

## 5. Terms

### 5.1 Variables

Variables are scoped to a single clause or query. A variable in a rule head and body denotes the same logical variable within that clause.

### 5.2 Atom constants, strings, and numbers

Atom constants, strings, and numbers are distinct scalar term kinds. Two scalar terms unify only when their type and lexical value match, except where a built-in explicitly interprets lexical values.

### 5.3 Compound terms

A compound term has a functor name and arity:

```prolog
parent(pat, jan)
pair(3, nested(atom, [x, y]))
```

The functor name is fixed syntactically. Eyelog does not support variables in predicate or functor position.

### 5.4 Lists

Lists use Prolog surface syntax and are represented internally with `./2` and `[]`:

```prolog
[]
[a, b, c]
[a, b | tail]
```

### 5.5 Comma terms

Parenthesized comma terms may be goals or data:

```prolog
(parent(pat, jan), parent(jan, emma))
(name(alice, "Alice"), knows(alice, bob))
```

When a comma term appears as a goal, it is evaluated as conjunction. When it appears as data, it remains a term. `formula_atom/2` and `formula_binary/4` enumerate members inside such formula terms.

## 6. Clauses and predicates

A fact has no body:

```prolog
parent(pat, jan).
```

A rule has a head and a body:

```prolog
ancestor(X, Y) :-
  parent(X, Y).

ancestor(X, Z) :-
  parent(X, Y),
  ancestor(Y, Z).
```

Clauses with the same predicate name and arity define one predicate group. Predicate name and arity are both significant: `p/1` and `p/2` are different predicates.

## 7. Goals and proof search

Goals are solved left-to-right. For a user predicate goal, Eyelog selects candidate clauses by predicate name, arity, and available indexes. A candidate clause is freshened, its head is unified with the goal, and then its body is solved.

A conjunction goal succeeds when all conjuncts succeed in order. A query answer is printed as the resolved query term followed by a period.

### 7.1 Unification

Unification follows the ordinary first-order term structure used by the language. The implementation does not perform an occurs check.

### 7.2 Failure

A goal fails when no built-in case or user clause can prove it. Eyelog has no exception term language; parse errors and resource failures are implementation errors reported to the host.

### 7.3 Finite search expectation

Programs and queries SHOULD be written so the relevant search space is finite. Eyelog includes recursion guards and memoization support, but it is not required to terminate for arbitrary recursive logic programs.

## 8. Logical reading

For the pure Horn-clause fragment, an Eyelog program has the standard least-Herbrand-model reading. Facts are true directly. A rule contributes an immediate consequence when its body is true under some substitution.

The CLI is goal-directed rather than a complete bottom-up model enumerator. Its no-query output is a host behavior: it asks broad materialization queries, suppresses duplicates, excludes source facts, and prints selected ground answers. Explicit `--query` gives direct access to the goal-directed solver.

Built-ins such as arithmetic, string operations, time, negation-as-failure, `once/1`, and `findall/3` are operational extensions and should be understood by their specified behavior rather than by pure Horn semantics alone.

## 9. Built-in predicates

This section lists the built-ins supported by the implementation.

### 9.1 Equality and unification

| Built-in | Meaning |
|---|---|
| `eq(A, B)` | Succeeds when `A` and `B` unify. |
| `neq(A, B)` | Succeeds when `A` and `B` do not unify. |

### 9.2 Arithmetic

| Built-in | Meaning |
|---|---|
| `neg(A, B)` | `B` is the numeric negation of `A`. |
| `abs(A, B)` | `B` is the absolute value of `A`. |
| `sin(A, B)`, `cos(A, B)`, `asin(A, B)`, `acos(A, B)`, `log(A, B)` | Floating functions. |
| `rounded(A, B)` | `B` is `A` rounded to the nearest integer. |
| `add(A, B, C)` | `C = A + B`. |
| `sub(A, B, C)` | `C = A - B`. |
| `mul(A, B, C)` | `C = A * B`. |
| `div(A, B, C)` | `C = A / B`; integer inputs use integer division. |
| `mod(A, B, C)` | Integer remainder. |
| `pow(A, B, C)` | `C = A^B`. |
| `max(A, B, C)`, `min(A, B, C)` | Numeric maximum or minimum. |

### 9.3 Comparison

| Built-in | Meaning |
|---|---|
| `lt(A, B)` | `A < B`. |
| `gt(A, B)` | `A > B`. |
| `le(A, B)` | `A =< B`. |
| `ge(A, B)` | `A >= B`. |

Comparisons interpret numeric-looking terms numerically. Other scalar terms are compared lexically.

### 9.4 Dates and durations

| Built-in | Meaning |
|---|---|
| `local_time(T)` | Binds `T` to the local timestamp string. |
| `difference(A, B, D)` | Computes an ISO-like date/duration difference. |

### 9.5 Generators

| Built-in | Meaning |
|---|---|
| `between(Low, High, X)` | Enumerates integers from `Low` through `High`. |
| `smallest_divisor_from(N, Start, D)` | Finds a divisor of `N` starting at `Start`. |

### 9.6 Strings and atoms

| Built-in | Meaning |
|---|---|
| `atom_concat(A, B, C)` | Atom-constant concatenation. |
| `str_concat(A, B, C)` | String concatenation. |
| `contains(Text, Needle)` | Text contains `Needle`. |
| `not_contains(Text, Needle)` | Text does not contain `Needle`. |
| `matches(Text, Pattern)` | Text matches a simple implementation regex/search pattern. |
| `not_matches(Text, Pattern)` | Negation of `matches/2`. |

### 9.7 Lists

| Built-in | Meaning |
|---|---|
| `append(A, B, C)` | List append/split relation. |
| `nth0(Index, List, Value)` | Zero-based list lookup. |
| `set_nth0(Index, List, Value, Out)` | Functional list update. |
| `rest(List, Tail)` | Tail of a non-empty list. |
| `member(X, List)` | Member generator. |
| `select(X, List, Rest)` | Selects one occurrence. |
| `not_member(X, List)` | Succeeds when `X` is not a member. |
| `reverse(A, B)` | Reverses a proper list. |
| `length(List, N)` | Proper-list length. |
| `is_list(X)` | Succeeds when `X` is a proper list. |

### 9.8 Aggregation and ordering

| Built-in | Meaning |
|---|---|
| `findall(Template, Goal, Bag)` | Collects all templates for solutions of `Goal`. |
| `sort(Input, Output)` | Sorts and deduplicates a proper list. |

### 9.9 Formula terms

| Built-in | Meaning |
|---|---|
| `formula_atom(Formula, Atom)` | Enumerates compound formula members inside comma formula data. |
| `formula_binary(Formula, S, P, O)` | Enumerates binary formula members `P(S, O)`, exposing the functor as atom constant `P`. |

Example:

```prolog
formula_binary((name(alice, "Alice"), knows(alice, bob)), S, P, O).
```

This can yield `formula_binary((name(alice, "Alice"), knows(alice, bob)), alice, name, "Alice").` and `formula_binary((name(alice, "Alice"), knows(alice, bob)), alice, knows, bob).`

### 9.10 Search control

| Built-in | Meaning |
|---|---|
| `not(Goal)` | Negation as failure. Succeeds when `Goal` has no solution. |
| `once(Goal)` | Succeeds with at most the first solution of `Goal`. |

### 9.11 Finite constraint helper

| Built-in | Meaning |
|---|---|
| `sudoku(Puzzle, Solution)` | Solves a 9x9 Sudoku string/list puzzle. |

## 10. Declarations

Declarations are written as ordinary facts, but the host treats them specially.

### 10.1 Memoization

```prolog
memoize(Name, Arity).
```

`Name` MUST be an atom constant and `Arity` MUST be a non-negative integer. The declaration asks the solver to table answers for the named predicate group when applicable.

Example:

```prolog
memoize(path, 2).
```

### 10.2 Default-output materialization

```prolog
materialize(Name, Arity).
```

`Name` MUST be an atom constant and `Arity` MUST be a non-negative integer. If a program contains one or more `materialize/2` declarations, no-query CLI output is restricted to those predicate groups. Source facts are still excluded from printed output.

Example:

```prolog
materialize(status, 2).
materialize(reason, 2).
```

`materialize/2` does not affect explicit queries.

## 11. Output and read-back profile

Normal answer output prints one resolved term per line, followed by a period. Strings are double-quoted; atom constants are quoted when needed; lists use list syntax; compound terms use functor notation.

Output SHOULD be accepted as Eyelog input when it contains only supported term syntax.

Without `--query`, the host behavior is:

1. parse all inputs into one program;
2. collect source fact lines for duplicate suppression;
3. if `materialize/2` declarations exist, query those predicate groups; otherwise query all binary predicate groups with at least one rule;
4. keep only ground answers;
5. remove answers identical to source facts;
6. suppress duplicates;
7. print sorted facts.

### 11.1 Explanation output

`--explain` MAY print non-normative proof trees for query answers or default derived output. Explanation output is outside the logical semantics and MUST NOT change the set of answers.

## 12. Conformance profiles

### 12.1 Core profile

A conforming core implementation supports:

- lexical syntax described above;
- facts and definite clauses;
- first-order unification without occurs check;
- left-to-right goal-directed proof search;
- lists and comma conjunctions;
- answer printing.

### 12.2 Extension profile

The C implementation also supports:

- the built-ins listed in this specification;
- `memoize/2` declarations;
- `materialize/2` declarations;
- default no-query derived output;
- explanation output;
- stdin, file, and URL inputs in the native CLI;
- browser execution through the WebAssembly build.

## 13. Relationship to ISO Prolog

Eyelog borrows familiar Prolog syntax and Horn-clause execution but is not ISO Prolog. Notable differences include:

- no operators or operator declarations;
- no cut;
- no modules;
- no dynamic database update;
- no DCGs;
- no full ISO term ordering or standard library;
- no variables in functor or predicate position;
- no occurs check in unification.

Programs intended to be portable to Eyelog SHOULD avoid ISO-specific syntax and keep terms explicit.

## 14. Examples

### 14.1 Transitive closure

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
```

### 14.2 Arithmetic

```prolog
square(X, Y) :- mul(X, X, Y).
answer(three, Y) :- square(3, Y).
```

### 14.3 Lists

```prolog
first([X | _Rest], X).
answer(example, X) :- first([a, b, c], X).
```

### 14.4 Negation as failure

```prolog
closed(b).
open(X) :- not(closed(X)).
status(a, open) :- open(a).
```

## 15. Security and portability considerations

Native URL input uses external tools such as `curl` or `wget` when available. Hosts SHOULD treat downloaded programs as untrusted code because they can trigger expensive search.

Programs SHOULD be written with finite search in mind. Broad no-query materialization can be expensive for helper predicates; use explicit `--query` or `materialize/2` declarations when needed.
