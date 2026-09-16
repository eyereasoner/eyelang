# Example-led migration plan

The target is to express the reasoning problems from EyeProlog, Eyeling, and
Eyeleng in a smaller language. Source compatibility is not a target for draft 0.1.

The initial inventory found 235 top-level `.pl` examples, 227 top-level `.n3`
examples, and 56 top-level `.srl` examples in the neighboring checkouts. These
counts exclude book, proof, output, and other nested directories. They are an
inventory snapshot, not a measured compatibility percentage.

## Acceptance seeds implemented here

| Eyelit example | Source inspiration | What is checked; limits of the port |
| --- | --- | --- |
| `socrates.eye` | All three projects' Socrates examples | Ground conclusion and rule provenance |
| `ancestor.eye` | EyeProlog `ancestor.pl`; Eyeleng `family.srl` | Recursive family relation over a small new fixture |
| `cyclic-reachability.eye` | Graph/reachability and backward-recursion examples | Actual left recursion and a cycle; finite closure |
| `fibonacci.eye` | Eyeling `fibonacci.n3`; EyeProlog `fibonacci.pl` | Direct recurrence, exact F(100); not the full original large-case corpus |
| `lists.eye` | Prolog list relations and N3 collection examples | Relational append in reverse and duplicate-free membership |
| `derivative.eye` | EyeProlog `symbolic-derivative.pl` | Product differentiation over explicit terms; a subset of derivative rules |
| `type-inference.eye` | EyeProlog `type-inference.pl` | Monomorphic lambda inference with actual shared logic variables; no let polymorphism |
| `policy.eye` | Eyeleng `stratified-negation.srl` | Same three-person scenario and completed absence test |
| `aggregation.eye` | Collection/statistics examples | Distinct collection, tagged multiplicity, count and fold |
| `shortest-path.eye` | Dijkstra/path examples | New small graph, minimum-cost simple route; not Dijkstra's algorithm |
| `four-queens.eye` | EyeProlog `clpz-n-queens.pl` | Both four-queens solutions through real finite search; no constraint propagation |
| `graph-join.eye` | Named-graph and knowledge-graph examples | New reviewer/claim fixture using RDF-shaped terms; no RDF parser |
| `grammar.eye` | EyeProlog DCG examples | Parsing and generating a small command grammar using explicit difference lists |

The acceptance assertions are in `test/examples.test.js`. Tests also ensure
that every `.eye` example has a corresponding check. The ports above are not
byte-for-byte output comparisons against the old examples.

## How to expand coverage

For each original program, record its source path and revision, required inputs,
public questions, expected answer representation, semantic features, and one of:

- **Direct port:** equivalent rules/algorithm in new syntax.
- **Problem reformulation:** same specified problem or selected answers through
  a different algorithm, with that difference stated.
- **Extension needed:** a named missing general capability.
- **Compatibility-only behavior:** a test specifically about the old language,
  not an application-level reasoning requirement.

Then run both versions with controlled inputs and compare canonical answers.
Compare RDF blank-node structures up to renaming, exact integers exactly, and
floating-point values using a declared policy appropriate to each example.
Keep expected-error programs and nontermination cases distinct from successes.
For generated rules or existential witnesses, also test intermediate structure
and scoping; a final Boolean answer alone is insufficient evidence.

## Feature backlog

**Constraints.** Queens, Sudoku, resource allocation, CLP(Z), CLP(B), and delayed
disequality need a general constraint interface and solver. Finite enumeration
provides a first correctness baseline but is not performance-equivalent.

**RDF boundary.** Preserve full IRIs, datatypes, language/direction metadata,
blank-node identity and scope, named graphs, and nested triple terms. Ordinary
constructor values provide a place to represent these; they do not implement
RDF equality, entailment, or parsing by themselves.

**Quoted knowledge and generated rules.** N3 formula variables, scoped absence,
rule activation, and existential witnesses require a dedicated semantics.
They cannot be translated faithfully by flattening everything into global facts.

**State and effects.** Dynamic Prolog predicates and ordered I/O require explicit
state transitions or host operations. Preserve the application outcome where
appropriate, and document the changed operational contract.

**Compatibility behavior.** ISO operator declarations, stream APIs, exception
shapes, reflection, and conformance edge cases are not core Eyelit requirements.
DCG applications can initially use explicit input/remainder relations.

**Scale.** Add original F(10000), deep-taxonomy, larger search, and collection
cases after recording baseline time/memory and required answer shape. Do not
infer 100,000-level behavior from the small seed tests.
