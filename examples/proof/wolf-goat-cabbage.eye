# Eyelang result format 1
query(1, at(28, 1), [call(solution(?v0))], [binding("moves", ?v0)]).
result(1, complete, 2).
answer(1, [binding("moves", [goat, nothing, wolf, goat, cabbage, nothing, goat])]).
why(1, [binding("moves", [goat, nothing, wolf, goat, cabbage, nothing, goat])], 129).
answer(1, [binding("moves", [goat, nothing, cabbage, goat, wolf, nothing, goat])]).
why(1, [binding("moves", [goat, nothing, cabbage, goat, wolf, nothing, goat])], 130).
proof(1, change(w, e), rule(4, at(7, 1)), []).
proof(2, move([w, w, w, w], wolf, [e, e, w, w]), rule(5, at(9, 1)), [uses(1, change(w, e))]).
proof(3, move([w, w, w, w], goat, [e, w, e, w]), rule(6, at(10, 1)), [uses(1, change(w, e))]).
proof(4, move([w, w, w, w], cabbage, [e, w, w, e]), rule(7, at(11, 1)), [uses(1, change(w, e))]).
proof(5, move([w, w, w, w], nothing, [e, w, w, w]), rule(8, at(12, 1)), [uses(1, change(w, e))]).
proof(6, one_equal(e, w, e), rule(10, at(15, 1)), []).
proof(7, one_equal(e, e, w), rule(9, at(14, 1)), []).
proof(8, safe([e, w, e, w]), rule(11, at(16, 1)), [uses(7, one_equal(e, e, w)), uses(7, one_equal(e, e, w))]).
proof(9, change(e, w), rule(3, at(6, 1)), []).
proof(10, move([e, w, e, w], goat, [w, w, w, w]), rule(6, at(10, 1)), [uses(9, change(e, w))]).
proof(11, move([e, w, e, w], nothing, [w, w, e, w]), rule(8, at(12, 1)), [uses(9, change(e, w))]).
proof(12, one_equal(w, w, w), rule(9, at(14, 1)), []).
proof(13, one_equal(w, e, w), rule(10, at(15, 1)), []).
proof(14, safe([w, w, w, w]), rule(11, at(16, 1)), [uses(12, one_equal(w, w, w)), uses(12, one_equal(w, w, w))]).
proof(15, safe([w, w, e, w]), rule(11, at(16, 1)), [uses(13, one_equal(w, e, w)), uses(13, one_equal(w, e, w))]).
proof(16, member([w, w, w, w], [[w, w, w, w]]), rule(1, at(4, 1)), []).
proof(17, member([w, w, w, w], [[e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(16, member([w, w, w, w], [[w, w, w, w]]))]).
proof(18, solution([]), query, [uses(17, member([w, w, w, w], [[e, w, e, w], [w, w, w, w]]))]).
proof(19, move([w, w, e, w], wolf, [e, e, e, w]), rule(5, at(9, 1)), [uses(1, change(w, e))]).
proof(20, move([w, w, e, w], cabbage, [e, w, e, e]), rule(7, at(11, 1)), [uses(1, change(w, e))]).
proof(21, move([w, w, e, w], nothing, [e, w, e, w]), rule(8, at(12, 1)), [uses(1, change(w, e))]).
proof(22, member([e, w, e, w], [[e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(23, member([e, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(22, member([e, w, e, w], [[e, w, e, w], [w, w, w, w]]))]).
proof(24, solution([]), query, [uses(23, member([e, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(25, one_equal(e, e, e), rule(9, at(14, 1)), []).
proof(26, safe([e, e, e, w]), rule(11, at(16, 1)), [uses(25, one_equal(e, e, e)), uses(7, one_equal(e, e, w))]).
proof(27, safe([e, w, e, e]), rule(11, at(16, 1)), [uses(7, one_equal(e, e, w)), uses(25, one_equal(e, e, e))]).
proof(28, move([e, e, e, w], wolf, [w, w, e, w]), rule(5, at(9, 1)), [uses(9, change(e, w))]).
proof(29, move([e, e, e, w], goat, [w, e, w, w]), rule(6, at(10, 1)), [uses(9, change(e, w))]).
proof(30, move([e, e, e, w], nothing, [w, e, e, w]), rule(8, at(12, 1)), [uses(9, change(e, w))]).
proof(31, move([e, w, e, e], goat, [w, w, w, e]), rule(6, at(10, 1)), [uses(9, change(e, w))]).
proof(32, move([e, w, e, e], cabbage, [w, w, e, w]), rule(7, at(11, 1)), [uses(9, change(e, w))]).
proof(33, move([e, w, e, e], nothing, [w, w, e, e]), rule(8, at(12, 1)), [uses(9, change(e, w))]).
proof(34, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(35, member([w, w, e, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(34, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(36, solution([]), query, [uses(35, member([w, w, e, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(37, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(38, member([w, w, e, w], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(37, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(39, solution([]), query, [uses(38, member([w, w, e, w], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(40, one_equal(w, w, e), rule(9, at(14, 1)), []).
proof(41, safe([w, e, w, w]), rule(11, at(16, 1)), [uses(40, one_equal(w, w, e)), uses(12, one_equal(w, w, w))]).
proof(42, safe([w, w, w, e]), rule(11, at(16, 1)), [uses(12, one_equal(w, w, w)), uses(40, one_equal(w, w, e))]).
proof(43, move([w, e, w, w], goat, [e, e, e, w]), rule(6, at(10, 1)), [uses(1, change(w, e))]).
proof(44, move([w, e, w, w], cabbage, [e, e, w, e]), rule(7, at(11, 1)), [uses(1, change(w, e))]).
proof(45, move([w, e, w, w], nothing, [e, e, w, w]), rule(8, at(12, 1)), [uses(1, change(w, e))]).
proof(46, move([w, w, w, e], wolf, [e, e, w, e]), rule(5, at(9, 1)), [uses(1, change(w, e))]).
proof(47, move([w, w, w, e], goat, [e, w, e, e]), rule(6, at(10, 1)), [uses(1, change(w, e))]).
proof(48, move([w, w, w, e], nothing, [e, w, w, e]), rule(8, at(12, 1)), [uses(1, change(w, e))]).
proof(49, member([e, e, e, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(50, member([e, e, e, w], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(49, member([e, e, e, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(51, solution([]), query, [uses(50, member([e, e, e, w], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(52, member([e, w, e, e], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(53, member([e, w, e, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(52, member([e, w, e, e], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(54, solution([]), query, [uses(53, member([e, w, e, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(55, safe([e, e, w, e]), rule(11, at(16, 1)), [uses(6, one_equal(e, w, e)), uses(6, one_equal(e, w, e))]).
proof(56, move([e, e, w, e], wolf, [w, w, w, e]), rule(5, at(9, 1)), [uses(9, change(e, w))]).
proof(57, move([e, e, w, e], cabbage, [w, e, w, w]), rule(7, at(11, 1)), [uses(9, change(e, w))]).
proof(58, move([e, e, w, e], nothing, [w, e, w, e]), rule(8, at(12, 1)), [uses(9, change(e, w))]).
proof(59, member([w, e, w, w], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(60, member([w, e, w, w], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(59, member([w, e, w, w], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(61, solution([]), query, [uses(60, member([w, e, w, w], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(62, member([w, w, w, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(63, member([w, w, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(62, member([w, w, w, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(64, solution([]), query, [uses(63, member([w, w, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(65, member([e, e, w, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(66, member([e, e, w, e], [[w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(65, member([e, e, w, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(67, solution([]), query, [uses(66, member([e, e, w, e], [[w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(68, safe([w, e, w, e]), rule(11, at(16, 1)), [uses(40, one_equal(w, w, e)), uses(40, one_equal(w, w, e))]).
proof(69, member([e, e, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(70, member([e, e, w, e], [[w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(69, member([e, e, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(71, solution([]), query, [uses(70, member([e, e, w, e], [[w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(72, member([w, w, w, e], [[w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(73, member([w, w, w, e], [[e, w, e, e], [w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(72, member([w, w, w, e], [[w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(74, solution([]), query, [uses(73, member([w, w, w, e], [[e, w, e, e], [w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(75, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(76, member([w, w, e, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(75, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(77, member([w, w, e, w], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(76, member([w, w, e, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(78, member([w, w, e, w], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(77, member([w, w, e, w], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(79, member([w, w, e, w], [[w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(78, member([w, w, e, w], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(80, member([w, w, e, w], [[e, w, e, e], [w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(79, member([w, w, e, w], [[w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(81, solution([]), query, [uses(80, member([w, w, e, w], [[e, w, e, e], [w, w, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(82, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(83, member([w, w, e, w], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(82, member([w, w, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(84, member([w, w, e, w], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(83, member([w, w, e, w], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(85, member([w, w, e, w], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(84, member([w, w, e, w], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(86, member([w, w, e, w], [[w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(85, member([w, w, e, w], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(87, member([w, w, e, w], [[e, e, e, w], [w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(86, member([w, w, e, w], [[w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(88, solution([]), query, [uses(87, member([w, w, e, w], [[e, e, e, w], [w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(89, member([w, e, w, w], [[w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(90, member([w, e, w, w], [[e, e, e, w], [w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(89, member([w, e, w, w], [[w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(91, solution([]), query, [uses(90, member([w, e, w, w], [[e, e, e, w], [w, e, w, w], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(92, move([w, e, w, e], goat, [e, e, e, e]), rule(6, at(10, 1)), [uses(1, change(w, e))]).
proof(93, move([w, e, w, e], nothing, [e, e, w, e]), rule(8, at(12, 1)), [uses(1, change(w, e))]).
proof(94, member([e, e, w, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(95, member([e, e, w, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(94, member([e, e, w, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(96, solution([]), query, [uses(95, member([e, e, w, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(97, member([e, e, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(98, member([e, e, w, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(97, member([e, e, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(99, solution([]), query, [uses(98, member([e, e, w, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(100, safe([e, e, e, e]), rule(11, at(16, 1)), [uses(25, one_equal(e, e, e)), uses(25, one_equal(e, e, e))]).
proof(101, solve([e, e, e, e], [e, e, e, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], []), rule(12, at(19, 1)), []).
proof(102, solve([e, e, e, e], [e, e, e, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], []), rule(12, at(19, 1)), []).
proof(103, solve([w, e, w, e], [e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat]), rule(13, at(20, 1)), [uses(92, move([w, e, w, e], goat, [e, e, e, e])), uses(100, safe([e, e, e, e])), absent(member([e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(101, solve([e, e, e, e], [e, e, e, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], []))]).
proof(104, move([e, e, e, e], wolf, [w, w, e, e]), rule(5, at(9, 1)), [uses(9, change(e, w))]).
proof(105, move([e, e, e, e], goat, [w, e, w, e]), rule(6, at(10, 1)), [uses(9, change(e, w))]).
proof(106, move([e, e, e, e], cabbage, [w, e, e, w]), rule(7, at(11, 1)), [uses(9, change(e, w))]).
proof(107, move([e, e, e, e], nothing, [w, e, e, e]), rule(8, at(12, 1)), [uses(9, change(e, w))]).
proof(108, solve([w, e, w, e], [e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat]), rule(13, at(20, 1)), [uses(92, move([w, e, w, e], goat, [e, e, e, e])), uses(100, safe([e, e, e, e])), absent(member([e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(102, solve([e, e, e, e], [e, e, e, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], []))]).
proof(109, solve([e, e, w, e], [e, e, e, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [nothing, goat]), rule(13, at(20, 1)), [uses(58, move([e, e, w, e], nothing, [w, e, w, e])), uses(68, safe([w, e, w, e])), absent(member([w, e, w, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(103, solve([w, e, w, e], [e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat]))]).
proof(110, member([w, e, w, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(111, member([w, e, w, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(110, member([w, e, w, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(112, solution([]), query, [uses(111, member([w, e, w, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(113, member([w, e, w, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(1, at(4, 1)), []).
proof(114, member([w, e, w, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), rule(2, at(5, 1)), [uses(113, member([w, e, w, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(115, solution([]), query, [uses(114, member([w, e, w, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]))]).
proof(116, solve([e, e, w, e], [e, e, e, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [nothing, goat]), rule(13, at(20, 1)), [uses(58, move([e, e, w, e], nothing, [w, e, w, e])), uses(68, safe([w, e, w, e])), absent(member([w, e, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(108, solve([w, e, w, e], [e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat]))]).
proof(117, solve([w, e, w, w], [e, e, e, e], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [cabbage, nothing, goat]), rule(13, at(20, 1)), [uses(44, move([w, e, w, w], cabbage, [e, e, w, e])), uses(55, safe([e, e, w, e])), absent(member([e, e, w, e], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(109, solve([e, e, w, e], [e, e, e, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [nothing, goat]))]).
proof(118, solve([w, w, w, e], [e, e, e, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [wolf, nothing, goat]), rule(13, at(20, 1)), [uses(46, move([w, w, w, e], wolf, [e, e, w, e])), uses(55, safe([e, e, w, e])), absent(member([e, e, w, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(116, solve([e, e, w, e], [e, e, e, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [nothing, goat]))]).
proof(119, solve([e, e, e, w], [e, e, e, e], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat, cabbage, nothing, goat]), rule(13, at(20, 1)), [uses(29, move([e, e, e, w], goat, [w, e, w, w])), uses(41, safe([w, e, w, w])), absent(member([w, e, w, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(117, solve([w, e, w, w], [e, e, e, e], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [cabbage, nothing, goat]))]).
proof(120, solve([e, w, e, e], [e, e, e, e], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat, wolf, nothing, goat]), rule(13, at(20, 1)), [uses(31, move([e, w, e, e], goat, [w, w, w, e])), uses(42, safe([w, w, w, e])), absent(member([w, w, w, e], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(118, solve([w, w, w, e], [e, e, e, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [wolf, nothing, goat]))]).
proof(121, solve([w, w, e, w], [e, e, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]], [wolf, goat, cabbage, nothing, goat]), rule(13, at(20, 1)), [uses(19, move([w, w, e, w], wolf, [e, e, e, w])), uses(26, safe([e, e, e, w])), absent(member([e, e, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(119, solve([e, e, e, w], [e, e, e, e], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat, cabbage, nothing, goat]))]).
proof(122, solve([w, w, e, w], [e, e, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]], [cabbage, goat, wolf, nothing, goat]), rule(13, at(20, 1)), [uses(20, move([w, w, e, w], cabbage, [e, w, e, e])), uses(27, safe([e, w, e, e])), absent(member([e, w, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), complete), uses(120, solve([e, w, e, e], [e, e, e, e], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat, wolf, nothing, goat]))]).
proof(123, solve([e, w, e, w], [e, e, e, e], [[e, w, e, w], [w, w, w, w]], [nothing, wolf, goat, cabbage, nothing, goat]), rule(13, at(20, 1)), [uses(11, move([e, w, e, w], nothing, [w, w, e, w])), uses(15, safe([w, w, e, w])), absent(member([w, w, e, w], [[e, w, e, w], [w, w, w, w]]), complete), uses(121, solve([w, w, e, w], [e, e, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]], [wolf, goat, cabbage, nothing, goat]))]).
proof(124, solve([e, w, e, w], [e, e, e, e], [[e, w, e, w], [w, w, w, w]], [nothing, cabbage, goat, wolf, nothing, goat]), rule(13, at(20, 1)), [uses(11, move([e, w, e, w], nothing, [w, w, e, w])), uses(15, safe([w, w, e, w])), absent(member([w, w, e, w], [[e, w, e, w], [w, w, w, w]]), complete), uses(122, solve([w, w, e, w], [e, e, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]], [cabbage, goat, wolf, nothing, goat]))]).
proof(125, solve([w, w, w, w], [e, e, e, e], [[w, w, w, w]], [goat, nothing, wolf, goat, cabbage, nothing, goat]), rule(13, at(20, 1)), [uses(3, move([w, w, w, w], goat, [e, w, e, w])), uses(8, safe([e, w, e, w])), absent(member([e, w, e, w], [[w, w, w, w]]), complete), uses(123, solve([e, w, e, w], [e, e, e, e], [[e, w, e, w], [w, w, w, w]], [nothing, wolf, goat, cabbage, nothing, goat]))]).
proof(126, solve([w, w, w, w], [e, e, e, e], [[w, w, w, w]], [goat, nothing, cabbage, goat, wolf, nothing, goat]), rule(13, at(20, 1)), [uses(3, move([w, w, w, w], goat, [e, w, e, w])), uses(8, safe([e, w, e, w])), absent(member([e, w, e, w], [[w, w, w, w]]), complete), uses(124, solve([e, w, e, w], [e, e, e, e], [[e, w, e, w], [w, w, w, w]], [nothing, cabbage, goat, wolf, nothing, goat]))]).
proof(127, solution([goat, nothing, wolf, goat, cabbage, nothing, goat]), rule(14, at(25, 1)), [uses(125, solve([w, w, w, w], [e, e, e, e], [[w, w, w, w]], [goat, nothing, wolf, goat, cabbage, nothing, goat])), builtin(length([goat, nothing, wolf, goat, cabbage, nothing, goat], 7))]).
proof(128, solution([goat, nothing, cabbage, goat, wolf, nothing, goat]), rule(14, at(25, 1)), [uses(126, solve([w, w, w, w], [e, e, e, e], [[w, w, w, w]], [goat, nothing, cabbage, goat, wolf, nothing, goat])), builtin(length([goat, nothing, cabbage, goat, wolf, nothing, goat], 7))]).
proof(129, solution([[goat, nothing, wolf, goat, cabbage, nothing, goat]]), query, [uses(127, solution([goat, nothing, wolf, goat, cabbage, nothing, goat]))]).
proof(130, solution([[goat, nothing, cabbage, goat, wolf, nothing, goat]]), query, [uses(128, solution([goat, nothing, cabbage, goat, wolf, nothing, goat]))]).
