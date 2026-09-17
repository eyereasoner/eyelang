# Eyelang result format 1
query(1, at(6, 1), [call(test())], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 5).
proof(1, animal(koko), rule(1, at(2, 1)), []).
proof(2, cat(generated_cat), rule(2, at(3, 1)), [uses(1, animal(koko))]).
proof(3, british_short_hair(generated_bsh), rule(3, at(4, 1)), [uses(1, animal(koko))]).
proof(4, test(), rule(4, at(5, 1)), [uses(2, cat(generated_cat)), uses(3, british_short_hair(generated_bsh)), compared("!=", generated_cat, generated_bsh)]).
proof(5, solution([]), query, [uses(4, test())]).
