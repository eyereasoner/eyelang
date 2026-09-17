# Eyelang result format 1
query(1, at(4, 1), [call(level(100000))], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 2).
proof(1, level(100000), rule(1, at(3, 1)), [builtin(range(0, 100000, 100000))]).
proof(2, solution([]), query, [uses(1, level(100000))]).
