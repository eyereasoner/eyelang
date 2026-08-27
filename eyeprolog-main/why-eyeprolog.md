# Why EyeProlog?

Many systems can apply rules to data. The harder questions are whether people
can understand those rules, whether another implementation can run them, and
whether a conclusion can be traced back to the facts and rules that produced
it.

EyeProlog is a small, inspectable ISO Prolog implementation for JavaScript. It
turns facts and rules into answers, and it can show a proof for each answer. Its
aim is not to invent a new reasoning language, but to make a mature standard
practical in command-line tools, applications, and browsers.

Its design rule is simple:

> **Keep the ISO language core explicit and auditable, keep extensions small
> and visible, and implement portable conveniences as ordinary Prolog whenever
> possible.**

## A shared language for facts and rules

Prolog describes knowledge through relations. A program can state facts such
as “Socrates is human,” define a rule saying that every human is mortal, and
then ask whether Socrates is mortal. Variables, unification, and search let the
same rule answer more general questions without turning it into a sequence of
manual data-processing steps.

This relational style is useful well beyond textbook examples. It can express
graph reachability, policy decisions, validation rules, parsers, schedules,
constraints, and explanations. Because the program says what relationships
must hold, its logical structure remains visible to readers and tools.

## Close to the explicit surface of human reasoning

Prolog's attraction is not only standardization. Among widely used computational formalisms, it is arguably unusually close to the *explicit, communicable* surface of human cognition: facts resemble assertions, rules resemble reusable generalizations, queries resemble questions, variable bindings fill in answers, backtracking considers alternatives, and proofs give reasons.

That is not a claim that the brain literally executes Prolog. Human cognition includes perception, emotion, embodiment, analogy, learning, uncertainty, and many processes that Horn-clause reasoning does not model. The narrower engineering point is powerful enough: when people externalize what they know and why they think something follows, Prolog preserves those objects of thought directly instead of hiding them behind imperative state changes or opaque vectors. That makes it a strong reasoning layer for systems in which humans and machines must inspect and revise shared knowledge together.

## Why the ISO standard matters

