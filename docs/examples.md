# Example design and acceptance

Eyelang is developed through executable examples. Each example states its input
facts, inference rules, and public `ask` questions in one self-contained `.eye`
program. The suite is an acceptance surface for the language, not compatibility
documentation for another implementation.

## Acceptance policy

Every normally completing example must satisfy four layers:

1. Its embedded questions execute to completion within the standard limits.
2. Its answers and explanations serialize as parseable Eyelang programs.
3. Its saved answer and proof documents match freshly generated documents.
4. Computational examples pass an independent semantic check or a proof-chain
   audit demonstrating that the result was derived from inputs.

Expected-error examples are listed separately in `examples/suite.json` and must
fail for the stated reason. An error fixture is never counted as a false query.

## Inputs versus answers

Facts describe problem instances: graph edges, task durations, family links,
puzzle givens, observations, policies, or type environments. They may not encode
a computational result merely to make a question succeed. Result relations such
as `solution`, `best`, `schedule`, `score`, `classified_as`, and `must_have` are
derived by rules or trusted general-purpose built-ins.

Some examples intentionally query stored knowledge—for example reification or
annotation facts. That is data retrieval, not a search problem. The distinction
is documented by the question and tested separately from algorithmic examples.

## Independent checks

- Search traces are replayed against their transition rules.
- Schedules are checked against every dependency and duration.
- Shortest paths and modular powers are compared with independent calculations.
- Sudoku results are checked against givens and every row, column, and box; the
  general solver is exercised on more than one puzzle.
- Taxonomies check spine edges, both side branches, transitive classifications,
  direction, incomparability, and out-of-domain non-entailments.
- Cardinality and metadata examples are perturbed around their decision boundary.
- Designated computed answers are traced to non-fact derivations in the proof
  graph, preventing a stored answer from masquerading as computation.

## Representation boundaries

Graph-shaped examples use explicit constructors and relations. They demonstrate
logical joins and scoping but do not imply a concrete RDF parser. Quoted values
are data constructors, not executable rule scopes. Blank-node-looking terms are
local fixture identities.

The deep-taxonomy and relational-cube scale examples use parameterized relations
instead of enormous expanded source files. Their tests check the represented
mathematical relation, including negative cases, rather than only a final Boolean.

## Extending the suite

For a new example, record the inputs, questions, expected answer shape, relevant
language features, termination assumptions, and an independent oracle or
invariant. Prefer perturbation tests over a single golden answer. If a required
capability is missing, add a general language feature or built-in with isolated
tests; do not insert the expected application answer as a special case.

Keep nontermination, resource exhaustion, malformed input, and logical failure
distinct. Floating-point checks require an explicit tolerance; exact integers
and discrete structures are compared exactly.
