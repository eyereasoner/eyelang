# Eyelang result format 1
query(1, at(8, 1), [call(cousin(?v0, ?v1))], [binding("person", ?v0), binding("cousin", ?v1)]).
result(1, complete, 8).
answer(1, [binding("person", dave), binding("cousin", frank)]).
why(1, [binding("person", dave), binding("cousin", frank)], 40).
answer(1, [binding("person", dave), binding("cousin", grace)]).
why(1, [binding("person", dave), binding("cousin", grace)], 41).
answer(1, [binding("person", eve), binding("cousin", frank)]).
why(1, [binding("person", eve), binding("cousin", frank)], 42).
answer(1, [binding("person", eve), binding("cousin", grace)]).
why(1, [binding("person", eve), binding("cousin", grace)], 43).
answer(1, [binding("person", frank), binding("cousin", dave)]).
why(1, [binding("person", frank), binding("cousin", dave)], 44).
answer(1, [binding("person", frank), binding("cousin", eve)]).
why(1, [binding("person", frank), binding("cousin", eve)], 45).
answer(1, [binding("person", grace), binding("cousin", dave)]).
why(1, [binding("person", grace), binding("cousin", dave)], 46).
answer(1, [binding("person", grace), binding("cousin", eve)]).
why(1, [binding("person", grace), binding("cousin", eve)], 47).
proof(1, generation(adam, 0), rule(13, at(5, 1)), []).
proof(2, parent(adam, bob), rule(1, at(2, 1)), []).
proof(3, parent(adam, carol), rule(2, at(2, 20)), []).
proof(4, parent(bob, dave), rule(3, at(2, 41)), []).
proof(5, parent(bob, eve), rule(4, at(2, 60)), []).
proof(6, parent(carol, frank), rule(5, at(2, 78)), []).
proof(7, parent(carol, grace), rule(6, at(2, 100)), []).
proof(8, generation(adam, 0), rule(13, at(5, 1)), []).
proof(9, generation(adam, 0), rule(13, at(5, 1)), []).
proof(10, generation(bob, 1), rule(14, at(6, 1)), [uses(2, parent(adam, bob)), uses(9, generation(adam, 0)), calculated(1, binary("+", value(0), value(1)))]).
proof(11, generation(carol, 1), rule(14, at(6, 1)), [uses(3, parent(adam, carol)), uses(9, generation(adam, 0)), calculated(1, binary("+", value(0), value(1)))]).
proof(12, parent(adam, bob), rule(1, at(2, 1)), []).
proof(13, parent(adam, carol), rule(2, at(2, 20)), []).
proof(14, generation(bob, 1), rule(14, at(6, 1)), [uses(12, parent(adam, bob)), uses(9, generation(adam, 0)), calculated(1, binary("+", value(0), value(1)))]).
proof(15, generation(carol, 1), rule(14, at(6, 1)), [uses(13, parent(adam, carol)), uses(9, generation(adam, 0)), calculated(1, binary("+", value(0), value(1)))]).
proof(16, generation(bob, 1), rule(14, at(6, 1)), [uses(2, parent(adam, bob)), uses(9, generation(adam, 0)), calculated(1, binary("+", value(0), value(1)))]).
proof(17, generation(carol, 1), rule(14, at(6, 1)), [uses(3, parent(adam, carol)), uses(9, generation(adam, 0)), calculated(1, binary("+", value(0), value(1)))]).
proof(18, generation(dave, 2), rule(14, at(6, 1)), [uses(4, parent(bob, dave)), uses(14, generation(bob, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(19, generation(eve, 2), rule(14, at(6, 1)), [uses(5, parent(bob, eve)), uses(14, generation(bob, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(20, generation(frank, 2), rule(14, at(6, 1)), [uses(6, parent(carol, frank)), uses(15, generation(carol, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(21, generation(grace, 2), rule(14, at(6, 1)), [uses(7, parent(carol, grace)), uses(15, generation(carol, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(22, generation(dave, 2), rule(14, at(6, 1)), [uses(4, parent(bob, dave)), uses(14, generation(bob, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(23, generation(eve, 2), rule(14, at(6, 1)), [uses(5, parent(bob, eve)), uses(14, generation(bob, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(24, generation(frank, 2), rule(14, at(6, 1)), [uses(6, parent(carol, frank)), uses(15, generation(carol, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(25, generation(grace, 2), rule(14, at(6, 1)), [uses(7, parent(carol, grace)), uses(15, generation(carol, 1)), calculated(2, binary("+", value(1), value(1)))]).
proof(26, branch(dave, b), rule(7, at(3, 1)), []).
proof(27, branch(eve, b), rule(8, at(3, 18)), []).
proof(28, branch(frank, c), rule(9, at(3, 34)), []).
proof(29, branch(grace, c), rule(10, at(3, 52)), []).
proof(30, different(b, c), rule(11, at(4, 1)), []).
proof(31, different(c, b), rule(12, at(4, 18)), []).
proof(32, cousin(dave, frank), rule(15, at(7, 1)), [uses(18, generation(dave, 2)), uses(24, generation(frank, 2)), uses(26, branch(dave, b)), uses(28, branch(frank, c)), uses(30, different(b, c))]).
proof(33, cousin(dave, grace), rule(15, at(7, 1)), [uses(18, generation(dave, 2)), uses(25, generation(grace, 2)), uses(26, branch(dave, b)), uses(29, branch(grace, c)), uses(30, different(b, c))]).
proof(34, cousin(eve, frank), rule(15, at(7, 1)), [uses(19, generation(eve, 2)), uses(24, generation(frank, 2)), uses(27, branch(eve, b)), uses(28, branch(frank, c)), uses(30, different(b, c))]).
proof(35, cousin(eve, grace), rule(15, at(7, 1)), [uses(19, generation(eve, 2)), uses(25, generation(grace, 2)), uses(27, branch(eve, b)), uses(29, branch(grace, c)), uses(30, different(b, c))]).
proof(36, cousin(frank, dave), rule(15, at(7, 1)), [uses(20, generation(frank, 2)), uses(22, generation(dave, 2)), uses(28, branch(frank, c)), uses(26, branch(dave, b)), uses(31, different(c, b))]).
proof(37, cousin(frank, eve), rule(15, at(7, 1)), [uses(20, generation(frank, 2)), uses(23, generation(eve, 2)), uses(28, branch(frank, c)), uses(27, branch(eve, b)), uses(31, different(c, b))]).
proof(38, cousin(grace, dave), rule(15, at(7, 1)), [uses(21, generation(grace, 2)), uses(22, generation(dave, 2)), uses(29, branch(grace, c)), uses(26, branch(dave, b)), uses(31, different(c, b))]).
proof(39, cousin(grace, eve), rule(15, at(7, 1)), [uses(21, generation(grace, 2)), uses(23, generation(eve, 2)), uses(29, branch(grace, c)), uses(27, branch(eve, b)), uses(31, different(c, b))]).
proof(40, solution([dave, frank]), query, [uses(32, cousin(dave, frank))]).
proof(41, solution([dave, grace]), query, [uses(33, cousin(dave, grace))]).
proof(42, solution([eve, frank]), query, [uses(34, cousin(eve, frank))]).
proof(43, solution([eve, grace]), query, [uses(35, cousin(eve, grace))]).
proof(44, solution([frank, dave]), query, [uses(36, cousin(frank, dave))]).
proof(45, solution([frank, eve]), query, [uses(37, cousin(frank, eve))]).
proof(46, solution([grace, dave]), query, [uses(38, cousin(grace, dave))]).
proof(47, solution([grace, eve]), query, [uses(39, cousin(grace, eve))]).
