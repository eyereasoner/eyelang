# Eyelang result format 1
query(1, at(2, 39), [call(mortal(socrates))], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 3).
proof(1, man(socrates), rule(1, at(2, 1)), []).
proof(2, mortal(socrates), rule(2, at(2, 16)), [uses(1, man(socrates))]).
proof(3, solution([]), query, [uses(2, mortal(socrates))]).
