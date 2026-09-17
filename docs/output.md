# Eyelang result format 1

Answers and explanations are ordinary Eyelang relations. Default CLI output,
`--proof`, and `--check` output can be parsed, loaded, and queried by Eyelang.
The only non-statement text is a `#` comment identifying the result format.
Errors go to stderr and do not masquerade as complete output.

This is syntactic closure and an explicit data vocabulary. Loading an output
document asserts result records, not the original application's predicates or
rules. It does not rerun the original questions. A consuming program uses
ordinary rules to interpret the records.

## Answers

```text
query(1, at(5, 1), [call(ancestor(alice, ?v0))], [binding("who", ?v0)]).
result(1, complete, 2).
answer(1, [binding("who", bob)]).
answer(1, [binding("who", carol)]).
```

- `query(Id, Location, Goals, Projection)` records a question template and its
  named projected variables. `at(Line, Column)` refers to the combined input.
- `result(Id, complete, Count)` records successful completion and answer count.
  Count zero means that question has no answers. No `answer` record is emitted
  for it. A successful ground question has `answer(Id, []).`.
- `answer(Id, Bindings)` records a solution as a list of `binding("name", Value)`.
  Original variable names are strings; values are native Eyelang terms.

Conjunctions, calculation-only questions, collections, and ground questions all
use the same representation. Exact integers remain integers, floats remain
floats, and strings use the normal Eyelang/JSON escapes.

Residual variables remain actual variables. `fun(?v0, ?v0)` preserves sharing;
`pair(?v0, ?v1)` preserves independence. Each fact is a separate scope. Repeated
spellings across facts do not establish variable identity across those facts.
As with any non-ground unit clause, a residual answer denotes its instances.
The projection associates query variable names with the question template;
bindings in each answer are associated by those string names.

## Proofs

With `--proof`, the document also contains:

```text
why(1, [], 3).
clause(1, human(socrates), []).
clause(2, mortal(var("who")), [call(human(var("who")))]).
substitution(1, []).
proof(1, human(socrates), rule(1, at(1, 1)), []).
substitution(2, [binding("who", socrates)]).
proof(2, mortal(socrates), rule(2, at(2, 1)), [uses(1, human(socrates))]).
substitution(3, []).
proof(3, solution([]), query, [uses(2, mortal(socrates))]).
```

`why(QueryId, Bindings, ProofId)` links a particular answer to its derivation.
`proof(Id, Conclusion, Source, Premises)` records one step. A source is either
`rule(ClauseNumber, Location)` or the symbol `query` for a projected query step.
A query conclusion is `solution([ProjectedValue, ...])`; the internal `$query`
implementation name never appears in `.eye` output.

`clause(ClauseNumber, HeadTemplate, BodyTemplate)` records each source clause
used by at least one proof step. Source variables are data constructors such as
`var("who")`, so their identity survives across separate output statements.
Repeated occurrences with the same name denote the same clause variable.
Anonymous source variables are numbered locally as `anonymous(1)`,
`anonymous(2)`, and so on; they never appear as substitution keys.

`substitution(ProofId, Bindings)` records the instantiation used by every proof
step. For a rule step, names belong to its `clause` template. For a query step,
names belong to the corresponding `query` projection. Empty ground instances
have `substitution(Id, []).`. Residual values remain ordinary output variables,
and formatting the complete substitution fact preserves their sharing.
Variables local to a collection can remain residual in the enclosing rule's
substitution; the collection premise and its referenced proof steps record the
individual contributing instances.

The premise vocabulary is:

| Term | Meaning |
| --- | --- |
| `uses(Id, Call)` | An instantiated positive call supported by another proof |
| `builtin(Call)` | Successful built-in relation |
| `compared("operator", Left, Right)` | Successful comparison/unification |
| `calculated(Value, Expression)` | Successful expression evaluation |
| `absent(Call, complete)` | Completed ground call with no answers |
| `collected(Values, Template, Goals, ProofIds, complete)` | Completed projected collection |

Conclusions, calls, values, expressions, and nested goals are structured data,
not prose or JSON hidden inside strings. Expressions use `value(Term)`,
`unary("-", Expr)`, `binary("operator", Left, Right)`, and
`function("name", [Arguments...])`.

Question and collection goal templates use `call(Term)`, `absent(Term)`,
`compare("operator", Left, Right)`, `calculate(Target, Expression)`, and
`collect(Target, Template, Goals)`. These are constructor values inside records,
not new executable syntax.

Proof documents include all derivations recorded during the run, including
intermediate table and collection queries. Only one derivation is retained per
variant answer. Proof IDs refer to earlier entries. Query and proof IDs are local
to one output document; independently generated documents must have their IDs
remapped before merging. The current format provides no automatic merge scope.

## Querying a proof with Eyelang

```sh
node bin/eyelang.js examples/proof/socrates.eye examples/proof-audit.eye
node bin/eyelang.js --proof examples/proof/socrates.eye examples/proof-audit.eye
```

The audit example traverses `uses` and collection references, derives transitive
proof dependencies, finds supporting source facts, and queries an applied rule
substitution. Its own output and proof output obey the same format. This
demonstrates reasoning about explanations; a standalone checker that reapplies
templates and validates every trusted operation is still future work.

Built-ins, absence, and collection completion remain trusted explanation steps.
Clause templates and substitutions make rule instantiation checkable, but the
format is not yet a fully independently checked proof certificate. Do not infer
classical falsity from a closed-world absence record.

## Check and JSON output

`--check` emits `checked(rules(N), queries(M)).` followed by
`stratum("name/arity", Level).` facts. These can also be loaded by Eyelang.
`--json` explicitly selects the JavaScript API representation instead of `.eye`.
JSON results retain the existing display strings plus structured proof fields
such as `conclusionTerm`, `ruleHead`, `substitution`, and `callTerm`; integers
have tagged decimal strings.

`formatResult(result, { proof: false })` and `formatCheck(summary)` expose the
serializers to JavaScript callers. Formatting covers results returned by the
current API; hand-constructed arbitrary objects are not an import format.

Saved outputs and tests cover every normally completing example, including variable identity,
integer precision, empty results, positive/negative/collection premises, repeated
serialization, and proofs of proof queries. Resource-limit failures still produce
no partial answer document and exit with status 2.
