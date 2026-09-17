# Eyelang result format 1
query(1, at(7, 1), [call(cousin(?v0, ?v1))], [binding("person", ?v0), binding("cousin", ?v1)]).
result(1, complete, 8).
answer(1, [binding("person", dave), binding("cousin", frank)]).
answer(1, [binding("person", dave), binding("cousin", grace)]).
answer(1, [binding("person", eve), binding("cousin", frank)]).
answer(1, [binding("person", eve), binding("cousin", grace)]).
answer(1, [binding("person", frank), binding("cousin", dave)]).
answer(1, [binding("person", frank), binding("cousin", eve)]).
answer(1, [binding("person", grace), binding("cousin", dave)]).
answer(1, [binding("person", grace), binding("cousin", eve)]).
