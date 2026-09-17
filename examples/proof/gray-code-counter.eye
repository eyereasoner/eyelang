# Eyelang result format 1
query(1, at(33, 1), [call(counter([1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0], ?v0))], [binding("states", ?v0)]).
result(1, complete, 1).
answer(1, [binding("states", [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])]).
why(1, [binding("states", [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])], 44).
query(2, at(35, 1), [call(gcc(0, [1, 0, 1], ?v0))], [binding("state", ?v0)]).
result(2, complete, 1).
answer(2, [binding("state", [1, 0, 1])]).
why(2, [binding("state", [1, 0, 1])], 59).
proof(1, and_gate(0, 0, 0), rule(1, at(5, 1)), []).
proof(2, inv(0, 1), rule(9, at(13, 1)), []).
proof(3, and_gate(0, 1, 0), rule(2, at(6, 1)), []).
proof(4, and_gate(1, 0, 0), rule(3, at(7, 1)), []).
proof(5, or_gate(0, 0, 0), rule(5, at(9, 1)), []).
proof(6, netb(0, 0, 0, 0, 0), rule(14, at(21, 1)), [uses(1, and_gate(0, 0, 0)), uses(2, inv(0, 1)), uses(3, and_gate(0, 1, 0)), uses(2, inv(0, 1)), uses(4, and_gate(1, 0, 0)), uses(5, or_gate(0, 0, 0)), uses(5, or_gate(0, 0, 0))]).
proof(7, and_gate(1, 1, 1), rule(4, at(8, 1)), []).
proof(8, or_gate(0, 1, 1), rule(6, at(10, 1)), []).
proof(9, neta(0, 0, 1), rule(13, at(18, 1)), [uses(1, and_gate(0, 0, 0)), uses(2, inv(0, 1)), uses(2, inv(0, 1)), uses(7, and_gate(1, 1, 1)), uses(8, or_gate(0, 1, 1))]).
proof(10, dff(0, 1, 0, 0), rule(12, at(16, 1)), []).
proof(11, dff(1, 1, 0, 1), rule(12, at(16, 1)), []).
proof(12, gcc(1, [0, 0, 0], [0, 0, 1]), rule(15, at(25, 1)), [uses(6, netb(0, 0, 0, 0, 0)), uses(9, neta(0, 0, 1)), uses(10, dff(0, 1, 0, 0)), uses(10, dff(0, 1, 0, 0)), uses(11, dff(1, 1, 0, 1))]).
proof(13, inv(1, 0), rule(10, at(14, 1)), []).
proof(14, netb(0, 0, 1, 0, 1), rule(14, at(21, 1)), [uses(3, and_gate(0, 1, 0)), uses(13, inv(1, 0)), uses(1, and_gate(0, 0, 0)), uses(2, inv(0, 1)), uses(7, and_gate(1, 1, 1)), uses(5, or_gate(0, 0, 0)), uses(8, or_gate(0, 1, 1))]).
proof(15, dff(1, 1, 1, 1), rule(12, at(16, 1)), []).
proof(16, gcc(1, [0, 0, 1], [0, 1, 1]), rule(15, at(25, 1)), [uses(14, netb(0, 0, 1, 0, 1)), uses(9, neta(0, 0, 1)), uses(10, dff(0, 1, 0, 0)), uses(11, dff(1, 1, 0, 1)), uses(15, dff(1, 1, 1, 1))]).
proof(17, netb(0, 1, 1, 0, 1), rule(14, at(21, 1)), [uses(3, and_gate(0, 1, 0)), uses(13, inv(1, 0)), uses(4, and_gate(1, 0, 0)), uses(2, inv(0, 1)), uses(7, and_gate(1, 1, 1)), uses(5, or_gate(0, 0, 0)), uses(8, or_gate(0, 1, 1))]).
proof(18, neta(0, 1, 0), rule(13, at(18, 1)), [uses(3, and_gate(0, 1, 0)), uses(2, inv(0, 1)), uses(13, inv(1, 0)), uses(4, and_gate(1, 0, 0)), uses(5, or_gate(0, 0, 0))]).
proof(19, dff(0, 1, 1, 0), rule(12, at(16, 1)), []).
proof(20, gcc(1, [0, 1, 1], [0, 1, 0]), rule(15, at(25, 1)), [uses(17, netb(0, 1, 1, 0, 1)), uses(18, neta(0, 1, 0)), uses(10, dff(0, 1, 0, 0)), uses(15, dff(1, 1, 1, 1)), uses(19, dff(0, 1, 1, 0))]).
proof(21, or_gate(1, 0, 1), rule(7, at(11, 1)), []).
proof(22, netb(0, 1, 0, 1, 1), rule(14, at(21, 1)), [uses(1, and_gate(0, 0, 0)), uses(2, inv(0, 1)), uses(7, and_gate(1, 1, 1)), uses(2, inv(0, 1)), uses(4, and_gate(1, 0, 0)), uses(8, or_gate(0, 1, 1)), uses(21, or_gate(1, 0, 1))]).
proof(23, gcc(1, [0, 1, 0], [1, 1, 0]), rule(15, at(25, 1)), [uses(22, netb(0, 1, 0, 1, 1)), uses(18, neta(0, 1, 0)), uses(11, dff(1, 1, 0, 1)), uses(15, dff(1, 1, 1, 1)), uses(10, dff(0, 1, 0, 0))]).
proof(24, netb(1, 1, 0, 1, 1), rule(14, at(21, 1)), [uses(4, and_gate(1, 0, 0)), uses(2, inv(0, 1)), uses(7, and_gate(1, 1, 1)), uses(13, inv(1, 0)), uses(1, and_gate(0, 0, 0)), uses(8, or_gate(0, 1, 1)), uses(21, or_gate(1, 0, 1))]).
proof(25, neta(1, 1, 1), rule(13, at(18, 1)), [uses(7, and_gate(1, 1, 1)), uses(13, inv(1, 0)), uses(13, inv(1, 0)), uses(1, and_gate(0, 0, 0)), uses(21, or_gate(1, 0, 1))]).
proof(26, gcc(1, [1, 1, 0], [1, 1, 1]), rule(15, at(25, 1)), [uses(24, netb(1, 1, 0, 1, 1)), uses(25, neta(1, 1, 1)), uses(15, dff(1, 1, 1, 1)), uses(15, dff(1, 1, 1, 1)), uses(11, dff(1, 1, 0, 1))]).
proof(27, netb(1, 1, 1, 1, 0), rule(14, at(21, 1)), [uses(7, and_gate(1, 1, 1)), uses(13, inv(1, 0)), uses(4, and_gate(1, 0, 0)), uses(13, inv(1, 0)), uses(3, and_gate(0, 1, 0)), uses(21, or_gate(1, 0, 1)), uses(5, or_gate(0, 0, 0))]).
proof(28, gcc(1, [1, 1, 1], [1, 0, 1]), rule(15, at(25, 1)), [uses(27, netb(1, 1, 1, 1, 0)), uses(25, neta(1, 1, 1)), uses(15, dff(1, 1, 1, 1)), uses(19, dff(0, 1, 1, 0)), uses(15, dff(1, 1, 1, 1))]).
proof(29, netb(1, 0, 1, 1, 0), rule(14, at(21, 1)), [uses(7, and_gate(1, 1, 1)), uses(13, inv(1, 0)), uses(1, and_gate(0, 0, 0)), uses(13, inv(1, 0)), uses(3, and_gate(0, 1, 0)), uses(21, or_gate(1, 0, 1)), uses(5, or_gate(0, 0, 0))]).
proof(30, neta(1, 0, 0), rule(13, at(18, 1)), [uses(4, and_gate(1, 0, 0)), uses(13, inv(1, 0)), uses(2, inv(0, 1)), uses(3, and_gate(0, 1, 0)), uses(5, or_gate(0, 0, 0))]).
proof(31, gcc(1, [1, 0, 1], [1, 0, 0]), rule(15, at(25, 1)), [uses(29, netb(1, 0, 1, 1, 0)), uses(30, neta(1, 0, 0)), uses(15, dff(1, 1, 1, 1)), uses(10, dff(0, 1, 0, 0)), uses(19, dff(0, 1, 1, 0))]).
proof(32, netb(1, 0, 0, 0, 0), rule(14, at(21, 1)), [uses(4, and_gate(1, 0, 0)), uses(2, inv(0, 1)), uses(3, and_gate(0, 1, 0)), uses(13, inv(1, 0)), uses(1, and_gate(0, 0, 0)), uses(5, or_gate(0, 0, 0)), uses(5, or_gate(0, 0, 0))]).
proof(33, gcc(1, [1, 0, 0], [0, 0, 0]), rule(15, at(25, 1)), [uses(32, netb(1, 0, 0, 0, 0)), uses(30, neta(1, 0, 0)), uses(19, dff(0, 1, 1, 0)), uses(10, dff(0, 1, 0, 0)), uses(10, dff(0, 1, 0, 0))]).
proof(34, counter([], [0, 0, 1], []), rule(16, at(29, 1)), []).
proof(35, counter([1], [0, 0, 0], [[0, 0, 1]]), rule(17, at(30, 1)), [uses(12, gcc(1, [0, 0, 0], [0, 0, 1])), uses(34, counter([], [0, 0, 1], []))]).
proof(36, counter([1, 1], [1, 0, 0], [[0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(33, gcc(1, [1, 0, 0], [0, 0, 0])), uses(35, counter([1], [0, 0, 0], [[0, 0, 1]]))]).
proof(37, counter([1, 1, 1], [1, 0, 1], [[1, 0, 0], [0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(31, gcc(1, [1, 0, 1], [1, 0, 0])), uses(36, counter([1, 1], [1, 0, 0], [[0, 0, 0], [0, 0, 1]]))]).
proof(38, counter([1, 1, 1, 1], [1, 1, 1], [[1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(28, gcc(1, [1, 1, 1], [1, 0, 1])), uses(37, counter([1, 1, 1], [1, 0, 1], [[1, 0, 0], [0, 0, 0], [0, 0, 1]]))]).
proof(39, counter([1, 1, 1, 1, 1], [1, 1, 0], [[1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(26, gcc(1, [1, 1, 0], [1, 1, 1])), uses(38, counter([1, 1, 1, 1], [1, 1, 1], [[1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]))]).
proof(40, counter([1, 1, 1, 1, 1, 1], [0, 1, 0], [[1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(23, gcc(1, [0, 1, 0], [1, 1, 0])), uses(39, counter([1, 1, 1, 1, 1], [1, 1, 0], [[1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]))]).
proof(41, counter([1, 1, 1, 1, 1, 1, 1], [0, 1, 1], [[0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(20, gcc(1, [0, 1, 1], [0, 1, 0])), uses(40, counter([1, 1, 1, 1, 1, 1], [0, 1, 0], [[1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]))]).
proof(42, counter([1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1], [[0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(16, gcc(1, [0, 0, 1], [0, 1, 1])), uses(41, counter([1, 1, 1, 1, 1, 1, 1], [0, 1, 1], [[0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]))]).
proof(43, counter([1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0], [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]), rule(17, at(30, 1)), [uses(12, gcc(1, [0, 0, 0], [0, 0, 1])), uses(42, counter([1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1], [[0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]))]).
proof(44, solution([[[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]]), query, [uses(43, counter([1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0], [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]))]).
proof(45, and_gate(1, 1, 1), rule(4, at(8, 1)), []).
proof(46, inv(1, 0), rule(10, at(14, 1)), []).
proof(47, and_gate(0, 0, 0), rule(1, at(5, 1)), []).
proof(48, and_gate(0, 1, 0), rule(2, at(6, 1)), []).
proof(49, or_gate(1, 0, 1), rule(7, at(11, 1)), []).
proof(50, or_gate(0, 0, 0), rule(5, at(9, 1)), []).
proof(51, netb(1, 0, 1, 1, 0), rule(14, at(21, 1)), [uses(45, and_gate(1, 1, 1)), uses(46, inv(1, 0)), uses(47, and_gate(0, 0, 0)), uses(46, inv(1, 0)), uses(48, and_gate(0, 1, 0)), uses(49, or_gate(1, 0, 1)), uses(50, or_gate(0, 0, 0))]).
proof(52, and_gate(1, 0, 0), rule(3, at(7, 1)), []).
proof(53, inv(0, 1), rule(9, at(13, 1)), []).
proof(54, neta(1, 0, 0), rule(13, at(18, 1)), [uses(52, and_gate(1, 0, 0)), uses(46, inv(1, 0)), uses(53, inv(0, 1)), uses(48, and_gate(0, 1, 0)), uses(50, or_gate(0, 0, 0))]).
proof(55, dff(1, 0, 1, 1), rule(11, at(15, 1)), []).
proof(56, dff(0, 0, 0, 0), rule(11, at(15, 1)), []).
proof(57, dff(0, 0, 1, 1), rule(11, at(15, 1)), []).
proof(58, gcc(0, [1, 0, 1], [1, 0, 1]), rule(15, at(25, 1)), [uses(51, netb(1, 0, 1, 1, 0)), uses(54, neta(1, 0, 0)), uses(55, dff(1, 0, 1, 1)), uses(56, dff(0, 0, 0, 0)), uses(57, dff(0, 0, 1, 1))]).
proof(59, solution([[1, 0, 1]]), query, [uses(58, gcc(0, [1, 0, 1], [1, 0, 1]))]).
