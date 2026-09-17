# Eyelang result format 1
query(1, at(7, 1), [call(best(?v0, ?v1))], [binding("path", ?v0), binding("cost", ?v1)]).
result(1, complete, 3).
answer(1, [binding("path", ab), binding("cost", 2)]).
answer(1, [binding("path", abc), binding("cost", 3)]).
answer(1, [binding("path", abcd), binding("cost", 5)]).
