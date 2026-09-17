# Eyelang user manual

Eyelang is a small logic programming language with facts, rules, questions,
structured terms, arithmetic, finite search, stratified negation, collection,
and inspectable explanations. This manual is task-oriented. Exact grammar and
semantics are in the [language specification](specification.md).

## Running Eyelang

Eyelang requires Node.js 18 or newer and has no runtime dependencies. From the
project root:

```sh
node bin/eyelang.js examples/ancestor.eye
node bin/eyelang.js --proof examples/socrates.eye
npm test
```

Useful CLI forms are:

```sh
node bin/eyelang.js --query 'ancestor(bob, ?who)' examples/ancestor.eye
node bin/eyelang.js --check examples/policy.eye
node bin/eyelang.js --json examples/type-inference.eye
node bin/eyelang.js --max-steps 100000 examples/shortest-path.eye
node bin/eyelang.js -
```

`--query` appends a question to questions already in the files. Multiple files
are concatenated in argument order. `-` reads standard input. Exit status `0`
means completed evaluation, including a question with no answers; `1` means a
syntax, validation, or runtime error; `2` means a work limit prevented complete
evaluation.

## Facts, rules, and questions

```eye
parent(alice, bob).
parent(bob, carol).

ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).

ask ancestor(alice, ?who).
```

Every statement ends in a period. A rule reads “the head holds if the body
holds.” Commas form a left-to-right conjunction, and multiple clauses provide
alternatives. `#` starts a line comment.

Relations are identified by name and arity. `ready` and `ready()` are both calls
to `ready/0`. Clause order does not establish priority, and there are no cuts or
procedural database updates.

## Terms and variables

```eye
symbol(alice).
text("hello").
numbers(42, -7, 3.5, 2e3).
flags(true, false).
point_value(point(2, 3)).
items([a, b, c]).
open_list([?head | ?tail]).
```

Variables begin with `?`. A named variable is shared within one statement; `?_`
creates a fresh anonymous variable on every occurrence. Variables in different
statements are unrelated. Capitalization has no special variable meaning.

Integers are exact and arbitrary-size. Floats are finite binary floating-point
values. Symbols, strings, booleans, integers, floats, and constructor terms are
different kinds. In particular, `1 = 1.0` fails.

Lists support ordinary relational definitions:

```eye
append([], ?ys, ?ys).
append([?x | ?xs], ?ys, [?x | ?zs]) if append(?xs, ?ys, ?zs).

ask append(?left, ?right, [a, b]).
```

## Goals

The available goal forms are:

```eye
pair(?x, ?y)                       # relation call
?x = point(1, 2)                   # unification
?x != ?y                           # ground structural inequality
?age >= 18                         # ground numeric comparison
not blocked(?person)               # ground closed-world test
let ?square = ?number * ?number    # calculation
```

Goals run left to right. `!=`, numeric comparisons, arithmetic, negation, and
several built-ins require their inputs to be bound when selected. Eyelang
reports a mode error instead of reordering the body.

Unification is structural and uses an occurs check, so `?x = f(?x)` fails.
Numeric comparisons may compare integers with floats. Structural `=` never
performs numeric conversion.

## Arithmetic

Expressions support unary `-` and `+`, `-`, `*`, `/`, `//`, `%`. Multiplication,
division, integer division, and remainder bind more tightly than addition and
subtraction. Parentheses override precedence.

```eye
hypotenuse(?a, ?b, ?length) if
    let ?a2 = ?a * ?a,
    let ?b2 = ?b * ?b,
    let ?sum = ?a2 + ?b2,
    let ?length = sqrt(?sum).
```

The one-argument expression functions are `abs`, `sqrt`, `round`, `count`,
`sum`, `min`, `max`, and `str`. `str` returns the lexical text of a value.
`concat(...)` joins the lexical text of any number of values. `/` returns a
float; `//` requires integers and truncates toward zero. Division by zero,
invalid domains, and non-finite results are errors.

## Negation

```eye
person(alice).
person(bob).
blocked(bob).

eligible(?person) if person(?person), not blocked(?person).
ask eligible(?person).
```

The call after `not` must be ground. It succeeds when complete evaluation of
that call finds no answer. This is stratified closed-world negation, not
classical negation. Cycles through negation are rejected before evaluation.

## Collection and braces

```eye
reading(sensor_a, 10).
reading(sensor_b, 15).
reading(sensor_c, 10).

summary(?readings, ?total) if
    collect ?readings = reading(?sensor, ?value) where {
        reading(?sensor, ?value)
    },
    collect ?values = ?value where {
        reading(?sensor, ?value)
    },
    let ?total = sum(?values).
```

Literal `{` and `}` are used only after `collect ... where`. They delimit the
nested comma-separated goal body. They are not general blocks, graph literals,
sets, maps, or quoted formulas, and there is no period inside them.

Collection evaluates its body completely and returns a closed list of distinct,
ground template values. It has set semantics: the two readings of `10` collapse
in `?values`, while the tagged readings remain distinct in `?readings`.

