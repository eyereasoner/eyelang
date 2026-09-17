# Eyelang result format 1
query(1, at(5, 1), [call(ancestor(a, ?v0))], [binding("who", ?v0)]).
result(1, complete, 3).
answer(1, [binding("who", b)]).
why(1, [binding("who", b)], 3).
answer(1, [binding("who", c)]).
why(1, [binding("who", c)], 7).
answer(1, [binding("who", d)]).
why(1, [binding("who", d)], 12).
proof(1, parent(a, b), rule(1, at(2, 1)), []).
proof(2, ancestor(a, b), rule(4, at(3, 1)), [uses(1, parent(a, b))]).
proof(3, solution([b]), query, [uses(2, ancestor(a, b))]).
proof(4, parent(b, c), rule(2, at(2, 15)), []).
proof(5, ancestor(b, c), rule(4, at(3, 1)), [uses(4, parent(b, c))]).
proof(6, ancestor(a, c), rule(5, at(4, 1)), [uses(1, parent(a, b)), uses(5, ancestor(b, c))]).
proof(7, solution([c]), query, [uses(6, ancestor(a, c))]).
proof(8, parent(c, d), rule(3, at(2, 29)), []).
proof(9, ancestor(c, d), rule(4, at(3, 1)), [uses(8, parent(c, d))]).
proof(10, ancestor(b, d), rule(5, at(4, 1)), [uses(4, parent(b, c)), uses(9, ancestor(c, d))]).
proof(11, ancestor(a, d), rule(5, at(4, 1)), [uses(1, parent(a, b)), uses(10, ancestor(b, d))]).
proof(12, solution([d]), query, [uses(11, ancestor(a, d))]).
