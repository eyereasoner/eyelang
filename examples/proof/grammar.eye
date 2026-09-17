# Eyelang result format 1
query(1, at(8, 1), [call(sentence(?v0, [open, door], []))], [binding("ast", ?v0)]).
result(1, complete, 1).
answer(1, [binding("ast", command(open, door))]).
why(1, [binding("ast", command(open, door))], 4).
query(2, at(9, 1), [call(sentence(command(close, window), ?v0, []))], [binding("words", ?v0)]).
result(2, complete, 1).
answer(2, [binding("words", [close, window])]).
why(2, [binding("words", [close, window])], 8).
proof(1, verb(open, [open, door], [door]), rule(2, at(4, 1)), []).
proof(2, noun(door, [door], []), rule(4, at(6, 1)), []).
proof(3, sentence(command(open, door), [open, door], []), rule(1, at(2, 1)), [uses(1, verb(open, [open, door], [door])), uses(2, noun(door, [door], []))]).
proof(4, solution([command(open, door)]), query, [uses(3, sentence(command(open, door), [open, door], []))]).
proof(5, verb(close, [close | ?v0], ?v0), rule(3, at(5, 1)), []).
proof(6, noun(window, [window], []), rule(5, at(7, 1)), []).
proof(7, sentence(command(close, window), [close, window], []), rule(1, at(2, 1)), [uses(5, verb(close, [close, window], [window])), uses(6, noun(window, [window], []))]).
proof(8, solution([[close, window]]), query, [uses(7, sentence(command(close, window), [close, window], []))]).
