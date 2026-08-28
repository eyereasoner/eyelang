---
marp: true
title: Introduction to EyeProlog
description: A short presentation introducing EyeProlog as a portable, inspectable ISO Prolog engine for answers, proofs, and RDF-backed reasoning.
---

# Introduction to EyeProlog

Portable Prolog reasoning for answers, proofs, and knowledge graphs

---

## What is EyeProlog?

EyeProlog is a small ISO Prolog implementation for JavaScript.

It turns explicit facts and rules into:

- answers;
- variable bindings;
- checked example output;
- optional proof traces;
- embeddable reasoning in Node.js and browsers.

---

## Why Prolog?

Prolog is a language for relations.

Instead of spelling out every control step, you describe what must hold:

```prolog
human(socrates).
mortal(X) :- human(X).
```

Then you ask questions:

```prolog
?- mortal(socrates).
   true.
```

---

## The core idea

```text
facts + rules + query
        |
        v
  search by unification
        |
        v
answers with reasons
```

The same rule can answer a yes/no question, enumerate solutions, or participate in a larger proof.

---

## Quick start

Run EyeProlog without a global install:

```sh
npx --yes eyeprolog
```

Try a list query:

```prolog
?- use_module(library(lists)).
   true.
?- member(X, [prolog, logic]).
   X = prolog
;  X = logic.
```

---

## Programs are ordinary text

A file can contain facts, rules, and goals:

```prolog
human(socrates).
mortal(X) :- human(X).

?- mortal(X).
```

Run it:

```sh
eyeprolog examples/socrates.pl
```

---

## Proofs are first-class

EyeProlog can show not only *what* was concluded, but *why*.

```sh
eyeprolog --proof examples/socrates.pl
```

Proof output is useful for:

- debugging rules;
- explaining decisions;
- regression tests;
- audit trails.

---

## ISO first, extensions visible

EyeProlog starts from ISO/IEC 13211-1 Prolog.

That matters because facts, rules, terms, control, errors, streams, arithmetic, and meta-calls have an external reference point.

Normal mode adds practical libraries and embedding features. Strict ISO mode keeps the standardized core separate and testable.

---

## Why JavaScript?

EyeProlog runs where modern applications already run:

- command-line tools;
- npm packages;
- browser playgrounds;
- web workers;
- JavaScript APIs.

The aim is not to replace every Prolog system. It is to make portable Prolog reasoning easy to embed and inspect.

---

## RDF and knowledge graphs

EyeProlog pairs naturally with RDF through `rdf-prolog-roundtrip`:

```text
RDF dataset
  -> rdf(S, P, O, Graph) facts
  -> EyeProlog rules
  -> result_rdf/4 facts
  -> RDF dataset
```

RDF remains the interchange layer. Prolog remains the transparent reasoning layer.

---

## What this enables

The example suite uses the same pattern for:

- policy decisions;
- incident response;
- software supply-chain risk;
- scientific evidence assessment;
- EV-depot configuration;
- symbiotic human/AI/knowledge-graph workflows.

Each scenario keeps data, rules, answers, and materialized results as separate inspectable artifacts.

---

## Testing and conformance

EyeProlog’s release gate includes:

- file-based conformance cases;
- strict ISO tests;
- WG17 syntax cases;
- regression tests;
- runnable examples;
- proof examples;
- documentation synchronization checks.

The point is simple: behavior should be reproducible, not anecdotal.

---

## When EyeProlog fits

EyeProlog is a good fit when a project needs:

- explicit rules;
- inspectable conclusions;
- portable Prolog syntax;
- embeddable JavaScript runtime;
- checked examples and proofs;
- a clean boundary between data, rules, and results.

---

## Where to go next

- Read [`README.md`](../../README.md) for setup and links.
- Read [`why-eyeprolog.md`](../../why-eyeprolog.md) for the design motivation.
- Open [`playground.html`](../../playground.html) to run examples in a browser.
- Explore [`examples/`](../) for runnable programs.
- Read [`the-art-of-eyeprolog.md`](../../the-art-of-eyeprolog.md) for the full reference.
