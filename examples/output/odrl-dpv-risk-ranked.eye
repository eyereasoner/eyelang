# Eyelang result format 1
query(1, at(7, 1), [call(risk(?v0, ?v1)), call(rank(?v0, ?v2))], [binding("clause", ?v0), binding("score", ?v1), binding("rank", ?v2)]).
result(1, complete, 4).
answer(1, [binding("clause", c1), binding("score", 20), binding("rank", high)]).
answer(1, [binding("clause", c2), binding("score", 15), binding("rank", high)]).
answer(1, [binding("clause", c3), binding("score", 12), binding("rank", medium)]).
answer(1, [binding("clause", c4), binding("score", 10), binding("rank", medium)]).
