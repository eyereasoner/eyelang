# Eyelang result format 1
query(1, at(26, 1), [call(direct_subclass(n(4), n(5)))], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 2).
query(2, at(27, 1), [call(direct_subclass(n(4), i(5)))], []).
result(2, complete, 1).
answer(2, []).
why(2, [], 4).
query(3, at(28, 1), [call(direct_subclass(n(4), j(5)))], []).
result(3, complete, 1).
answer(3, []).
why(3, [], 6).
query(4, at(29, 1), [call(subsumed(n(0), n(10)))], []).
result(4, complete, 1).
answer(4, []).
why(4, [], 8).
query(5, at(30, 1), [call(classified_as(ind, i(5)))], []).
result(5, complete, 1).
answer(5, []).
why(5, [], 12).
query(6, at(31, 1), [call(classified_as(ind, j(10)))], []).
result(6, complete, 1).
answer(6, []).
why(6, [], 16).
query(7, at(32, 1), [call(classified_as(ind, a2))], []).
result(7, complete, 1).
answer(7, []).
why(7, [], 20).
query(8, at(33, 1), [absent(subsumed(i(5), n(10)))], []).
result(8, complete, 1).
answer(8, []).
why(8, [], 21).
query(9, at(34, 1), [absent(subsumed(i(5), j(5)))], []).
result(9, complete, 1).
answer(9, []).
why(9, [], 22).
query(10, at(35, 1), [absent(classified_as(ind, i(11)))], []).
result(10, complete, 1).
answer(10, []).
why(10, [], 24).
query(11, at(36, 1), [absent(direct_subclass(n(-1), n(0)))], []).
result(11, complete, 1).
answer(11, []).
why(11, [], 25).
query(12, at(37, 1), [absent(subsumed(a2, n(10)))], []).
result(12, complete, 1).
answer(12, []).
why(12, [], 26).
proof(1, direct_subclass(n(4), n(5)), rule(1, at(6, 1)), [compared(">=", 4, 0), compared("<", 4, 10), calculated(5, binary("+", value(4), value(1)))]).
proof(2, solution([]), query, [uses(1, direct_subclass(n(4), n(5)))]).
proof(3, direct_subclass(n(4), i(5)), rule(2, at(7, 1)), [compared(">=", 4, 0), compared("<", 4, 10), calculated(5, binary("+", value(4), value(1)))]).
proof(4, solution([]), query, [uses(3, direct_subclass(n(4), i(5)))]).
proof(5, direct_subclass(n(4), j(5)), rule(3, at(8, 1)), [compared(">=", 4, 0), compared("<", 4, 10), calculated(5, binary("+", value(4), value(1)))]).
proof(6, solution([]), query, [uses(5, direct_subclass(n(4), j(5)))]).
proof(7, subsumed(n(0), n(10)), rule(6, at(16, 1)), [compared(">=", 0, 0), compared("<", 0, 10), compared("<=", 10, 10)]).
proof(8, solution([]), query, [uses(7, subsumed(n(0), n(10)))]).
proof(9, asserted_type(ind, n(0)), rule(10, at(21, 1)), []).
proof(10, subsumed(n(0), i(5)), rule(7, at(17, 1)), [compared(">=", 0, 0), compared("<", 0, 5), compared("<=", 5, 10)]).
proof(11, classified_as(ind, i(5)), rule(11, at(22, 1)), [uses(9, asserted_type(ind, n(0))), uses(10, subsumed(n(0), i(5)))]).
proof(12, solution([]), query, [uses(11, classified_as(ind, i(5)))]).
proof(13, asserted_type(ind, n(0)), rule(10, at(21, 1)), []).
proof(14, subsumed(n(0), j(10)), rule(8, at(18, 1)), [compared(">=", 0, 0), compared("<", 0, 10), compared("<=", 10, 10)]).
proof(15, classified_as(ind, j(10)), rule(11, at(22, 1)), [uses(13, asserted_type(ind, n(0))), uses(14, subsumed(n(0), j(10)))]).
proof(16, solution([]), query, [uses(15, classified_as(ind, j(10)))]).
proof(17, asserted_type(ind, n(0)), rule(10, at(21, 1)), []).
proof(18, subsumed(n(0), a2), rule(9, at(19, 1)), [compared(">=", 0, 0), compared("<=", 0, 10)]).
proof(19, classified_as(ind, a2), rule(11, at(22, 1)), [uses(17, asserted_type(ind, n(0))), uses(18, subsumed(n(0), a2))]).
proof(20, solution([]), query, [uses(19, classified_as(ind, a2))]).
proof(21, solution([]), query, [absent(subsumed(i(5), n(10)), complete)]).
proof(22, solution([]), query, [absent(subsumed(i(5), j(5)), complete)]).
proof(23, asserted_type(ind, n(0)), rule(10, at(21, 1)), []).
proof(24, solution([]), query, [absent(classified_as(ind, i(11)), complete)]).
proof(25, solution([]), query, [absent(direct_subclass(n(-1), n(0)), complete)]).
proof(26, solution([]), query, [absent(subsumed(a2, n(10)), complete)]).
