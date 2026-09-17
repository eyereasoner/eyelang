# Eyelang result format 1
query(1, at(4, 1), [call(more_interesting(?v0, ?v1))], [binding("x", ?v0), binding("y", ?v1)]).
result(1, complete, 1).
answer(1, [binding("x", five), binding("y", three)]).
why(1, [binding("x", five), binding("y", three)], 4).
proof(1, value(five, 5), rule(1, at(2, 1)), []).
proof(2, value(three, 3), rule(2, at(2, 17)), []).
proof(3, more_interesting(five, three), rule(3, at(3, 1)), [uses(1, value(five, 5)), uses(2, value(three, 3)), compared(">", 5, 3)]).
proof(4, solution([five, three]), query, [uses(3, more_interesting(five, three))]).
