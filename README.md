# eyelog

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.

Eyelog materializes distinct `triple/3` consequences by Prolog-like Horn-clause search, with duplicate suppression and a guarded recursion rule that prevents common cyclic closures from looping.

Current version: see [`VERSION`](VERSION)

For language details, examples, built-ins, browser use, and test conventions, see [HANDBOOK.md](HANDBOOK.md).

Try it in the [browser playground](playground.html).

## Build

The default build now builds both the native CLI and the browser playground assets:

```sh
make
# same as: make all
```

This creates:

```text
bin/eyelog

dist/browser/eyelog.mjs
dist/browser/eyelog.wasm
```

`make` and `make all` require a C compiler and Emscripten's `emcc`. To build only one target, use:

```sh
make cli       # native executable only
make browser   # WebAssembly playground assets only
```

Check the version with:

```sh
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

## Browser playground

`playground.html` runs Eyelog in the browser through a WebAssembly build. Build
the browser assets with:

```sh
make browser
```

The command writes `dist/browser/eyelog.mjs` and `dist/browser/eyelog.wasm`. Serve
the repository with a local HTTP server and open `playground.html`; browsers do
not usually allow ES-module WebAssembly workers from `file://` URLs.

For local use, run:

```sh
make serve
```

and open <http://localhost:8000/playground.html>.

The playground has a vertical, mobile-friendly layout. It can load examples, load
programs from URLs, concatenate background programs before the editor contents,
run an optional `--query`, autosave locally, and make compact share links. On
insecure HTTP origins where `navigator.clipboard` is unavailable, the share-link
button falls back to a temporary textarea copy and finally to a manual copy
prompt instead of failing.

After changing the C source, Makefile, or browser settings, rebuild stale browser
assets with:

```sh
make clean browser
```

## Release

After updating `VERSION`, commit, tag, and push with:

```sh
./mkeyelog "release message"
```

The script must be run from `main`. It first runs `make all` and `make test`, so
release preparation requires both a C compiler and Emscripten. If any build or
test step fails, it stops before committing, tagging, or pushing. When tests
pass, it commits all source and documentation changes with the supplied message,
creates an annotated `v$(cat VERSION)` tag, and pushes `main` plus the tag.
Generated binaries under `bin/` and browser assets under `dist/` are generated
locally and should not be committed, so releases do not depend on the libc or
Emscripten version of the machine that prepared them. The `main` push triggers
the GitHub Pages workflow, and the tag push triggers the release workflow.

## GitHub Pages

The site is deployed by `.github/workflows/pages.yml` on every push to `main` and
can also be run manually from the Actions tab. The workflow installs Emscripten,
builds the WebAssembly playground assets, and then lets Jekyll package the site.
Use `./mkeyelog "release message"` for normal releases so native tests, browser
assets, Pages, and the GitHub Release stay in sync.

## Test

```sh
make test
```

`make test` removes any existing `bin/eyelog`, rebuilds the native CLI from
`src/eyelog.c`, and runs the example suite. It does not require Emscripten; use
`make` or `make all` when you also want to validate that the browser target
builds.

Examples are self-contained `.pl` programs. Golden outputs live in `examples/output/`.
The test runner uses a private `mktemp` directory, so parallel test runs do not
share fixed files under `/tmp`. For the example-writing conventions and the
example tour, see the Handbook's [Writing examples](HANDBOOK.md#8-writing-examples)
chapter.
