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
failed expectation does not prevent the later ones from running. Following the
Trealla quad convention, `sto` declares that the query is subject to occurs-check.
EyeProlog now uses an occurs-check event observed during the query's ordinary
execution as positive STO evidence, and rejects `sto` when a finite execution
completes without such an event (for example `?- true. sto.`). If execution is
cut short by a search/resource boundary, the STO claim remains conservatively
unverified rather than being guessed.
For nontermination expectations, `loops` is kept distinct from resource
exhaustion: structural loop evidence may satisfy `loops`, while a bounded
search that cannot establish the requested answer sequence is reported as
`UNDECIDED`. In CLI quad mode, failures use exit status `1`; if there are no
failures but at least one undecided quad, the exit status is `2`.

## Tabling and well-founded negation

In normal mode, EyeProlog automatically tables eligible positive recursive
predicates. For large finite, function-free Datalog dependency cones it may use
one shared relation-wide table, so an open query such as `tc(X, Y)` computes a
finite closure once and bound recursive calls can reuse indexed answers. The
choice of when to use relation-wide tabling is an implementation optimization,
not a language-level threshold or directive.

Recursive nonterminals reached through `phrase/2-3` use a dedicated table
scope keyed by the complete invocation rather than the caller's general memo.
When a new input is seen, recursive DCGs that static analysis proves consume a
list tail on every recursive step run directly without automatic tabling; this
avoids building and retaining a family of suffix tables that cannot help the
next distinct input. If the same `phrase/2-3` invocation repeats, normal tabling
is enabled again and its small completed table can be reused. The retained
phrase table is also bounded, with active fixed points never evicted. This
keeps both long-running filters such as `\+ phrase((..., Pattern), Sequence)`
and repeated same-input probes bounded without turning memory safety into a
per-call cache-eviction cost.

Finite-tree unification also accepts an internal proven-nonoccurrence hint: when
the solver can prove that a variable cannot occur in the value it is about to
receive, that binding skips an otherwise redundant occurs traversal. The main
source-level case is conservative first use in a freshly renamed clause, inspired
by the local-variable optimization used by WAM-family systems; native construction
paths such as relational `length/2` reuse the same unifier mechanism. Repeated
variables, variables seen earlier in the clause, and ordinary public unification
remain fully occurs-checked. This is a proof local to one binding, not a WAM-style
local/global variable stack. `phrase/2` likewise supplies its fixed `[]`
remainder directly to the grammar; `phrase/3` retains its delayed final output
unification for steadfastness.

Recursion through negation is explicit. EyeProlog provides `tnot/1` for
well-founded negation over finite, range-restricted, function-free Datalog
components. Ordinary `\+/1` remains negation-as-failure and is not silently
reinterpreted as WFS.

```prolog
move(1, 2).
move(2, 1).
win(X) :- move(X, Y), tnot(win(Y)).

%% goal: win(X)
```

A cycle through `tnot/1` can leave atoms *undefined* rather than true or false.
EyeProlog exposes those as conditional successes so they can participate in
collectors such as `findall/3`; it does not currently expose a residual-program
API. Direct `tnot/1` calls must be ground. Variables used in an eligible WFS
rule are range-restricted by positive body literals before they are negated.

The normal-mode statistics interface includes `wfs_fixpoint_rounds` and
`wfs_undefined_answers`:

```prolog
statistics(wfs_fixpoint_rounds, Rounds).
statistics(wfs_undefined_answers, UndefinedObservations).
```

Both automatic tabling and `tnot/1` are EyeProlog extensions. Strict ISO mode
disables automatic tabling and does not provide `tnot/1`.

## Cleanup-aware control

Normal mode provides `call_cleanup/2` and `setup_call_cleanup/3` for resource
lifetimes that follow Prolog search. Cleanup runs exactly once when the protected
goal completes deterministically, is exhausted, is cut or otherwise pruned, the
top level stops answer enumeration, or an exception unwinds the search.
`setup_call_cleanup/3` runs Setup once and installs Cleanup only after Setup
succeeds. On ordinary pruning Cleanup sees the current goal bindings; during
exception unwinding bindings made by the protected goal have already been
unwound. Cleanup failure is ignored, and an exception already being propagated
takes precedence over a cleanup exception. Nested cleanups run inside-out.

These predicates are EyeProlog normal-mode extensions and are absent from
`--iso-strict`. Their implementation is lifecycle-aware: the interactive top
level can report a remaining choicepoint without speculatively requesting the
next solution, while abandoning that choicepoint still closes protected
resources.

## OpenRuleBench portable profile

The `openrulebench/` directory contains a deterministic four-engine adaptation
for EyeProlog, Trealla, Scryer, and SWI-Prolog. Its default `portable` profile
keeps the characteristic joins, recursive closures, and WFS cases while
avoiding benchmark sizes that require multi-gigabyte collectors on some
engines. Run EyeProlog's complete profile with:

```sh
./openrulebench/run-eyeprolog.mjs
```

The benchmark README records the expected answer counts. Timing values are
machine-dependent; use the same generated profile when comparing engines.

## Strict ISO/IEC 13211-1 core

For portability and conformance work, run the Part 1 core with Technical
Corrigenda 1–3 in strict mode:

```sh
eyeprolog --iso-strict
eyeprolog --iso-strict --goal 'p(X)' program.pl
```

The equivalent JavaScript option is `isoStrict: true`. Strict mode keeps
EyeProlog's documented implementation-defined Unicode scalar processor
character set, while excluding normal-profile language extensions such as Part
2 module compatibility forms, Part 3 DCG expansion, quads, extra libraries,
automatic tabling, and non-standard flags/control facilities. Normal mode is
unchanged.

