# Eyelang result format 1
query(1, at(7, 1), [call(risk(?v0, ?v1)), call(rank(?v0, ?v2))], [binding("clause", ?v0), binding("score", ?v1), binding("rank", ?v2)]).
result(1, complete, 4).
answer(1, [binding("clause", c1), binding("score", 20), binding("rank", high)]).
why(1, [binding("clause", c1), binding("score", 20), binding("rank", high)], 25).
answer(1, [binding("clause", c2), binding("score", 15), binding("rank", high)]).
why(1, [binding("clause", c2), binding("score", 15), binding("rank", high)], 26).
answer(1, [binding("clause", c3), binding("score", 12), binding("rank", medium)]).
why(1, [binding("clause", c3), binding("score", 12), binding("rank", medium)], 27).
answer(1, [binding("clause", c4), binding("score", 10), binding("rank", medium)]).
why(1, [binding("clause", c4), binding("score", 10), binding("rank", medium)], 28).
proof(1, conflict(c1, data_cannot_be_removed), rule(5, at(3, 1)), []).
proof(2, conflict(c2, prior_notice), rule(6, at(3, 39)), []).
proof(3, conflict(c3, no_sharing), rule(7, at(3, 67)), []).
proof(4, conflict(c4, portability), rule(8, at(3, 93)), []).
proof(5, need(data_cannot_be_removed, 20), rule(1, at(2, 1)), []).
proof(6, need(prior_notice, 15), rule(2, at(2, 35)), []).
proof(7, need(no_sharing, 12), rule(3, at(2, 59)), []).
proof(8, need(portability, 10), rule(4, at(2, 81)), []).
proof(9, risk(c1, 20), rule(9, at(4, 1)), [uses(1, conflict(c1, data_cannot_be_removed)), uses(5, need(data_cannot_be_removed, 20))]).
proof(10, risk(c2, 15), rule(9, at(4, 1)), [uses(2, conflict(c2, prior_notice)), uses(6, need(prior_notice, 15))]).
proof(11, risk(c3, 12), rule(9, at(4, 1)), [uses(3, conflict(c3, no_sharing)), uses(7, need(no_sharing, 12))]).
proof(12, risk(c4, 10), rule(9, at(4, 1)), [uses(4, conflict(c4, portability)), uses(8, need(portability, 10))]).
proof(13, conflict(c1, data_cannot_be_removed), rule(5, at(3, 1)), []).
proof(14, conflict(c2, prior_notice), rule(6, at(3, 39)), []).
proof(15, conflict(c3, no_sharing), rule(7, at(3, 67)), []).
proof(16, conflict(c4, portability), rule(8, at(3, 93)), []).
proof(17, risk(c1, 20), rule(9, at(4, 1)), [uses(13, conflict(c1, data_cannot_be_removed)), uses(5, need(data_cannot_be_removed, 20))]).
proof(18, risk(c2, 15), rule(9, at(4, 1)), [uses(14, conflict(c2, prior_notice)), uses(6, need(prior_notice, 15))]).
proof(19, risk(c3, 12), rule(9, at(4, 1)), [uses(15, conflict(c3, no_sharing)), uses(7, need(no_sharing, 12))]).
proof(20, risk(c4, 10), rule(9, at(4, 1)), [uses(16, conflict(c4, portability)), uses(8, need(portability, 10))]).
proof(21, rank(c1, high), rule(10, at(5, 1)), [uses(17, risk(c1, 20)), compared(">=", 20, 15)]).
proof(22, rank(c2, high), rule(10, at(5, 1)), [uses(18, risk(c2, 15)), compared(">=", 15, 15)]).
proof(23, rank(c3, medium), rule(11, at(6, 1)), [uses(19, risk(c3, 12)), compared(">=", 12, 10), compared("<", 12, 15)]).
proof(24, rank(c4, medium), rule(11, at(6, 1)), [uses(20, risk(c4, 10)), compared(">=", 10, 10), compared("<", 10, 15)]).
proof(25, solution([c1, 20, high]), query, [uses(9, risk(c1, 20)), uses(21, rank(c1, high))]).
proof(26, solution([c2, 15, high]), query, [uses(10, risk(c2, 15)), uses(22, rank(c2, high))]).
proof(27, solution([c3, 12, medium]), query, [uses(11, risk(c3, 12)), uses(23, rank(c3, medium))]).
proof(28, solution([c4, 10, medium]), query, [uses(12, risk(c4, 10)), uses(24, rank(c4, medium))]).
