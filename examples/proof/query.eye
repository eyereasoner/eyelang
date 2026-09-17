# Eyelang result format 1
query(1, at(5, 1), [call(ancestor(?v0, ?v1))], [binding("x", ?v0), binding("y", ?v1)]).
result(1, complete, 4).
answer(1, [binding("x", alice), binding("y", bob)]).
why(1, [binding("x", alice), binding("y", bob)], 7).
answer(1, [binding("x", bob), binding("y", carol)]).
why(1, [binding("x", bob), binding("y", carol)], 8).
answer(1, [binding("x", dora), binding("y", emma)]).
why(1, [binding("x", dora), binding("y", emma)], 9).
answer(1, [binding("x", alice), binding("y", carol)]).
why(1, [binding("x", alice), binding("y", carol)], 13).
proof(1, parent(alice, bob), rule(1, at(2, 1)), []).
proof(2, parent(bob, carol), rule(2, at(2, 21)), []).
proof(3, parent(dora, emma), rule(3, at(2, 41)), []).
proof(4, ancestor(alice, bob), rule(4, at(3, 1)), [uses(1, parent(alice, bob))]).
proof(5, ancestor(bob, carol), rule(4, at(3, 1)), [uses(2, parent(bob, carol))]).
proof(6, ancestor(dora, emma), rule(4, at(3, 1)), [uses(3, parent(dora, emma))]).
proof(7, solution([alice, bob]), query, [uses(4, ancestor(alice, bob))]).
proof(8, solution([bob, carol]), query, [uses(5, ancestor(bob, carol))]).
proof(9, solution([dora, emma]), query, [uses(6, ancestor(dora, emma))]).
proof(10, parent(bob, carol), rule(2, at(2, 21)), []).
proof(11, ancestor(bob, carol), rule(4, at(3, 1)), [uses(10, parent(bob, carol))]).
proof(12, ancestor(alice, carol), rule(5, at(4, 1)), [uses(1, parent(alice, bob)), uses(11, ancestor(bob, carol))]).
proof(13, solution([alice, carol]), query, [uses(12, ancestor(alice, carol))]).
