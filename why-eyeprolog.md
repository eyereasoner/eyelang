# Why EyeProlog?

EyeProlog is a small, inspectable ISO Prolog implementation for JavaScript.
It turns facts and rules into answers and can show the derivation behind each
answer.

Its design rule is simple:

> **Keep the ISO language core complete, keep extensions small and explicit,
> and implement portable conveniences as ordinary Prolog whenever possible.**

## Why ISO Prolog?

[ISO/IEC 13211-1](https://www.iso.org/standard/21413.html) defines a mature
logic-programming core: terms, variables, unification, clauses, recursion,
arithmetic, control, streams, errors, and processor behavior. Reusing that
language gives programs recognizable semantics without inventing another rule
syntax.

EyeProlog implements the Part 1 core together with Technical Corrigenda 1, 2,
and 3. Its executable conformance matrix and tests document the supported
behavior. This is extensive implementation evidence, not certification by an
independent standards body.

## Why a small implementation?

A compact engine is easier to read, embed, test, and audit. EyeProlog therefore
keeps a narrow architecture:

- one parser and term model;
- one solver with automatic tabling for eligible positive recursion;
- the ISO built-in registry;
- a lean portable Prolog library;
- optional proof explanations; and
- the same implementation in Node.js and the browser.

The library does not wrap facilities already available in the ISO core. Common
relations such as list processing remain ordinary Prolog clauses, while
standard sorting, arithmetic, meta-calls, streams, and database operations use
their ISO definitions directly.

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
a complete standard core, a small portable library, and an ordinary JavaScript
API. Its value is not feature count; it is that the language boundary stays
visible enough to understand.

## References

- [ISO/IEC 13211-1:1995 — Prolog, Part 1: General core](https://www.iso.org/standard/21413.html)
- [The Art of EyeProlog](the-art-of-eyeprolog.md)
- [EyeProlog README](README.md)
