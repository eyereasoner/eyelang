# Eyelit result format 1
query(1, at(16, 1), [call(place(4, 4, [], ?v0))], [binding("rows", ?v0)]).
result(1, complete, 2).
answer(1, [binding("rows", [3, 1, 4, 2])]).
why(1, [binding("rows", [3, 1, 4, 2])], 45).
answer(1, [binding("rows", [2, 4, 1, 3])]).
why(1, [binding("rows", [2, 4, 1, 3])], 46).
proof(1, safe(1, [], 1), rule(1, at(2, 1)), []).
proof(2, safe(2, [], 1), rule(1, at(2, 1)), []).
proof(3, safe(3, [], 1), rule(1, at(2, 1)), []).
proof(4, safe(4, [], 1), rule(1, at(2, 1)), []).
proof(5, safe(3, [], 2), rule(1, at(2, 1)), []).
proof(6, safe(4, [], 2), rule(1, at(2, 1)), []).
proof(7, safe(1, [], 2), rule(1, at(2, 1)), []).
proof(8, safe(2, [], 2), rule(1, at(2, 1)), []).
proof(9, safe(3, [1], 1), rule(2, at(3, 1)), [compared("!=", 3, 1), calculated(2, function("abs", [binary("-", value(3), value(1))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(5, safe(3, [], 2))]).
proof(10, safe(4, [1], 1), rule(2, at(3, 1)), [compared("!=", 4, 1), calculated(3, function("abs", [binary("-", value(4), value(1))])), compared("!=", 3, 1), calculated(2, binary("+", value(1), value(1))), uses(6, safe(4, [], 2))]).
proof(11, safe(4, [2], 1), rule(2, at(3, 1)), [compared("!=", 4, 2), calculated(2, function("abs", [binary("-", value(4), value(2))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(6, safe(4, [], 2))]).
proof(12, safe(1, [3], 1), rule(2, at(3, 1)), [compared("!=", 1, 3), calculated(2, function("abs", [binary("-", value(1), value(3))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(7, safe(1, [], 2))]).
proof(13, safe(1, [4], 1), rule(2, at(3, 1)), [compared("!=", 1, 4), calculated(3, function("abs", [binary("-", value(1), value(4))])), compared("!=", 3, 1), calculated(2, binary("+", value(1), value(1))), uses(7, safe(1, [], 2))]).
proof(14, safe(2, [4], 1), rule(2, at(3, 1)), [compared("!=", 2, 4), calculated(2, function("abs", [binary("-", value(2), value(4))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(8, safe(2, [], 2))]).
proof(15, safe(2, [], 3), rule(1, at(2, 1)), []).
proof(16, safe(1, [], 3), rule(1, at(2, 1)), []).
proof(17, safe(4, [], 3), rule(1, at(2, 1)), []).
proof(18, safe(3, [], 3), rule(1, at(2, 1)), []).
proof(19, safe(2, [1], 2), rule(2, at(3, 1)), [compared("!=", 2, 1), calculated(1, function("abs", [binary("-", value(2), value(1))])), compared("!=", 1, 2), calculated(3, binary("+", value(2), value(1))), uses(15, safe(2, [], 3))]).
proof(20, safe(1, [2], 2), rule(2, at(3, 1)), [compared("!=", 1, 2), calculated(1, function("abs", [binary("-", value(1), value(2))])), compared("!=", 1, 2), calculated(3, binary("+", value(2), value(1))), uses(16, safe(1, [], 3))]).
proof(21, safe(4, [3], 2), rule(2, at(3, 1)), [compared("!=", 4, 3), calculated(1, function("abs", [binary("-", value(4), value(3))])), compared("!=", 1, 2), calculated(3, binary("+", value(2), value(1))), uses(17, safe(4, [], 3))]).
proof(22, safe(3, [4], 2), rule(2, at(3, 1)), [compared("!=", 3, 4), calculated(1, function("abs", [binary("-", value(3), value(4))])), compared("!=", 1, 2), calculated(3, binary("+", value(2), value(1))), uses(18, safe(3, [], 3))]).
proof(23, safe(2, [4, 1], 1), rule(2, at(3, 1)), [compared("!=", 2, 4), calculated(2, function("abs", [binary("-", value(2), value(4))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(19, safe(2, [1], 2))]).
proof(24, safe(1, [4, 2], 1), rule(2, at(3, 1)), [compared("!=", 1, 4), calculated(3, function("abs", [binary("-", value(1), value(4))])), compared("!=", 3, 1), calculated(2, binary("+", value(1), value(1))), uses(20, safe(1, [2], 2))]).
proof(25, safe(4, [1, 3], 1), rule(2, at(3, 1)), [compared("!=", 4, 1), calculated(3, function("abs", [binary("-", value(4), value(1))])), compared("!=", 3, 1), calculated(2, binary("+", value(1), value(1))), uses(21, safe(4, [3], 2))]).
proof(26, safe(3, [1, 4], 1), rule(2, at(3, 1)), [compared("!=", 3, 1), calculated(2, function("abs", [binary("-", value(3), value(1))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(22, safe(3, [4], 2))]).
proof(27, safe(3, [], 4), rule(1, at(2, 1)), []).
proof(28, safe(2, [], 4), rule(1, at(2, 1)), []).
proof(29, safe(3, [2], 3), rule(2, at(3, 1)), [compared("!=", 3, 2), calculated(1, function("abs", [binary("-", value(3), value(2))])), compared("!=", 1, 3), calculated(4, binary("+", value(3), value(1))), uses(27, safe(3, [], 4))]).
proof(30, safe(2, [3], 3), rule(2, at(3, 1)), [compared("!=", 2, 3), calculated(1, function("abs", [binary("-", value(2), value(3))])), compared("!=", 1, 3), calculated(4, binary("+", value(3), value(1))), uses(28, safe(2, [], 4))]).
proof(31, safe(3, [4, 2], 2), rule(2, at(3, 1)), [compared("!=", 3, 4), calculated(1, function("abs", [binary("-", value(3), value(4))])), compared("!=", 1, 2), calculated(3, binary("+", value(2), value(1))), uses(29, safe(3, [2], 3))]).
proof(32, safe(2, [1, 3], 2), rule(2, at(3, 1)), [compared("!=", 2, 1), calculated(1, function("abs", [binary("-", value(2), value(1))])), compared("!=", 1, 2), calculated(3, binary("+", value(2), value(1))), uses(30, safe(2, [3], 3))]).
proof(33, safe(3, [1, 4, 2], 1), rule(2, at(3, 1)), [compared("!=", 3, 1), calculated(2, function("abs", [binary("-", value(3), value(1))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(31, safe(3, [4, 2], 2))]).
proof(34, safe(2, [4, 1, 3], 1), rule(2, at(3, 1)), [compared("!=", 2, 4), calculated(2, function("abs", [binary("-", value(2), value(4))])), compared("!=", 2, 1), calculated(2, binary("+", value(1), value(1))), uses(32, safe(2, [1, 3], 2))]).
proof(35, place(0, 4, [3, 1, 4, 2], [3, 1, 4, 2]), rule(3, at(9, 1)), []).
proof(36, place(0, 4, [2, 4, 1, 3], [2, 4, 1, 3]), rule(3, at(9, 1)), []).
proof(37, place(1, 4, [1, 4, 2], [3, 1, 4, 2]), rule(4, at(10, 1)), [compared(">", 1, 0), builtin(range(1, 4, 3)), uses(33, safe(3, [1, 4, 2], 1)), calculated(0, binary("-", value(1), value(1))), uses(35, place(0, 4, [3, 1, 4, 2], [3, 1, 4, 2]))]).
proof(38, place(1, 4, [4, 1, 3], [2, 4, 1, 3]), rule(4, at(10, 1)), [compared(">", 1, 0), builtin(range(1, 4, 2)), uses(34, safe(2, [4, 1, 3], 1)), calculated(0, binary("-", value(1), value(1))), uses(36, place(0, 4, [2, 4, 1, 3], [2, 4, 1, 3]))]).
proof(39, place(2, 4, [4, 2], [3, 1, 4, 2]), rule(4, at(10, 1)), [compared(">", 2, 0), builtin(range(1, 4, 1)), uses(24, safe(1, [4, 2], 1)), calculated(1, binary("-", value(2), value(1))), uses(37, place(1, 4, [1, 4, 2], [3, 1, 4, 2]))]).
proof(40, place(2, 4, [1, 3], [2, 4, 1, 3]), rule(4, at(10, 1)), [compared(">", 2, 0), builtin(range(1, 4, 4)), uses(25, safe(4, [1, 3], 1)), calculated(1, binary("-", value(2), value(1))), uses(38, place(1, 4, [4, 1, 3], [2, 4, 1, 3]))]).
proof(41, place(3, 4, [2], [3, 1, 4, 2]), rule(4, at(10, 1)), [compared(">", 3, 0), builtin(range(1, 4, 4)), uses(11, safe(4, [2], 1)), calculated(2, binary("-", value(3), value(1))), uses(39, place(2, 4, [4, 2], [3, 1, 4, 2]))]).
proof(42, place(3, 4, [3], [2, 4, 1, 3]), rule(4, at(10, 1)), [compared(">", 3, 0), builtin(range(1, 4, 1)), uses(12, safe(1, [3], 1)), calculated(2, binary("-", value(3), value(1))), uses(40, place(2, 4, [1, 3], [2, 4, 1, 3]))]).
proof(43, place(4, 4, [], [3, 1, 4, 2]), rule(4, at(10, 1)), [compared(">", 4, 0), builtin(range(1, 4, 2)), uses(2, safe(2, [], 1)), calculated(3, binary("-", value(4), value(1))), uses(41, place(3, 4, [2], [3, 1, 4, 2]))]).
proof(44, place(4, 4, [], [2, 4, 1, 3]), rule(4, at(10, 1)), [compared(">", 4, 0), builtin(range(1, 4, 3)), uses(3, safe(3, [], 1)), calculated(3, binary("-", value(4), value(1))), uses(42, place(3, 4, [3], [2, 4, 1, 3]))]).
proof(45, solution([[3, 1, 4, 2]]), query, [uses(43, place(4, 4, [], [3, 1, 4, 2]))]).
proof(46, solution([[2, 4, 1, 3]]), query, [uses(44, place(4, 4, [], [2, 4, 1, 3]))]).
