# Eyelit result format 1
query(1, at(3, 1), [call(mortal(socrates))], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 3).
proof(1, human(socrates), rule(1, at(1, 1)), []).
proof(2, mortal(socrates), rule(2, at(2, 1)), [uses(1, human(socrates))]).
proof(3, solution([]), query, [uses(2, mortal(socrates))]).
