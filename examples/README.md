# Eyelang examples

There are 76 top-level examples: 73 complete normally and three are deliberate
negative examples. Each successful example has checked answers in [output](output)
and checked explanations in [proof](proof), both written in ordinary `.eye`
syntax. Run from the project root:

```sh
node bin/eyelang.js examples/wolf-goat-cabbage.eye
node bin/eyelang.js --proof examples/modular-exponentiation.eye
node bin/eyelang.js examples/proof/socrates.eye examples/proof-audit.eye
npm test
```

`proof-audit.eye` consumes the separate proof document shown above. All other
top-level examples are self-contained. No sister checkout or runtime dependency
is required to execute these ports or their tests.

## Complete Eyeleng example corpus

All 56 `.srl` basenames from `eyeleng/examples/` at revision
`b7c7e46f82974682974a342a7fa65e6b8a229d48` have a corresponding `.eye` file
directly in this directory. [eyeleng-ports.json](eyeleng-ports.json) is the
one-to-one manifest. The conformance test runs every port and checks that the
three intentionally invalid sources—`unstratified-negation`,
`variable-predicate-dependency`, and `well-formedness-error`—are rejected for
the expected reason.

```sh
node bin/eyelang.js examples/alignment-demo.eye
node bin/eyelang.js examples/deep-taxonomy-100000.eye
node --test test/eyeleng-examples.test.js
```

These are Eyelang ports, not an SRL parser. RDF surface constructs become
ordinary relations and constructors. Generated stress fixtures use compact
parameterized rules, and examples relying on host-specific functions use stable,
explicit logical values. The examples retain the logical scenario and an
acceptance query while staying inside the deliberately small Eyelang language.
When the sister checkout is present, `node tools/update-eyeleng-ports.js` first
checks that its complete `.srl` filename set is still covered.

## Twelve ports from the sister projects

These additions retain the original problem data and selected results. Changes
to algorithms, representation, or scope are explicit below. [sources.json](sources.json)
pins all three source revisions and records the source and reference-output paths.
The source commits inspected were:

- EyeProlog: `1468906b4e2b3af8035dfdcbbeb99bd4b77367df`.
- Eyeling: `835cb3555c8b56c41838a53002760b3f918b49c9`.
- Eyeleng: `b7c7e46f82974682974a342a7fa65e6b8a229d48`.

