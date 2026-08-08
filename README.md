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

EyeProlog requires Node.js 18 or newer.

```sh
npm install --global eyeprolog
printf 'human(socrates).\nmortal(X) :- human(X).\n' |
  eyeprolog --proof --goal 'mortal(socrates)' -
```

Programs may declare their default queries with `%% goal:` comments.
Double-quoted text follows the ISO `double_quotes` flag and defaults to a
proper list of one-character atoms (`chars`), matching Trealla and Scryer.

## Portable library

EyeProlog adds 44 public library predicates to its 127-entry ISO core registry.
**All 44 are ordinary Prolog clauses** across `src/eyeprolog-library.pl` and
`src/eyeprolog-common-library.pl`; both are autoloaded in Node and the
browser. None requires host support. Other Prolog systems should load only
`eyeprolog-library.pl`, which avoids redefining their common list predicates.
Portable text predicates use ISO atoms or character lists.

## Development

```sh
git clone https://github.com/eyereasoner/eyeprolog.git
cd eyeprolog
npm install
npm test
```

EyeProlog is released under the [MIT License](LICENSE.md).
