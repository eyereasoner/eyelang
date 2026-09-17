# Eyelang result format 1
query(1, at(5, 1), [call(adult(?v0))], [binding("person", ?v0)]).
result(1, complete, 1).
answer(1, [binding("person", alice)]).
why(1, [binding("person", alice)], 3).
proof(1, person(alice, literal("Alice Smith", en), typed(22, integer)), rule(1, at(2, 1)), []).
proof(2, adult(alice), rule(3, at(4, 1)), [uses(1, person(alice, literal("Alice Smith", en), typed(22, integer))), compared(">=", 22, 18)]).
proof(3, solution([alice]), query, [uses(2, adult(alice))]).
