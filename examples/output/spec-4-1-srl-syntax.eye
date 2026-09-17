# Eyelang result format 1
query(1, at(5, 1), [call(both_positive(?v0))], [binding("x", ?v0)]).
result(1, complete, 1).
answer(1, [binding("x", x)]).
query(2, at(5, 24), [call(one_zero(?v0))], [binding("x", ?v0)]).
result(2, complete, 0).
