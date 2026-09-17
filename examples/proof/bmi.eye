# Eyelang result format 1
query(1, at(5, 1), [call(bmi(?v0)), call(category(?v1))], [binding("value", ?v0), binding("category", ?v1)]).
result(1, complete, 1).
answer(1, [binding("value", 22.724403484408533), binding("category", normal)]).
why(1, [binding("value", 22.724403484408533), binding("category", normal)], 4).
proof(1, metric_input(72.0, 178.0), rule(1, at(2, 1)), []).
proof(2, bmi(22.724403484408533), rule(2, at(3, 1)), [uses(1, metric_input(72.0, 178.0)), calculated(1.78, binary("/", value(178.0), value(100.0))), calculated(3.1684, binary("*", value(1.78), value(1.78))), calculated(22.724403484408533, binary("/", value(72.0), value(3.1684)))]).
proof(3, category(normal), rule(3, at(4, 1)), [uses(2, bmi(22.724403484408533)), compared(">=", 22.724403484408533, 18.5), compared("<", 22.724403484408533, 25.0)]).
proof(4, solution([22.724403484408533, normal]), query, [uses(2, bmi(22.724403484408533)), uses(3, category(normal))]).
