# Eyelang result format 1
query(1, at(5, 1), [call(statement_author(?v0))], [binding("who", ?v0)]).
result(1, complete, 1).
answer(1, [binding("who", bob)]).
why(1, [binding("who", bob)], 4).
proof(1, reifies(claim, triple(alice, name, "Alice")), rule(2, at(2, 34)), []).
proof(2, stated_by(claim, bob), rule(3, at(3, 1)), []).
proof(3, statement_author(bob), rule(5, at(4, 1)), [uses(1, reifies(claim, triple(alice, name, "Alice"))), uses(2, stated_by(claim, bob))]).
proof(4, solution([bob]), query, [uses(3, statement_author(bob))]).
