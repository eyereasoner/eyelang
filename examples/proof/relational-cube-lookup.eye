# Eyelang result format 1
query(1, at(4, 1), [call(cube(137, ?v0, 11, ?v1))], [binding("b", ?v0), binding("value", ?v1)]).
result(1, complete, 1).
answer(1, [binding("b", 110), binding("value", 2066)]).
why(1, [binding("b", 110), binding("value", 2066)], 2).
proof(1, cube(137, 110, 11, 2066), rule(1, at(3, 1)), [builtin(range(0, 224, 137)), builtin(range(0, 14, 11)), calculated(2329, binary("*", value(137), value(17))), calculated(110, binary("%", binary("+", value(2329), binary("*", value(11), value(31))), value(512))), calculated(2066, binary("+", binary("*", value(137), value(15)), value(11)))]).
proof(2, solution([110, 2066]), query, [uses(1, cube(137, 110, 11, 2066))]).
