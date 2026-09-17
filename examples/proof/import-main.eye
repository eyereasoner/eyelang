# Eyelang result format 1
query(1, at(5, 1), [call(ancestor(alice, ?v0))], [binding("who", ?v0)]).
result(1, complete, 2).
answer(1, [binding("who", bob)]).
why(1, [binding("who", bob)], 3).
answer(1, [binding("who", carol)]).
why(1, [binding("who", carol)], 7).
proof(1, parent(alice, bob), rule(1, at(2, 1)), []).
proof(2, ancestor(alice, bob), rule(3, at(3, 1)), [uses(1, parent(alice, bob))]).
proof(3, solution([bob]), query, [uses(2, ancestor(alice, bob))]).
proof(4, parent(bob, carol), rule(2, at(2, 21)), []).
proof(5, ancestor(bob, carol), rule(3, at(3, 1)), [uses(4, parent(bob, carol))]).
proof(6, ancestor(alice, carol), rule(4, at(4, 1)), [uses(1, parent(alice, bob)), uses(5, ancestor(bob, carol))]).
proof(7, solution([carol]), query, [uses(6, ancestor(alice, carol))]).
