# Eyelang result format 1
query(1, at(4, 1), [call(summary(?v0, ?v1, ?v2, ?v3))], [binding("absolute", ?v0), binding("root", ?v1), binding("count", ?v2), binding("sorted", ?v3)]).
result(1, complete, 1).
answer(1, [binding("absolute", 3.7), binding("root", 3.0), binding("count", 3), binding("sorted", [-3.7, 2, 7])]).
why(1, [binding("absolute", 3.7), binding("root", 3.0), binding("count", 3), binding("sorted", [-3.7, 2, 7])], 3).
proof(1, numbers([-3.7, 7, 2]), rule(1, at(2, 1)), []).
proof(2, summary(3.7, 3.0, 3, [-3.7, 2, 7]), rule(2, at(3, 1)), [uses(1, numbers([-3.7, 7, 2])), calculated(3.7, function("abs", [unary("-", value(3.7))])), calculated(3.0, function("sqrt", [value(9)])), calculated(3, function("count", [value([-3.7, 7, 2])])), builtin(sort([-3.7, 7, 2], [-3.7, 2, 7]))]).
proof(3, solution([3.7, 3.0, 3, [-3.7, 2, 7]]), query, [uses(2, summary(3.7, 3.0, 3, [-3.7, 2, 7]))]).
