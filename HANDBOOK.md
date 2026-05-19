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
skolem:id(:x)      % namespaced compound term
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

### 3.1 Vocabulary-style names and Prolog portability

Eyelog is **Prolog-like**, but it is not intended to be a portable SWI-Prolog
source format. In particular, names such as `:pat`, `:payment_service`,
`rdf:type`, `math:sum`, and `skolem:observation/2` are Eyelog atoms or
functors with vocabulary-style names.

The colon is part of the name syntax used to stay close to RDF, N3, and
Eyeling examples:

```prolog
triple(:checkout_api, :impactedByFailureOf, :payment_service).
triple(:a, rdf:type, :Person).
```

In Eyelog, `:payment_service` means a local IRI-style atom, and `rdf:type` means
the atom whose spelling is `rdf:type`. The colon is not SWI-Prolog module
qualification.

Some Prolog systems, such as Trealla, may accept these files as a permissive
extension. That is useful for experiments, but it is not part of Eyelog's
compatibility promise. SWI-Prolog gives `:` a different syntactic role, so a
plain Eyelog file with `:name` atoms is expected to be rejected by SWI.

A SWI-oriented translation would quote such names, for example:

```prolog
triple(':checkout_api', ':impactedByFailureOf', ':payment_service').
triple(':a', 'rdf:type', ':Person').
```

That translation is deliberately not used in the examples because it would make
them less readable and less close to Eyeling/N3. The recommended rule is simple:
write Eyelog examples in Eyelog syntax, and translate only when targeting a
specific Prolog system.

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
var(:x)
skolem:observation(:Alice, :glucose)
graph([triple(var(:x), rdf:type, :Dog)])
```

A ground term contains no eyelog variables. Compound terms and lists can be nested, so the Herbrand universe may be infinite if the program has a compound term symbol.

Notice the distinction between `X` and `var(:x)`. `X` is an eyelog variable: it can be bound by unification while a rule is being proved. `var(:x)` is an ordinary compound term with functor `var/1`; it is ground because `:x` is an atom. Eyelog uses this convention when a quoted graph needs to mention an object-language variable as data.

A functor may also use a vocabulary-style name such as `skolem:observation/2`. This is still an ordinary Herbrand function symbol. A term such as `skolem:observation(:Alice, :glucose)` denotes one generated resource. The same arguments denote the same resource; different arguments denote different Herbrand terms, so using the relevant inputs as arguments prevents accidental clashes.

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

### 5.6 Quoted graphs and variables-as-data

Graph terms such as `graph([triple(:s, :p, :o)])` are ordinary Herbrand terms. A `triple/3` at top level is an atom that can belong to the least Herbrand model. A `triple/3` inside `graph([...])` is just a subterm of some larger atom until a rule projects it.

For example:

```prolog
triple(:Charly, rdf:type, :Dog).
```

is a candidate member of the Herbrand base: it may be true or false in an interpretation. But in:

```prolog
graph([triple(var(:y), rdf:type, :Dog)])
```

the inner `triple/3` is quoted data. The whole graph term can occur as an argument of another atom, for example:

```prolog
triple(
  graph([triple(var(:y), rdf:type, :Dog)]),
  log:implies,
  graph([triple(:test, :is, true)])
).
```

Here `var(:y)` does not bind like `Y`. It is the ground term that represents a variable named `y` inside the quoted rule. A rule that wants to interpret such a graph as a rule schema must do so explicitly. This keeps Herbrand semantics simple: quoted formulas are data, not automatically asserted facts and not automatically active rules.

Use this convention:

- use `Y` for an eyelog variable in the current rule,
- use `var(:y)` only when a quoted graph itself needs to contain a variable placeholder,
- use helper predicates to project or interpret quoted graph terms when needed.

### 5.7 Skolem terms in rule heads

Use the `skolem:` vocabulary prefix when a rule needs to introduce a generated resource. In Eyelog this is not a special runtime feature. It is a naming convention for ordinary compound terms used as Skolem functions.

For example:

```prolog
triple(skolem:observation(Patient, Test), rdf:type, :Observation) :-
  test_result(Patient, Test, _Value).

triple(skolem:observation(Patient, Test), :patient, Patient) :-
  test_result(Patient, Test, _Value).
