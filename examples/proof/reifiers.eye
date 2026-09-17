# Eyelang result format 1
query(1, at(5, 1), [call(statement_source(?v0, ?v1))], [binding("speaker", ?v0), binding("source", ?v1)]).
result(1, complete, 2).
answer(1, [binding("speaker", alice), binding("source", chat)]).
why(1, [binding("speaker", alice), binding("source", chat)], 7).
answer(1, [binding("speaker", bob), binding("source", email)]).
why(1, [binding("speaker", bob), binding("source", email)], 8).
query(2, at(5, 42), [call(reifies(?v0, ?v1))], [binding("claim", ?v0), binding("statement", ?v1)]).
result(2, complete, 2).
answer(2, [binding("claim", claim1), binding("statement", triple(alice, says, hello))]).
why(2, [binding("claim", claim1), binding("statement", triple(alice, says, hello))], 11).
answer(2, [binding("claim", claim2), binding("statement", triple(bob, says, hi))]).
why(2, [binding("claim", claim2), binding("statement", triple(bob, says, hi))], 12).
proof(1, reifies(claim1, triple(alice, says, hello)), rule(1, at(2, 1)), []).
proof(2, reifies(claim2, triple(bob, says, hi)), rule(3, at(3, 1)), []).
proof(3, source(claim1, chat), rule(2, at(2, 46)), []).
proof(4, source(claim2, email), rule(4, at(3, 41)), []).
proof(5, statement_source(alice, chat), rule(5, at(4, 1)), [uses(1, reifies(claim1, triple(alice, says, hello))), uses(3, source(claim1, chat))]).
proof(6, statement_source(bob, email), rule(5, at(4, 1)), [uses(2, reifies(claim2, triple(bob, says, hi))), uses(4, source(claim2, email))]).
proof(7, solution([alice, chat]), query, [uses(5, statement_source(alice, chat))]).
proof(8, solution([bob, email]), query, [uses(6, statement_source(bob, email))]).
proof(9, reifies(claim1, triple(alice, says, hello)), rule(1, at(2, 1)), []).
proof(10, reifies(claim2, triple(bob, says, hi)), rule(3, at(3, 1)), []).
proof(11, solution([claim1, triple(alice, says, hello)]), query, [uses(9, reifies(claim1, triple(alice, says, hello)))]).
proof(12, solution([claim2, triple(bob, says, hi)]), query, [uses(10, reifies(claim2, triple(bob, says, hi)))]).
