# Eyelang result format 1
query(1, at(7, 1), [call(best(?v0, ?v1))], [binding("path", ?v0), binding("cost", ?v1)]).
result(1, complete, 3).
answer(1, [binding("path", ab), binding("cost", 2)]).
why(1, [binding("path", ab), binding("cost", 2)], 16).
answer(1, [binding("path", abc), binding("cost", 3)]).
why(1, [binding("path", abc), binding("cost", 3)], 56).
answer(1, [binding("path", abcd), binding("cost", 5)]).
why(1, [binding("path", abcd), binding("cost", 5)], 57).
proof(1, path(ab, a, b, 2), rule(1, at(2, 1)), []).
proof(2, path(ac, a, c, 5), rule(2, at(2, 20)), []).
proof(3, path(ab, a, b, 2), rule(1, at(2, 1)), []).
proof(4, path(ab, a, b, 2), rule(1, at(2, 1)), []).
proof(5, best(ab, 2), rule(9, at(6, 1)), [uses(1, path(ab, a, b, 2)), absent(dominated(ab), complete)]).
proof(6, path(ac, a, c, 5), rule(2, at(2, 20)), []).
proof(7, path(ac, a, c, 5), rule(2, at(2, 20)), []).
proof(8, candidate(abc, a, c, 2, 1), rule(3, at(3, 1)), []).
proof(9, path(abc, a, c, 3), rule(7, at(4, 1)), [uses(8, candidate(abc, a, c, 2, 1)), calculated(3, binary("+", value(2), value(1)))]).
proof(10, dominated(ac), rule(8, at(5, 1)), [uses(6, path(ac, a, c, 5)), uses(9, path(abc, a, c, 3)), compared("<", 3, 5)]).
proof(11, solution([]), query, [uses(10, dominated(ac))]).
proof(12, candidate(abc, a, c, 2, 1), rule(3, at(3, 1)), []).
proof(13, candidate(abd, a, d, 2, 7), rule(4, at(3, 29)), []).
proof(14, candidate(acd, a, d, 5, 2), rule(5, at(3, 57)), []).
proof(15, candidate(abcd, a, d, 2, 3), rule(6, at(3, 85)), []).
proof(16, solution([ab, 2]), query, [uses(5, best(ab, 2))]).
proof(17, path(abc, a, c, 3), rule(7, at(4, 1)), [uses(12, candidate(abc, a, c, 2, 1)), calculated(3, binary("+", value(2), value(1)))]).
proof(18, path(abd, a, d, 9), rule(7, at(4, 1)), [uses(13, candidate(abd, a, d, 2, 7)), calculated(9, binary("+", value(2), value(7)))]).
proof(19, path(acd, a, d, 7), rule(7, at(4, 1)), [uses(14, candidate(acd, a, d, 5, 2)), calculated(7, binary("+", value(5), value(2)))]).
proof(20, path(abcd, a, d, 5), rule(7, at(4, 1)), [uses(15, candidate(abcd, a, d, 2, 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(21, candidate(abc, a, c, 2, 1), rule(3, at(3, 1)), []).
proof(22, path(abc, a, c, 3), rule(7, at(4, 1)), [uses(21, candidate(abc, a, c, 2, 1)), calculated(3, binary("+", value(2), value(1)))]).
proof(23, path(ac, a, c, 5), rule(2, at(2, 20)), []).
proof(24, candidate(abc, a, c, 2, 1), rule(3, at(3, 1)), []).
proof(25, path(abc, a, c, 3), rule(7, at(4, 1)), [uses(24, candidate(abc, a, c, 2, 1)), calculated(3, binary("+", value(2), value(1)))]).
proof(26, best(abc, 3), rule(9, at(6, 1)), [uses(17, path(abc, a, c, 3)), absent(dominated(abc), complete)]).
proof(27, candidate(abd, a, d, 2, 7), rule(4, at(3, 29)), []).
proof(28, path(abd, a, d, 9), rule(7, at(4, 1)), [uses(27, candidate(abd, a, d, 2, 7)), calculated(9, binary("+", value(2), value(7)))]).
proof(29, candidate(abd, a, d, 2, 7), rule(4, at(3, 29)), []).
proof(30, candidate(acd, a, d, 5, 2), rule(5, at(3, 57)), []).
proof(31, candidate(abcd, a, d, 2, 3), rule(6, at(3, 85)), []).
proof(32, path(abd, a, d, 9), rule(7, at(4, 1)), [uses(29, candidate(abd, a, d, 2, 7)), calculated(9, binary("+", value(2), value(7)))]).
proof(33, path(acd, a, d, 7), rule(7, at(4, 1)), [uses(30, candidate(acd, a, d, 5, 2)), calculated(7, binary("+", value(5), value(2)))]).
proof(34, path(abcd, a, d, 5), rule(7, at(4, 1)), [uses(31, candidate(abcd, a, d, 2, 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(35, dominated(abd), rule(8, at(5, 1)), [uses(28, path(abd, a, d, 9)), uses(33, path(acd, a, d, 7)), compared("<", 7, 9)]).
proof(36, solution([]), query, [uses(35, dominated(abd))]).
proof(37, candidate(acd, a, d, 5, 2), rule(5, at(3, 57)), []).
proof(38, path(acd, a, d, 7), rule(7, at(4, 1)), [uses(37, candidate(acd, a, d, 5, 2)), calculated(7, binary("+", value(5), value(2)))]).
proof(39, candidate(abd, a, d, 2, 7), rule(4, at(3, 29)), []).
proof(40, candidate(acd, a, d, 5, 2), rule(5, at(3, 57)), []).
proof(41, candidate(abcd, a, d, 2, 3), rule(6, at(3, 85)), []).
proof(42, path(abd, a, d, 9), rule(7, at(4, 1)), [uses(39, candidate(abd, a, d, 2, 7)), calculated(9, binary("+", value(2), value(7)))]).
proof(43, path(acd, a, d, 7), rule(7, at(4, 1)), [uses(40, candidate(acd, a, d, 5, 2)), calculated(7, binary("+", value(5), value(2)))]).
proof(44, path(abcd, a, d, 5), rule(7, at(4, 1)), [uses(41, candidate(abcd, a, d, 2, 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(45, dominated(acd), rule(8, at(5, 1)), [uses(38, path(acd, a, d, 7)), uses(44, path(abcd, a, d, 5)), compared("<", 5, 7)]).
proof(46, solution([]), query, [uses(45, dominated(acd))]).
proof(47, candidate(abcd, a, d, 2, 3), rule(6, at(3, 85)), []).
proof(48, path(abcd, a, d, 5), rule(7, at(4, 1)), [uses(47, candidate(abcd, a, d, 2, 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(49, candidate(abd, a, d, 2, 7), rule(4, at(3, 29)), []).
proof(50, candidate(acd, a, d, 5, 2), rule(5, at(3, 57)), []).
proof(51, candidate(abcd, a, d, 2, 3), rule(6, at(3, 85)), []).
proof(52, path(abd, a, d, 9), rule(7, at(4, 1)), [uses(49, candidate(abd, a, d, 2, 7)), calculated(9, binary("+", value(2), value(7)))]).
proof(53, path(acd, a, d, 7), rule(7, at(4, 1)), [uses(50, candidate(acd, a, d, 5, 2)), calculated(7, binary("+", value(5), value(2)))]).
proof(54, path(abcd, a, d, 5), rule(7, at(4, 1)), [uses(51, candidate(abcd, a, d, 2, 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(55, best(abcd, 5), rule(9, at(6, 1)), [uses(20, path(abcd, a, d, 5)), absent(dominated(abcd), complete)]).
proof(56, solution([abc, 3]), query, [uses(26, best(abc, 3))]).
proof(57, solution([abcd, 5]), query, [uses(55, best(abcd, 5))]).
