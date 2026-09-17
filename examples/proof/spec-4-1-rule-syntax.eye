# Eyelang result format 1
query(1, at(5, 1), [call(both_positive(?v0))], [binding("x", ?v0)]).
result(1, complete, 1).
answer(1, [binding("x", x)]).
why(1, [binding("x", x)], 3).
query(2, at(5, 24), [call(one_zero(?v0))], [binding("x", ?v0)]).
result(2, complete, 0).
proof(1, values(x, 1, 2), rule(1, at(2, 1)), []).
proof(2, both_positive(x), rule(2, at(3, 1)), [uses(1, values(x, 1, 2)), compared(">", 1, 0), compared(">", 2, 0)]).
proof(3, solution([x]), query, [uses(2, both_positive(x))]).