| Example | Source | What it demonstrates |
| --- | --- | --- |
| [hanoi.eye](hanoi.eye) | [EyeProlog hanoi.pl](https://github.com/eyereasoner/eyeprolog/blob/1468906b4e2b3af8035dfdcbbeb99bd4b77367df/examples/hanoi.pl) | Recursive construction of the same seven moves for three disks |
| [wolf-goat-cabbage.eye](wolf-goat-cabbage.eye) | [EyeProlog wolf-goat-cabbage.pl](https://github.com/eyereasoner/eyeprolog/blob/1468906b4e2b3af8035dfdcbbeb99bd4b77367df/examples/wolf-goat-cabbage.pl) | Safe-state search, visited-state negation, and both seven-crossing solutions |
| [critical-path-schedule.eye](critical-path-schedule.eye) | [EyeProlog critical-path-schedule.pl](https://github.com/eyereasoner/eyeprolog/blob/1468906b4e2b3af8035dfdcbbeb99bd4b77367df/examples/critical-path-schedule.pl) | Eleven-task schedule, finish time 23, and seven critical tasks |
| [peano-arithmetic.eye](peano-arithmetic.eye) | [EyeProlog peano-arithmetic.pl](https://github.com/eyereasoner/eyeprolog/blob/1468906b4e2b3af8035dfdcbbeb99bd4b77367df/examples/peano-arithmetic.pl) | Structural addition, multiplication, and factorial: an actual 120-successor term |
| [modular-exponentiation.eye](modular-exponentiation.eye) | [Eyeling modexp.n3](https://github.com/eyereasoner/eyeling/blob/835cb3555c8b56c41838a53002760b3f918b49c9/examples/modexp.n3) | Repeated squaring with exact integers, including a billion-sized exponent |
| [gray-code-counter.eye](gray-code-counter.eye) | [Eyeling gray-code-counter.n3](https://github.com/eyereasoner/eyeling/blob/835cb3555c8b56c41838a53002760b3f918b49c9/examples/gray-code-counter.n3) | Truth tables, flip-flops, list-threaded circuit state, and a full Gray cycle |
| [good-cobbler.eye](good-cobbler.eye) | [Eyeling good-cobbler.n3](https://github.com/eyereasoner/eyeling/blob/835cb3555c8b56c41838a53002760b3f918b49c9/examples/good-cobbler.n3) | Compound properties and a quoted statement represented as data |
| [context-association.eye](context-association.eye) | [Eyeling context-association.n3](https://github.com/eyereasoner/eyeling/blob/835cb3555c8b56c41838a53002760b3f918b49c9/examples/context-association.n3) and its TriG fixture | Joins across three graph contexts, retaining graph and blank-node distinctions |
| [dog-license.eye](dog-license.eye) | [Eyeleng dog-license.srl](https://github.com/eyereasoner/eyeleng/blob/b7c7e46f82974682974a342a7fa65e6b8a229d48/examples/dog-license.srl) | Distinct collection and a cardinality policy; only Alice requires a license |
| [property-paths.eye](property-paths.eye) | [Eyeleng property-paths.srl](https://github.com/eyereasoner/eyeleng/blob/b7c7e46f82974682974a342a7fa65e6b8a229d48/examples/property-paths.srl) | Expanding path sequence and inverse into ordinary joins |
| [bayes-diagnosis.eye](bayes-diagnosis.eye) | [Eyeleng bayes-diagnosis.srl](https://github.com/eyereasoner/eyeleng/blob/b7c7e46f82974682974a342a7fa65e6b8a229d48/examples/bayes-diagnosis.srl) | Calculated floating-point scores, screening, and threshold classification |
| [reification-and-annotations.eye](reification-and-annotations.eye) | [Eyeleng reification-and-annotations.srl](https://github.com/eyereasoner/eyeleng/blob/b7c7e46f82974682974a342a7fa65e6b8a229d48/examples/reification-and-annotations.srl) | Joining statement metadata without asserting a merely reified statement |

## What the ports preserve and change

**Scheduling:** the source uses recursive maximum aggregation. Eyelang rejects
recursion through collection, so the port first enumerates dependency-path
durations and then aggregates. The full schedule and critical-task answers match
the reference, but the algorithm has different scaling behavior and assumes the
given acyclic task graph.

**Cardinality:** the dog-license port collects dog identities. Collecting constant
`1` values would collapse them under Eyelang's set semantics. The source's five-way
distinct join and this collection formulation select the same owner.

**RDF and quoted statements:** these ports operate on already represented data.
Namespace-local names become symbols, while the context example preserves its
issuer IRI and typed date explicitly. `blank(...)` names identify local fixture
nodes; they are not globally unique blank-node identifiers. `quoted(...)` is an
ordinary constructor, not N3's complete formula semantics. The context example
uses only the source fixture triples consumed by its rule. It checks metadata
links, not signatures, cryptographic trust, or time validity. Bob's reified
statement in the annotation example remains unasserted.

**Scoring:** the four unnormalized scores are computed from the same input
models as the SRL source; tests use relative tolerance `1e-12` against the saved
reference values. Rank and screening decisions are checked exactly. This small
illustrative model is not a medical decision tool or a normalized posterior.

The other original seed examples remain useful introductions: [ancestor](ancestor.eye),
[cyclic reachability](cyclic-reachability.eye), [lists](lists.eye),
[symbolic differentiation](derivative.eye), [type inference](type-inference.eye),
[negation](policy.eye), [aggregation](aggregation.eye), [four queens](four-queens.eye),
and [proof analysis](proof-audit.eye).

## Verification

Semantic expectations are independent of the generated output files. Additional
checks replay Hanoi and river-crossing moves, verify every scheduling dependency,
check the Gray-code one-bit invariant, compare small modular powers with direct
integer exponentiation, exercise the dog-count boundary and duplicate facts,
and move a metadata triple to another graph to ensure it cannot complete the
association. Every answer/proof document is also parsed, loaded, printed, and
parsed again by the closure tests.

Regenerate artifacts only after an intentional change:

```sh
node tools/update-eyeleng-ports.js
node tools/update-examples.js
npm test
```

The tests do not modify the generated files. Review the output/proof diffs along
with source changes; passing saved-output checks alone does not establish a
faithful port of an arbitrary sister-project feature.