Bindings made before collection are visible inside it. Unbound variables used
only inside are local and do not escape. Bind a correlation variable before the
collection goal when separate groups must stay separate. Recursion through a
collection is rejected by stratification.

## Built-in relations

- `range(Low, High, Value)` enumerates an inclusive integer range.
- `length(List, Size)` obtains the length of a ground closed list.
- `sort(List, Sorted)` removes duplicates and sorts a ground closed list.
- `sudoku(Puzzle, Solution)` solves a ground 9 by 9 Sudoku grid, using zero for
  an empty cell.

These signatures cannot be redefined. `member/2`, `append/3`, and similar list
relations are ordinary Eyelang definitions, not implicit built-ins.

## Answers and proofs

Default output is itself an Eyelang program:

```eye
query(1, at(7, 1), [call(ancestor(alice, ?v0))], [binding("who", ?v0)]).
result(1, complete, 2).
answer(1, [binding("who", bob)]).
answer(1, [binding("who", carol)]).
```

That output can be saved, loaded, and queried. It records a question as data;
loading it does not run the question again. `result(..., complete, 0)` means a
completed question had no answers. A successful ground question has
`answer(Id, [])`.

With `--proof`, additional facts describe the derivation:

```eye
clause(2, mortal(var("who")), [call(human(var("who")))]).
substitution(2, [binding("who", socrates)]).
proof(2, mortal(socrates), rule(2, at(2, 1)),
      [uses(1, human(socrates))]).
```

`clause/3` reifies the source template, `substitution/2` records its explicit
instantiation, `proof/4` records the conclusion and premises, and `why/3` links
an answer to its proof. These records can be inspected by ordinary Eyelang
rules. Built-ins, calculations, absence, and collection completion remain
trusted steps, so the document is an explanation rather than a fully checked
proof certificate. The complete record vocabulary is normative in section 12
of the [specification](specification.md).

`--check` emits `checked/2` and `stratum/2` facts without evaluating questions.
`--json` selects a tagged JavaScript-oriented representation instead of `.eye`.

## RDF 1.2 interoperability

The N-Quads adapter turns an RDF 1.2 dataset into ordinary `rdf/4` facts. That
keeps RDF at the boundary: rules can inspect, join, and derive RDF statements
without adding a second evaluation model.

```sh
node bin/eyelang.js \
  --rdf-input examples/rdf12-interoperability.nq \
  examples/rdf12-interoperability.eye

node bin/eyelang.js \
  --rdf-input examples/rdf12-interoperability.nq \
  --rdf-output examples/rdf12-interoperability.eye
```

The first command produces normal `.eye` answers. The second emits RDF 1.2
N-Quads containing imported and inferred `rdf/4` statements. The mapping is
visible in the example itself: IRIs use `iri(Text)`, blank nodes use
`blank(Label)`, literals retain datatype or language and direction, triple
terms use `triple(Subject, Predicate, Object)`, and the fourth argument is
`default_graph` or a graph IRI/blank node. Blank-node labels from separate input
files are scoped independently. Import does not silently apply an RDF or RDFS
entailment regime; any intended entailment is expressed by Eyelang rules.

The public JavaScript functions are `parseNQuads`, `nquadsToEyelang`,
`formatNQuads`, and `rdfAnswersToNQuads`. The concrete syntax follows
[RDF 1.2 N-Quads](https://www.w3.org/TR/rdf12-n-quads/), including `VERSION
"1.2"`, triple terms, and directional language-tagged strings.

## JavaScript API

```js
import { run, format } from './index.js';

const result = run(`
  human(socrates).
  mortal(?x) if human(?x).
  ask mortal(?who).
`);

console.log(format(result.queries[0].answers[0].bindings.who));
```

`run(source, options)` returns `{ status, queries, proofs, stats }` or throws.
`check(source)` parses and validates without evaluation. `format(term)` prints a
term. `formatResult(result, { proof: true })` and `formatCheck(summary)` produce
Eyelang documents.

Options `maxSteps`, `maxTables`, and `maxAnswers` are positive integers. Their
defaults are 1,000,000, 100,000, and 100,000. Limits are shared across the run;
exhaustion reports incomplete evaluation and never turns partial work into a
false or complete answer.

## Examples and practical boundaries

The flat [example suite](../examples/README.md) covers recursion, lists, search,
arithmetic, graph-shaped data, policies, scheduling, Sudoku, proof auditing, and
large parameterized taxonomies. Its inventory is
[examples/suite.json](../examples/suite.json). Regenerate checked answer and
proof documents after intentional changes with:

```sh
node tools/update-examples.js
npm test
```

Eyelang does not currently provide constraint propagation, Turtle or TriG
concrete syntax, quoted executable formulas, generated rules, mutable databases,
existential witness generation, or static type and mode inference. Constructor values can
represent graph-shaped data but do not acquire RDF semantics automatically;
RDF interoperability is explicitly selected through the N-Quads adapter.

General constructor recursion and value-generating arithmetic may not terminate.
The reference engine is a replay-based, demand-driven fixed-point evaluator; it
is intended for clarity and conformance rather than production optimization.