```

The head contains a functional term. For each ground proof of `test_result(Patient, Test, Value)`, the variables are substituted into the term. Thus `skolem:observation(:Alice, :glucose)` and `skolem:observation(:Bob, :glucose)` are distinct terms, while two derivations with the same `Patient` and `Test` produce the same term. This gives deterministic existential-style resources without relying on a global counter or blank-node allocation.

Good Skolem functions include enough arguments to identify what makes the generated resource unique:

```prolog
skolem:observation(Patient, Test)
skolem:alert(Patient, Condition)
skolem:membership(Person, Group)
```

Avoid a constant such as `skolem:observation` when several observations may exist, because all rule instances would collapse onto the same resource.

In Herbrand semantics, these Skolem terms are just terms in the universe. A rule head containing `skolem:observation(Patient, Test)` contributes ground atoms to the least Herbrand model for the corresponding ground substitutions. No extra semantics is needed.

### 5.8 Interpolation lemma

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

### 5.9 Scope of the lemma in eyelog

The lemma applies directly to pure facts and Horn rules.

It extends cleanly to deterministic built-ins when they are treated as interpreted leaves, for example arithmetic comparisons or `length/2` on a ground proper list. In that reading, a proof tree may have built-in leaves that are checked by their intended interpretation rather than by user-defined facts.

Quoted graph terms do not invalidate the lemma. They are just terms in the Herbrand universe. If a program derives a ground atom whose argument is a quoted graph, that atom still appears at some finite `T_P` stage. If another rule later interprets `var(:x)` placeholders inside that graph, the interpretation is an ordinary user-defined relation and its derived conclusions are again supported by finite rule instances.

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

To avoid a common non-termination case, eyelog keeps an active-call stack and does not re-enter a user-defined goal that is a variant of an already active goal. A variant is the same goal up to variable renaming after current bindings are taken into account. This is not full tabling, but it prevents simple cyclic transitive closures from revisiting the same subgoal forever. For example, the recursive `path/2` program in `examples/cyclic-path.pl` terminates on a directed cycle and emits the finite reachability relation. If you need to enumerate paths rather than reachability pairs, use an explicit visited list as in the Dijkstra examples.

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
not(arc(X, Y))
```

when `X` and `Y` are unbound.

## 8. Writing examples

Each example should contain:

1. input data as facts,
2. reusable logic as predicates,
3. final `triple/3` rules as the query/output layer.

The repository includes small examples adapted from the Eyeling examples collection:

- `examples/list-collection.pl` demonstrates list literals, `member/2`, `length/2`, `append/3`, and `[Head|Tail]`.
- `examples/gps.pl` adapts the GPS route-planning example more closely: map descriptions are quoted graph data, route actions are lists built with `list:append/3`, route metrics include duration/cost/belief/comfort, and the output layer emits the recommendation, checks, and report text.
- `examples/cyclic-path.pl` demonstrates transitive closure over a directed cycle. The logical reachability result is finite, and eyelog's active-call variant guard prevents recursive proof search from looping forever.
- `examples/service-impact.pl` applies the same cyclic-closure pattern to incident analysis: when `:payment_service` fails, services and business functions that depend on it transitively are marked at risk even though the payment/fraud/risk-rules dependency graph contains a cycle.
- `examples/expression-eval.pl` adapts the expression evaluator example using eyelog arithmetic predicates.
- `examples/ackermann.pl` adapts Eyeling's Ackermann-style hyperoperation benchmark and uses `pow/3` with arbitrary-size integers, including the large `ackermann(4, 2)` value.
- `examples/dijkstra.pl` adapts the weighted Dijkstra graph as bounded simple-path enumeration. The route network is a quoted `graph([...])` term, and path search uses `list:notMember/2` for visited-node checks.
- `examples/family-cousins.pl` adapts the generation/branch cousin derivation. The family tree is a scoped graph term, so parent links and seed branch labels are read from quoted data.
- `examples/allen-interval-calculus.pl` adapts Allen's interval relations over integer endpoints. The interval table is represented as a list of `interval(Id, Start, End)` records.
- `examples/gray-code-counter.pl` adapts the Clause and Effect gray-code counter.
- `examples/bayes-diagnosis.pl` adapts the Bayesian diagnosis model and emits Eyeling-style full posterior probabilities.
- `examples/bayes-therapy.pl` adapts the Bayesian therapy decision-support example. It uses list-valued disease, evidence, posterior, and therapy vectors to combine Naive Bayes diagnosis with expected-utility therapy selection.
- `examples/floating-point.pl` demonstrates decimal arithmetic, `math:*` aliases, and floating-point comparisons.
- `examples/skolem-functions.pl` demonstrates generated resources using `skolem:` functional terms in rule heads, such as `skolem:observation(Patient, Test)`, so derived identifiers are deterministic and collision-free.
- `examples/aliases-and-namespaces.pl` demonstrates that short built-in names and namespaced aliases call the same implementation.
- `examples/delfour.pl` adapts the Delfour neutral-insight authorization case, including policy checks, scoped shopping assistance, minimization, and a lower-sugar product recommendation. Its case, insight, policy, envelope, and signature inputs are graph terms; the product catalog is a list of records.
- `examples/dijkstra-risk-path.pl` adapts the risk-adjusted route example, deriving route metrics and selecting the lowest risk-adjusted score. It combines a quoted segment graph with list-valued candidate paths.
- `examples/drone-corridor-planner.pl` adapts the bounded corridor-planning example, using a fuel list to keep recursive planning finite while aggregating cost, duration, belief, and comfort.
- `examples/dining-philosophers.pl` adapts the Chandy-Misra dining-philosophers trace, deriving requests, dirty-fork sends, and meals across nine rounds.
- `examples/fundamental-theorem-arithmetic.pl` adapts the ARC-style Fundamental Theorem of Arithmetic scenario. It derives the factor list for `202692987`, reconstructs the product, and checks the distinct prime factors by trial division.
- `examples/easter-computus.pl` adapts the Gregorian computus example. It derives Easter dates for 2026-2035 and emits independent range/window checks.
- `examples/gd-step-certified.pl` adapts the certified gradient-descent interval example using decimal arithmetic, interval bounds, and objective bounds.
- `examples/fft8-numeric.pl` adapts the numeric FFT example using explicit complex pairs and radix-2 decomposition.
- `examples/odrl-dpv-risk-ranked.pl` adapts the ODRL + DPV ranked-risk assessment example. It derives missing-safeguard risks, DPV risk levels, mitigation measures, and inverse-score report keys from a graph-valued policy term, so policy triples are treated as scoped data rather than globally asserted facts.
- `examples/annotation.pl` adapts the RDF annotation example closely: it asserts `:a :name "Alice"`, names the quoted graph containing that triple with `log:nameOf`, and attaches the provenance triples directly.
- `examples/context-association.pl` adapts the context-association example more directly: the data, signature, and metadata contexts are top-level `log:nameOf` triples whose objects are quoted `graph([...])` terms. A tiny `context_triple/4` projection demonstrates scoped inspection without turning the whole context into ambient facts.
- `examples/derived-rule.pl` adapts the derived-rule example closely: a top-level `triple/3` cat fact derives a quoted implication graph, and a top-level `triple/3` dog fact then fires that derived rule.
- `examples/odrl-dpv-healthcare-risk-ranked.pl` adapts the healthcare ODRL + DPV example. It keeps the policy and mitigation suggestions as graph-valued terms and derives only the risks supported by the scoped graph.

