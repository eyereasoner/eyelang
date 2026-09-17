# Eyelit result format 1
query(1, at(12, 1), [call(type([], app(lam(x, var(x)), int_lit(42)), ?v0))], [binding("type", ?v0)]).
result(1, complete, 1).
answer(1, [binding("type", int)]).
why(1, [binding("type", int)], 6).
query(2, at(13, 1), [call(type([], lam(x, var(x)), ?v0))], [binding("type", ?v0)]).
result(2, complete, 1).
answer(2, [binding("type", fun(?v0, ?v0))]).
why(2, [binding("type", fun(?v0, ?v0))], 10).
proof(1, lookup(x, [binding(x, ?v0)], ?v0), rule(1, at(3, 1)), []).
proof(2, type([binding(x, ?v0)], var(x), ?v0), rule(4, at(7, 1)), [uses(1, lookup(x, [binding(x, ?v0)], ?v0))]).
proof(3, type([], lam(x, var(x)), fun(?v0, ?v0)), rule(5, at(8, 1)), [uses(2, type([binding(x, ?v0)], var(x), ?v0))]).
proof(4, type([], int_lit(42), int), rule(3, at(6, 1)), []).
proof(5, type([], app(lam(x, var(x)), int_lit(42)), int), rule(6, at(10, 1)), [uses(3, type([], lam(x, var(x)), fun(int, int))), uses(4, type([], int_lit(42), int))]).
proof(6, solution([int]), query, [uses(5, type([], app(lam(x, var(x)), int_lit(42)), int))]).
proof(7, lookup(x, [binding(x, ?v0)], ?v0), rule(1, at(3, 1)), []).
proof(8, type([binding(x, ?v0)], var(x), ?v0), rule(4, at(7, 1)), [uses(7, lookup(x, [binding(x, ?v0)], ?v0))]).
proof(9, type([], lam(x, var(x)), fun(?v0, ?v0)), rule(5, at(8, 1)), [uses(8, type([binding(x, ?v0)], var(x), ?v0))]).
proof(10, solution([fun(?v0, ?v0)]), query, [uses(9, type([], lam(x, var(x)), fun(?v0, ?v0)))]).
