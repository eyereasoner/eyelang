# Eyelang result format 1
query(1, at(4, 1), [call(eligible(?v0))], [binding("person", ?v0)]).
result(1, complete, 1).
answer(1, [binding("person", alice)]).
why(1, [binding("person", alice)], 6).
proof(1, person(alice), rule(1, at(2, 1)), []).
proof(2, person(bob), rule(2, at(2, 16)), []).
proof(3, eligible(alice), rule(4, at(3, 1)), [uses(1, person(alice)), absent(blocked(alice), complete)]).
proof(4, blocked(bob), rule(3, at(2, 29)), []).
proof(5, solution([]), query, [uses(4, blocked(bob))]).
proof(6, solution([alice]), query, [uses(3, eligible(alice))]).
