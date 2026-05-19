# eyelog

`eyelog` is a C Prolog-style rule engine with an RDF bridge through `triple(S, P, O)`.

Current version: `0.3.11`

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

## Test

```sh
make test
```

Examples are self-contained `.pl` programs. Golden outputs live in `examples/output/`.
Graph-term examples include `delfour.pl`, `dijkstra.pl`, `family-cousins.pl`,
`annotation-graph.pl`, `context-association.pl`, `derived-rule-graph.pl`,
and the ODRL/DPV risk examples. List-heavy examples include `gps.pl`,
`allen-interval-calculus.pl`, and `drone-corridor-planner.pl`.
Inside `graph([...])`, RDF-shaped content uses `triple(S, P, O)` consistently; `triple/3` remains the output convention.
