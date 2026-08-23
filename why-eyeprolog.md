# Why EyeProlog?

EyeProlog is a small, inspectable ISO Prolog implementation for JavaScript.
It turns facts and rules into answers and can show the derivation behind each
answer.

Its design rule is simple:

> **Keep the ISO language core explicit and auditable, keep extensions small and
> explicit, and implement portable conveniences as ordinary Prolog whenever possible.**

## Why ISO Prolog?

[ISO/IEC 13211-1](https://www.iso.org/standard/21413.html) defines a mature
logic-programming core: terms, variables, unification, clauses, recursion,
arithmetic, control, streams, errors, and processor behavior. Reusing that
language gives programs recognizable semantics without inventing another rule
syntax.

EyeProlog targets the Part 1 core together with Technical Corrigenda 1, 2,
and 3, and provides documented module and definite-clause-grammar compatibility
profiles for normal-mode programs. The post-N289 WG17/STC working draft is
tracked as audit input rather than silently treated as another published
Corrigendum; the conformance ledger records where draft wording differs from
the published strict baseline. The processor character model is explicitly
implementation defined: EyeProlog uses Unicode scalar values as the PCS and as
collating-sequence integers in both normal and strict profiles. Strict mode
therefore rejects implementation-specific language extensions without changing
that processor choice. Its executable conformance matrix records explicit
dispositions for the Part 1 processor, syntax, semantic, built-in, and arithmetic
requirements, including the complete vendored WG17 syntax cases and cross-profile
preservation of strict-success syntax outcomes. Implementation-defined choices
such as mixed-type `max/2`/`min/2` and signed bitwise/shift operations are pinned
by regression tests. This is extensive implementation evidence, not an independent
ISO certification; the Part 2 and Part 3 compatibility profiles also remain
separate from the Part 1 strict-core claim.

## Why a small implementation?

A compact engine is easier to read, embed, test, and audit. EyeProlog therefore
keeps a narrow architecture:

- one parser and term model;
- one solver with automatic tabling for eligible positive recursion;
- explicit `tnot/1` with well-founded semantics for finite, range-restricted,
  function-free Datalog components;
- the ISO built-in registry;
- lean portable library modules using the documented module compatibility profile;
- ISO Part 3-oriented definite clause grammars and `phrase/2-3`;
- lifecycle-aware `call_cleanup/2` and `setup_call_cleanup/3` in normal mode;
- optional proof explanations; and
- the same implementation in Node.js and the browser.

The modules do not wrap facilities already available in the ISO core. Common
relations such as list processing remain ordinary Prolog clauses imported with
`use_module/1-2`, while
standard sorting, arithmetic, meta-calls, streams, and database operations use
their ISO definitions directly.

The implementation follows the same compactness rule. JavaScript runtime
modules stay flat under `src/`: `program.js` and `iso.js` remain stable facade
modules, while static program analysis, clause indexing, arithmetic evaluation,
processor error types, and cleanup lifecycle handling are factored into focused
sibling files. `cleanup.js` closes protected builtin iterators when search is
committed, abandoned, or unwound without making `solver.js` depend on the
language registry. The execution fast paths remain direct code in `solver.js`;
source cleanup is not allowed to add dispatch or abstraction overhead merely to
make that file smaller. `src/ARCHITECTURE.md` records these boundaries and an
automated test rejects JavaScript import cycles.


## Why keep well-founded negation explicit?

Ordinary Prolog `\+/1` is negation-as-failure and remains useful when a closed,
usually stratified relation has already been computed. Non-stratified rule
systems need a different semantic choice. EyeProlog therefore does not silently
change `\+/1`; normal mode provides `tnot/1` for finite Datalog components that
need the three-valued well-founded semantics. This keeps the extension visible
in source code and lets strict ISO mode remove it cleanly.

The same boundary guides performance work. EyeProlog may evaluate large finite
positive Datalog closures with a shared relation-wide table, but the admission
heuristics are implementation details. Programs should rely on the documented
semantics and finiteness conditions, not on a particular internal threshold.

DCGs follow the same rule. Their supported semantics follow the ISO Part 3
difference-list model, while finite sequence scans and proven zero-width hand-offs may use
lighter internal control paths so deep grammars do not pay one general solver
frame per token.  Relational remainder-producing modes are preserved.  The
checked `examples/dcg-expression-language.pl` program shows the declarative side
of that design: one grammar builds precedence-aware syntax trees and another
generates minimally parenthesized token sequences back from them.

## Why cleanup follows search lifecycle?

A Prolog resource lifetime is tied to search, not just to ordinary function
return. A protected goal can finish, fail, be cut, be abandoned at the top
level while alternatives remain, or unwind through an exception. Normal-mode
`call_cleanup/2` and `setup_call_cleanup/3` make those exits explicit and run
Cleanup exactly once. This also preserves demand-driven answer interaction: the
top level need not execute a successor merely to decide whether a choicepoint
exists. Strict ISO mode leaves these predicates out.

## Why proofs?

An answer says that a goal succeeded. A proof records one successful route
through the supplied clauses and built-ins. That makes rule behavior easier to
inspect, test, and explain.

A proof does not authenticate source data or replace host security. Embedders
remain responsible for validating inputs and imposing suitable time, memory,
depth, and solution limits.

## Why JavaScript?

JavaScript makes the same engine usable from a command line, a server, an
application, or a browser worker. Embedders can use the convenience `run`
function or work directly with `Program`, `Solver`, terms, environments, and a
custom built-in registry.

## What EyeProlog should become

EyeProlog should improve by becoming more correct and more economical, not by
accumulating unrelated subsystems. New capabilities should normally be one of:

1. required ISO behavior;
2. a small portable Prolog relation; or
3. a narrowly documented embedding hook.

It should resist duplicate aliases, hidden execution phases, advisory syntax,
and integrations that can live outside the reasoning engine.

## The durable idea

EyeProlog demonstrates that a useful proof-producing reasoner can be built from
a carefully audited standard-oriented core, small portable modules, and an ordinary JavaScript
API. Its value is not feature count; it is that the language boundary stays
visible enough to understand.

## References

- [ISO/IEC 13211-1:1995 — Prolog, Part 1: General core](https://www.iso.org/standard/21413.html)
- [ISO/IEC 13211-2:2000 — Prolog, Part 2: Modules](https://www.iso.org/standard/20775.html)
- [ISO/IEC TS 13211-3:2025 — Prolog, Part 3: Definite clause grammar rules](https://www.iso.org/standard/83635.html)
- [The Art of EyeProlog](the-art-of-eyeprolog.md)
- [EyeProlog README](README.md)
