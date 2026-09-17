# Eyelang result format 1
query(1, at(16, 1), [call(hanoi(3, left, right, center, ?v0))], [binding("moves", ?v0)]).
result(1, complete, 1).
answer(1, [binding("moves", [[left, right], [left, center], [right, center], [left, right], [center, left], [center, right], [left, right]])]).
