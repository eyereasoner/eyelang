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

A label is simply the first argument of the ordinary `(?-)/2` term, so it may
use any normal Prolog term syntax; EyeProlog only requires it to be ground when
the quad is checked. A non-ground label is a quad failure, not a source syntax
error, and later quads still run. When a query has multiple indented answer
descriptions, each description is checked and counted independently, so one
failed expectation does not prevent the later ones from running.

## Strict ISO/IEC 13211-1 core

For portability and conformance work, run the Part 1 core with Technical
Corrigenda 1–3 in strict mode:

```sh
eyeprolog --iso-strict
eyeprolog --iso-strict --goal 'p(X)' program.pl
```

The equivalent JavaScript option is `isoStrict: true`. Strict mode rejects
EyeProlog language extensions, Part 2 module directives, and Part 3 grammar-rule
expansion/`phrase/2-3`; it also removes the EyeProlog `occurs_check` flag and
disables automatic tabling. Normal mode is unchanged and continues to support
modules, DCGs, quads, libraries, proofs, and the other documented extensions.

The auditable processor-requirement checklist lives in
[`test/conformance/ISO-COMPLIANCE.md`](test/conformance/ISO-COMPLIANCE.md).
The separate [WG17 syntax ledger](test/conformance/WG17-SYNTAX-STATUS.md)
records executable dispositions for the vendored active upstream WG17 syntax
cases and runs as part of `npm test`. Reviewed cases can pin exact outcomes;
newly upgraded cases run directly against the upstream Codex expectation.
EyeProlog does not yet claim independent certification or closure of every
normative Part 1 requirement.

## ISO modules and definite clause grammars

EyeProlog implements ISO/IEC 13211-2 modules and the grammar rules and
`phrase/2-3` predicates of ISO/IEC TS 13211-3:2025. For example:

```prolog
sentence --> [hello], noun.
noun --> [world] | [prolog].

%% goal: phrase(sentence, Words)
```

EyeProlog also adds 102 public library predicate indicators to its 129-entry ISO
profile. **63 are implemented entirely as ordinary Prolog clauses** in focused
modules under `src/lib/`; the control predicates and finite-domain
`library(clpz)` kernel use backtrackable host support.
They are ISO/IEC 13211-2 modules loaded explicitly by purpose, such as
`library(lists)`, `library(strings)`, `library(aggregate)`, or `library(clpz)`.
Portable text
predicates use ISO atoms or character lists. The old catch-all
`library(eyeprolog)` module is no longer needed.

## Trealla and Scryer interoperability

EyeProlog keeps a conservative source-level interoperability profile separate
from the larger EyeProlog library surface. `library(lists)` follows the common
Trealla/Scryer organization for predicates such as `member/2`, `memberchk/2`,
`append/2-3`, `nth0/3-4`, `nth1/3-4`, `length/2`, `maplist/2-8`, and
`foldl/4-6`. Its `length/2` remains relational: with both arguments variable,
`length(Xs, N)` enumerates lists of increasing length together with `N = 0, 1,
2, ...`.

`library(iso_ext)` is also accepted as a common interop module name.
EyeProlog exports `call_nth/2` there, so Scryer-style source can explicitly use
`:- use_module(library(iso_ext)).`; unqualified source may still autoload it.
The aligned `library(lists)` and `library(iso_ext)` exports are kept disjoint so
they can be imported together without an accidental import conflict. EyeProlog's
legacy `library(prologue)` remains a compatibility umbrella and should be
selectively imported when mixed with the aligned modules.

Outside `--iso-strict`, an otherwise undefined unqualified call may autoload a
predicate only when the interop profile has one canonical EyeProlog provider.
For example, `member/2` autoloads from `library(lists)`, `call_nth/2` from
`library(iso_ext)`, and `between/3` from EyeProlog's internal
`library(prologue)` implementation. Use `--no-autoload` to disable this
convenience. Strict ISO mode never autoloads library predicates.

Use `-w` / `--warnings` to diagnose dependencies outside the interop profile,
or `--portable` to make such diagnostics fail the run. This catches both
implementation-specific library names and EyeProlog-only predicates such as
`set_nth0/4` even when they live in an otherwise common module.

Cross-engine smoke tests live in `test/run-interop.mjs`. With Trealla (`tpl`)
and Scryer (`scryer-prolog`) installed, run:

```sh
npm run test:interop
```

The GitHub interoperability workflow builds both implementations and runs the
same portable Sudoku source under EyeProlog, Trealla, and Scryer.

## Development

```sh
git clone https://github.com/eyereasoner/eyeprolog.git
cd eyeprolog
npm install
npm test
```

EyeProlog is released under the [MIT License](LICENSE.md).
