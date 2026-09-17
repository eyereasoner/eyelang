# Source: eyeleng/examples/dijkstra.srl (b7c7e46f8297).
path(ab, a, b, 2). path(ac, a, c, 5).
candidate(abc, a, c, 2, 1). candidate(abd, a, d, 2, 7). candidate(acd, a, d, 5, 2). candidate(abcd, a, d, 2, 3).
path(?id, ?from, ?to, ?total) if candidate(?id, ?from, ?to, ?left, ?right), let ?total = ?left + ?right.
dominated(?id) if path(?id, ?from, ?to, ?cost), path(?better, ?from, ?to, ?better_cost), ?better_cost < ?cost.
best(?id, ?cost) if path(?id, ?from, ?to, ?cost), not dominated(?id).
ask best(?path, ?cost).
