# Eyelang result format 1
query(1, at(5, 1), [call(eligible(?v0))], [binding("person", ?v0)]).
result(1, complete, 1).
answer(1, [binding("person", bob)]).
why(1, [binding("person", bob)], 11).
clause(1, person(alice), []).
clause(2, person(bob), []).
clause(3, person(carol), []).
clause(4, directly_blocked(alice), []).
clause(5, flagged(carol), []).
clause(6, blocked(var("x")), [call(directly_blocked(var("x")))]).
clause(7, blocked(var("x")), [call(flagged(var("x")))]).
clause(8, eligible(var("x")), [call(person(var("x"))), absent(blocked(var("x")))]).
substitution(1, []).
proof(1, person(alice), rule(1, at(2, 1)), []).
substitution(2, []).
proof(2, person(bob), rule(2, at(2, 16)), []).
substitution(3, []).
proof(3, person(carol), rule(3, at(2, 29)), []).
substitution(4, []).
proof(4, directly_blocked(alice), rule(4, at(2, 44)), []).
substitution(5, [binding("x", alice)]).
proof(5, blocked(alice), rule(6, at(3, 1)), [uses(4, directly_blocked(alice))]).
substitution(6, []).
proof(6, solution([]), query, [uses(5, blocked(alice))]).
substitution(7, [binding("x", bob)]).
proof(7, eligible(bob), rule(8, at(4, 1)), [uses(2, person(bob)), absent(blocked(bob), complete)]).
substitution(8, []).
proof(8, flagged(carol), rule(5, at(2, 69)), []).
substitution(9, [binding("x", carol)]).
proof(9, blocked(carol), rule(7, at(3, 38)), [uses(8, flagged(carol))]).
substitution(10, []).
proof(10, solution([]), query, [uses(9, blocked(carol))]).
substitution(11, [binding("person", bob)]).
proof(11, solution([bob]), query, [uses(7, eligible(bob))]).
