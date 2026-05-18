# eyelog Handbook

This handbook describes the eyelog language and how to write examples that are self-contained: data, logic, and the final query live in the same `.pl` file.

## Contents

- [1. Program shape](#1-program-shape)
- [2. Terms](#2-terms)
- [3. Default output: `triple/3`](#3-default-output-triple3)
- [4. Query mode](#4-query-mode)
- [5. Built-ins](#5-built-ins)
- [6. Writing examples](#6-writing-examples)
- [7. Golden outputs](#7-golden-outputs)
- [8. Performance tips](#8-performance-tips)
- [9. Current limits](#9-current-limits)
- [10. Versioning](#10-versioning)

## 1. Program shape

An eyelog program is a sequence of Prolog-style facts and Horn clauses.

```prolog
parent(:jos, :jan).
parent(:jan, :emma).

ancestor(X, Y) :-
  parent(X, Y).

ancestor(X, Z) :-
  parent(X, Y),
  ancestor(Y, Z).
```

A fact has no body. A rule has a head, `:-`, a comma-separated body, and a final `.`.

## 2. Terms

Supported term forms are:

```prolog
X                  % variable, starts with uppercase or _
:jos               % atom
parent             % atom
"hello world"      % string
123                % integer
pair(3, 7)         % compound term
```

The anonymous variable `_` is allowed. Each occurrence is treated as a fresh variable.

## 3. Default output: `triple/3`

When you run a file without `--query`, eyelog materializes all distinct solutions of:

```prolog
triple(S, P, O)
```

and prints them as Prolog facts:

```prolog
triple(:jos, :ancestor, :emma).
```

This keeps the engine generic. Each example should define the `triple/3` rules that represent its intended output.

Example:

```prolog
parent(:jos, :jan).
parent(:jan, :emma).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

triple(X, :ancestor, Y) :- ancestor(X, Y).
```

Run:

```sh
bin/eyelog examples/ancestor.pl
```

## 4. Query mode

Use `--query` to ask any goal directly:

```sh
bin/eyelog --query 'ancestor(:jos, X)' examples/ancestor.pl
```

Output is the instantiated goal:

```prolog
ancestor(:jos, :jan).
ancestor(:jos, :emma).
```

## 5. Built-ins

### Unification

```prolog
=(X, :jos)
eq(X, :jos)
```

Both forms unify their arguments.

### Arithmetic

```prolog
add(A, B, Sum)
sub(A, B, Difference)
mul(A, B, Product)
div(A, B, Quotient)
mod(A, B, Remainder)
max(A, B, Maximum)
```

`add/3`, `sub/3`, and `mul/3` support arbitrary-size decimal integers. This is why examples such as `fib(10000)` can be written without engine-specific Fibonacci code.

`div/3`, `mod/3`, and `max/3` currently use machine integers.

### Comparisons

```prolog
lt(A, B)
gt(A, B)
le(A, B)
ge(A, B)
```

### Generators

```prolog
between(Low, High, N)
```

`between/3` enumerates integers from `Low` through `High` inclusive.

### String and atom construction

```prolog
atom_concat(A, B, C)
str_concat(A, B, C)
contains(Text, Part)
not_contains(Text, Part)
```

`atom_concat/3` produces an atom. `str_concat/3` produces a string.

### Negation as failure

```prolog
not(Goal)
```

`not/1` succeeds when `Goal` has no solution. Use it only with goals whose variables are already bound enough to make the check finite.

Good:

```prolog
not(visited(Node, Path))
```

Risky:

```prolog
not(edge(X, Y))
```

when `X` and `Y` are unbound.

## 6. Writing examples

Each example should contain:

1. input data as facts,
2. reusable logic as predicates,
3. final `triple/3` rules as the query/output layer.

For example, a graph reachability program:

```prolog
edge(:a, :b).
edge(:b, :c).

path(X, Y) :- edge(X, Y).
path(X, Z) :- edge(X, Y), path(Y, Z).

triple(X, :path, Y) :- path(X, Y).
```

Do not paste expected output as facts. The program should derive it.

## 7. Golden outputs

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

## 8. Performance tips

Place the most selective goals early in a rule body.

For large materializations, prefer rules that generate each result once. The engine keeps a hash-backed set of printed `triple/3` facts, so examples such as `deep-taxonomy-100000.pl` can produce hundreds of thousands of distinct triples without quadratic duplicate checks.


Prefer this:

```prolog
triple(:goldbach, N, pair(P, Q)) :-
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

## 9. Current limits

The implementation is intentionally direct:

- no lists syntax yet,
- no cut,
- no DCGs,
- no module system,
- no floating point arithmetic,
- no general tabling,
- no RDF parser yet.

Use atoms and `triple/3` for RDF-shaped data until Turtle/TriG input support is added.

## 10. Versioning

The project version is stored in `VERSION`. After `make`, run:

```sh
bin/eyelog --version
```

