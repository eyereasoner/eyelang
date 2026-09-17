# Eyelit result format 1
query(1, at(7, 1), [call(path(a, ?v0))], [binding("where", ?v0)]).
result(1, complete, 3).
answer(1, [binding("where", b)]).
why(1, [binding("where", b)], 3).
answer(1, [binding("where", c)]).
why(1, [binding("where", c)], 6).
answer(1, [binding("where", a)]).
why(1, [binding("where", a)], 9).
proof(1, edge(a, b), rule(1, at(2, 1)), []).
proof(2, path(a, b), rule(4, at(5, 1)), [uses(1, edge(a, b))]).
proof(3, solution([b]), query, [uses(2, path(a, b))]).
proof(4, edge(b, c), rule(2, at(3, 1)), []).
proof(5, path(a, c), rule(5, at(6, 1)), [uses(2, path(a, b)), uses(4, edge(b, c))]).
proof(6, solution([c]), query, [uses(5, path(a, c))]).
proof(7, edge(c, a), rule(3, at(4, 1)), []).
proof(8, path(a, a), rule(5, at(6, 1)), [uses(5, path(a, c)), uses(7, edge(c, a))]).
proof(9, solution([a]), query, [uses(8, path(a, a))]).
