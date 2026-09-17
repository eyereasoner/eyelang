# Eyelang result format 1
query(1, at(5, 1), [call(priority(?v0))], [binding("person", ?v0)]).
result(1, complete, 2).
answer(1, [binding("person", alice)]).
why(1, [binding("person", alice)], 5).
answer(1, [binding("person", carol)]).
why(1, [binding("person", carol)], 6).
query(2, at(5, 24), [call(ordinary(?v0))], [binding("person", ?v0)]).
result(2, complete, 1).
answer(2, [binding("person", bob)]).
why(2, [binding("person", bob)], 9).
proof(1, level(alice, gold), rule(1, at(2, 1)), []).
proof(2, level(carol, platinum), rule(3, at(2, 41)), []).
proof(3, priority(alice), rule(4, at(3, 1)), [uses(1, level(alice, gold))]).
proof(4, priority(carol), rule(5, at(3, 34)), [uses(2, level(carol, platinum))]).
proof(5, solution([alice]), query, [uses(3, priority(alice))]).
proof(6, solution([carol]), query, [uses(4, priority(carol))]).
proof(7, level(bob, bronze), rule(2, at(2, 21)), []).
proof(8, ordinary(bob), rule(6, at(4, 1)), [uses(7, level(bob, bronze))]).
proof(9, solution([bob]), query, [uses(8, ordinary(bob))]).
