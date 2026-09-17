# Eyelit result format 1
query(1, at(10, 1), [call(report(?v0))], [binding("statement", ?v0)]).
result(1, complete, 1).
answer(1, [binding("statement", quoted([triple(joe, is, [good, Cobbler])]))]).
why(1, [binding("statement", quoted([triple(joe, is, [good, Cobbler])]))], 3).
query(2, at(11, 1), [call(is(joe, good))], []).
result(2, complete, 0).
proof(1, is(joe, [good, Cobbler]), rule(1, at(6, 1)), []).
proof(2, report(quoted([triple(joe, is, [good, Cobbler])])), rule(2, at(7, 1)), [uses(1, is(joe, [good, Cobbler]))]).
proof(3, solution([quoted([triple(joe, is, [good, Cobbler])])]), query, [uses(2, report(quoted([triple(joe, is, [good, Cobbler])])))]).
