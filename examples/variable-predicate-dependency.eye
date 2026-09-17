# Source: eyeleng/examples/variable-predicate-dependency.srl (b7c7e46f8297).
# Eyelang has fixed relation names, so the equivalent negative cycle is explicit.
source(a, blocked). derived(?x) if source(?x, blocked), not blocked(?x). blocked(?x) if derived(?x). ask derived(a).
