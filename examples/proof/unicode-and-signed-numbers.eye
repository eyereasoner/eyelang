# Eyelang result format 1
query(1, at(4, 1), [call(unicode_decoded())], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 3).
query(2, at(4, 22), [call(below_zero())], []).
result(2, complete, 1).
answer(2, []).
why(2, [], 6).
proof(1, text(sample, "ABC"), rule(1, at(2, 1)), []).
proof(2, unicode_decoded(), rule(3, at(3, 1)), [uses(1, text(sample, "ABC"))]).
proof(3, solution([]), query, [uses(2, unicode_decoded())]).
proof(4, delta(thermo, -12), rule(2, at(2, 22)), []).
proof(5, below_zero(), rule(4, at(3, 41)), [uses(4, delta(thermo, -12)), compared("<", -12, 0)]).
proof(6, solution([]), query, [uses(5, below_zero())]).
