# eyelog

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.

Current version: `0.3.3`

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

## Test

```sh
make test
```

Examples are self-contained `.pl` programs. Golden outputs live in `examples/output/`.
