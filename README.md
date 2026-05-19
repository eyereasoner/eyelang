# eyelog

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.

Current version: `0.3.26`

For language details, examples, built-ins, and test conventions, see [HANDBOOK.md](HANDBOOK.md).

## Build

```sh
make
bin/eyelog --version
```

## Run

```sh
bin/eyelog examples/delfour.pl
bin/eyelog --query 'triple(:pat, :ancestor, X)' examples/ancestor.pl
```

Swap in any file under `examples/` to run another self-contained program.

Built-ins have short native names such as `sum/3`, `less_than/2`, and `rest/2`.
Namespaced forms such as `math:sum/3` and `list:rest/2` are aliases for
Eyeling/N3-style vocabularies, not a separate kind of built-in.

## Release

After updating `VERSION`, commit, tag, and push with:

```sh
./mkeyelog "release message"
```

The script must be run from `main`. It first runs `make test`. If any test fails,
it stops before committing, tagging, or pushing. When tests pass, it commits all
changes with the supplied message, creates an annotated `v$(cat VERSION)` tag,
and pushes `main` plus the tag. The `main` push triggers the GitHub Pages
workflow, and the tag push triggers the release workflow.

## GitHub Pages

The site is deployed by `.github/workflows/pages.yml` on every push to `main` and
can also be run manually from the Actions tab. Use `./mkeyelog "release message"`
for normal releases so tests, Pages, and the GitHub Release stay in sync.

## Test

```sh
make test
```

Examples are self-contained `.pl` programs. Golden outputs live in `examples/output/`.
For the example-writing conventions and the example tour, see the Handbook's
[Writing examples](HANDBOOK.md#8-writing-examples) chapter.
