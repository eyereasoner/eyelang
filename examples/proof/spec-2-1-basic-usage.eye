# Eyelang result format 1
query(1, at(4, 1), [call(child(?v0, ?v1))], [binding("child", ?v0), binding("parent", ?v1)]).
result(1, complete, 3).
answer(1, [binding("child", x), binding("parent", a)]).
why(1, [binding("child", x), binding("parent", a)], 7).
answer(1, [binding("child", x), binding("parent", b)]).
why(1, [binding("child", x), binding("parent", b)], 8).
answer(1, [binding("child", a), binding("parent", c)]).
why(1, [binding("child", a), binding("parent", c)], 9).
proof(1, father(a, x), rule(1, at(2, 1)), []).
proof(2, mother(b, x), rule(2, at(2, 15)), []).
proof(3, mother(c, a), rule(3, at(2, 29)), []).
proof(4, child(x, a), rule(4, at(3, 1)), [uses(1, father(a, x))]).
proof(5, child(x, b), rule(5, at(3, 34)), [uses(2, mother(b, x))]).
proof(6, child(a, c), rule(5, at(3, 34)), [uses(3, mother(c, a))]).
proof(7, solution([x, a]), query, [uses(4, child(x, a))]).
proof(8, solution([x, b]), query, [uses(5, child(x, b))]).
proof(9, solution([a, c]), query, [uses(6, child(a, c))]).
