# Eyelang result format 1
query(1, at(5, 1), [call(both_positive(?v0))], [binding("x", ?v0)]).
result(1, complete, 1).
answer(1, [binding("x", x)]).
why(1, [binding("x", x)], 3).
query(2, at(5, 24), [call(one_zero(?v0))], [binding("x", ?v0)]).
result(2, complete, 0).
clause(1, values(x, 1, 2), []).
clause(2, both_positive(var("x")), [call(values(var("x"), var("a"), var("b"))), compare(">", var("a"), 0), compare(">", var("b"), 0)]).
substitution(1, []).
proof(1, values(x, 1, 2), rule(1, at(2, 1)), []).
substitution(2, [binding("x", x), binding("a", 1), binding("b", 2)]).
proof(2, both_positive(x), rule(2, at(3, 1)), [uses(1, values(x, 1, 2)), compared(">", 1, 0), compared(">", 2, 0)]).
substitution(3, [binding("x", x)]).
proof(3, solution([x]), query, [uses(2, both_positive(x))]).
