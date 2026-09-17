# Eyelit result format 1
query(1, at(7, 1), [call(ancestor(alice, ?v0))], [binding("who", ?v0)]).
result(1, complete, 3).
answer(1, [binding("who", bob)]).
why(1, [binding("who", bob)], 3).
answer(1, [binding("who", carol)]).
why(1, [binding("who", carol)], 7).
answer(1, [binding("who", dana)]).
why(1, [binding("who", dana)], 12).
proof(1, parent(alice, bob), rule(1, at(2, 1)), []).
proof(2, ancestor(alice, bob), rule(4, at(5, 1)), [uses(1, parent(alice, bob))]).
proof(3, solution([bob]), query, [uses(2, ancestor(alice, bob))]).
proof(4, parent(bob, carol), rule(2, at(3, 1)), []).
proof(5, ancestor(bob, carol), rule(4, at(5, 1)), [uses(4, parent(bob, carol))]).
proof(6, ancestor(alice, carol), rule(5, at(6, 1)), [uses(1, parent(alice, bob)), uses(5, ancestor(bob, carol))]).
proof(7, solution([carol]), query, [uses(6, ancestor(alice, carol))]).
proof(8, parent(carol, dana), rule(3, at(4, 1)), []).
proof(9, ancestor(carol, dana), rule(4, at(5, 1)), [uses(8, parent(carol, dana))]).
proof(10, ancestor(bob, dana), rule(5, at(6, 1)), [uses(4, parent(bob, carol)), uses(9, ancestor(carol, dana))]).
proof(11, ancestor(alice, dana), rule(5, at(6, 1)), [uses(1, parent(alice, bob)), uses(10, ancestor(bob, dana))]).
proof(12, solution([dana]), query, [uses(11, ancestor(alice, dana))]).
