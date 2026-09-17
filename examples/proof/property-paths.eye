# Eyelit result format 1
query(1, at(10, 1), [call(grandparent_of(?v0, ?v1))], [binding("person", ?v0), binding("grandchild", ?v1)]).
result(1, complete, 1).
answer(1, [binding("person", alice), binding("grandchild", carol)]).
why(1, [binding("person", alice), binding("grandchild", carol)], 5).
query(2, at(11, 1), [call(has_parent(?v0, ?v1))], [binding("child", ?v0), binding("parent", ?v1)]).
result(2, complete, 2).
answer(2, [binding("child", bob), binding("parent", alice)]).
why(2, [binding("child", bob), binding("parent", alice)], 10).
answer(2, [binding("child", carol), binding("parent", bob)]).
why(2, [binding("child", carol), binding("parent", bob)], 11).
proof(1, parent_of(alice, bob), rule(1, at(5, 1)), []).
proof(2, parent_of(bob, carol), rule(2, at(6, 1)), []).
proof(3, parent_of(bob, carol), rule(2, at(6, 1)), []).
proof(4, grandparent_of(alice, carol), rule(3, at(7, 1)), [uses(1, parent_of(alice, bob)), uses(3, parent_of(bob, carol))]).
proof(5, solution([alice, carol]), query, [uses(4, grandparent_of(alice, carol))]).
proof(6, parent_of(alice, bob), rule(1, at(5, 1)), []).
proof(7, parent_of(bob, carol), rule(2, at(6, 1)), []).
proof(8, has_parent(bob, alice), rule(4, at(8, 1)), [uses(6, parent_of(alice, bob))]).
proof(9, has_parent(carol, bob), rule(4, at(8, 1)), [uses(7, parent_of(bob, carol))]).
proof(10, solution([bob, alice]), query, [uses(8, has_parent(bob, alice))]).
proof(11, solution([carol, bob]), query, [uses(9, has_parent(carol, bob))]).
