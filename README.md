# eyelog

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.

Current version: `0.3.0`

For language details, examples, built-ins, and test conventions, see [HANDBOOK.md](HANDBOOK.md).

## Build

```sh
make
bin/eyelog --version
```

## Run

```sh
bin/eyelog examples/path-discovery.pl
bin/eyelog examples/fibonacci.pl
bin/eyelog examples/gps.pl
bin/eyelog examples/dijkstra.pl
bin/eyelog examples/gray-code-counter.pl
bin/eyelog --query 'triple(:pat, :ancestor, X)' examples/ancestor.pl
bin/eyelog --query 'append([a, b], [c], X)' examples/list-collection.pl
```

## Test

```sh
make test
```

Examples are self-contained `.pl` programs. Golden outputs live in `examples/output/`.
