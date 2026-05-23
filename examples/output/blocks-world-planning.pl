triple(blocks_world, finalState, [on(a, table), on(b, a), on(c, b)]).
triple(blocks_world, plan, [move(c, a, table), move(b, table, a), move(c, table, b)]).
triple(blocks_world, status, planned).
