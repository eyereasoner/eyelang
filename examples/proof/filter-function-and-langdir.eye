# Eyelang result format 1
query(1, at(5, 1), [call(negative(?v0))], [binding("x", ?v0)]).
result(1, complete, 1).
answer(1, [binding("x", n1)]).
why(1, [binding("x", n1)], 4).
query(2, at(5, 19), [call(language_direction(msg, ?v0))], [binding("direction", ?v0)]).
result(2, complete, 1).
answer(2, [binding("direction", ltr)]).
why(2, [binding("direction", ltr)], 7).
proof(1, value(n1, -3.5), rule(1, at(2, 1)), []).
proof(2, value(n2, 7), rule(2, at(2, 18)), []).
proof(3, negative(n1), rule(4, at(3, 1)), [uses(1, value(n1, -3.5)), compared("<", -3.5, 0)]).
proof(4, solution([n1]), query, [uses(3, negative(n1))]).
proof(5, directed_text(msg, literal("bonjour", fr, ltr)), rule(3, at(2, 32)), []).
proof(6, language_direction(msg, ltr), rule(5, at(4, 1)), [uses(5, directed_text(msg, literal("bonjour", fr, ltr)))]).
proof(7, solution([ltr]), query, [uses(6, language_direction(msg, ltr))]).
