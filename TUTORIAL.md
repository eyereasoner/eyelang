# eyelang tutorial

Write down what you know, describe how the pieces fit together, and ask what
follows. Then ask **why** and check that the result is the one you intended.

This tutorial builds rules for an outing: choose places to visit, follow
connections, calculate a journey time, and summarize the options. Along the
way, each program produces an answer, explains it, and checks an expectation.
That is **ARC: Answer, Reason, Check**.

## Run a program

Open the [playground](https://eyereasoner.github.io/eyelang/playground/), replace
the editor contents with a program below, and press **Run program**.
Use **Stop** to cancel a long computation.

For the command line, install eyelang with Node.js 18 or later:

```sh
npm install --global eyelang
eyelang outing.pl
```

Save the program as `outing.pl` before running it. From a repository checkout,
use `node eyelang.js outing.pl` instead; running the interpreter requires no
package installation or build step. Queries belong in the file alongside the
facts and rules.

Each Prolog block below is a complete program. Replace the file or editor
contents when moving to the next block.

## 1. Make your first inference

Start with a place and a fact about its opening status. A rule connects the
two facts to a possible visit:

```prolog
place(park).
open(park).

visit(Place) :-
    place(Place),
    open(Place).

% Answer
?- visit(Where).
% Reason
?- why.
% Check
:- assertion(visit(park)).
```

The answer is `Where = park.`. The reason shows the actual rule application:

```text
visit(park).
  because visit(park) :- place(park), open(park).
  place(park).
    you told me this.
  open(park).
    you told me this.
```

`visit(park)` follows because both conditions hold. Remove `open(park).` and
the assertion fails because the query has no successful answer. Remove the
assertion too to see `false.` in the answer section. The rule remains the same
while the evidence changes.

Here are the pieces you just used:

| Form | Meaning |
| --- | --- |
| `place(park).` | A supplied fact. |
| `visit(Place) :- ... .` | A rule: the head follows when all body goals succeed. |
| `,` | Both goals must hold, sharing any repeated variables. |
| `?- visit(Where).` | A question asking for every matching value of `Where`. |
| `?- why.` | Explain all answers to the preceding question. |
| `:- assertion(visit(park)).` | Require the expectation to succeed. |

Lowercase names such as `park` are **atoms**. Names starting with an uppercase
letter, such as `Place`, are **variables**. Repeated variable names within one
rule or question mean the same value. Variables in different rules or questions
have separate scopes. Each bare `_` is a fresh variable whose value is not
displayed.

Every statement ends with a period. `%` starts a line comment. Use single
quotes for atoms such as `'city-park'` and double quotes for strings such as
`"City park"`; atoms and strings are distinct terms.

## 2. Turn a policy into a rule

Now choose among several places. A visit must have a known entry fee, fit a
limit of 6, and have no recorded closure:

```prolog
place(park).
place(museum).
place(cafe).
entry_fee(park, 0).
entry_fee(museum, 12).
entry_fee(cafe, 5).
closed(museum).

visit(Place, Fee) :-
    place(Place),
    entry_fee(Place, Fee),
    \+ closed(Place),
    Fee =< 6.

?- visit(Where, Fee).
?- why(visit(cafe, 5)).

:- assertion(visit(park, 0)).
:- assertion(visit(cafe, 5)).
:- assertion(\+ visit(museum, 12)).
:- assertion(aggregate_all(count, visit(Place, Fee), 2)).
```

The first question returns these bindings, once each:

```text
Where = park, Fee = 0.
Where = cafe, Fee = 5.
```

Answer order is unspecified. The rule selects every matching option; it does
not rank the options or select the cheapest one. `visit/1` in the first program
and `visit/2` here are different predicates: the number of arguments matters.

`\+ closed(Place)` tests the absence of matching evidence after the relevant
producers finish. `place(Place)` binds the place before that test. For `cafe`,
the explanation identifies the completed absence search and the numeric test.
`why(visit(cafe, 5))` asks directly for that particular explanation.

The result depends on the supplied data: no recorded closure is not a promise
that a place is open in the world. If opening status must be supplied explicitly,
use a positive `open(Place)` condition as in the first program. Put a positive
goal before a negative test to bind its inputs; `\+ closed(Place)` on its own
with an unbound `Place` raises an error. Dependencies through negation must be
stratified: a rule cannot depend, directly or indirectly, on its own absence.

**Try it:** remove the museum closure and raise the fee limit to 12. Add an
assertion for the museum, replace its absence check, and update the expected
count to 3. The checks make that policy change explicit.

## 3. Follow connections, including a loop

Some conclusions need more than one application of a rule. A reachable place
is either one road away, or reachable after taking a road to an intermediate
place:

```prolog
road(home, park).
road(park, museum).
road(park, cafe).
road(museum, park).

reachable(From, To) :-
    road(From, To).
reachable(From, To) :-
    road(From, Via),
    reachable(Via, To).

?- reachable(home, Where).
?- why(reachable(home, museum)).

:- assertion(reachable(home, park)).
:- assertion(reachable(home, museum)).
:- assertion(reachable(home, cafe)).
:- assertion(aggregate_all(count, reachable(home, Place), 3)).
:- assertion(\+ reachable(home, home)).
```

The destinations are `park`, `museum`, and `cafe`. The explanation for the
museum follows `home → park → museum`.

The roads form a loop between the park and museum. This finite program still
finishes: inference stores each distinct conclusion once and continues until
there are no new conclusions. More paths to the same pair do not produce
duplicate answers. These rules describe paths with at least one road; they do
not add a zero-length journey from home to itself.

The positive rules here run forward, deriving reachable pairs even without a
query. Moving the facts or reversing the two rules preserves the answer set.
eyelang uses set-based inference rather than Prolog's usual ordered depth-first
execution.

**Try it:** add `road(cafe, library).`. Predict the new destinations from home,
then check your prediction with an assertion and an updated count.

## 4. Calculate a value, then test it

Keep numbers as data and make each calculation explicit. This program finds
two-leg journeys from home that take at most 20 minutes:

```prolog
leg(home, park, 10).
leg(park, cafe, 7).
leg(park, museum, 25).

short_trip(To, Minutes) :-
    leg(home, Via, First),
    leg(Via, To, Second),
    Minutes is First + Second,
    Minutes =< 20.

?- short_trip(Where, Minutes).
?- why.
?- Value is 9007199254740993 + 1.

:- assertion(short_trip(cafe, 17)).
:- assertion(\+ short_trip(museum, 35)).
:- assertion(9007199254740993 + 1 =:= 9007199254740994).
```

The first answer is `Where = cafe, Minutes = 17.`. Its explanation shows the
two legs, the concrete addition, and the comparison. The second answer is
`Value = 9007199254740994.`; integer arithmetic preserves every digit.

`is` computes its right-hand expression using already bound inputs. The road
goals bind `First` and `Second` before the addition. A question such as
`?- 17 is Unknown + 7.` raises an unbound-input error; arithmetic does not solve
that equation backward.

`=` unifies terms without calculating. `=:=` compares the values of arithmetic
expressions. For example, `?- X = 2 + 3.` binds `X` to the compound term
`(2 + 3)`, while `?- X is 2 + 3.` binds it to the integer `5`.
Integers and reals are distinct terms: `1 = 1.0` fails, but `1 =:= 1.0`
succeeds. Real arithmetic uses finite binary64 values; it is not exact decimal
arithmetic.

These rules describe exactly two legs. They do not find an optimal route or
enumerate journeys of arbitrary length.

## 5. Summarize distinct data

An aggregate answers a question about a completed set of matching tuples:

```prolog
entry_fee(park, 0).
entry_fee(cafe, 5).
entry_fee(garden, 5).
entry_fee(museum, 12).
entry_fee(cafe, 5).

?- aggregate_all(count, entry_fee(Place, Fee), Count).
?- aggregate_all(sum(Fee), entry_fee(Place, Fee), Total).
?- why.

:- assertion(aggregate_all(count, entry_fee(Place, Fee), 4)).
:- assertion(aggregate_all(sum(Fee), entry_fee(Place, Fee), 22)).
:- assertion(aggregate_all(min(Fee), entry_fee(Place, Fee), 0)).
:- assertion(aggregate_all(max(Fee), entry_fee(Place, Fee), 12)).
```

The answers are `Count = 4.` and `Total = 22.`. Repeating the cafe fact does not
add another tuple. The cafe and garden both contribute 5 because they are
different places. The count is over distinct `(Place, Fee)` tuples, not over
proof paths or distinct fee values alone.

The explanation identifies the completed aggregate and its supporting facts.
An empty count or sum is zero; an empty minimum or maximum fails. The producer
variables `Place` and `Fee` are local to each aggregate, so these questions
display only `Count` or `Total`.

## 6. Keep structure in your data

A term can describe more than a single label. Here, `details/2` groups an entry
type and a list of activities. List patterns let a rule inspect the first item
and continue with the rest:

```prolog
:- table member/2.

outing(park, details(free, [walk, picnic])).
outing(museum, details(ticketed, [art, history])).

member(Item, [Item | _]).
member(Item, [_ | Rest]) :-
    member(Item, Rest).

?- outing(Where, details(free, [First | Rest])).
?- why.
?- outing(Where, details(_Kind, Activities)), member(picnic, Activities).
?- why.

:- assertion(member(picnic, [walk, picnic])).
:- assertion(\+ member(swim, [walk, picnic])).
```

The first answer is `Where = park, First = walk, Rest = [picnic].`. The second
is `Where = park, Activities = [walk, picnic].`. `_Kind` is a named variable
whose binding is omitted from the displayed answer. Repeating `_Kind` within
the same query would still require the same value.

`[First | Rest]` splits a nonempty list into its first item and remaining list.
`member/2` is defined by the two clauses in this program; no library import is
needed. Its declaration makes calls demand-driven and tabled. These calls
supply a finite list. Calls must provide enough bindings to produce ground
answers; the interpreter does not return unresolved list tails as answers.

## 7. Request a bounded computation

Tabling is also useful when a calculation needs an input. Supply a particular
Fibonacci index and share the intermediate answers needed to compute it:

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

?- fibonacci(20, Value).
?- why.

:- assertion(fibonacci(20, 6765)).
:- assertion((fibonacci(19, A), fibonacci(20, B), fibonacci(21, C),
              A*C - B*B =:= 1)).
```

The answer is `Value = 6765.`. The first assertion checks a known value; the
second checks the relation between three neighboring results, independently
of the recurrence's individual additions.

`:- table fibonacci/2.` applies to every clause of that predicate. Calls share
their computed answers within this run. Clauses needing call inputs also use
tables automatically; the declaration makes that choice explicit for the whole
predicate. The supplied index bounds this calculation; asking
`fibonacci(N, Value)` with both variables unbound raises an
error when `N > 1` needs its input.

Short proofs for a single answer use an indented tree when they have no shared
steps. Multiple answers, shared steps, or deep chains use numbered rules and
steps, with local bindings such as `N = 20`. Numbering lets an explanation
refer to a shared premise without expanding it repeatedly. Each derived tuple
retains one successful derivation; `why` does not enumerate every alternative
proof of the same answer.

Tabling does not guarantee termination for arbitrary programs. Rules can still
create infinitely many distinct numbers, terms, or calls. Bound computations
with inputs, finite data, and stopping conditions.

## 8. Make a check fail

An assertion turns an expectation into an executable part of the program.
This deliberately incorrect expectation makes the run fail:

```prolog
entry_fee(cafe, 5).
?- entry_fee(cafe, Fee).
?- why.
:- assertion(entry_fee(cafe, 4)).
```

The CLI reports `Line 4: Check failed: entry_fee(cafe, 4).` and exits with a
nonzero status. It prepares the full transcript before printing, so this failed
run does not print a partial successful answer. Change the expected fee to 5
and the check passes.

An assertion with variables checks that at least one matching solution exists.
To verify that you have every expected answer, check individual results and an
aggregate count, as in the route program. Checks use the same inference engine;
known values, independent calculations, and identities make useful expectations.

## Build your own rulebook

Choose a question you currently answer by following several facts: which
devices meet a policy, which tasks depend on a task, or which records satisfy
a set of conditions. Start with a small, explicit data set:

1. Write the facts and a query whose expected answers you can list.
2. Add one rule that connects those facts to a useful conclusion.
3. Ask `why` and inspect the actual supporting terms.
4. Assert both an expected result and an expected absence.
5. Add more data, recursion, or calculations while keeping the checks useful.

The [example index](README.md#examples) has larger route, arithmetic, policy,
and taxonomy programs. The [specification](SPEC.md) defines the exact syntax and
semantics. eyelang implements a Prolog subset: cut, disjunction, general
meta-calls, modules, mutation, and external I/O predicates are outside it.

When a proof becomes large, save the complete CLI output:

```sh
eyelang outing.pl > outing-arc.txt
```

In the playground, the preview may be shortened, but copying or saving the
output keeps the complete result.
