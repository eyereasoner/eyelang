# Eyelang result format 1
query(1, at(6, 1), [call(first(?v0))], [binding("x", ?v0)]).
result(1, complete, 1).
answer(1, [binding("x", 1)]).
why(1, [binding("x", 1)], 3).
query(2, at(6, 16), [call(blank_property(?v0))], [binding("x", ?v0)]).
result(2, complete, 1).
answer(2, [binding("x", q)]).
why(2, [binding("x", q)], 6).
query(3, at(6, 40), [call(nested_first(?v0))], [binding("x", ?v0)]).
result(3, complete, 1).
answer(3, [binding("x", 2)]).
why(3, [binding("x", 2)], 9).
proof(1, value(root, [1, node(q), [2]]), rule(1, at(2, 1)), []).
proof(2, first(1), rule(2, at(3, 1)), [uses(1, value(root, [1, node(q), [2]]))]).
proof(3, solution([1]), query, [uses(2, first(1))]).
proof(4, value(root, [1, node(q), [2]]), rule(1, at(2, 1)), []).
proof(5, blank_property(q), rule(3, at(4, 1)), [uses(4, value(root, [1, node(q), [2]]))]).
proof(6, solution([q]), query, [uses(5, blank_property(q))]).
proof(7, value(root, [1, node(q), [2]]), rule(1, at(2, 1)), []).
proof(8, nested_first(2), rule(4, at(5, 1)), [uses(7, value(root, [1, node(q), [2]]))]).
proof(9, solution([2]), query, [uses(8, nested_first(2))]).
