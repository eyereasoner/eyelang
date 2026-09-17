# Eyelang result format 1
query(1, at(4, 1), [call(known_by(?v0, ?v1, ?v2))], [binding("friend", ?v0), binding("person", ?v1), binding("score", ?v2)]).
result(1, complete, 2).
answer(1, [binding("friend", bob), binding("person", alice), binding("score", 8)]).
answer(1, [binding("friend", carol), binding("person", alice), binding("score", 8)]).
