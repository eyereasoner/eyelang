# eyelang

[![npm version](https://img.shields.io/npm/v/eyelang.svg)](https://www.npmjs.com/package/eyelang)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23416492.svg)](https://doi.org/10.5281/zenodo.23416492)

<!-- navigation:start -->
[eyelang](https://eyereasoner.github.io/eyelang/) ·
[Repository](https://github.com/eyereasoner/eyelang) ·
[Playground](https://eyereasoner.github.io/eyelang/playground) ·
[Tutorial](https://eyereasoner.github.io/eyelang/TUTORIAL/) ·
[Specification](https://eyereasoner.github.io/eyelang/SPEC)
<!-- navigation:end -->

A symbolic logic programming language using a practical subset of
Prolog syntax and `.pl` files, with query explanations and executable checks.

Start with the [hands-on tutorial](TUTORIAL.md): choose an outing, follow
routes, calculate a journey time, and explain and check the results.

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
:- assertion(aggregate_all(count, mortal(Person), 1)).
```

Run it with Node.js 18 or later. No packages to install:

```sh
node eyelang.js examples/socrates.pl
```

The answer is `Who = socrates.`. The explanation shows the rule and its fact.
The assertions check mortality and the number of matching people. This is
[ARC: Answer, Reason, Check](https://josd.github.io/arc/).
The CLI and playground group output under `% Answer`, `% Reason`, and `% Check`.
Each answer block shows its query before the bindings or `true.` / `false.`
so results retain their context when a program asks several questions.

## Playground

Open [the playground](https://eyereasoner.github.io/eyelang/playground),
choose an example, and press **Run program** (or Ctrl/⌘ + Enter). **Stop**
cancels a long run.
You can open `.pl` files or URLs, save programs and full output, and share a
program as a link. Drafts are saved on this device when storage is available.
Unchanged examples get short links such as `#example=socrates`; edited programs
are included in the link. **Create Gist share** shares through GitHub with an
optional token, or helps you create a Gist on GitHub's website.
Large output has a labeled preview; copying or saving preserves the complete
result.
For local use, run `node src/playground-server.js` and open
http://127.0.0.1:8000/playground.html.

## The subset

- Facts: `human(socrates).` Rules: `mortal(X) :- human(X).`
- Atoms start with a lowercase ASCII letter. Quote other atoms, such as
  `'red-fox'` or `'Élodie'`. Names are case-sensitive. Double quotes denote
  strings.
- Variables start with an uppercase ASCII letter or `_`. Their scope is one
  clause or query. Repeated names require the same term; each `_` is fresh.
- Join goals with commas: `?- human(X), likes(X, tea).` All statements
  end in `.`.
  `%` introduces a line comment; `/* ... */` is a block comment.
- Queries return all distinct bindings, or `true.` / `false.` for ground goals.
  Use `?- why.` to explain the preceding answers, or
  `?- why(mortal(socrates)).`.
- Terms include exact integers, finite binary64 reals, atoms, strings, compound
  terms such as `point(2, 3)`, and lists such as `[Head | Tail]`.
- Arithmetic is explicit: `Next is N + 1`. Inputs must already be bound.
  `=` unifies terms; `=:=` compares arithmetic values. Use `<`, `=<`, `>`, `>=`,
  and `=\=` for other arithmetic tests.
- `\+ Goal` tests absence after its producers finish. Negation requires bound
  inputs and stratified dependencies.
- `:- table fibonacci/2.` makes a predicate demand-driven and tabled. Other
  range-restricted clauses run forward; clauses needing call inputs also use
  tabling. Positive recursion uses a fixed point and does not repeat answers.
- `aggregate_all(count, mortal(X), N)` counts distinct matching tuples.
  `sum(Value)`, `min(Value)`, and `max(Value)` are also supported.
- `:- assertion(Goal).` checks an expectation. A failed check reports its source
  line and stops the run with a failing exit status.

This is a Prolog subset, with set-based inference rather than Prolog's usual
ordered depth-first execution. It has no cut, disjunction, arbitrary directives,
modules, mutation, or external calls. `why/0`, `why/1`, and `contains_text/2`
are eyelang predicates; `assertion/1`, `aggregate_all/3`, and `table/1` follow
familiar Prolog library or tabling notation. See [SPEC.md](SPEC.md) for exact
limits.

For example, this computes only the Fibonacci numbers requested:

```prolog
:- table fibonacci/2.
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Value) :-
    N > 1,
    PreviousIndex is N - 1,
    EarlierIndex is N - 2,
    fibonacci(PreviousIndex, Previous),
    fibonacci(EarlierIndex, Earlier),
    Value is Previous + Earlier.

?- fibonacci(10000, Value).
```

The supplied index bounds the calculation. Asking `fibonacci(N, Value)` with
both arguments unbound fails when the comparison needs an index. Arithmetic
does not solve equations in reverse, and tabling does not ensure termination
for programs that create infinitely many distinct terms or calls.

The earlier English-like syntax is no longer accepted. Rename existing programs
to `.pl` and rewrite their facts, rules, questions, and checks using the forms
above. The playground uses a new draft slot; older saved drafts are left intact.

## Examples

Every example includes answers, reasons, and executable checks.

| Example | Try it for |
| --- | --- |
| [Socrates](https://github.com/eyereasoner/eyelang/blob/main/examples/socrates.pl) | The hello world of reasoning |
| [Animals](https://github.com/eyereasoner/eyelang/blob/main/examples/animals.pl) | Facts, rules, and missing evidence |
| [Friends](https://github.com/eyereasoner/eyelang/blob/main/examples/friends.pl) | Combining clues |
| [Paths](https://github.com/eyereasoner/eyelang/blob/main/examples/paths.pl) | Rules with a loop |
| [French cities](https://github.com/eyereasoner/eyelang/blob/main/examples/french-cities.pl) | Routes through one-way roads |
| [GPS](https://github.com/eyereasoner/eyelang/blob/main/examples/gps.pl) | Choosing a route by duration, cost, belief, and comfort |
| [Age](https://github.com/eyereasoner/eyelang/blob/main/examples/age.pl) | Checking an age against a supplied date |
| [Arithmetic](https://github.com/eyereasoner/eyelang/blob/main/examples/arithmetic.pl) | Exact integers, division, rounding, bits, and real functions |
| [Bayes diagnosis](https://github.com/eyereasoner/eyelang/blob/main/examples/bayes-diagnosis.pl) | Updating toy disease probabilities from symptom evidence |
| [Fibonacci](https://github.com/eyereasoner/eyelang/blob/main/examples/fibonacci.pl) | Exact Fibonacci 10000 and Cassini's identity |
| [Ackermann](https://github.com/eyereasoner/eyelang/blob/main/examples/ackermann.pl) | Exact large integers and nested backward calls |
| [Complex numbers](https://github.com/eyereasoner/eyelang/blob/main/examples/complex.pl) | Powers, `asin(5.22)`, and inverse checks |
| [Turing machine](https://github.com/eyereasoner/eyelang/blob/main/examples/turing.pl) | Running binary tapes with ordinary rules |
| [Delfour](https://github.com/eyereasoner/eyelang/blob/main/examples/delfour.pl) | A shopping policy and a lower-sugar recommendation |
| [Research portal](https://github.com/eyereasoner/eyelang/blob/main/examples/research-portal.pl) | Research policy, device consent, and breach plans across two rulebooks |
| [Negation](https://github.com/eyereasoner/eyelang/blob/main/examples/negation.pl) | Reasoning from absent evidence |
| [Aggregation](https://github.com/eyereasoner/eyelang/blob/main/examples/aggregation.pl) | Counts, totals, and smallest/largest values |

Deep taxonomy examples have
[10](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-10.pl),
[100](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-100.pl),
[1000](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-1000.pl),
[10000](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-10000.pl), and
[100000](https://github.com/eyereasoner/eyelang/blob/main/examples/deep-taxonomy-100000.pl) steps.

Run any `.pl` file in the same way. Save large answers and explanations to a
file:

```sh
node eyelang.js examples/fibonacci.pl > fibonacci-arc.txt
node eyelang.js my-program.pl
node eyelang.js - < my-program.pl
node eyelang.js --version
npm test
npm run test:conformance
```

The [conformance suite](https://github.com/eyereasoner/eyelang/tree/main/test/conformance)
tests the specification's syntax, semantics, explanations, checks, and CLI.
Its coverage map links specification sections to tests with explicit expected
results. It also runs as part of `npm test`.

To release, commit your changes and run
`./release patch "$(git log -1 --pretty=%B)"`.
Use `minor` or `major` instead of `patch` for a larger version bump.
The version bump updates the specification and playground; pushing the tag
runs the tests, creates a GitHub release with that message, and publishes to npm
and Zenodo in one job. All publishing steps and their logs appear in the
[Publish release to GitHub, npm, and Zenodo](https://github.com/eyereasoner/eyelang/actions/workflows/publish-release.yml).

The workflow publishes to npm using OIDC. In the `eyelang` package settings on
npm, configure a GitHub Actions trusted publisher with organization
`eyereasoner`, repository `eyelang`, and workflow filename
`publish-release.yml`.
If an existing trusted publisher uses `publish-npm.yml`, update that filename
to `publish-release.yml` before the next release. Leave the environment name
empty and allow direct publishing with `npm publish`. The package's
`repository.url` must match this GitHub repository. See the
[npm trusted publishing documentation](https://docs.npmjs.com/trusted-publishers/).
If publishing fails with a 404 permission error, verify these settings as well
as the package metadata. Changing files on `main` does not change an existing
release tag; release the fix under a new version and tag.

The same workflow publishes the tagged source archive to Zenodo using
`.zenodo.json` for metadata. Set the repository secret `ZENODO_TOKEN` to
a Zenodo personal access token with `deposit:write` and `deposit:actions`
scopes.
If the project already has a Zenodo concept DOI (the DOI for all versions), set
the repository variable `ZENODO_CONCEPT_DOI` to it. Otherwise, the first upload
creates one; set that variable to the resulting concept DOI before the next
release so subsequent versions stay linked. Leaving it empty creates a separate
record on each run.

Check Zenodo before rerunning a successful upload, since rerunning can publish
another record or version.
