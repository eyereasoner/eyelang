triple(blocks_world, blockCount, 5).
triple(blocks_world, finalState, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]).
triple(blocks_world, plan, [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]).
triple(blocks_world, status, planned).
