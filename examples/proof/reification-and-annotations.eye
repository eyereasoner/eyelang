# Eyelang result format 1
query(1, at(17, 1), [call(statement_source(?v0, ?v1))], [binding("speaker", ?v0), binding("source", ?v1)]).
result(1, complete, 2).
answer(1, [binding("speaker", alice), binding("source", chat)]).
why(1, [binding("speaker", alice), binding("source", chat)], 7).
answer(1, [binding("speaker", bob), binding("source", email)]).
why(1, [binding("speaker", bob), binding("source", email)], 8).
query(2, at(18, 1), [call(statement(bob, says, hi))], []).
result(2, complete, 0).
query(3, at(19, 1), [call(certainty(blank(claim1), ?v0))], [binding("certainty", ?v0)]).
result(3, complete, 1).
answer(3, [binding("certainty", 0.9)]).
why(3, [binding("certainty", 0.9)], 10).
proof(1, reifies(blank(claim1), triple(alice, says, hello)), rule(2, at(8, 1)), []).
proof(2, reifies(bobClaim, triple(bob, says, hi)), rule(5, at(11, 1)), []).
proof(3, source(blank(claim1), chat), rule(3, at(9, 1)), []).
proof(4, source(bobClaim, email), rule(6, at(12, 1)), []).
proof(5, statement_source(alice, chat), rule(7, at(14, 1)), [uses(1, reifies(blank(claim1), triple(alice, says, hello))), uses(3, source(blank(claim1), chat))]).
proof(6, statement_source(bob, email), rule(7, at(14, 1)), [uses(2, reifies(bobClaim, triple(bob, says, hi))), uses(4, source(bobClaim, email))]).
proof(7, solution([alice, chat]), query, [uses(5, statement_source(alice, chat))]).
proof(8, solution([bob, email]), query, [uses(6, statement_source(bob, email))]).
proof(9, certainty(blank(claim1), 0.9), rule(4, at(10, 1)), []).
proof(10, solution([0.9]), query, [uses(9, certainty(blank(claim1), 0.9))]).
