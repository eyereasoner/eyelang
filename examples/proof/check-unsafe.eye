# Eyelang result format 1
query(1, at(5, 1), [call(seen(?v0))], [binding("someone", ?v0)]).
result(1, complete, 1).
answer(1, [binding("someone", ?v0)]).
why(1, [binding("someone", ?v0)], 3).
proof(1, knows(alice, bob), rule(1, at(2, 1)), []).
proof(2, seen(?v0), rule(2, at(4, 1)), [uses(1, knows(alice, bob))]).
proof(3, solution([?v0]), query, [uses(2, seen(?v0))]).
