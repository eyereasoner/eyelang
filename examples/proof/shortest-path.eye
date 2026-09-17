# Eyelit result format 1
query(1, at(21, 1), [call(best(a, d, ?v0, ?v1))], [binding("path", ?v0), binding("cost", ?v1)]).
result(1, complete, 1).
answer(1, [binding("path", [a, b, c, d]), binding("cost", 5)]).
why(1, [binding("path", [a, b, c, d]), binding("cost", 5)], 61).
proof(1, edge(a, b, 2), rule(1, at(3, 1)), []).
proof(2, edge(a, c, 5), rule(2, at(4, 1)), []).
proof(3, edge(b, c, 1), rule(3, at(5, 1)), []).
proof(4, edge(b, d, 7), rule(4, at(6, 1)), []).
proof(5, edge(c, d, 2), rule(5, at(7, 1)), []).
proof(6, edge(c, a, 1), rule(6, at(8, 1)), []).
proof(7, member(a, [a]), rule(7, at(9, 1)), []).
proof(8, member(a, [c, a]), rule(8, at(10, 1)), [uses(7, member(a, [a]))]).
proof(9, solution([]), query, [uses(8, member(a, [c, a]))]).
proof(10, member(a, [a]), rule(7, at(9, 1)), []).
proof(11, member(a, [b, a]), rule(8, at(10, 1)), [uses(10, member(a, [a]))]).
proof(12, member(a, [c, b, a]), rule(8, at(10, 1)), [uses(11, member(a, [b, a]))]).
proof(13, solution([]), query, [uses(12, member(a, [c, b, a]))]).
proof(14, route(d, d, [d, b, a], [d], 0), rule(9, at(11, 1)), []).
proof(15, route(d, d, [d, c, a], [d], 0), rule(9, at(11, 1)), []).
proof(16, route(d, d, [d, c, b, a], [d], 0), rule(9, at(11, 1)), []).
proof(17, route(b, d, [b, a], [b, d], 7), rule(10, at(12, 1)), [uses(4, edge(b, d, 7)), absent(member(d, [b, a]), complete), uses(14, route(d, d, [d, b, a], [d], 0)), calculated(7, binary("+", value(7), value(0)))]).
proof(18, route(c, d, [c, a], [c, d], 2), rule(10, at(12, 1)), [uses(5, edge(c, d, 2)), absent(member(d, [c, a]), complete), uses(15, route(d, d, [d, c, a], [d], 0)), calculated(2, binary("+", value(2), value(0)))]).
proof(19, route(c, d, [c, b, a], [c, d], 2), rule(10, at(12, 1)), [uses(5, edge(c, d, 2)), absent(member(d, [c, b, a]), complete), uses(16, route(d, d, [d, c, b, a], [d], 0)), calculated(2, binary("+", value(2), value(0)))]).
proof(20, route(a, d, [a], [a, b, d], 9), rule(10, at(12, 1)), [uses(1, edge(a, b, 2)), absent(member(b, [a]), complete), uses(17, route(b, d, [b, a], [b, d], 7)), calculated(9, binary("+", value(2), value(7)))]).
proof(21, route(a, d, [a], [a, c, d], 7), rule(10, at(12, 1)), [uses(2, edge(a, c, 5)), absent(member(c, [a]), complete), uses(18, route(c, d, [c, a], [c, d], 2)), calculated(7, binary("+", value(5), value(2)))]).
proof(22, route(b, d, [b, a], [b, c, d], 3), rule(10, at(12, 1)), [uses(3, edge(b, c, 1)), absent(member(c, [b, a]), complete), uses(19, route(c, d, [c, b, a], [c, d], 2)), calculated(3, binary("+", value(1), value(2)))]).
proof(23, solution([9]), query, [uses(20, route(a, d, [a], [a, b, d], 9))]).
proof(24, solution([7]), query, [uses(21, route(a, d, [a], [a, c, d], 7))]).
proof(25, route(a, d, [a], [a, b, c, d], 5), rule(10, at(12, 1)), [uses(1, edge(a, b, 2)), absent(member(b, [a]), complete), uses(22, route(b, d, [b, a], [b, c, d], 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(26, solution([5]), query, [uses(25, route(a, d, [a], [a, b, c, d], 5))]).
proof(27, edge(a, b, 2), rule(1, at(3, 1)), []).
proof(28, edge(a, c, 5), rule(2, at(4, 1)), []).
proof(29, edge(b, c, 1), rule(3, at(5, 1)), []).
proof(30, edge(b, d, 7), rule(4, at(6, 1)), []).
proof(31, edge(c, d, 2), rule(5, at(7, 1)), []).
proof(32, edge(c, a, 1), rule(6, at(8, 1)), []).
proof(33, route(d, d, [d, b, a], [d], 0), rule(9, at(11, 1)), []).
proof(34, route(d, d, [d, c, a], [d], 0), rule(9, at(11, 1)), []).
proof(35, route(d, d, [d, c, b, a], [d], 0), rule(9, at(11, 1)), []).
proof(36, route(b, d, [b, a], [b, d], 7), rule(10, at(12, 1)), [uses(30, edge(b, d, 7)), absent(member(d, [b, a]), complete), uses(33, route(d, d, [d, b, a], [d], 0)), calculated(7, binary("+", value(7), value(0)))]).
proof(37, route(c, d, [c, a], [c, d], 2), rule(10, at(12, 1)), [uses(31, edge(c, d, 2)), absent(member(d, [c, a]), complete), uses(34, route(d, d, [d, c, a], [d], 0)), calculated(2, binary("+", value(2), value(0)))]).
proof(38, route(c, d, [c, b, a], [c, d], 2), rule(10, at(12, 1)), [uses(31, edge(c, d, 2)), absent(member(d, [c, b, a]), complete), uses(35, route(d, d, [d, c, b, a], [d], 0)), calculated(2, binary("+", value(2), value(0)))]).
proof(39, route(b, d, [b, a], [b, c, d], 3), rule(10, at(12, 1)), [uses(29, edge(b, c, 1)), absent(member(c, [b, a]), complete), uses(38, route(c, d, [c, b, a], [c, d], 2)), calculated(3, binary("+", value(1), value(2)))]).
proof(40, route(a, d, [a], [a, b, c, d], 5), rule(10, at(12, 1)), [uses(27, edge(a, b, 2)), absent(member(b, [a]), complete), uses(39, route(b, d, [b, a], [b, c, d], 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(41, edge(a, b, 2), rule(1, at(3, 1)), []).
proof(42, edge(a, c, 5), rule(2, at(4, 1)), []).
proof(43, edge(b, c, 1), rule(3, at(5, 1)), []).
proof(44, edge(b, d, 7), rule(4, at(6, 1)), []).
proof(45, edge(c, d, 2), rule(5, at(7, 1)), []).
proof(46, edge(c, a, 1), rule(6, at(8, 1)), []).
proof(47, route(d, d, [d, b, a], [d], 0), rule(9, at(11, 1)), []).
proof(48, route(d, d, [d, c, a], [d], 0), rule(9, at(11, 1)), []).
proof(49, route(d, d, [d, c, b, a], [d], 0), rule(9, at(11, 1)), []).
proof(50, route(b, d, [b, a], [b, d], 7), rule(10, at(12, 1)), [uses(44, edge(b, d, 7)), absent(member(d, [b, a]), complete), uses(47, route(d, d, [d, b, a], [d], 0)), calculated(7, binary("+", value(7), value(0)))]).
proof(51, route(c, d, [c, a], [c, d], 2), rule(10, at(12, 1)), [uses(45, edge(c, d, 2)), absent(member(d, [c, a]), complete), uses(48, route(d, d, [d, c, a], [d], 0)), calculated(2, binary("+", value(2), value(0)))]).
proof(52, route(c, d, [c, b, a], [c, d], 2), rule(10, at(12, 1)), [uses(45, edge(c, d, 2)), absent(member(d, [c, b, a]), complete), uses(49, route(d, d, [d, c, b, a], [d], 0)), calculated(2, binary("+", value(2), value(0)))]).
proof(53, route(a, d, [a], [a, b, d], 9), rule(10, at(12, 1)), [uses(41, edge(a, b, 2)), absent(member(b, [a]), complete), uses(50, route(b, d, [b, a], [b, d], 7)), calculated(9, binary("+", value(2), value(7)))]).
proof(54, route(a, d, [a], [a, c, d], 7), rule(10, at(12, 1)), [uses(42, edge(a, c, 5)), absent(member(c, [a]), complete), uses(51, route(c, d, [c, a], [c, d], 2)), calculated(7, binary("+", value(5), value(2)))]).
proof(55, route(b, d, [b, a], [b, c, d], 3), rule(10, at(12, 1)), [uses(43, edge(b, c, 1)), absent(member(c, [b, a]), complete), uses(52, route(c, d, [c, b, a], [c, d], 2)), calculated(3, binary("+", value(1), value(2)))]).
proof(56, solution([9]), query, [uses(53, route(a, d, [a], [a, b, d], 9))]).
proof(57, solution([7]), query, [uses(54, route(a, d, [a], [a, c, d], 7))]).
proof(58, route(a, d, [a], [a, b, c, d], 5), rule(10, at(12, 1)), [uses(41, edge(a, b, 2)), absent(member(b, [a]), complete), uses(55, route(b, d, [b, a], [b, c, d], 3)), calculated(5, binary("+", value(2), value(3)))]).
proof(59, solution([5]), query, [uses(58, route(a, d, [a], [a, b, c, d], 5))]).
proof(60, best(a, d, [a, b, c, d], 5), rule(11, at(17, 1)), [collected([5, 7, 9], ?v0, [call(route(a, d, [a], ?v1, ?v0))], [56, 57, 59], complete), calculated(5, function("min", [value([5, 7, 9])])), uses(40, route(a, d, [a], [a, b, c, d], 5))]).
proof(61, solution([[a, b, c, d], 5]), query, [uses(60, best(a, d, [a, b, c, d], 5))]).
