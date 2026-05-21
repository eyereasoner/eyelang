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
- [10. Development and release](#10-development-and-release)
- [11. Performance tips](#11-performance-tips)
- [12. Current limits](#12-current-limits)

## 1. Program shape

An eyelog program is a sequence of Prolog-style facts and Horn clauses.

```prolog
parent(pat, jan).
parent(jan, emma).

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

The default build builds both the native command-line executable and the browser playground assets:

```sh
make
# same as: make all
```

This writes the CLI to `bin/eyelog` and the browser build to `dist/browser/eyelog.mjs` plus `dist/browser/eyelog.wasm`. The default build requires Emscripten's `emcc` as well as a C compiler. To build only the native command-line executable, run:

```sh
make cli
```

Then run an example:

```sh
bin/eyelog examples/ancestor.pl
```

When you run a file without `--query`, eyelog materializes distinct `triple/3` consequences by Prolog-like Horn-clause search, with duplicate suppression and a guarded recursion rule that prevents common cyclic closures from looping. Operationally, the default query is:

```prolog
triple(S, P, O)
```

and the distinct ground answers are printed as Prolog facts:

```prolog
triple(pat, ancestor, emma).
```

This keeps the engine generic. Each example should define the `triple/3` rules that represent its intended output.

Example:

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, ancestor, Y) :- ancestor(X, Y).
```

### 2.1 Browser playground

`playground.html` runs the same engine in the browser through WebAssembly. Build the browser assets with:

```sh
make browser
```

For local use, serve the repository over HTTP:

```sh
make serve
```

and open `http://localhost:8000/playground.html`. Opening the page directly as a `file://` URL usually blocks the module worker or `.wasm` file, so the playground shows a warning in that mode.

The playground is intentionally vertical and mobile-friendly. It shows the current version from `VERSION`, preloads the WebAssembly engine in a module worker as soon as the page opens, then reuses that warm worker for runs. The Run button remains clickable while the engine is still loading and waits for preload to finish before executing. This avoids making the first visible run pay the full `.mjs`/`.wasm` load and initialization cost. It supports loading examples, loading `.pl` files from URLs, adding background programs before the editor contents, passing an optional `--query`, viewing stdout and stderr separately, syntax coloring the input editor and stdout/stderr output, autosaving in local storage, stopping a run by terminating the worker, and creating share links. If the editor was loaded from a URL and has not been edited, the share link uses the readable `?url=...` form, for example `playground?url=https://raw.githubusercontent.com/eyereasoner/eyelog/refs/heads/main/examples/matrix.pl`; edited inline programs still use compact hash links. On insecure HTTP origins where the modern Clipboard API is unavailable, the share-link button falls back to an older textarea copy path and then to a manual copy prompt.

After changing the C source, the Makefile, or browser build settings, rebuild stale browser assets with:

```sh
make clean browser
```

The browser build writes generated assets under `dist/browser/`. These files are local build products and should not be committed.

## 3. Terms

Supported term forms are:

```prolog
X                         % variable, starts with uppercase or _
_                         % anonymous variable; each occurrence is fresh
pat                       % lower-case atom
atom_123                  % atom with underscores and digits
#                         % graphic atom
'atom with space'         % quoted atom
'can''t'                  % quoted atom with an embedded quote
''                        % empty atom
"hello world"             % string
"line\ntext"               % string with a backslash escape
123                       % integer
-42                       % negative integer
0.25                      % decimal literal
-2.5                      % negative decimal literal
7.5e-7                    % scientific decimal literal
pair(3, 7)                % compound term
nil()                     % zero-arity compound term
skolem_id(x)              % vocabulary-style compound term
[]                        % empty list
[a, b, c]                 % proper list
[Head|Tail]               % head/tail list pattern
[a, b | Tail]             % explicit tail / improper-list notation
(triple(a, b, c), triple(d, e, f))  % comma formula term
```

The anonymous variable `_` is allowed. Each occurrence is treated as a fresh variable. Decimal and scientific numeric literals are parsed as numeric terms. Integer-only arithmetic uses arbitrary-size decimal-integer helpers for `add/3`, `sub/3`, `mul/3`, `div/3`, `pow/3`, and `max/3`. When at least one arithmetic operand contains a decimal point or exponent, the arithmetic built-ins use the host C `double` type and print a decimal result.

Single-quoted atoms are accepted for ISO-style Prolog syntax, including doubled embedded quotes such as `'can''t'`. Output quotes atoms when needed so atoms containing spaces, embedded quotes, or the empty atom print as parseable Prolog terms. Existing backslash escapes such as `\n` and `\t` are also accepted inside quoted terms. Strings are double-quoted terms and print with double quotes.

Eyelog's syntax is a compact Prolog-like subset, not full ISO Prolog. Supported program forms are facts and definite Horn clauses using `:-`, comma-separated bodies, variables, atoms, strings, numbers, compound terms, lists, parenthesized comma terms, and `%` line comments. Eyelog deliberately does not implement the complete ISO reader or evaluator: there is no operator-declaration system, no general infix arithmetic such as `X is 1 + 2`, no cut, no disjunction, no DCGs, no modules, no dynamic database predicates, and no portable ISO standard-library claim. Use explicit built-ins such as `add/3`, `sub/3`, `mul/3`, `div/3`, `eq/2`, `neq/2`, `lt/2`, `gt/2`, `not/1`, and `once/1` instead.

Lists are first-class terms. They can appear in facts, rule heads, rule bodies, queries, and `triple/3` output. Proper lists print with bracket syntax:

```prolog
triple(example, items, [a, b, c]).
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
source format. Vocabulary names are plain atoms or functors. Use a local name
directly, and use underscores for prefixed vocabulary names:

```prolog
triple(checkout_api, impactedByFailureOf, payment_service).
triple(a, rdf_type, person).
triple(skolem_observation(alice, glucose), rdf_type, observation).
```

The old RDF/N3-style colon spelling is no longer accepted. Write `b` instead of
`:b`, and write `a_b` instead of `a:b`. This keeps Eyelog source closer to its
Prolog-like execution model and avoids overloading `:` with namespace/module
syntax.

A SWI-oriented translation may still need quoted names for atoms that are not
valid in a target Prolog system, but the Eyelog examples deliberately use the
plain source form above for readability.

## 4. Rules as Horn clauses

A fact is an atomic assertion:

```prolog
parent(pat, jan).
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
parent(pat, jan).
```

can be read as the clause:

```prolog
parent(pat, jan) :- true.
```

## 5. Herbrand semantics

The pure core of eyelog has the standard Herbrand semantics of definite logic programs.

This section describes the mathematical meaning of facts and rules. Built-ins are discussed afterward: arithmetic, comparisons, strings, finite list predicates, and solution-control predicates are interpreted predicates; `not/1` is negation as failure and `once/1` is first-solution search control rather than part of the monotone definite-clause semantics.

### 5.1 Herbrand universe

For a program `P`, the Herbrand universe `U_P` is the set of all ground terms that can be built from the constants and function symbols appearing in `P`.

Examples of ground terms are:

```prolog
pat
123
pair(left, right)
[a, b, c]
var(x)
skolem_observation(alice, glucose)
triple(var(x), rdf_type, dog)
```

A ground term contains no eyelog variables. For a fixed finite program, the Herbrand universe is formed only from the constants and compound term symbols that occur in that program. The language may allow endlessly many possible atom names, but they are not all automatically in `U_P`. If there are no compound term symbols, `U_P` is finite. If there is at least one compound term symbol of positive arity, `U_P` may be infinite, because terms can be nested without bound.

Notice the distinction between `X` and `var(x)`. `X` is an eyelog variable: it can be bound by unification while a rule is being proved. `var(x)` is an ordinary compound term with functor `var/1`; it is ground because `x` is an atom. Eyelog uses this convention when a quoted formula needs to mention an object-language variable as data.

A functor may also use a vocabulary-style name such as `skolem_observation/2`. This is still an ordinary Herbrand function symbol. A term such as `skolem_observation(alice, glucose)` denotes one generated resource. The same arguments denote the same resource; different arguments denote different Herbrand terms, so using the relevant inputs as arguments prevents accidental clashes.

If a program has no constants, the usual convention is to add one fresh constant so the universe is non-empty.

### 5.2 Herbrand base

The Herbrand base `B_P` is the set of all ground atoms that can be formed by applying predicate symbols from `P` to ground terms from `U_P`. Here “ground atom” means an atomic formula such as `triple(a, b, c)` or `parent(pat, jan)`, not an atom name such as `a` or `pat`.

`B_P` is a set, not a bag. A ground atom is either present or absent. Duplicate facts or duplicate derivations do not create new logical facts, although an implementation may temporarily encounter the same fact more than once during search.

For a program containing `parent/2` and constants `pat`, `jan`, and `emma`, the Herbrand base includes atoms such as:

```prolog
parent(pat, jan)
parent(jan, emma)
parent(emma, pat)
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

Default execution materializes distinct `triple/3` consequences by Prolog-like Horn-clause search, with duplicate suppression and a guarded recursion rule that prevents common cyclic closures from looping. Operationally, it asks for all solutions of:

```prolog
triple(S, P, O)
```

In the pure core, the printed facts are the ground `triple/3` atoms that belong to the least Herbrand model of the loaded program. The implementation is intentionally top-down and Prolog-like, but the default output has a forward-chaining reading: it is the set of `triple/3` consequences that the program derives.

For example:

```prolog
parent(pat, jan).
parent(jan, emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, ancestor, Y) :- ancestor(X, Y).
```

has least-model consequences including:

```prolog
ancestor(pat, jan)
ancestor(jan, emma)
ancestor(pat, emma)
triple(pat, ancestor, jan)
triple(jan, ancestor, emma)
triple(pat, ancestor, emma)
```

so the default output contains the three `triple/3` facts.

### 5.6 Backward search and forward materialization

Eyelog can be understood in two complementary ways. Operationally it is a backward-chaining engine, like Prolog: given a goal, it selects matching clauses, unifies the goal with clause heads, proves the body goals from left to right, and backtracks over alternatives. This is what happens in query mode and also inside the default `triple(S, P, O)` run.

At the same time, Eyelog has two materialization points that give this top-down search a forward-chaining flavor.

The first materialization point is the default output relation. By asking for all ground answers to `triple(S, P, O)` and printing each distinct answer once, Eyelog exposes the derived `triple/3` consequences as if the program had saturated its output graph. This is why examples can be written as rules over helper predicates and still produce a materialized set of triples.

For example, the rule:

```prolog
triple(X, ancestor, Z) :-
  parent(X, Y),
  ancestor(Y, Z).
```

is used backward when Eyelog tries to prove `triple(S, P, O)`: the head unifies with the query, and the body is solved as subgoals. But the visible result is forward-looking: all distinct ground instances such as `triple(pat, ancestor, emma)` are emitted as derived facts.

The second materialization point is explicit memoization. A declaration such as:

```prolog
memoize(reachable, 2).
```

keeps answers for selected calls to `reachable/2`. The first call is still solved by ordinary backward search, but the answers found are stored in a table and reused by later calls. For recursive predicates such as `reachable/2`, this behaves like a local materialization of that relation: once enough reachable pairs have been found, they are available as facts for subsequent subgoals.

So `memoize/2` is a bridge between the two views. It does not turn the whole engine into a forward reasoner, and it is not full general tabling. It lets selected backward-derived relations become incrementally materialized when that is useful for the workload.

This dual view is useful:

- write rules as ordinary Prolog-style backward-chaining clauses,
- read the default output as the materialized RDF-shaped consequence set,
- use `memoize/2` for local materialization of repeated recursive or deterministic subcomputations,
- use helper predicates for computation and `triple/3` as the public output relation.

Eyelog is therefore not a full bottom-up saturation engine. It does not eagerly derive every atom in the Herbrand base. It performs top-down search for selected goals; the default selected goal is `triple(S, P, O)`, and memoized predicates add opt-in local materialization for selected helper relations.

### 5.7 Quoted formulae and variables-as-data

Formula terms such as `triple(s, p, o)` and `(triple(s1, p1, o1), triple(s2, p2, o2))` are ordinary Herbrand terms when they occur in argument position. A `triple/3` at top level is an atom that can belong to the least Herbrand model. A `triple/3` inside another term is quoted data until a rule projects it.

For example:

```prolog
triple(charly, rdf_type, dog).
```

is a candidate member of the Herbrand base: it may be true or false in an interpretation. But in:

```prolog
triple(var(y), rdf_type, dog)
```

the inner `triple/3` is quoted data. The whole formula term can occur as an argument of another atom, for example:

```prolog
triple(
  triple(var(y), rdf_type, dog),
  log_implies,
  triple(test, is, true)
).
```

For multiple triples, use the same comma form that Prolog uses for conjunction, but in data position:

```prolog
triple(g1, log_nameOf, (
  triple(s1, p1, o1),
  triple(s2, p2, o2)
)).
```

Position determines the meaning. In a rule body, commas are executable conjunction. In an argument position, the comma term is quoted formula data. Parenthesized conjunction goals such as `(a(X), b(X))` are also accepted in rule bodies and are expanded as ordinary conjunction.

Here `var(y)` does not bind like `Y`. It is the ground term that represents a variable named `y` inside the quoted rule. A rule that wants to interpret such a formula as a rule schema must do so explicitly. This keeps Herbrand semantics simple: quoted formulae are data, not automatically asserted facts and not automatically active rules.

Use this convention:

- use `Y` for an eyelog variable in the current rule,
- use `var(y)` only when a quoted formula itself needs to contain a variable placeholder,
- use helper predicates to project or interpret quoted formula terms when needed.

### 5.8 Skolem terms in rule heads

Use the `skolem_` vocabulary prefix when a rule needs to introduce a generated resource. In Eyelog this is not a special runtime feature. It is a naming convention for ordinary compound terms used as Skolem functions.

For example:

```prolog
triple(skolem_observation(Patient, Test), rdf_type, observation) :-
  test_result(Patient, Test, _Value).

triple(skolem_observation(Patient, Test), patient, Patient) :-
  test_result(Patient, Test, _Value).
```

The head contains a functional term. For each ground proof of `test_result(Patient, Test, Value)`, the variables are substituted into the term. Thus `skolem_observation(alice, glucose)` and `skolem_observation(bob, glucose)` are distinct terms, while two derivations with the same `Patient` and `Test` produce the same term. This gives deterministic existential-style resources without relying on a global counter or blank-node allocation.

Good Skolem functions include enough arguments to identify what makes the generated resource unique:

```prolog
skolem_observation(Patient, Test)
skolem_alert(Patient, Condition)
skolem_membership(Person, Group)
```

Avoid a constant such as `skolem_observation` when several observations may exist, because all rule instances would collapse onto the same resource.

In Herbrand semantics, these Skolem terms are just terms in the universe. A rule head containing `skolem_observation(Patient, Test)` contributes ground atoms to the least Herbrand model for the corresponding ground substitutions. No extra semantics is needed.

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

Quoted formula terms do not invalidate the lemma. They are just terms in the Herbrand universe. If a program derives a ground atom whose argument is a quoted formula, that atom still appears at some finite `T_P` stage. If another rule later interprets `var(x)` placeholders inside that formula, the interpretation is an ordinary user-defined relation and its derived conclusions are again supported by finite rule instances.

Use more care with `not/1`. Negation as failure depends on failure of search, not membership in the least Herbrand model of a positive program. Programs using `not/1` should be written so the negated goal is sufficiently ground and finite.

## 6. Query mode

Use `--query` to ask any goal directly:

```sh
bin/eyelog --query 'ancestor(pat, X)' examples/ancestor.pl
```

Output is the instantiated goal:

```prolog
ancestor(pat, jan).
ancestor(pat, emma).
```

Query variables are instantiated by unification. In the pure core, each printed query instance is a consequence of the program's least Herbrand model. Operationally, eyelog finds those instances by depth-first rule search with unification and backtracking.

Default output adds two practical execution rules to that search:

- duplicate suppression: the same printed `triple/3` consequence is emitted once, even if several proof paths derive it;
- guarded recursion: eyelog keeps an active-call stack and does not re-enter a user-defined goal that is a variant of an already active goal.

A variant is the same goal up to variable renaming after current bindings are taken into account. This is not full tabling, but it prevents simple cyclic transitive closures from revisiting the same subgoal forever. For example, the recursive `path/2` program in `examples/cyclic-path.pl` terminates on a directed cycle and emits the finite reachability relation. If you need to enumerate paths rather than reachability pairs, use an explicit visited list as in the Dijkstra examples.

## 7. Built-ins

Built-ins are ordinary predicate calls that the engine knows how to evaluate.
Each built-in has a single native eyelog spelling. Vocabulary-style predicate
names remain ordinary user predicates, but they are not built-in aliases:
`math_sum/3` is just the ordinary predicate name `math_sum`, while `add/3` is
the built-in arithmetic operation.

When older examples offered several native spellings for one operation, eyelog
keeps the first spelling and drops the rest. This keeps the built-in dispatch
small and makes programs less ambiguous.

### Unification and equality

| Built-in | Meaning |
| --- | --- |
| `eq(X, Y)` | unify two terms |
| `neq(X, Y)` | succeeds when terms are not unifiable |

Inequality is most predictable when both arguments are already bound.

### Arithmetic

| Built-in | Meaning |
| --- | --- |
| `add(A, B, X)` | `X = A + B` |
| `sub(A, B, X)` | `X = A - B` |
| `mul(A, B, X)` | `X = A * B` |
| `div(A, B, X)` | `X = A / B`; integer quotient in integer mode |
| `mod(A, B, X)` | integer remainder |
| `max(A, B, X)` | larger value |
| `min(A, B, X)` | smaller value |
| `pow(A, B, X)` | `X = A ** B` |
| `neg(A, X)` | `X = -A` |
| `abs(A, X)` | absolute value |
| `sin(A, X)` | sine, in radians |
| `cos(A, X)` | cosine, in radians |
| `asin(A, X)` | inverse sine, in radians |
| `acos(A, X)` | inverse cosine, in radians |
| `rounded(A, X)` | nearest integer, returned as an integer term |
| `log(A, X)` | natural logarithm |

When all operands are integers, `add/3`, `sub/3`, `mul/3`, `div/3`,
`pow/3`, `max/3`, and `min/3` use arbitrary-size decimal-integer helpers.
This is why examples such as `fib(10000)` and the Ackermann-style
hyperoperation example can be written without engine-specific Fibonacci or
exponentiation code. In integer mode, exponentiation requires a non-negative
machine-integer exponent, and division is integer quotient.

When either operand contains a decimal point or exponent, the same arithmetic
predicates use C double-precision floating-point arithmetic. The result is
printed as a numeric term, with `.0` added when the floating result is
mathematically integral. This is useful for Eyeling-style probability and
measurement examples, but it is not exact decimal arithmetic.

`mod/3` remains integer-only. `rounded/2` also uses double-precision input and returns the nearest integer term. The unary transcendental functions are
double-precision operations and expect bound numeric input. They are intended
for translated mathematical examples such as `complex.pl`, not exact symbolic
mathematics.

`smallest_divisor_from(N, D, S)` is a bounded integer helper used by the
Fundamental Theorem of Arithmetic example. With `N` and starting divisor `D`
bound, it unifies `S` with the first divisor of `N` at or above `D`, or with
`N` itself when no smaller divisor exists.

### Comparisons

| Built-in | Meaning |
| --- | --- |
| `lt(A, B)` | `A < B` |
| `gt(A, B)` | `A > B` |
| `le(A, B)` | `A <= B` |
| `ge(A, B)` | `A >= B` |

Integer comparisons use arbitrary-size decimal-integer ordering. Decimal or
scientific operands use double-precision floating-point ordering. ISO-8601
duration strings such as `"P80Y"` and `"P81Y8M28D"` are compared by their
`Y`, `M`, and `D` components. If both operands are otherwise nonnumeric scalar
terms, comparison falls back to lexical string ordering, which is useful for
canonical ISO-8601 timestamps.

### Dates and durations

| Built-in | Meaning |
| --- | --- |
| `local_time(D)` | current local date as an ISO `YYYY-MM-DD` string |
| `difference(End, Start, Duration)` | calendar difference between two ISO dates as an ISO duration string |

`difference/3` accepts ISO date strings whose first ten characters are
`YYYY-MM-DD` and emits positive calendar durations such as `"P81Y8M28D"`.
This is enough for translated Eyeling examples that ask whether an age exceeds
a duration such as `"P80Y"`.

### Generators

```prolog
between(Low, High, N)
```

`between/3` enumerates integers from `Low` through `High` inclusive.

### Lists

| Built-in | Meaning |
| --- | --- |
| `append(A, B, C)` | concatenate lists |
| `nth0(N, List, Value)` | zero-based list lookup or finite enumeration |
| `set_nth0(N, List, Updated, Value)` | replace a zero-based list item |
| `rest(List, Tail)` | tail of a non-empty list |
| `member(Item, List)` | item occurs in list |
| `not_member(Item, List)` | item does not occur in a known list |
| `reverse(List, Reversed)` | reverse a known list |
| `length(List, N)` | count a known proper list |
| `is_list(List)` | proper-list check |
| `formula_triple(Formula, S, P, O)` | enumerate `triple/3` terms inside a comma formula |

`append/3` concatenates lists. It supports the common finite modes where the
first list is known, or where the combined list is known and the predicate
enumerates all prefix/suffix splits. `nth0/3` and `set_nth0/4` are native
finite list helpers; they are useful for examples such as matrix algorithms and
avoid building deep Prolog recursion in browser WebAssembly.

Examples:

```prolog
append([a, b], [c], X).      % X = [a, b, c]
append(A, B, [a, b]).        % enumerates [], [a], [a, b] prefixes
nth0(2, [a, b, c], X).       % X = c
set_nth0(1, [a, b, c], X, z). % X = [a, z, c]
```

`rest/2` exposes the tail of a non-empty list. `member/2` enumerates items in a
proper list. `not_member/2` succeeds when an item is not present in a known
proper list. `reverse/2` reverses a known proper list. `length/2` counts a
proper list when the list is known. `is_list/1` succeeds for proper lists.

### Finite constraint helpers

| Built-in | Meaning |
| --- | --- |
| `sudoku(Puzzle, Solution)` | solve a standard 9x9 Sudoku puzzle |

`sudoku/2` accepts an 81-character puzzle string, using `0` or `.` for blanks,
or a 9x9 grid list using `0` for blanks. It enumerates completed 9x9 grid
solutions. The built-in is generic: it is not tied to one example puzzle, and
it exists because a plain Prolog-style Sudoku search otherwise obscures the
reasoning example with a large amount of constraint plumbing.
Example:

```prolog
once(sudoku("100007090030020008009600500005300900010080002600004000300000010040000007007000300", Grid))
```

### String and atom construction

| Built-in | Meaning |
| --- | --- |
| `atom_concat(A, B, C)` | concatenate into an atom |
| `str_concat(A, B, C)` | concatenate into a string |
| `contains(Text, Part)` | literal substring test |
| `not_contains(Text, Part)` | negated literal substring test |
| `matches(Text, Pattern)` | simple alternation match |
| `not_matches(Text, Pattern)` | negated simple alternation match |

`matches/2` and `not_matches/2` support the simple alternation form used in the
translated Eyeling examples, for example `"diabetes|medical"`; they are not full
regular-expression engines.

### Search control

```prolog
not(Goal)
once(Goal)
```

`not/1` succeeds when `Goal` has no solution. Use it only with goals whose
variables are already bound enough to make the check finite.

`once/1` runs `Goal` and keeps only the first solution. It is useful at the
output/reporting layer when an example wants one witness rather than all
possible witnesses. The Sudoku example uses `once/1` to report the first completed grid returned by
the generic `sudoku/2` solver without re-emitting alternative solution searches
for each report triple.

Good:

```prolog
not(visited(Node, Path))
once(sudoku(Puzzle, Solution))
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
- `examples/gps.pl` adapts the GPS route-planning example more closely: map descriptions are quoted formula data, route actions are lists built with `append/3`, route metrics include duration/cost/belief/comfort, and the output layer emits the recommendation, checks, and report text.
- `examples/cyclic-path.pl` demonstrates transitive closure over a directed cycle. The logical reachability result is finite, and eyelog's active-call variant guard prevents recursive proof search from looping forever.
- `examples/service-impact.pl` applies the same cyclic-closure pattern to incident analysis: when `payment_service` fails, services and business functions that depend on it transitively are marked at risk even though the payment/fraud/risk-rules dependency graph contains a cycle.
- `examples/expression-eval.pl` adapts the expression evaluator example using eyelog arithmetic predicates.
- `examples/ackermann.pl` adapts Eyeling's Ackermann-style hyperoperation benchmark and uses `pow/3` with arbitrary-size integers, including the large `ackermann(4, 2)` value.
- `examples/dijkstra.pl` adapts the weighted Dijkstra graph as bounded simple-path enumeration. The route network is a quoted formula term, and path search uses `not_member/2` for visited-node checks.
- `examples/family-cousins.pl` adapts the generation/branch cousin derivation. The family tree is a scoped formula term, so parent links and seed branch labels are read from quoted data.
- `examples/allen-interval-calculus.pl` adapts Allen's interval relations over integer endpoints. The interval table is represented as a list of `interval(Id, Start, End)` records.
- `examples/gray-code-counter.pl` adapts the Clause and Effect gray-code counter.
- `examples/bayes-diagnosis.pl` adapts the Bayesian diagnosis model and emits Eyeling-style full posterior probabilities.
- `examples/bayes-therapy.pl` adapts the Bayesian therapy decision-support example. It uses list-valued disease, evidence, posterior, and therapy vectors to combine Naive Bayes diagnosis with expected-utility therapy selection.
- `examples/bmi.pl` adapts Eyeling's ARC-style BMI example, normalizing metric or US inputs, computing BMI, assigning a WHO adult category, deriving a healthy-weight band, and emitting checks plus a report.
- `examples/age.pl` adapts Eyeling's age checker, using `local_time/1`, `difference/3`, and ISO duration comparison to test whether a person is older than a threshold.
- `examples/c-core-throughput.pl` demonstrates Eyelog's compact C hot path by deriving many generated triples from a tiny rule set using range generation, atom construction, native arithmetic, unification, duplicate suppression, and formatted output.
- `examples/floating-point.pl` demonstrates decimal arithmetic and floating-point comparisons using native built-ins.
- `examples/complex.pl` adapts Eyeling's complex-number example. Complex values are two-item lists `[Real, Imaginary]`; the example derives complex exponentiation, polar form, `complex_asin/2`, and `complex_acos/2` using the native floating-point built-ins.
- `examples/skolem-functions.pl` demonstrates generated resources using `skolem_` functional terms in rule heads, such as `skolem_observation(Patient, Test)`, so derived identifiers are deterministic and collision-free.
- `examples/aliases-and-namespaces.pl` demonstrates native built-ins alongside ordinary vocabulary predicates.
- `examples/delfour.pl` adapts the Delfour neutral-insight authorization case, including policy checks, scoped shopping assistance, minimization, and a lower-sugar product recommendation. Its case, insight, policy, envelope, and signature inputs are formula terms; the product catalog is a list of records.
- `examples/dijkstra-risk-path.pl` adapts the risk-adjusted route example, deriving route metrics and selecting the lowest risk-adjusted score. It combines a quoted segment graph with list-valued candidate paths.
- `examples/drone-corridor-planner.pl` adapts the bounded corridor-planning example, using a fuel list to keep recursive planning finite while aggregating cost, duration, belief, and comfort.
- `examples/dining-philosophers.pl` adapts the Chandy-Misra dining-philosophers trace, deriving requests, dirty-fork sends, and meals across nine rounds.
- `examples/fundamental-theorem-arithmetic.pl` adapts the ARC-style Fundamental Theorem of Arithmetic scenario. It derives the factor list for `202692987`, reconstructs the product, and checks the distinct prime factors by trial division.
- `examples/easter-computus.pl` adapts the Gregorian computus example. It derives Easter dates for 2026-2035 and emits independent range/window checks.
- `examples/gd-step-certified.pl` adapts the certified gradient-descent interval example using decimal arithmetic, interval bounds, and objective bounds.
- `examples/fft8-numeric.pl` adapts the numeric FFT example using explicit complex pairs and radix-2 decomposition.
- `examples/odrl-dpv-risk-ranked.pl` adapts the ODRL + DPV ranked-risk assessment example. It derives missing-safeguard risks, DPV risk levels, mitigation measures, and inverse-score report keys from a formula-valued policy term, so policy triples are treated as scoped data rather than globally asserted facts.
- `examples/annotation.pl` adapts the RDF annotation example closely: it asserts `a name "Alice"`, names the quoted formula containing that triple with `log_nameOf`, and attaches the provenance triples directly.
- `examples/context-association.pl` adapts the context-association example more directly: the data, signature, and metadata contexts are top-level `log_nameOf` triples whose objects are quoted formula terms. A tiny `context_triple/4` projection demonstrates scoped inspection without turning the whole context into ambient facts.
- `examples/derived-rule.pl` adapts the derived-rule example closely: a top-level `triple/3` cat fact derives a quoted implication graph, and a top-level `triple/3` dog fact then fires that derived rule.
- `examples/odrl-dpv-healthcare-risk-ranked.pl` adapts the healthcare ODRL + DPV example. It keeps the policy and mitigation suggestions as formula-valued terms and derives only the risks supported by the scoped formula.
- `examples/sudoku.pl` adapts Eyeling's Sudoku case. The puzzle is an ordinary 81-character string, and `sudoku/2` is a generic native helper that solves any standard 9x9 puzzle string or grid using constraint propagation and search.
- `examples/kaprekar.pl` adapts Eyelet's Kaprekar example as a small rule-level demo. It derives Kaprekar step counts for representative inputs using digit extraction, sorting, subtraction, recursion, and memoization, without adding a Kaprekar-specific built-in.
- `examples/lldm.pl` adapts Eyeling's Leg Length Discrepancy Measurement example. It keeps measurement data and intermediate geometry in helper predicates, then emits a concise `triple/3` report with the alarm, the two leg lengths, the discrepancy, the threshold, and a short reason.

For policy-like inputs, annotations, signatures, route networks, and quoted rules, prefer formula-valued data when triples should stay scoped. Keep the outer shape close to the source when possible: an N3 `G log_nameOf { ... }` usually translates well to a top-level `triple(G, log_nameOf, ...)`, not to a separate `named_graph/2` table unless several rules need that indirection.
For example, `annotation.pl` and `context-association.pl` use top-level `triple(G, log_nameOf, ...)` declarations because that is the shape of the Eyeling inputs. `odrl-dpv-risk-ranked.pl` stores ODRL clauses as `policy_graph(policyGraph1, (triple(S, P, O), ...))` because the policy formula is a domain object that many helper predicates read from. `delfour.pl` uses the same idea for its case, insight, policy, envelope, and signature inputs. In each case rules can inspect a policy or signed payload without asserting every permission, prohibition, constraint, or signed field as a global fact, which is useful when different formulae may contain incompatible clauses.

Use lists when order or a closed collection matters: candidate routes, action sequences, interval tables, product catalogs, evidence vectors, and bounded fuel tokens are clearer as list terms than as many unrelated facts. Use formula terms when the data is RDF-shaped or intentionally scoped. It is fine to combine both: `dijkstra-risk-path.pl` keeps network segments in a quoted formula and candidate routes as lists.

For cyclic graph reachability, a simple transitive closure is usually fine:

```prolog
path(X, Y) :- arc(X, Y).
path(X, Z) :- arc(X, Y), path(Y, Z).
```

On a cyclic finite graph, eyelog's variant loop guard stops the proof search from re-entering the same active `path/2` subgoal. `examples/service-impact.pl` uses the same pattern for a practical service-dependency closure: if `Service` depends on `Dependency`, then a failure of `Dependency` affects `Service`, transitively, even when two services depend on each other. For path enumeration, shortest paths, or routes with costs, prefer an explicit visited-list argument so the program says which revisits are forbidden.

Formula terms are ordinary Eyelog terms. Use one representation for RDF-shaped scoped content:

```prolog
triple(g1, log_nameOf, (
  triple(s1, p1, o1),
  triple(s2, p2, o2)
)).

% formula_triple/4 is a native built-in over comma formula terms.
context_triple(GraphName, S, P, O) :-
  triple(GraphName, log_nameOf, Formula),
  formula_triple(Formula, S, P, O).
```

There is deliberately only one RDF-shaped constructor: `triple/3`. For several quoted triples, the formula itself is the standard comma term. For a single quoted triple, use the `triple/3` term directly.

Quoted formula variables use `var(name)` when the variable itself is part of the quoted data:

```prolog
triple(var(y), rdf_type, dog)
```

This is different from `Y`. `Y` is an eyelog variable in the surrounding rule; `var(y)` is a ground term that denotes a variable placeholder inside the quoted formula. The `derived-rule.pl` example uses this to represent an inner rule schema without letting the outer rule accidentally bind that inner variable.

The difference between an asserted/output triple and a quoted triple is positional, not syntactic:

- `triple(S, P, O)` as a top-level derived fact is materialized by the default query.
- `triple(S, P, O)` inside `...` is ordinary data. It becomes relevant only when a rule projects it with a helper such as `formula_triple/4`.

This avoids parallel names such as `statement/3` and `triple/3` for the same shape. Avoid using `edge/3` for RDF-shaped graph contents. Reserve domain names such as `arc/2`, `link/3`, or `route_segment/4` for ordinary graph algorithms where they are not RDF triples.

For example, a graph reachability program can use domain arcs without involving formula terms:

```prolog
arc(a, b).
arc(b, c).

path(X, Y) :- arc(X, Y).
path(X, Z) :- arc(X, Y), path(Y, Z).

triple(X, path, Y) :- path(X, Y).
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

`make test` cleans and rebuilds the native `bin/eyelog` executable before executing the suite. It does not build the browser target, so it can run on machines that have a C compiler but not Emscripten. Use `make` or `make all` when you also want to validate the browser build.

The native binary and the `dist/browser` WebAssembly assets are generated local artifacts and should not be committed. This avoids portable-release problems such as checking in an executable that was linked against a newer glibc than another user's system provides, and it keeps WebAssembly output tied to the Emscripten version used by the current build.

The test runner creates a private temporary directory with `mktemp` and removes
it on exit. It does not use fixed names such as `/tmp/eyelog-actual`, so several
`make test` runs can execute at the same time without clobbering each other's
intermediate files. Query parsing in `src/eyelog.c` also uses `mkstemp`, honoring
`TMPDIR` when it is set.

The API section of `test/run.sh` includes focused syntax regressions in `test/eyelog-syntax.pl`. These tests cover the term and clause syntax Eyelog actually supports: atoms, graphic atoms, quoted atoms, doubled quotes, empty atoms, strings and escapes, comments, integers, decimals, scientific numbers, negative numbers, compound terms, zero-arity compounds, proper and improper lists, list head/tail patterns, anonymous variables, parenthesized conjunction/comma formula terms, and basic built-in integration. They are Eyelog syntax/API checks, not a claim of complete ISO Prolog implementation.

## 10. Development and release

### 10.1 Build targets

The default target builds both the native CLI and the browser playground assets:

```sh
make
# same as: make all
```

This creates:

```text
bin/eyelog

dist/browser/eyelog.mjs
dist/browser/eyelog.wasm
```

`make` and `make all` require both a C compiler and Emscripten's `emcc`. To build only one target, use:

```sh
make cli       # native executable only
make browser   # WebAssembly playground assets only
```

Check the version with:

```sh
bin/eyelog --version
```

Use `make test` for the native example suite. It cleans and rebuilds `bin/eyelog`, but it does not require Emscripten.

### 10.2 Release script

After updating `VERSION`, commit, tag, and push with:

```sh
./mkeyelog "release message"
```

The script must be run from `main`. It first runs `make all` and `make test`, so release preparation requires both a C compiler and Emscripten. If any build or test step fails, it stops before committing, tagging, or pushing.

When checks pass, the script commits all source and documentation changes with the supplied message, creates an annotated `v$(cat VERSION)` tag, and pushes `main` plus the tag. Generated binaries under `bin/` and browser assets under `dist/` are generated locally and should not be committed, so releases do not depend on the libc or Emscripten version of the machine that prepared them.

### 10.3 GitHub Pages

The site is deployed by `.github/workflows/pages.yml` on every push to `main` and can also be run manually from the Actions tab. The workflow installs Emscripten, builds the WebAssembly playground assets, and then lets Jekyll package the site.

Use `./mkeyelog "release message"` for normal releases so native tests, browser assets, Pages, and the GitHub Release stay in sync.

### 10.4 Indexing implementation note

At load time, eyelog groups clauses by predicate name and arity. Within each predicate group it builds scalar indexes for every argument position, not only for `triple/3`. During solving, a goal with one or more bound atom, string, or number arguments chooses the smallest matching bucket and still checks candidate heads by unification. Clauses whose indexed argument is variable-headed or otherwise non-scalar remain in a fallback list so general rules continue to match.

For example, the same indexing mechanism helps all of these calls:

```prolog
triple(S, rdf_type, O)
parent(pat, X)
edge(A, B)
score(Item, 97)
```

The index narrows the candidate clauses; correctness still comes from the ordinary head-match and unification path.

## 11. Performance tips

Place the most selective goals early in a rule body. The engine groups clauses by predicate name and arity, then builds per-argument scalar indexes for every predicate. A call with one or more bound atom, string, or number arguments uses the most selective matching argument bucket and also keeps variable-headed clauses through a fallback list. This helps `triple/3`, but it also helps ordinary predicates such as `parent(pat, X)`, `edge(A, B)`, and `score(Item, 97)`.

For large materializations, prefer rules that generate each result once. The engine keeps a hash-backed set of printed `triple/3` facts, so examples such as `deep-taxonomy-100000.pl` can produce hundreds of thousands of distinct triples without quadratic duplicate checks.

The browser build runs inside a WebAssembly worker and has a smaller host call stack than a native process. The engine therefore uses an internal trampoline for long deterministic built-in chains, but programs should still avoid unnecessary recursive helper layers in tight arithmetic loops. `examples/kaprekar.pl` is a representative browser-friendly recursive arithmetic example.

For acyclic recursive workloads where the same bound subgoal is solved many times, add an opt-in memoization declaration:

```prolog
memoize(reachable, 2).
```

This caches answers for calls to `reachable/2` when at least one argument is already bound. It is useful for generated chains and other dynamic-programming-shaped examples. It can also help deterministic helper predicates that are called repeatedly with the same bound input, for example score vectors, route metrics, interval bounds, or list reductions used by several output triples. In this sense, memoization is local forward materialization inside backward chaining: answers are derived on demand, stored, and then reused as tabled facts for later calls. Memoization is deliberately explicit rather than automatic: cyclic closures should continue to rely on the guarded recursive search unless the memoized predicate is known to be safe for that workload.

Prefer this:

```prolog
triple(N, goldbachOk, true) :-
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

## 12. Current limits

The implementation is intentionally direct. Eyelog solves goals by guarded, Prolog-style Horn-clause search. Its default run materializes the selected output relation, `triple(S, P, O)`, by printing each distinct answer once; it is not a complete bottom-up saturation engine over every predicate.

Current limits:

- no cut,
- no DCGs,
- no module system,
- no automatic general tabling; `memoize/2` is explicit and workload-specific,
- no RDF parser yet.

List support is intentionally finite: `append/3`, `member/2`, `not_member/2`, and `reverse/2` are useful when at least one list-shaped argument is already bound enough to avoid infinite generation. Floating-point arithmetic uses the platform C `double` type. It is suitable for measurements, probabilities, and examples that need approximate real arithmetic, but it is not exact rational or exact decimal arithmetic. Use atoms and `triple/3` for RDF-shaped data until Turtle/TriG input support is added.