For policy-like inputs, annotations, signatures, route networks, and quoted rules, prefer graph-valued data when triples should stay scoped. Keep the outer shape close to the source when possible: an N3 `G log:nameOf { ... }` usually translates well to a top-level `triple(G, log:nameOf, graph([...]))`, not to a separate `named_graph/2` table unless several rules need that indirection.
For example, `annotation.pl` and `context-association.pl` use top-level `triple(G, log:nameOf, graph([...]))` declarations because that is the shape of the Eyeling inputs. `odrl-dpv-risk-ranked.pl` stores ODRL clauses as `policy_graph(:PolicyGraph1, graph([triple(S, P, O), ...]))` because the policy graph is a domain object that many helper predicates read from. `delfour.pl` uses the same idea for its case, insight, policy, envelope, and signature inputs. In each case rules can inspect a policy or signed payload without asserting every permission, prohibition, constraint, or signed field as a global fact, which is useful when different graphs may contain incompatible clauses.

Use lists when order or a closed collection matters: candidate routes, action sequences, interval tables, product catalogs, evidence vectors, and bounded fuel tokens are clearer as list terms than as many unrelated facts. Use graph terms when the data is RDF-shaped or intentionally scoped. It is fine to combine both: `dijkstra-risk-path.pl` keeps network segments in a quoted graph and candidate routes as lists.

For cyclic graph reachability, a simple transitive closure is usually fine:

```prolog
path(X, Y) :- arc(X, Y).
path(X, Z) :- arc(X, Y), path(Y, Z).
```

On a cyclic finite graph, eyelog's variant loop guard stops the proof search from re-entering the same active `path/2` subgoal. `examples/service-impact.pl` uses the same pattern for a practical service-dependency closure: if `Service` depends on `Dependency`, then a failure of `Dependency` affects `Service`, transitively, even when two services depend on each other. For path enumeration, shortest paths, or routes with costs, prefer an explicit visited-list argument so the program says which revisits are forbidden.

Graph terms are ordinary Eyelog terms. Use one representation for RDF-shaped content inside a graph:

```prolog
triple(:G1, log:nameOf, graph([
  triple(:s, :p, :o)
])).

graph_triple(GraphName, S, P, O) :-
  triple(GraphName, log:nameOf, graph(Statements)),
  member(triple(S, P, O), Statements).
```

There is deliberately only one RDF-shaped constructor: `triple/3`.

Quoted graph variables use `var(:name)` when the variable itself is part of the quoted data:

```prolog
graph([triple(var(:y), rdf:type, :Dog)])
```

This is different from `Y`. `Y` is an eyelog variable in the surrounding rule; `var(:y)` is a ground term that denotes a variable placeholder inside the quoted graph. The `derived-rule.pl` example uses this to represent an inner rule schema without letting the outer rule accidentally bind that inner variable.

The difference between an asserted/output triple and a quoted triple is positional, not syntactic:

- `triple(S, P, O)` as a top-level derived fact is materialized by the default query.
- `triple(S, P, O)` inside `graph([...])` is ordinary data. It becomes relevant only when a rule projects it with a helper such as `graph_triple/4`.

This avoids parallel names such as `statement/3` and `triple/3` for the same shape. Avoid using `edge/3` for RDF-shaped graph contents. Reserve domain names such as `arc/2`, `link/3`, or `route_segment/4` for ordinary graph algorithms where they are not RDF triples.

For example, a graph reachability program can use domain arcs without involving graph terms:

```prolog
arc(:a, :b).
arc(:b, :c).

path(X, Y) :- arc(X, Y).
path(X, Z) :- arc(X, Y), path(Y, Z).

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
