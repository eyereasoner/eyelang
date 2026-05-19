# eyelog

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.

Eyelog materializes distinct `triple/3` consequences by Prolog-like Horn-clause search, with duplicate suppression and a guarded recursion rule that prevents common cyclic closures from looping.

Current version: `0.4.4`

For language details, examples, built-ins, and test conventions, see [HANDBOOK.md](HANDBOOK.md).

## Build

```sh
make
bin/eyelog --version
```

## Run

```sh
bin/eyelog examples/delfour.pl
bin/eyelog --query 'triple(pat, ancestor, X)' examples/ancestor.pl
```

Swap in any file under `examples/` to run another self-contained program.

Built-ins use one native spelling each, such as `add/3`, `lt/2`, `rounded/2`, and `rest/2`.
Vocabulary-style names use plain atoms and underscores: write `b` instead of
`:b`, and `a_b` instead of `a:b`.

## Release

After updating `VERSION`, commit, tag, and push with:

```sh
./mkeyelog "release message"
```

The script must be run from `main`. It first runs `make test`, which rebuilds
`bin/eyelog` locally before running the suite. If any test fails, it stops before
committing, tagging, or pushing. When tests pass, it commits all source and
documentation changes with the supplied message, creates an annotated
`v$(cat VERSION)` tag, and pushes `main` plus the tag. Generated binaries under
`bin/` are ignored and are not committed, so releases do not depend on the libc
version of the machine that prepared them. The `main` push triggers the GitHub
Pages workflow, and the tag push triggers the release workflow.

## GitHub Pages

The site is deployed by `.github/workflows/pages.yml` on every push to `main` and
can also be run manually from the Actions tab. Use `./mkeyelog "release message"`
for normal releases so tests, Pages, and the GitHub Release stay in sync.

## Test

```sh
make test
```

`make test` removes any existing `bin/eyelog` and rebuilds it from `src/eyelog.c`,
so stale binaries from another machine are not reused.

Examples are self-contained `.pl` programs. Golden outputs live in `examples/output/`.
The test runner uses a private `mktemp` directory, so parallel test runs do not
share fixed files under `/tmp`. For the example-writing conventions and the
example tour, see the Handbook's [Writing examples](HANDBOOK.md#8-writing-examples)
chapter.
