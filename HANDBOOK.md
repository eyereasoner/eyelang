# eyelog Handbook

This handbook describes the eyelog language and how to write examples that are self-contained: data, logic, and the final query live in the same `.pl` file.

## Contents

- [1. Program shape](#1-program-shape)
- [2. Running eyelog](#2-running-eyelog)
- [3. Terms](#3-terms)
- [4. Rules as Horn clauses](#4-rules-as-horn-clauses)
- [5. Herbrand semantics](#5-herbrand-semantics)
- [6. Query mode](#6-query-mode)
- [7. Built-ins](#7-built-ins)
- [8. Writing examples](#8-writing-examples)
- [9. Golden outputs and tests](#9-golden-outputs-and-tests)
- [10. Performance tips](#10-performance-tips)
- [11. Current limits](#11-current-limits)

## 1. Program shape

An eyelog program is a sequence of Prolog-style facts and Horn clauses.

```prolog
parent(:pat, :jan).
parent(:jan, :emma).

ancestor(X, Y) :-
  parent(X, Y).

ancestor(X, Z) :-
  parent(X, Y),
  ancestor(Y, Z).
```

A fact has no body. A rule has a head, `:-`, a comma-separated body, and a final `.`.

Most examples follow this shape:

1. input data as facts,
2. reusable logic as predicates,
3. final `triple/3` rules as the query/output layer.

## 2. Running eyelog

Build the executable with:

```sh
make
```

Then run an example:

```sh
bin/eyelog examples/ancestor.pl
```

When you run a file without `--query`, eyelog materializes all distinct solutions of:

```prolog
triple(S, P, O)
```

and prints them as Prolog facts:

```prolog
triple(:pat, :ancestor, :emma).
```

This keeps the engine generic. Each example should define the `triple/3` rules that represent its intended output.

Example:

```prolog
parent(:pat, :jan).
parent(:jan, :emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, :ancestor, Y) :- ancestor(X, Y).
```

## 3. Terms

Supported term forms are:

```prolog
X                  % variable, starts with uppercase or _
:pat               % atom
parent             % atom
"hello world"      % string
123                % integer
0.25               % decimal literal
7.5e-7             % scientific decimal literal
pair(3, 7)         % compound term
[]                 % empty list
[a, b, c]          % proper list
[Head|Tail]        % head/tail list pattern
```

The anonymous variable `_` is allowed. Each occurrence is treated as a fresh variable. Decimal and scientific numeric literals are parsed as numeric terms. Integer-only arithmetic uses arbitrary-size decimal-integer helpers for `add/3`, `sub/3`, `mul/3`, `div/3`, `pow/3`, and `max/3`. When at least one arithmetic operand contains a decimal point or exponent, the arithmetic built-ins use the host C `double` type and print a decimal result.

Lists are first-class terms. They can appear in facts, rule heads, rule bodies, queries, and `triple/3` output. Proper lists print with bracket syntax:

```prolog
triple(:example, :items, [a, b, c]).
```

Head/tail patterns work by unification:

```prolog
first(List, Head) :-
  eq(List, [Head|_Tail]).
```

Improper lists are accepted when you explicitly use a non-list tail, for example `[a, b|Tail]`. Most list built-ins below require proper lists for finite execution.

Semantically, list syntax is just notation for ordinary terms. The empty list is a constant, and a non-empty list is a nested cons term. For example, `[a, b, c]` behaves like `.(a, .(b, .(c, [])))`, although eyelog prints the bracket form.

## 4. Rules as Horn clauses

A fact is an atomic assertion:

```prolog
parent(:pat, :jan).
```

A rule is a definite Horn clause:

```prolog
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
```

Read the rule as:

> for all `X`, `Y`, and `Z`, if `parent(X, Y)` and `ancestor(Y, Z)` hold, then `ancestor(X, Z)` holds.

All variables in a rule are universally quantified over the whole rule. A variable that appears only in the body is still universally quantified in the implication, but operationally it acts as an intermediate value that the engine must find.

Facts are rules with an empty body. The fact:

```prolog
parent(:pat, :jan).
```

can be read as the clause:

```prolog
parent(:pat, :jan) :- true.
```

## 5. Herbrand semantics

The pure core of eyelog has the standard Herbrand semantics of definite logic programs.

This section describes the mathematical meaning of facts and rules. Built-ins are discussed afterward: arithmetic, comparisons, strings, and finite list predicates are interpreted predicates, and `not/1` is negation as failure rather than part of the monotone definite-clause semantics.

### 5.1 Herbrand universe

For a program `P`, the Herbrand universe `U_P` is the set of all ground terms that can be built from the constants and function symbols appearing in `P`.

Examples of ground terms are:

```prolog
:pat
123
pair(:left, :right)
[a, b, c]
```

A ground term contains no variables. Compound terms and lists can be nested, so the Herbrand universe may be infinite if the program has a compound term symbol.

If a program has no constants, the usual convention is to add one fresh constant so the universe is non-empty.

### 5.2 Herbrand base

The Herbrand base `B_P` is the set of all ground atoms that can be formed by applying predicate symbols from `P` to ground terms from `U_P`.

For a program containing `parent/2` and constants `:pat`, `:jan`, and `:emma`, the Herbrand base includes atoms such as:

```prolog
parent(:pat, :jan)
parent(:jan, :emma)
parent(:emma, :pat)
```

Only some of those atoms are true in a particular interpretation.

### 5.3 Herbrand interpretations and models

A Herbrand interpretation is a subset of the Herbrand base. It says which ground atoms are true.

A ground fact is true in interpretation `I` when that atom is a member of `I`.

A ground rule

```prolog
Head :- Body1, ..., Bodyn.
```

is true in `I` when either at least one body atom is not in `I`, or `Head` is in `I`. In other words, whenever all body atoms are true, the head must also be true.

An interpretation is a model of program `P` when every ground instance of every clause in `P` is true in that interpretation.

### 5.4 Least Herbrand model

Definite Horn programs have a least Herbrand model. It contains exactly the ground atoms forced by the facts and rules, and nothing extra.

One way to define it is with the immediate consequence operator `T_P`.

Given an interpretation `I`, `T_P(I)` is the set of all ground heads that can be derived by one rule application whose ground body atoms are already in `I`:

```text
T_P(I) = { Head | Head :- Body1, ..., Bodyn is a ground instance of a clause in P
                  and Body1, ..., Bodyn are all in I }
```

Starting from the empty interpretation, repeatedly apply `T_P`:

```text
I0 = ∅
I1 = T_P(I0)
I2 = T_P(I1)
I3 = T_P(I2)
...
```

The least Herbrand model is the union of this chain:

```text
M_P = I0 ∪ I1 ∪ I2 ∪ ...
```

For the pure definite subset of eyelog:

```text
P entails A  iff  A is in M_P
```

for every ground atom `A`.

### 5.5 How this relates to eyelog output

Default execution asks for all solutions of:

```prolog
triple(S, P, O)
```

In the pure core, the printed facts are the ground `triple/3` atoms that belong to the least Herbrand model of the loaded program.

For example:

```prolog
parent(:pat, :jan).
parent(:jan, :emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, :ancestor, Y) :- ancestor(X, Y).
```

has least-model consequences including:

```prolog
ancestor(:pat, :jan)
ancestor(:jan, :emma)
ancestor(:pat, :emma)
triple(:pat, :ancestor, :jan)
triple(:jan, :ancestor, :emma)
triple(:pat, :ancestor, :emma)
```

so the default output contains the three `triple/3` facts.

### 5.6 Interpolation lemma

The following lemma is often useful when reasoning about a derived answer.

**Interpolation lemma.** Let `P` be a pure definite eyelog program, and let `A` be a ground atom. If `A` is in the least Herbrand model `M_P`, then there is a natural number `n` such that `A` is in `T_P^n(∅)`. Equivalently, every true ground atom has a finite derivation depth.

A slightly more operational form is:

**Answer interpolation.** If a query instance `Qθ` is a ground consequence of `P`, then there is a finite proof tree for `Qθ` whose internal nodes are ground instances of rules from `P` and whose leaves are ground facts from `P`.

#### Proof

Let:

```text
I0 = ∅
I(k+1) = T_P(Ik)
M_P = ⋃k Ik
```

By definition of union, if `A ∈ M_P`, then `A ∈ Ik` for some finite `k`. This proves the first statement.

For the proof-tree statement, use induction on the least such `k`.

Base case: `k = 1`. Then `A ∈ T_P(I0)`. Since `I0` is empty, the only way to derive `A` is from a ground instance of a fact, that is, a clause with an empty body. The proof tree is the single leaf `A`.

Induction step: assume every atom first appearing at depth at most `k` has a finite proof tree. Suppose `A ∈ I(k+1)`. Then `A` is the head of some ground rule instance:

```prolog
A :- B1, ..., Bm.
```

where every `Bi ∈ Ik`. By the induction hypothesis, each `Bi` has a finite proof tree. Attach those proof trees under the rule instance whose head is `A`. The result is a finite proof tree for `A`.

Therefore every atom in the least Herbrand model is supported by a finite derivation, and every ground query answer can be interpolated by the finite rule instances that justify it.

### 5.7 Scope of the lemma in eyelog

The lemma applies directly to pure facts and Horn rules.

It extends cleanly to deterministic built-ins when they are treated as interpreted leaves, for example arithmetic comparisons or `length/2` on a ground proper list. In that reading, a proof tree may have built-in leaves that are checked by their intended interpretation rather than by user-defined facts.

Use more care with `not/1`. Negation as failure depends on failure of search, not membership in the least Herbrand model of a positive program. Programs using `not/1` should be written so the negated goal is sufficiently ground and finite.

## 6. Query mode

Use `--query` to ask any goal directly:

```sh
bin/eyelog --query 'ancestor(:pat, X)' examples/ancestor.pl
```

Output is the instantiated goal:

```prolog
ancestor(:pat, :jan).
ancestor(:pat, :emma).
```

Query variables are instantiated by unification. In the pure core, each printed query instance is a consequence of the program's least Herbrand model. Operationally, eyelog finds those instances by depth-first rule search with unification and backtracking.

## 7. Built-ins

Built-ins are ordinary predicate calls that the engine knows how to evaluate.
There is only one mechanism: a call such as `add/3` and a call such as
`math:sum/3` both enter the same arithmetic built-in.

The colon is a vocabulary separator, not a module operator. In other words,
`math:sum` is just the predicate name `math:sum`, much like an RDF or Eyeling
prefixed name. The short names are the native eyelog spelling. The namespaced
forms are aliases that make translated Eyeling/N3 examples read close to their
source vocabulary.

A useful rule of thumb:

- write new eyelog programs with the short names, such as `sum/3`, `less_than/2`,
  `rest/2`, and `matches/2`,
- keep the namespaced aliases, such as `math:sum/3`, `list:rest/2`, and
  `string:matches/2`, when translating or comparing with Eyeling examples.

For example, these two goals are equivalent:

```prolog
sum(2, 3, X)
math:sum(2, 3, X)
```

and these two are equivalent:

```prolog
less_than(A, B)
math:lessThan(A, B)
```

### Unification and equality

| Native eyelog name | Namespaced alias | Meaning |
| --- | --- | --- |
| `=(X, Y)` |  | unify two terms |
| `eq(X, Y)` | `math:equalTo(X, Y)` | unify two terms |
| `equal_to(X, Y)` | `math:equalTo(X, Y)` | unify two terms |
| `neq(X, Y)` | `math:notEqualTo(X, Y)` | succeeds when terms are not unifiable |
| `not_eq(X, Y)` | `log:notEqualTo(X, Y)` | same as `neq/2` |
| `not_equal_to(X, Y)` | `math:notEqualTo(X, Y)` | same as `neq/2` |

Inequality is most predictable when both arguments are already bound.

### Arithmetic

| Native eyelog name | Namespaced alias | Meaning |
| --- | --- | --- |
| `add(A, B, X)` or `sum(A, B, X)` | `math:sum(A, B, X)` | `X = A + B` |
| `sub(A, B, X)` or `difference(A, B, X)` | `math:difference(A, B, X)` | `X = A - B` |
| `mul(A, B, X)` or `product(A, B, X)` | `math:product(A, B, X)` | `X = A * B` |
| `div(A, B, X)` or `quotient(A, B, X)` | `math:quotient(A, B, X)` | `X = A / B` |
| `integer_quotient(A, B, X)` | `math:integerQuotient(A, B, X)` | integer quotient alias for translated examples |
| `pow(A, B, X)` or `exponentiation(A, B, X)` | `math:exponentiation(A, B, X)` | `X = A ** B` |
| `mod(A, B, X)` or `remainder(A, B, X)` | `math:remainder(A, B, X)` | integer remainder |
| `max(A, B, X)` or `maximum(A, B, X)` | `math:max(A, B, X)` | larger value |
| `min(A, B, X)` or `minimum(A, B, X)` | `math:min(A, B, X)` | smaller value |

When all operands are integers, `add/3`, `sum/3`, `sub/3`, `difference/3`,
`mul/3`, `product/3`, `div/3`, `quotient/3`, `integer_quotient/3`,
`pow/3`, `exponentiation/3`, `max/3`, and `min/3` use arbitrary-size
decimal-integer helpers. This is why examples such
as `fib(10000)` and the Ackermann-style hyperoperation example can be written
without engine-specific Fibonacci or exponentiation code. In integer mode,
exponentiation requires a non-negative machine-integer exponent, and division is
integer quotient.

When either operand contains a decimal point or exponent, the same arithmetic
predicates use C double-precision floating-point arithmetic. The result is
printed as a numeric term, with `.0` added when the floating result is
mathematically integral. This is useful for Eyeling-style probability and
measurement examples, but it is not exact decimal arithmetic.

`mod/3`, `remainder/3`, and `math:remainder/3` remain integer-only.

`smallest_divisor_from(N, D, S)` is a bounded integer helper used by the
Fundamental Theorem of Arithmetic example. With `N` and starting divisor `D`
bound, it unifies `S` with the first divisor of `N` at or above `D`, or with
`N` itself when no smaller divisor exists.

### Comparisons

| Native eyelog name | Namespaced alias | Meaning |
| --- | --- | --- |
| `lt(A, B)` or `less_than(A, B)` | `math:lessThan(A, B)` | `A < B` |
| `gt(A, B)` or `greater_than(A, B)` | `math:greaterThan(A, B)` | `A > B` |
| `le(A, B)` or `not_greater_than(A, B)` | `math:notGreaterThan(A, B)` | `A <= B` |
| `ge(A, B)` or `not_less_than(A, B)` | `math:notLessThan(A, B)` | `A >= B` |

Integer comparisons use arbitrary-size decimal-integer ordering. Decimal or
scientific operands use double-precision floating-point ordering. If both
operands are nonnumeric scalar terms, comparison falls back to lexical string
ordering, which is useful for canonical ISO-8601 timestamps.

### Generators

```prolog
between(Low, High, N)
```

`between/3` enumerates integers from `Low` through `High` inclusive.

### Lists

| Native eyelog name | Namespaced alias | Meaning |
| --- | --- | --- |
| `append(A, B, C)` | `list:append(A, B, C)` | concatenate lists |
| `rest(List, Tail)` | `list:rest(List, Tail)` | tail of a non-empty list |
| `member(Item, List)` or `in(Item, List)` | `list:member(Item, List)` or `list:in(Item, List)` | item occurs in list |
| `not_member(Item, List)` | `list:notMember(Item, List)` | item does not occur in a known list |
| `reverse(List, Reversed)` | `list:reverse(List, Reversed)` | reverse a known list |
| `length(List, N)` | `list:length(List, N)` | count a known proper list |
| `is_list(List)` | `list:isList(List)` | proper-list check |

`append/3` concatenates lists. It supports the common finite modes where the
first list is known, or where the combined list is known and the predicate
enumerates all prefix/suffix splits.

Examples:

```prolog
append([a, b], [c], X).      % X = [a, b, c]
append(A, B, [a, b]).        % enumerates [], [a], [a, b] prefixes
```

`rest/2` exposes the tail of a non-empty list. `member/2` enumerates items in a
proper list. `not_member/2` succeeds when an item is not present in a known
proper list. `reverse/2` reverses a known proper list. `length/2` counts a
proper list when the list is known. `is_list/1` succeeds for proper lists.

### String and atom construction

| Native eyelog name | Namespaced alias | Meaning |
| --- | --- | --- |
| `atom_concat(A, B, C)` |  | concatenate into an atom |
| `str_concat(A, B, C)` |  | concatenate into a string |
| `contains(Text, Part)` |  | literal substring test |
| `not_contains(Text, Part)` |  | negated literal substring test |
| `matches(Text, Pattern)` | `string:matches(Text, Pattern)` | simple alternation match |
| `not_matches(Text, Pattern)` | `string:notMatches(Text, Pattern)` | negated simple alternation match |

`matches/2` and `not_matches/2` support the simple alternation form used in the
translated Eyeling examples, for example `"diabetes|medical"`; they are not full
regular-expression engines.

### Negation as failure

```prolog
not(Goal)
```

`not/1` succeeds when `Goal` has no solution. Use it only with goals whose
variables are already bound enough to make the check finite.

Good:

```prolog
not(visited(Node, Path))
```

Risky:

```prolog
not(edge(X, Y))
```

when `X` and `Y` are unbound.

## 8. Writing examples

Each example should contain:

1. input data as facts,
2. reusable logic as predicates,
3. final `triple/3` rules as the query/output layer.

The repository includes small examples adapted from the Eyeling examples collection:

- `examples/list-collection.pl` demonstrates list literals, `member/2`, `length/2`, `append/3`, and `[Head|Tail]`.
- `examples/gps.pl` adapts the GPS route-planning example and uses `list:append/3` for action sequences.
- `examples/expression-eval.pl` adapts the expression evaluator example using eyelog arithmetic predicates.
- `examples/ackermann.pl` adapts Eyeling's Ackermann-style hyperoperation benchmark and uses `pow/3` with arbitrary-size integers, including the large `ackermann(4, 2)` value.
- `examples/dijkstra.pl` adapts the weighted Dijkstra graph as bounded simple-path enumeration using `list:notMember/2`.
- `examples/family-cousins.pl` adapts the generation/branch cousin derivation.
- `examples/allen-interval-calculus.pl` adapts Allen's interval relations over integer endpoints.
- `examples/gray-code-counter.pl` adapts the Clause and Effect gray-code counter.
- `examples/bayes-diagnosis.pl` adapts the Bayesian diagnosis model and emits Eyeling-style full posterior probabilities.
- `examples/floating-point.pl` demonstrates decimal arithmetic, `math:*` aliases, and floating-point comparisons.
- `examples/aliases-and-namespaces.pl` demonstrates that short built-in names and namespaced aliases call the same implementation.
- `examples/delfour.pl` adapts the Delfour neutral-insight authorization case, including policy checks, scoped shopping assistance, minimization, and a lower-sugar product recommendation.
- `examples/dijkstra-risk-path.pl` adapts the risk-adjusted route example, deriving route metrics and selecting the lowest risk-adjusted score.
- `examples/drone-corridor-planner.pl` adapts the bounded corridor-planning example, using a fuel list to keep recursive planning finite while aggregating cost, duration, belief, and comfort.
- `examples/dining-philosophers.pl` adapts the Chandy-Misra dining-philosophers trace, deriving requests, dirty-fork sends, and meals across nine rounds.
- `examples/fundamental-theorem-arithmetic.pl` adapts the ARC-style Fundamental Theorem of Arithmetic scenario. It derives the factor list for `202692987`, reconstructs the product, and checks the distinct prime factors by trial division.
- `examples/easter-computus.pl` adapts the Gregorian computus example. It derives Easter dates for 2026-2035 and emits independent range/window checks.
- `examples/gd-step-certified.pl` adapts the certified gradient-descent interval example using decimal arithmetic, interval bounds, and objective bounds.
- `examples/fft8-numeric.pl` adapts the numeric FFT example using explicit complex pairs and radix-2 decomposition.
- `examples/odrl-dpv-risk-ranked.pl` adapts the ODRL + DPV ranked-risk assessment example. It derives missing-safeguard risks, DPV risk levels, mitigation measures, and inverse-score report keys from a graph-valued policy term, so policy edges are treated as scoped data rather than globally asserted facts.

For policy-like inputs, prefer graph-valued data when the statements should stay scoped.
For example, `odrl-dpv-risk-ranked.pl` stores ODRL clauses as `policy_graph(:PolicyGraph1, [edge(S, P, O), ...])` and derives local helper predicates from graph membership.  That lets rules inspect a policy without asserting every permission, prohibition, or constraint as a global fact, which is useful when different policy graphs may contain incompatible clauses.

For example, a graph reachability program:

```prolog
edge(:a, :b).
edge(:b, :c).

path(X, Y) :- edge(X, Y).
path(X, Z) :- edge(X, Y), path(Y, Z).

triple(X, :path, Y) :- path(X, Y).
```

Do not paste expected output as facts. The program should derive it.

## 9. Golden outputs and tests

Example goldens live in:

```text
examples/output/<example-name>.pl
```

To regenerate a golden manually:

```sh
bin/eyelog examples/name.pl > examples/output/name.pl
```

Then run:

```sh
make test
```

## 10. Performance tips

Place the most selective goals early in a rule body.

For large materializations, prefer rules that generate each result once. The engine keeps a hash-backed set of printed `triple/3` facts, so examples such as `deep-taxonomy-100000.pl` can produce hundreds of thousands of distinct triples without quadratic duplicate checks.

Prefer this:

```prolog
triple(N, :goldbachOk, true) :-
  between(4, 1000, N),
  mod(N, 2, 0),
  div(N, 2, Half),
  prime(P),
  le(P, Half),
  sub(N, P, Q),
  prime(Q).
```

Avoid generating a large Cartesian product before filtering it.

For bounded challenge examples, it is fine to include domain facts such as airport routes or prime numbers as input data. What should be avoided is pasting the final answers as `triple/3` facts.

## 11. Current limits

The implementation is intentionally direct:

- no cut,
- no DCGs,
- no module system,
- no general tabling,
- no RDF parser yet.

List support is intentionally finite: `append/3`, `member/2`, `not_member/2`, and `reverse/2` are useful when at least one list-shaped argument is already bound enough to avoid infinite generation. Floating-point arithmetic uses the platform C `double` type. It is suitable for measurements, probabilities, and examples that need approximate real arithmetic, but it is not exact rational or exact decimal arithmetic. Use atoms and `triple/3` for RDF-shaped data until Turtle/TriG input support is added.
