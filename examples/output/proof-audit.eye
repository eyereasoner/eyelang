# Eyelit result format 1
query(1, at(34, 1), [call(depends_on(3, ?v0))], [binding("ancestor", ?v0)]).
result(1, complete, 2).
answer(1, [binding("ancestor", 2)]).
answer(1, [binding("ancestor", 1)]).
query(2, at(35, 1), [call(support(1, ?v0))], [binding("fact", ?v0)]).
result(2, complete, 1).
answer(2, [binding("fact", human(socrates))]).