[ISO/IEC 13211-1](https://www.iso.org/standard/21413.html) defines Prolog's
general core: terms, variables, unification, clauses, recursion, arithmetic,
control, streams, errors, and processor behavior. That published foundation
gives programmers a common vocabulary and gives implementations an external
reference against which behavior can be tested.

Standards do not make every implementation identical, but they sharply reduce
the number of hidden choices. A portable Prolog rule is not tied to one product,
one JavaScript API, or one project-specific syntax. It can be studied in books,
compared across conforming systems, and preserved independently of the engine
that happens to run it today. This is especially important for knowledge and
policy rules, which often need to remain understandable longer than the
application that first used them.

EyeProlog therefore starts with ISO Prolog and labels its additions. Normal
mode provides practical libraries, modules, definite clause grammars, tabling,
and embedding facilities. Strict mode removes EyeProlog-specific language
extensions so the standardized core can be tested on its own. The distinction
keeps convenience from quietly redefining the language.

## From standardized RDF to standardized rules

The standards argument becomes especially concrete for RDF systems. RDF gives
applications a standardized graph data model, but choosing a rule language for
those graphs is a separate decision.

[Eyeling](https://github.com/eyereasoner/eyeling) takes a compact, web-native
approach: it reasons directly over Notation3, RDF-JS datasets, and streaming RDF
messages. N3 is expressive and practically valuable, but it is not an ISO
standard or a W3C Recommendation. Prolog, by contrast, is defined by the
ISO/IEC 13211 family of international standards, while RDF belongs to the W3C
standards ecosystem.

EyeProlog and
[`rdf-prolog-roundtrip`](https://github.com/eyereasoner/rdf-prolog-roundtrip)
connect those two standardized worlds through a deliberately simple pipeline:

```text
RDF dataset
    -> ordinary rdf(Subject, Predicate, Object, Graph) facts
    -> portable ISO Prolog rules executed by EyeProlog
    -> ground rdf/4 result facts
    -> RDF dataset
```

The round-trip package performs the RDF conversion and contains no solver;
EyeProlog performs the reasoning. This separation makes every boundary
inspectable. The source graph remains recognizable, the rules are ordinary
Prolog programs, intermediate results can be saved and tested, and the final
facts can return to RDF without making the reasoning engine responsible for
every RDF syntax.

The [Symbiotic Knowledge Graphs example](examples/deck/symbiotic-knowledge-graphs.md) makes that boundary operational. Its RDF input keeps official sources, sensor data, AI proposals, and human review in separate named graphs. RDF 1.2 triple terms represent machine proposals without asserting them as truth. EyeProlog decides what can be accepted automatically, what requires human judgment, and what operational action follows. Only ground `result_rdf/4` conclusions are published back through `prolog-to-rdf`.

This is a concrete model of human/AI/KG symbiosis: the graph constrains the agent, the agent proposes additions to the graph, people resolve governed uncertainty, and the accepted result improves the next decision while staying interoperable RDF.

This combination is compelling when interoperability, reproducibility,
long-term maintenance, or independent verification matter. It also opens RDF
data to relational programming, constraints, recursion, collections, and
portable Prolog libraries. Eyeling remains the natural choice when an
application deliberately wants its rules, data, and streaming interfaces to
stay directly in the evolving N3 and RDF ecosystem. The two approaches serve
different boundaries rather than pretending that one boundary fits every
system.

## Small enough to inspect, useful enough to embed

A language standard is most valuable when the implementation can be examined
and tested against it. EyeProlog keeps a narrow architecture: one parser and
term model, one solver, an explicit built-in registry, portable Prolog library
modules, and optional proof generation. The same implementation runs in Node.js
and browser workers.

Common relations such as list processing remain Prolog clauses imported with
`use_module/1-2`. Sorting, arithmetic, meta-calls, streams, and database
operations use their ISO definitions directly. JavaScript is reserved for the
engine, host integration, and operations that genuinely belong at the runtime
boundary.

Internally, focused JavaScript modules handle parsing, static analysis, clause
indexing, arithmetic, errors, and cleanup lifecycles. Performance-critical
execution paths remain direct rather than being hidden behind layers added only
for architectural appearance. [`src/ARCHITECTURE.md`](src/ARCHITECTURE.md)
records these boundaries, and an automated test rejects import cycles.

## Visible choices instead of hidden semantics

Some useful reasoning behavior lies outside the ISO Part 1 core. EyeProlog
keeps those choices explicit in the program or execution profile.

Ordinary Prolog `\+/1` is negation-as-failure. It is useful when a closed,
usually stratified relation has already been computed, but non-stratified rule
systems need a different semantic choice. Normal mode therefore provides
`tnot/1` for finite, range-restricted, function-free Datalog components that
need three-valued well-founded semantics. EyeProlog does not silently change
the meaning of `\+/1`, and strict ISO mode does not expose `tnot/1`.

The engine can use automatic tabling and shared finite-Datalog evaluation to
make recursive programs practical. Those strategies are optimizations, not a
new source language: programs should depend on documented semantics and
finiteness conditions rather than internal thresholds.

Definite clause grammars follow the ISO Part 3 difference-list model. Internal
fast paths make deep finite sequence processing economical while preserving
relational modes. The checked
[`dcg-expression-language.pl`](examples/dcg-expression-language.pl) example
shows both directions: a grammar builds syntax trees from tokens, and another
generates minimally parenthesized tokens from syntax trees.

Resource cleanup follows Prolog search rather than ordinary JavaScript return.
A protected goal may succeed, fail, be cut, be abandoned while alternatives
remain, or unwind through an exception. Normal-mode `call_cleanup/2` and
`setup_call_cleanup/3` run cleanup exactly once across those exits. Keeping this
behavior tied to the actual search lifecycle also preserves demand-driven
interaction at the top level.

## Answers that can explain themselves

An answer says that a goal succeeded. A proof records one successful route
through the supplied clauses and built-ins. That difference matters when rules
make decisions, combine data from several sources, or need to be reviewed by
someone who did not write them.

Proofs make successful reasoning easier to inspect, test, teach, and discuss.
They do not authenticate source data or replace application security. Embedders
remain responsible for validating inputs and imposing suitable time, memory,
depth, and solution limits.

## One engine across JavaScript environments

JavaScript makes EyeProlog available from a command line, server, test suite,
application, or browser worker. A newcomer can run a `.pl` file or experiment
in the playground. An application developer can call the convenience `run`
function. An advanced embedder can work directly with `Program`, `Solver`,
terms, environments, and a custom built-in registry.

This range does not require separate language variants. The same Prolog text
and the same reasoning engine cross those environments, which makes examples,
tests, and production behavior easier to compare.

## What the conformance claim means

EyeProlog targets the ISO Part 1 core together with Technical Corrigenda 1, 2,
and 3. It provides separately documented compatibility profiles for Part 2
modules and Part 3 definite clause grammars in normal mode. The post-N289
WG17/STC working draft is audit input, not a published Corrigendum silently
added to the strict baseline.

The executable conformance matrix records explicit dispositions for the
Part 1 processor, syntax, semantic, built-in, and arithmetic requirements. It
includes the complete vendored WG17 syntax cases and verifies that successful
strict syntax remains successful across profiles. Implementation-defined
choices, including mixed-type `max/2` and `min/2` and signed bitwise and shift
operations, are pinned by regression tests.

The character model is also explicit: EyeProlog uses Unicode scalar values as
its processor character set and as collating-sequence integers in normal and
strict modes. Strict mode removes implementation-specific language extensions
without changing that processor choice.

This is extensive, executable implementation evidence, not independent ISO
certification. The Part 2 and Part 3 compatibility profiles likewise remain
separate from the Part 1 strict-core claim. Stating those limits is part of the
standards commitment: users should be able to tell which behavior comes from a
published standard, which comes from a compatibility profile, and which is an
EyeProlog extension.

## Who is EyeProlog for?

EyeProlog is intended for several audiences that benefit from the same visible
language boundary:

- learners who want a runnable logic language whose implementation and proofs
  can be inspected;
- application developers who need rules in Node.js or the browser without
  inventing an application-specific rule format;
- RDF practitioners who want standardized graph data to participate in
  portable ISO Prolog reasoning;
- researchers and implementers who want executable conformance evidence and a
  compact engine suitable for comparison; and
- teams maintaining policies or knowledge rules that must remain reviewable,
  reproducible, and portable over time.

The project is deliberately not a database, a distributed query service, or a
replacement for host security. Those concerns belong in surrounding systems
with storage, access control, and operational limits appropriate to the
application.

## A focused direction

EyeProlog should improve by becoming more correct, portable, and economical,
not by accumulating unrelated subsystems. New capabilities should normally be
required ISO behavior, a small portable Prolog relation, or a narrowly
documented embedding hook.

It should resist duplicate aliases, hidden execution phases, advisory syntax,
and integrations that can live outside the reasoning engine. The durable idea
is that useful, proof-producing reasoning does not require an opaque language
or an enormous runtime. A carefully audited standard core, portable modules,
and an ordinary JavaScript API can remain both practical and understandable.

## References

- [ISO/IEC 13211-1:1995 — Prolog, Part 1: General core](https://www.iso.org/standard/21413.html)
- [ISO/IEC 13211-2:2000 — Prolog, Part 2: Modules](https://www.iso.org/standard/20775.html)
- [ISO/IEC TS 13211-3:2025 — Prolog, Part 3: Definite clause grammar rules](https://www.iso.org/standard/83635.html)
- [RDF 1.2 Concepts and Abstract Syntax](https://www.w3.org/TR/rdf12-concepts/)
- [The Art of EyeProlog](the-art-of-eyeprolog.md)
- [EyeProlog README](README.md)
