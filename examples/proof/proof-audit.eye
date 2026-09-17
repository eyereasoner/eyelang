# Eyelit result format 1
query(1, at(34, 1), [call(depends_on(3, ?v0))], [binding("ancestor", ?v0)]).
result(1, complete, 2).
answer(1, [binding("ancestor", 2)]).
why(1, [binding("ancestor", 2)], 5).
answer(1, [binding("ancestor", 1)]).
why(1, [binding("ancestor", 1)], 11).
query(2, at(35, 1), [call(support(1, ?v0))], [binding("fact", ?v0)]).
result(2, complete, 1).
answer(2, [binding("fact", human(socrates))]).
why(2, [binding("fact", human(socrates))], 28).
proof(1, proof(3, solution([]), query, [uses(2, mortal(socrates))]), rule(7, at(8, 1)), []).
proof(2, member(uses(2, mortal(socrates)), [uses(2, mortal(socrates))]), rule(8, at(14, 1)), []).
proof(3, parent_proof(3, 2), rule(10, at(18, 1)), [uses(1, proof(3, solution([]), query, [uses(2, mortal(socrates))])), uses(2, member(uses(2, mortal(socrates)), [uses(2, mortal(socrates))]))]).
proof(4, depends_on(3, 2), rule(12, at(25, 1)), [uses(3, parent_proof(3, 2))]).
proof(5, solution([2]), query, [uses(4, depends_on(3, 2))]).
proof(6, proof(2, mortal(socrates), rule(2, at(2, 1)), [uses(1, human(socrates))]), rule(6, at(7, 1)), []).
proof(7, member(uses(1, human(socrates)), [uses(1, human(socrates))]), rule(8, at(14, 1)), []).
proof(8, parent_proof(2, 1), rule(10, at(18, 1)), [uses(6, proof(2, mortal(socrates), rule(2, at(2, 1)), [uses(1, human(socrates))])), uses(7, member(uses(1, human(socrates)), [uses(1, human(socrates))]))]).
proof(9, depends_on(2, 1), rule(12, at(25, 1)), [uses(8, parent_proof(2, 1))]).
proof(10, depends_on(3, 1), rule(13, at(26, 1)), [uses(3, parent_proof(3, 2)), uses(9, depends_on(2, 1))]).
proof(11, solution([1]), query, [uses(10, depends_on(3, 1))]).
proof(12, proof(1, human(socrates), rule(1, at(1, 1)), []), rule(5, at(6, 1)), []).
proof(13, why(1, [], 3), rule(4, at(5, 1)), []).
proof(14, proof(3, solution([]), query, [uses(2, mortal(socrates))]), rule(7, at(8, 1)), []).
proof(15, member(uses(2, mortal(socrates)), [uses(2, mortal(socrates))]), rule(8, at(14, 1)), []).
proof(16, parent_proof(3, 2), rule(10, at(18, 1)), [uses(14, proof(3, solution([]), query, [uses(2, mortal(socrates))])), uses(15, member(uses(2, mortal(socrates)), [uses(2, mortal(socrates))]))]).
proof(17, depends_on(3, 2), rule(12, at(25, 1)), [uses(16, parent_proof(3, 2))]).
proof(18, proof(2, mortal(socrates), rule(2, at(2, 1)), [uses(1, human(socrates))]), rule(6, at(7, 1)), []).
proof(19, member(uses(1, human(socrates)), [uses(1, human(socrates))]), rule(8, at(14, 1)), []).
proof(20, parent_proof(2, 1), rule(10, at(18, 1)), [uses(18, proof(2, mortal(socrates), rule(2, at(2, 1)), [uses(1, human(socrates))])), uses(19, member(uses(1, human(socrates)), [uses(1, human(socrates))]))]).
proof(21, depends_on(2, 1), rule(12, at(25, 1)), [uses(20, parent_proof(2, 1))]).
proof(22, depends_on(3, 1), rule(13, at(26, 1)), [uses(16, parent_proof(3, 2)), uses(21, depends_on(2, 1))]).
proof(23, proof(1, human(socrates), rule(1, at(1, 1)), []), rule(5, at(6, 1)), []).
proof(24, proof(1, human(socrates), rule(1, at(1, 1)), []), rule(5, at(6, 1)), []).
proof(25, source_fact(1, human(socrates)), rule(14, at(28, 1)), [uses(24, proof(1, human(socrates), rule(1, at(1, 1)), []))]).
proof(26, supporting_fact(3, human(socrates)), rule(16, at(30, 1)), [uses(22, depends_on(3, 1)), uses(25, source_fact(1, human(socrates)))]).
proof(27, support(1, human(socrates)), rule(17, at(32, 1)), [uses(13, why(1, [], 3)), uses(26, supporting_fact(3, human(socrates)))]).
proof(28, solution([human(socrates)]), query, [uses(27, support(1, human(socrates)))]).
