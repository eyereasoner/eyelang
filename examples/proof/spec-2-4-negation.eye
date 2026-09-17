# Eyelang result format 1
query(1, at(5, 1), [call(unclassified(?v0))], [binding("place", ?v0)]).
result(1, complete, 1).
answer(1, [binding("place", x3)]).
why(1, [binding("place", x3)], 11).
proof(1, place(x1), rule(1, at(2, 1)), []).
proof(2, place(x2), rule(2, at(2, 12)), []).
proof(3, place(x3), rule(3, at(2, 23)), []).
proof(4, population(x1, 1000), rule(4, at(2, 34)), []).
proof(5, has_population(x1), rule(7, at(4, 1)), [uses(4, population(x1, 1000))]).
proof(6, solution([]), query, [uses(5, has_population(x1))]).
proof(7, population(x2, 2000), rule(5, at(2, 56)), []).
proof(8, has_population(x2), rule(7, at(4, 1)), [uses(7, population(x2, 2000))]).
proof(9, solution([]), query, [uses(8, has_population(x2))]).
proof(10, unclassified(x3), rule(6, at(3, 1)), [uses(3, place(x3)), absent(has_population(x3), complete)]).
proof(11, solution([x3]), query, [uses(10, unclassified(x3))]).
