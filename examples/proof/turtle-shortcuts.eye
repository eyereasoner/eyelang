# Eyelang result format 1
query(1, at(4, 1), [call(known_by(?v0, ?v1, ?v2))], [binding("friend", ?v0), binding("person", ?v1), binding("score", ?v2)]).
result(1, complete, 2).
answer(1, [binding("friend", bob), binding("person", alice), binding("score", 8)]).
why(1, [binding("friend", bob), binding("person", alice), binding("score", 8)], 6).
answer(1, [binding("friend", carol), binding("person", alice), binding("score", 8)]).
why(1, [binding("friend", carol), binding("person", alice), binding("score", 8)], 7).
proof(1, knows(alice, bob), rule(1, at(2, 1)), []).
proof(2, knows(alice, carol), rule(2, at(2, 20)), []).
proof(3, score(alice, 8), rule(3, at(2, 41)), []).
proof(4, known_by(bob, alice, 8), rule(5, at(3, 1)), [uses(1, knows(alice, bob)), uses(3, score(alice, 8)), compared(">=", 8, 5)]).
proof(5, known_by(carol, alice, 8), rule(5, at(3, 1)), [uses(2, knows(alice, carol)), uses(3, score(alice, 8)), compared(">=", 8, 5)]).
proof(6, solution([bob, alice, 8]), query, [uses(4, known_by(bob, alice, 8))]).
proof(7, solution([carol, alice, 8]), query, [uses(5, known_by(carol, alice, 8))]).
