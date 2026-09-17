# Eyelang result format 1
query(1, at(5, 1), [call(eligible(?v0))], [binding("person", ?v0)]).
result(1, complete, 1).
answer(1, [binding("person", bob)]).
why(1, [binding("person", bob)], 11).
proof(1, person(alice), rule(1, at(2, 1)), []).
proof(2, person(bob), rule(2, at(2, 16)), []).
proof(3, person(carol), rule(3, at(2, 29)), []).
proof(4, directly_blocked(alice), rule(4, at(2, 44)), []).
proof(5, blocked(alice), rule(6, at(3, 1)), [uses(4, directly_blocked(alice))]).
proof(6, solution([]), query, [uses(5, blocked(alice))]).
proof(7, eligible(bob), rule(8, at(4, 1)), [uses(2, person(bob)), absent(blocked(bob), complete)]).
proof(8, flagged(carol), rule(5, at(2, 69)), []).
proof(9, blocked(carol), rule(7, at(3, 38)), [uses(8, flagged(carol))]).
proof(10, solution([]), query, [uses(9, blocked(carol))]).
proof(11, solution([bob]), query, [uses(7, eligible(bob))]).
