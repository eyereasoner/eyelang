# Eyelang result format 1
query(1, at(8, 1), [call(social(?v0))], [binding("graph", ?v0)]).
result(1, complete, 1).
answer(1, [binding("graph", g1)]).
why(1, [binding("graph", g1)], 7).
proof(1, graph_term(g1, graph([triple(alice, knows, bob), triple(bob, knows, carol)])), rule(1, at(2, 1)), []).
proof(2, graph_term(g1, graph([triple(alice, knows, bob), triple(bob, knows, carol)])), rule(1, at(2, 1)), []).
proof(3, graph_term(g2, graph([triple(alice, likes, tea)])), rule(2, at(3, 1)), []).
proof(4, contains(g1, triple(alice, knows, bob)), rule(3, at(4, 1)), [uses(1, graph_term(g1, graph([triple(alice, knows, bob), triple(bob, knows, carol)])))]).
proof(5, social(g1), rule(7, at(7, 1)), [uses(4, contains(g1, triple(alice, knows, bob)))]).
proof(6, member(triple(bob, knows, carol), [triple(bob, knows, carol)]), rule(5, at(6, 1)), []).
proof(7, solution([g1]), query, [uses(5, social(g1))]).
proof(8, contains(g1, triple(bob, knows, carol)), rule(4, at(5, 1)), [uses(2, graph_term(g1, graph([triple(alice, knows, bob), triple(bob, knows, carol)]))), uses(6, member(triple(bob, knows, carol), [triple(bob, knows, carol)]))]).