This README intentionally stays at the project-overview level. The detailed
implementation reference is [*The Art of EyeProlog*](the-art-of-eyeprolog.md).
The current Part 1 audit status and closure criteria are recorded in
[`test/conformance/ISO-COMPLIANCE.md`](test/conformance/ISO-COMPLIANCE.md);
implementation-defined decisions are indexed in
[`ISO-IMPLEMENTATION-DEFINED.md`](test/conformance/ISO-IMPLEMENTATION-DEFINED.md). The complete
vendored WG17 syntax corpus and the strict ISO regression suite run as release
gates.

The release-facing Part 1 audit ledger has explicit dispositions for its tracked requirements. This implementation evidence is not an independent ISO certification.

## Module and definite clause grammar compatibility profiles

Normal EyeProlog supports the widely used `module/2`, `use_module/1-2`,
`meta_predicate/1`, and `Module:Goal` interface reflected in later WG17 module
amendment work. This is a practical module compatibility profile; EyeProlog
does **not** currently claim a clause-by-clause implementation or certification
of the complete ISO/IEC 13211-2:2000 module model.

Definite clause grammar support follows the ISO/IEC TS 13211-3 grammar-rule and
`phrase/2-3` model and is exercised by the conformance corpus. As with Part 1,
that implementation evidence is not an independent certification of every
Part 3 requirement. For example:

```prolog
sentence --> [hello], noun.
noun --> [world] | [prolog].

%% goal: phrase(sentence, Words)
```

For a larger bidirectional example, see
[`examples/dcg-expression-language.pl`](examples/dcg-expression-language.pl).
It parses precedence-sensitive arithmetic into an AST, evaluates expressions
with variables, generates tokens back from an AST with only the necessary
parentheses, round-trips the generated form, and demonstrates `phrase/3`
remainder handling.  The example uses accumulator nonterminals for
left-associative operators, so state is handed repeatedly from one nonterminal
to the next rather than hidden in host code.

Deep finite DCG traversal is kept relational but does not have to consume one
general solver frame per token.  In particular, the interoperable `... //0`
helper from `library(iso_ext)` can scan a finite compact list iteratively, and a
following grammar that is statically known to leave the DCG state unchanged can
be continued without rebuilding a full clause-resolution frame for every
suffix.  Open and remainder-producing uses still retain the ordinary DCG
solutions and backtracking behavior.

EyeProlog also adds 128 public library predicate indicators to its 129-entry ISO
profile. **88 are implemented entirely as ordinary Prolog clauses** in focused
modules under `src/lib/`; the remaining control predicates and finite-domain
`library(clpz)` kernel use backtrackable host support.
They are ordinary Prolog modules using EyeProlog's documented module compatibility surface, loaded explicitly by purpose, such as
`library(lists)`, `library(lambda)`, `library(strings)`, `library(aggregate)`, or
`library(clpz)`.
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
2, ...`. Open-ended generation uses the normal memory guard with recovery
headroom, so an exhausted finite heap is reported as a catchable
`resource_error(memory)` instead of degenerating into quadratic list checks.

`library(iso_ext)` is also accepted as a common interop module name.
EyeProlog exports `call_nth/2`, `time/1`, and the DCG helper `... //0` there.
The latter describes an arbitrary number of input elements and supports the
nonterminal hand-off benchmark used by the interoperability tests. These common predicates
may be imported explicitly, while source/CLI/API dependency loading can resolve
their unqualified forms conservatively. For Trealla-style interactive timing,
`time/1` is also available directly in the normal EyeProlog runtime; strict ISO
mode does not expose it.
The aligned `library(lists)` and `library(iso_ext)` exports are kept disjoint so
they can be imported together without an accidental import conflict. EyeProlog's
legacy `library(prologue)` remains a compatibility umbrella and should be
selectively imported when mixed with the aligned modules.

`library(lambda)` follows Scryer's higher-order lambda notation, adapted from
Ulrich Neumerkel's permissively licensed implementation. Importing it installs
the `+\` operator and enables closures such as `\X^Goal` and
`Free+\X^Goal`. Parameters are supplied by `call/N`; variables not listed in
`Free` are copied afresh for each invocation, while explicitly free variables
remain shared. For example:

```prolog
:- use_module(library(lambda)).
:- use_module(library(lists)).

all_positive(Xs) :- maplist(\X^(X > 0), Xs).
all_equal(Y, Xs) :- maplist(Y+\X^(X = Y), Xs).
```

The explicit import is intentional: unlike ordinary predicate autoloading, the
lambda syntax also changes the active operator table.

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

This optional check runs the same portable Towers of Hanoi source under
EyeProlog, Trealla, and Scryer. The default `npm test` does not require external
Prolog implementations; it does validate all four generated OpenRuleBench
source trees and their engine-specific tabling and WFS adaptations. Run those
fast structural checks separately with `npm run test:openrulebench`.

## Development

```sh
git clone https://github.com/eyereasoner/eyeprolog.git
cd eyeprolog
npm install
npm test
```

The GitHub test workflow runs the complete suite and an npm package dry-run on
both the minimum supported Node.js 18 release line and Node.js 24. Publishing
repeats those release checks before uploading the package.

The runtime JavaScript modules stay flat under `src/`; the existing `src/lib/`
directory contains the portable Prolog library modules. See
[`src/ARCHITECTURE.md`](src/ARCHITECTURE.md) for the source-layer boundaries,
facade modules, dependency rule, and the requirement that architectural cleanup
must preserve the existing solver hot paths and benchmark performance.

EyeProlog is released under the [MIT License](LICENSE.md).
