# Eyelang result format 1
query(1, at(6, 1), [call(ancestor(none, none))], []).
result(1, complete, 1).
answer(1, []).
why(1, [], 4).
proof(1, parent(none, none), rule(1, at(3, 1)), []).
proof(2, parent(none, none), rule(1, at(3, 1)), []).
proof(3, ancestor(none, none), rule(2, at(4, 1)), [uses(1, parent(none, none))]).
proof(4, solution([]), query, [uses(3, ancestor(none, none))]).
