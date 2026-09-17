# Eyelang result format 1
query(1, at(5, 1), [call(priority(?v0))], [binding("person", ?v0)]).
result(1, complete, 2).
answer(1, [binding("person", alice)]).
answer(1, [binding("person", carol)]).
query(2, at(5, 24), [call(ordinary(?v0))], [binding("person", ?v0)]).
result(2, complete, 1).
answer(2, [binding("person", bob)]).
