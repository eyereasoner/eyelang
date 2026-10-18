<img src="https://josd.github.io/images/eye.png" alt="" width="96" height="96" align="left">

# eyelang

[![npm version](https://img.shields.io/npm/v/eyelang.svg)](https://www.npmjs.com/package/eyelang)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23416492.svg)](https://doi.org/10.5281/zenodo.23416492)

<br clear="left">

<!-- navigation:start -->
[eyelang](https://eyereasoner.github.io/eyelang/) ·
[Repository](https://github.com/eyereasoner/eyelang) ·
[Playground](https://eyereasoner.github.io/eyelang/playground/) ·
[Tutorial](https://eyereasoner.github.io/eyelang/TUTORIAL/) ·
[Specification](https://eyereasoner.github.io/eyelang/SPEC/)
<!-- navigation:end -->

A symbolic logic programming language implementing a subset of Prolog, with
`.pl` programs, query explanations, executable checks, and independently
checked proof certificates.

Start with the [hands-on tutorial](https://eyereasoner.github.io/eyelang/TUTORIAL/).

## Hello, Socrates

```prolog
human(socrates).
mortal(Person) :- human(Person).

% Answer
?- mortal(Who).
% Reason
?- why.
% Check
:- assertion(mortal(socrates)).
```

Run with Node.js 18 or later; no packages to install:

```sh
node eyelang.js examples/socrates.pl
```

The answer is `Who = socrates.`. `why` explains the supporting facts and rules;
the assertion checks the result. This is
[ARC: Answer, Reason, Check](https://josd.github.io/arc/).

The **Reason** section is a proof certificate. **Check** includes its
independent verification report alongside the assertions. Negation and
collection completeness remain explicit obligations. See the
[proof specification](https://eyereasoner.github.io/eyelang/SPEC/#81-proof-certificates).

## Playground

Open [the playground](https://eyereasoner.github.io/eyelang/playground/),
choose an example, and press **Run program**. Edit, share, or save your program
and its complete answers, proof certificate, and checks.

## The subset of Prolog

See the [specification](https://eyereasoner.github.io/eyelang/SPEC/) for syntax,
semantics, and limits.
