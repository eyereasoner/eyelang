# EyeProlog

[![npm version](https://img.shields.io/npm/v/eyeprolog.svg)](https://www.npmjs.com/package/eyeprolog)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.21446308-blue.svg)](https://doi.org/10.5281/zenodo.21446308)

EyeProlog turns portable ISO Prolog programs into answers and inspectable proofs.

<p>
  <a href="https://eyereasoner.github.io/eyeprolog/the-art-of-eyeprolog">
    <img src="book-assets/title-page.svg" alt="Read The Art of EyeProlog" title="Click to read The Art of EyeProlog" width="320">
  </a><br>
  <strong>Click the cover to read <em>The Art of EyeProlog</em>.</strong>
</p>

**[Why EyeProlog?](https://eyereasoner.github.io/eyeprolog/why-eyeprolog)** — Discover its purpose and design.

**[Playground](https://eyereasoner.github.io/eyeprolog/playground)** — Run EyeProlog in your browser.

The book is the reference for the language, command line, JavaScript API,
examples, proofs, conformance, and implementation.

## Quick start

EyeProlog requires Node.js 18 or newer. Check the active runtime before
installing:

```sh
node --version
```

If it reports an older release, upgrade through a Node version manager or the
[official Node.js download](https://nodejs.org/en/download) and check again.
Distribution packages can provide an older Node.js even on a current operating
system.

Run EyeProlog without a global installation:

```sh
npx --yes eyeprolog
?- use_module(library(lists)).
   true.
?- member(X, [prolog, logic]).
   X = prolog
;  X = logic.
?- halt.
```

For a persistent `eyeprolog` command without administrator access, install it
under a user-owned prefix and put that prefix's `bin` directory on `PATH`:

```sh
npm install --global --prefix "$HOME/.local" eyeprolog
export PATH="$HOME/.local/bin:$PATH"
eyeprolog
```

Add the `PATH` export to your shell startup file to keep it across sessions.
Do not use `sudo npm install`; npm's
[EACCES guidance](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally/)
also recommends a Node version manager or a user-owned npm prefix.

For a non-interactive run:

```sh
printf 'human(socrates).\nmortal(X) :- human(X).\n' |
  npx --yes eyeprolog --proof --goal 'mortal(socrates)' -
```

Programs may declare their default queries with `%% goal:` comments.
Double-quoted text follows the ISO `double_quotes` flag and defaults to a
proper list of one-character atoms (`chars`), matching Trealla and Scryer.

Portable unit tests can be embedded as quads—a query followed by its expected
top-level answer—and run with `eyeprolog --quads program.pl`:

```prolog
member_test ?- member(X, [prolog, logic]).
   X = prolog
;  X = logic.
```

## ISO modules and definite clause grammars

EyeProlog implements ISO/IEC 13211-2 modules and the grammar rules and
`phrase/2-3` predicates of ISO/IEC TS 13211-3:2025. For example:

```prolog
sentence --> [hello], noun.
noun --> [world] | [prolog].

%% goal: phrase(sentence, Words)
```

EyeProlog also adds 99 public library predicate indicators to its 129-entry ISO
profile. **60 are implemented entirely as ordinary Prolog clauses** in focused
modules under `src/lib/`; the control predicates and finite-domain
`library(clpz)` kernel use backtrackable host support.
They are ISO/IEC 13211-2 modules loaded explicitly by purpose, such as
`library(lists)`, `library(strings)`, `library(aggregate)`, or `library(clpz)`.
Portable text
predicates use ISO atoms or character lists. The old catch-all
`library(eyeprolog)` module is no longer needed.

## Development

```sh
git clone https://github.com/eyereasoner/eyeprolog.git
cd eyeprolog
npm install
npm test
```

EyeProlog is released under the [MIT License](LICENSE.md).
