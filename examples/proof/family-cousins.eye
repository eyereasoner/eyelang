# Eyelang result format 1
query(1, at(7, 1), [call(cousin(?v0, ?v1))], [binding("person", ?v0), binding("cousin", ?v1)]).
result(1, complete, 8).
answer(1, [binding("person", dave), binding("cousin", frank)]).
why(1, [binding("person", dave), binding("cousin", frank)], 27).
answer(1, [binding("person", dave), binding("cousin", grace)]).
why(1, [binding("person", dave), binding("cousin", grace)], 28).
answer(1, [binding("person", eve), binding("cousin", frank)]).
why(1, [binding("person", eve), binding("cousin", frank)], 29).
answer(1, [binding("person", eve), binding("cousin", grace)]).
why(1, [binding("person", eve), binding("cousin", grace)], 30).
answer(1, [binding("person", frank), binding("cousin", dave)]).
why(1, [binding("person", frank), binding("cousin", dave)], 31).
answer(1, [binding("person", frank), binding("cousin", eve)]).
why(1, [binding("person", frank), binding("cousin", eve)], 32).
answer(1, [binding("person", grace), binding("cousin", dave)]).
why(1, [binding("person", grace), binding("cousin", dave)], 33).
answer(1, [binding("person", grace), binding("cousin", eve)]).
why(1, [binding("person", grace), binding("cousin", eve)], 34).
proof(1, generation(bob, 1), rule(13, at(5, 1)), []).
proof(2, generation(carol, 1), rule(14, at(5, 21)), []).
proof(3, generation(dave, 2), rule(15, at(5, 43)), []).
proof(4, generation(eve, 2), rule(16, at(5, 64)), []).
proof(5, generation(frank, 2), rule(17, at(5, 84)), []).
proof(6, generation(grace, 2), rule(18, at(5, 106)), []).
proof(7, generation(bob, 1), rule(13, at(5, 1)), []).
proof(8, generation(carol, 1), rule(14, at(5, 21)), []).
proof(9, generation(dave, 2), rule(15, at(5, 43)), []).
proof(10, generation(eve, 2), rule(16, at(5, 64)), []).
proof(11, generation(frank, 2), rule(17, at(5, 84)), []).
proof(12, generation(grace, 2), rule(18, at(5, 106)), []).
proof(13, branch(dave, b), rule(7, at(3, 1)), []).
proof(14, branch(eve, b), rule(8, at(3, 18)), []).
proof(15, branch(frank, c), rule(9, at(3, 34)), []).
proof(16, branch(grace, c), rule(10, at(3, 52)), []).
proof(17, different(b, c), rule(11, at(4, 1)), []).
proof(18, different(c, b), rule(12, at(4, 18)), []).
proof(19, cousin(dave, frank), rule(19, at(6, 1)), [uses(3, generation(dave, 2)), uses(11, generation(frank, 2)), uses(13, branch(dave, b)), uses(15, branch(frank, c)), uses(17, different(b, c))]).
proof(20, cousin(dave, grace), rule(19, at(6, 1)), [uses(3, generation(dave, 2)), uses(12, generation(grace, 2)), uses(13, branch(dave, b)), uses(16, branch(grace, c)), uses(17, different(b, c))]).
proof(21, cousin(eve, frank), rule(19, at(6, 1)), [uses(4, generation(eve, 2)), uses(11, generation(frank, 2)), uses(14, branch(eve, b)), uses(15, branch(frank, c)), uses(17, different(b, c))]).
proof(22, cousin(eve, grace), rule(19, at(6, 1)), [uses(4, generation(eve, 2)), uses(12, generation(grace, 2)), uses(14, branch(eve, b)), uses(16, branch(grace, c)), uses(17, different(b, c))]).
proof(23, cousin(frank, dave), rule(19, at(6, 1)), [uses(5, generation(frank, 2)), uses(9, generation(dave, 2)), uses(15, branch(frank, c)), uses(13, branch(dave, b)), uses(18, different(c, b))]).
proof(24, cousin(frank, eve), rule(19, at(6, 1)), [uses(5, generation(frank, 2)), uses(10, generation(eve, 2)), uses(15, branch(frank, c)), uses(14, branch(eve, b)), uses(18, different(c, b))]).
proof(25, cousin(grace, dave), rule(19, at(6, 1)), [uses(6, generation(grace, 2)), uses(9, generation(dave, 2)), uses(16, branch(grace, c)), uses(13, branch(dave, b)), uses(18, different(c, b))]).
proof(26, cousin(grace, eve), rule(19, at(6, 1)), [uses(6, generation(grace, 2)), uses(10, generation(eve, 2)), uses(16, branch(grace, c)), uses(14, branch(eve, b)), uses(18, different(c, b))]).
proof(27, solution([dave, frank]), query, [uses(19, cousin(dave, frank))]).
proof(28, solution([dave, grace]), query, [uses(20, cousin(dave, grace))]).
proof(29, solution([eve, frank]), query, [uses(21, cousin(eve, frank))]).
proof(30, solution([eve, grace]), query, [uses(22, cousin(eve, grace))]).
proof(31, solution([frank, dave]), query, [uses(23, cousin(frank, dave))]).
proof(32, solution([frank, eve]), query, [uses(24, cousin(frank, eve))]).
proof(33, solution([grace, dave]), query, [uses(25, cousin(grace, dave))]).
proof(34, solution([grace, eve]), query, [uses(26, cousin(grace, eve))]).
