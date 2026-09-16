# Eyelit language, draft 0.1

This document specifies the implemented prototype, with limitations stated
explicitly. The surface syntax and semantics may change during the example ports.

## Program shape

```text
human(socrates).                          # fact
mortal(?x) if human(?x).                  # rule
ask mortal(?who).                        # question
```

Statements end in `.`. `#` starts a comment through the end of the line. Whitespace
is insignificant. A relation is identified by its name and arity. Zero-argument
relations can be written `ready` or `ready()`. Body goals are separated by commas
and form a conjunction. Multiple clauses for a relation provide alternatives.
Empty bodies succeed, including `ask .`.

Keywords are recognized in their grammatical positions: `ask`, `if`, `not`,
`let`, `collect`, and `where`. There are no user-defined operators, cuts,
implicit imports, or procedural database updates.

## Values and variables

| Form | Meaning |
| --- | --- |
| `alice`, `Human` | Symbols; capitalization has no variable meaning |
| `"hello"` | JSON-escaped string |
| `42`, `-42` | Arbitrary-size integer |
| `3.5`, `1.0`, `2e3` | Finite binary floating-point number |
| `true`, `false` | Boolean values, not callable goals |
| `?x` | Named logic variable |
| `?_` | A new anonymous variable on each occurrence |
| `[]`, `[a, b]`, `[?head \| ?tail]` | Lists, including open tails |
| `point(2, 3)` | Constructor term |

Names use ASCII letters or `_` followed by ASCII letters, digits, or `_`.
Strings can contain Unicode. Lists are syntactic sugar for `cons/2` and `nil/0`
constructor values; those two constructor names cannot be called as relations.
A bare symbol `red` differs from the zero-argument constructor value `red()`.

Variables are scoped to one statement. Clauses are standardized apart each time
they are used. A unit clause containing variables, such as `same(?x, ?x).`, is a
universally quantified relation definition, not a stored ground fact.

Constructor unification is structural and includes an occurs check. `?x = f(?x)`
fails. Strings, symbols, integers, floats, and booleans are distinct kinds:
`1 = 1.0` fails, while numeric comparison `1 <= 1.0` succeeds.

## Goals and their input requirements

Goals are evaluated left to right within a body. Clause order does not establish
priority. A computation or test encountered without its required inputs raises
an error; the prototype does not delay or reorder it automatically.

```text
pair(?x, ?y)                  # call a relation
?x = point(1, 2)              # structural unification; may bind either side
?x != ?y                     # ground structural inequality
?number >= 18                # ground numeric comparison
not blocked(?person)         # call must be fully ground
let ?square = ?number * ?number
```

Comparison operators are `=`, `!=`, `<`, `>`, `<=`, and `>=`. Comparison operands
are terms; use `let` to calculate an expression first. `!=` is a ground test,
not a delayed disequality constraint. Undefined relations are errors, including
undefined relations appearing only under `not`.

`let` evaluates a ground expression and unifies the target with its value. It
does not solve arithmetic constraints backwards. Expressions support parentheses,
unary minus, and infix `+`, `-`, `*`, `/`, `//`, `%`. Multiplication, division,
integer division, and remainder bind more tightly than addition and subtraction;
operators within a precedence level associate left to right.

`//` requires integers and truncates toward zero; `%` is remainder with the sign
of the dividend. `/` returns a floating-point value. Mixed integer/float operations
convert only integers within JavaScript's safe integer range; larger implicit
conversions raise an error. Division by zero and non-finite results raise errors.
Numeric comparisons can compare integers with floats without that conversion.
Numeric equality can be expressed with `<=` and `>=`; `=` remains structural.

Expression functions, each taking one argument:

- `abs(number)`, `sqrt(number)`.
- `count(list)`, `sum(list)`, `min(list)`, `max(list)`.

`count([])` and `sum([])` return `0`. `min([])` and `max([])` are errors.
`sqrt` uses floating-point arithmetic and the same integer conversion check.

Built-in relations:

- `range(low, high, value)` enumerates an inclusive integer interval; low and high
  must be ground. A reversed interval has no answers.
- `length(list, size)` requires a ground closed list and unifies its integer size.
- `sort(list, sorted)` requires a ground closed list, removes structurally equal
  duplicates, places numbers before other kinds, and sorts numbers numerically. Other comparisons and numeric
  ties use canonical term keys. This ordering is a prototype convention.

`member` and `append` are written as ordinary rules in the list examples, not
implicitly available built-ins. Built-in relation signatures cannot be redefined.

## Negation and collection

`not p(...)` succeeds when the fully ground positive call has no answer after
complete evaluation against the immutable program. An exhausted resource budget
does not establish absence. This is closed-world negation of the specified call;
it is not classical negation or N3 formula negation.

```text
eligible(?x) if person(?x), not blocked(?x).

summary(?values, ?total) if
    collect ?values = ?value where { reading(?sensor, ?value) },
    let ?total = sum(?values).
```

Collection evaluates the nested body to completion, projects its template, and
unifies the target with a list of distinct ground values in canonical term-key
order. Numeric order requires `sort`. An empty result is `[]`. A nonground
template answer is an error.

Collection sees the variable bindings available on entry; bindings made inside
the nested body do not escape, except through the target. Variables mentioned
only in its template/body are not projected by `ask`. If a value must be
correlated with an enclosing goal, bind it before entering `collect`. This is
an explicit calling-mode requirement of this prototype.

Collection uses sets. Equal readings from different sensors collapse when only
the number is projected. To preserve that multiplicity, collect
`reading(?sensor, ?value)` and fold the resulting list, as in the aggregation
example. There is no implicit bag of proofs.

The predicate dependency graph must be stratified: positive dependencies may
remain at the same level; dependencies under `not` or `collect` must be strictly
lower. Cycles crossing either construct are rejected before execution. Dependencies
are conservatively analyzed by relation name/arity, not argument values.

## Queries, answers, and termination

`ask` projects named variables from its outer body. Anonymous variables are
omitted. A successful ground query has one empty binding map. A completed query
with no answers is false. Residual variables are allowed, and shared variable
identity is preserved in the JavaScript API and the CLI's `?v0`, `?v1`, etc.

Tables deduplicate answers modulo variable renaming. Ground answers therefore
have ordinary set semantics. Nonground answers describe families of instances;
the prototype does not remove an answer merely because a more general answer
subsumes it. Answer ordering is unspecified; collection ordering is explicit.

The intended logical reading of positive rules is their least Herbrand model;
stratified negation and collection evaluate against completed lower dependencies.
Operationally, input-mode restrictions apply. A complete result is returned only
after every demanded table reaches a fixed point.

For finite, function-free, range-restricted programs without value-generating
arithmetic or built-ins, the demanded grounding is finite. General constructor
terms, universal clauses, and arithmetic can produce infinitely many calls or
answers. This prototype does not statically classify the terminating subset.
`maxSteps`, `maxTables`, and `maxAnswers` stop excessive evaluation with an explicit
incomplete-evaluation error. They do not bound individual arithmetic operations,
term nesting, wall-clock time, or total bytes allocated.

## Explanations

Every new table answer records one derivation: its source rule number, combined
source location, instantiated conclusion, and premises. Alternative derivations
of the same answer are not enumerated. Positive premise references point to
already recorded answers, forming an acyclic explanation graph even when the
program is recursive.

Built-ins and calculations are explicit trusted steps. Negation records that
a lower query completed without an answer. Collection records its contributing
answer IDs and completion basis. These records are provenance, not a portable
proof calculus or an independently checked completeness certificate.
