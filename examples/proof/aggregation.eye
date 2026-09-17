# Eyelang result format 1
query(1, at(12, 1), [call(report(?v0, ?v1))], [binding("count", ?v0), binding("total", ?v1)]).
result(1, complete, 1).
answer(1, [binding("count", 3), binding("total", 35)]).
why(1, [binding("count", 3), binding("total", 35)], 18).
proof(1, reading(sensor_a, 10), rule(1, at(1, 1)), []).
proof(2, reading(sensor_b, 15), rule(2, at(2, 1)), []).
proof(3, reading(sensor_c, 10), rule(3, at(3, 1)), []).
proof(4, solution([reading(sensor_a, 10)]), query, [uses(1, reading(sensor_a, 10))]).
proof(5, solution([reading(sensor_b, 15)]), query, [uses(2, reading(sensor_b, 15))]).
proof(6, solution([reading(sensor_c, 10)]), query, [uses(3, reading(sensor_c, 10))]).
proof(7, total([], 0), rule(5, at(9, 1)), []).
proof(8, total([reading(sensor_c, 10)], 10), rule(6, at(10, 1)), [uses(7, total([], 0)), calculated(10, binary("+", value(10), value(0)))]).
proof(9, total([reading(sensor_b, 15), reading(sensor_c, 10)], 25), rule(6, at(10, 1)), [uses(8, total([reading(sensor_c, 10)], 10)), calculated(25, binary("+", value(15), value(10)))]).
proof(10, total([reading(sensor_a, 10), reading(sensor_b, 15), reading(sensor_c, 10)], 35), rule(6, at(10, 1)), [uses(9, total([reading(sensor_b, 15), reading(sensor_c, 10)], 25)), calculated(35, binary("+", value(10), value(25)))]).
proof(11, reading(sensor_a, 10), rule(1, at(1, 1)), []).
proof(12, reading(sensor_b, 15), rule(2, at(2, 1)), []).
proof(13, reading(sensor_c, 10), rule(3, at(3, 1)), []).
proof(14, solution([reading(sensor_a, 10)]), query, [uses(11, reading(sensor_a, 10))]).
proof(15, solution([reading(sensor_b, 15)]), query, [uses(12, reading(sensor_b, 15))]).
proof(16, solution([reading(sensor_c, 10)]), query, [uses(13, reading(sensor_c, 10))]).
proof(17, report(3, 35), rule(4, at(5, 1)), [collected([reading(sensor_a, 10), reading(sensor_b, 15), reading(sensor_c, 10)], reading(?v0, ?v1), [call(reading(?v0, ?v1))], [14, 15, 16], complete), calculated(3, function("count", [value([reading(sensor_a, 10), reading(sensor_b, 15), reading(sensor_c, 10)])])), uses(10, total([reading(sensor_a, 10), reading(sensor_b, 15), reading(sensor_c, 10)], 35))]).
proof(18, solution([3, 35]), query, [uses(17, report(3, 35))]).
