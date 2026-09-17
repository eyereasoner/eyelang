# Eyelit result format 1
query(1, at(9, 1), [call(eligible(?v0))], [binding("person", ?v0)]).
result(1, complete, 1).
answer(1, [binding("person", bob)]).
why(1, [binding("person", bob)], 10).
proof(1, person(alice), rule(1, at(2, 1)), []).
proof(2, person(bob), rule(2, at(3, 1)), []).
proof(3, person(carol), rule(3, at(4, 1)), []).
proof(4, blocked(alice), rule(4, at(5, 1)), []).
proof(5, solution([]), query, [uses(4, blocked(alice))]).
proof(6, eligible(bob), rule(6, at(7, 1)), [uses(2, person(bob)), absent(blocked(bob), complete)]).
proof(7, flagged(carol), rule(5, at(6, 1)), []).
proof(8, blocked(carol), rule(7, at(8, 1)), [uses(7, flagged(carol))]).
proof(9, solution([]), query, [uses(8, blocked(carol))]).
proof(10, solution([bob]), query, [uses(6, eligible(bob))]).
