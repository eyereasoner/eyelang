# Eyelang result format 1
query(1, at(6, 1), [call(year(event1, ?v0))], [binding("year", ?v0)]).
result(1, complete, 1).
answer(1, [binding("year", 2026)]).
why(1, [binding("year", 2026)], 3).
query(2, at(6, 26), [call(quoted(?v0))], [binding("subject", ?v0)]).
result(2, complete, 1).
answer(2, [binding("subject", subject)]).
why(2, [binding("subject", subject)], 6).
proof(1, event(event1, datetime(2026, 5, 15, 10, 20, 30)), rule(1, at(2, 1)), []).
proof(2, year(event1, 2026), rule(2, at(3, 1)), [uses(1, event(event1, datetime(2026, 5, 15, 10, 20, 30)))]).
proof(3, solution([2026]), query, [uses(2, year(event1, 2026))]).
proof(4, triple_value(triple(subject, predicate, object)), rule(4, at(5, 1)), []).
proof(5, quoted(subject), rule(3, at(4, 1)), [uses(4, triple_value(triple(subject, predicate, object)))]).
proof(6, solution([subject]), query, [uses(5, quoted(subject))]).
