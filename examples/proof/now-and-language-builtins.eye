# Eyelang result format 1
query(1, at(6, 1), [call(same_language(msg))], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 3).
query(2, at(6, 25), [call(clock(?v0))], [binding("snapshot", ?v0)]).
result(2, complete, 1).
answer(2, [binding("snapshot", snapshot(datetime(2026, 5, 15, 10, 20, 30)))]).
why(2, [binding("snapshot", snapshot(datetime(2026, 5, 15, 10, 20, 30)))], 5).
proof(1, text(msg, literal("bonjour", fr)), rule(1, at(2, 1)), []).
proof(2, same_language(msg), rule(2, at(3, 1)), [uses(1, text(msg, literal("bonjour", fr)))]).
proof(3, solution([]), query, [uses(2, same_language(msg))]).
proof(4, clock(snapshot(datetime(2026, 5, 15, 10, 20, 30))), rule(3, at(5, 1)), []).
proof(5, solution([snapshot(datetime(2026, 5, 15, 10, 20, 30))]), query, [uses(4, clock(snapshot(datetime(2026, 5, 15, 10, 20, 30))))]).
