# Working on eyelang

eyelang is an experimental symbolic logic programming language. Describe its
implemented syntax, semantics, and limits without making claims about the age,
background, or ability of its users. Distinguish demonstrated behavior from
design goals. Keep explanations concrete, error messages specific, and
user-facing text direct.

## Repository map

- `src/language.js`: shared parser, inference engine, arithmetic, explanations,
  and checks. Both the CLI and browser worker use this implementation.
- `eyelang.js`: command-line entry point.
- `playground.html`, `src/playground.js`, and `src/playground-worker.js`:
  browser interface and computation worker.
- `src/playground-server.js`: local static server.
- `examples/*.eye`: executable examples using ARC (Answer, Reason, Check).
- `test/*.test.js`: Node.js behavior and regression tests.
- `SPEC.md`: normative language specification in RFC style.
- `README.md`: concise introduction, usage, and example index.
- `scripts/prepare-pages.js` and `scripts/pages-layout.html`: website staging
  and shared documentation layout.
- `scripts/sync-version.js`, `release`, and `.github/workflows/`: version
  synchronization, releases, and GitHub Pages deployment.

## Commands

Node.js 18 or later is required. The project uses ES modules and has no package
dependencies or build step for running programs.

```sh
node eyelang.js examples/socrates.eye
node eyelang.js - < examples/socrates.eye
node eyelang.js --version
node src/playground-server.js
node --test test/variables.test.js
npm test
node scripts/prepare-pages.js
git diff --check
```

The local playground is at `http://127.0.0.1:8000/playground.html`.
`prepare-pages.js` stages the website in `_pages/`; the Pages workflow renders
it with Jekyll into `_site/`. These generated directories are ignored.

## Language and examples

- Read the relevant sections of `SPEC.md` before changing language behavior.
  Keep the implementation, specification, README examples, and tests consistent.
- Rule variables are exactly `first`, `second`, `third`, `fourth`, `fifth`,
  `sixth`, `seventh`, `eighth`, `ninth`, `tenth`, `eleventh`, `twelfth`,
  `thirteenth`, `fourteenth`, `fifteenth`, and `sixteenth`. They are local to
  one rule and can bind any value, including people. Prefer consecutive names
  starting with `first` in each example rule. `who` and `what` are query variables.
- Preserve both forward rules (`if clues then answer.`) and tabled backward
  rules (`answer if clues.`). Backward calculations need bound inputs;
  arithmetic does not solve equations in reverse.
- Preserve exact integer arithmetic with `BigInt` and finite binary64 real
  arithmetic. Negation uses completed evidence and stratified inference.
- Explanations and executable checks are part of the language. When changing
  inference, verify answers, `why?` output, and check failures as appropriate.
- Use `.eye` for examples. Each bundled example should demonstrate an answer,
  explain it with `why?`, and verify expectations with `check that ... .`.
- Add new examples to the README index and the playground selector. Keep the
  specification's example descriptions current when relevant.
- Keep README example links pointed at repository files. Preserve the same
  top navigation on the homepage, specification, and playground: eyelang,
  Repository, Playground, Language specification.
- Use the project name `eyelang`. Omit obsolete slogans and public provenance
  notes about sibling projects. Do not restore `DESIGN.md`; keep language design
  and semantics in `SPEC.md`.

## Implementation and verification

Match the existing JavaScript style: two-space indentation, single-quoted
strings, semicolons, and named ES module imports/exports. Keep the shared
language implementation usable in both Node.js and the browser without Node
APIs in `src/language.js`.

Run focused tests while making behavioral changes, then `npm test` before
finishing changes to code, examples, or release tooling. Add regression tests
for meaningful behavior changes. Documentation-only edits generally need a
review and `git diff --check`.

For playground changes, check the actual browser as well as automated tests.
Preserve worker cancellation, usable error reporting, and complete output when
copying or saving a truncated preview. For website changes, verify paths under
`/eyelang/`, including `/playground/` and `/SPEC/`.

Large taxonomies contain many rules, and Fibonacci 10000 and Ackermann can
produce very large answers and explanations. Inspect focused sections and
redirect full output to temporary files instead of flooding the terminal.

## Versions and releases

`package.json` is the version source. The npm `version` lifecycle hook runs
`scripts/sync-version.js`, updating `SPEC.md` and `playground.html`; the CLI
reads the package version directly. Avoid independent version edits.

Follow the user's instructions about committing, pushing, and releasing.
The release script accepts `patch`, `minor`, and `major`. When a release using
the latest commit message is requested, commit the intended changes first,
then run the command for the requested version bump:

```sh
./release patch "$(git log -1 --pretty=%B)"
./release minor "$(git log -1 --pretty=%B)"
./release major "$(git log -1 --pretty=%B)"
```

The script switches to `main`, pulls with `--ff-only`, bumps the version, stages
all changes, commits, creates an annotated tag, and pushes the branch and tag.
Review the working tree first because it stages every changed file. A push to
`main` deploys GitHub Pages; a `v*` tag runs tests and creates the GitHub release
using the tag message. Verify the workflows and published version after release.
