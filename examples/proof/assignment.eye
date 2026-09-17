# Eyelang result format 1
query(1, at(4, 1), [call(grade(?v0, ?v1))], [binding("person", ?v0), binding("grade", ?v1)]).
result(1, complete, 1).
answer(1, [binding("person", alice), binding("grade", pass(7))]).
why(1, [binding("person", alice), binding("grade", pass(7))], 4).
proof(1, score(alice, 7), rule(1, at(2, 1)), []).
proof(2, score(bob, 3), rule(2, at(2, 18)), []).
proof(3, grade(alice, pass(7)), rule(3, at(3, 1)), [uses(1, score(alice, 7)), compared(">=", 7, 5)]).
proof(4, solution([alice, pass(7)]), query, [uses(3, grade(alice, pass(7)))]).
