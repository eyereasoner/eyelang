# Eyelang result format 1
query(1, at(4, 1), [call(large_town(?v0))], [binding("town", ?v0)]).
result(1, complete, 1).
answer(1, [binding("town", town2)]).
why(1, [binding("town", town2)], 4).
proof(1, population(town1, 1000), rule(1, at(2, 1)), []).
proof(2, population(town2, 2000), rule(2, at(2, 26)), []).
proof(3, large_town(town2), rule(3, at(3, 1)), [uses(2, population(town2, 2000)), compared(">", 2000, 1500)]).
proof(4, solution([town2]), query, [uses(3, large_town(town2))]).
