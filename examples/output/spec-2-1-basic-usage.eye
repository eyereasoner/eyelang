# Eyelang result format 1
query(1, at(4, 1), [call(child(?v0, ?v1))], [binding("child", ?v0), binding("parent", ?v1)]).
result(1, complete, 3).
answer(1, [binding("child", x), binding("parent", a)]).
answer(1, [binding("child", x), binding("parent", b)]).
answer(1, [binding("child", a), binding("parent", c)]).
