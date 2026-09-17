# Eyelang result format 1
query(1, at(6, 1), [call(same_language(msg))], []).
result(1, complete, 1).
answer(1, []).
query(2, at(6, 25), [call(event_year(clock, ?v0))], [binding("year", ?v0)]).
result(2, complete, 1).
answer(2, [binding("year", 2026)]).
