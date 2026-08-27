# Example data and roundtrip support

This directory contains source and materialized data that support runnable examples without adding extra root-level `.pl` programs to the example test discovery.

## Symbiotic Knowledge Graphs

The heatwave-response example uses [`rdf-prolog-roundtrip`](https://github.com/eyereasoner/rdf-prolog-roundtrip) as its RDF boundary:

```text
symbiotic-knowledge-graph-input.nq
    -> rdf-to-prolog + symbiotic-knowledge-graph-rules.pl
    -> ../symbiotic-knowledge-graph.pl
    -> EyeProlog result_rdf/4
    -> symbiotic-knowledge-graph-output.pl
    -> prolog-to-rdf
    -> symbiotic-knowledge-graph-output.nq
```

The input uses named graphs for source boundaries and RDF 1.2 triple terms for AI-proposed statements. A proposed triple is therefore metadata until governance rules accept it; it does not become an operational assertion merely because an AI produced it.

See [the wide-audience deck](../deck/symbiotic-knowledge-graphs.md) for the scenario and architecture.
