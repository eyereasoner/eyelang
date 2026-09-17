# Eyelang result format 1
query(1, at(7, 1), [call(descended(?v0, ?v1))], [binding("person", ?v0), binding("ancestor", ?v1)]).
result(1, complete, 4).
answer(1, [binding("person", x), binding("ancestor", a)]).
why(1, [binding("person", x), binding("ancestor", a)], 10).
answer(1, [binding("person", x), binding("ancestor", b)]).
why(1, [binding("person", x), binding("ancestor", b)], 11).
answer(1, [binding("person", a), binding("ancestor", c)]).
why(1, [binding("person", a), binding("ancestor", c)], 12).
answer(1, [binding("person", x), binding("ancestor", c)]).
why(1, [binding("person", x), binding("ancestor", c)], 17).
proof(1, father(a, x), rule(1, at(2, 1)), []).
proof(2, mother(b, x), rule(2, at(2, 15)), []).
proof(3, mother(c, a), rule(3, at(2, 29)), []).
proof(4, child(x, a), rule(4, at(3, 1)), [uses(1, father(a, x))]).
proof(5, child(x, b), rule(5, at(4, 1)), [uses(2, mother(b, x))]).
proof(6, child(a, c), rule(5, at(4, 1)), [uses(3, mother(c, a))]).
proof(7, descended(x, a), rule(6, at(5, 1)), [uses(4, child(x, a))]).
proof(8, descended(x, b), rule(6, at(5, 1)), [uses(5, child(x, b))]).
proof(9, descended(a, c), rule(6, at(5, 1)), [uses(6, child(a, c))]).
proof(10, solution([x, a]), query, [uses(7, descended(x, a))]).
proof(11, solution([x, b]), query, [uses(8, descended(x, b))]).
proof(12, solution([a, c]), query, [uses(9, descended(a, c))]).
proof(13, mother(c, a), rule(3, at(2, 29)), []).
proof(14, child(a, c), rule(5, at(4, 1)), [uses(13, mother(c, a))]).
proof(15, descended(a, c), rule(6, at(5, 1)), [uses(14, child(a, c))]).
proof(16, descended(x, c), rule(7, at(6, 1)), [uses(4, child(x, a)), uses(15, descended(a, c))]).
proof(17, solution([x, c]), query, [uses(16, descended(x, c))]).
