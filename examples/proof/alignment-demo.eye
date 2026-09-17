# Eyelang result format 1
query(1, at(9, 1), [call(rolls_up_to(?v0, car))], [binding("concept", ?v0)]).
result(1, complete, 4).
answer(1, [binding("concept", tel_car)]).
why(1, [binding("concept", tel_car)], 24).
answer(1, [binding("concept", heavy_vehicle)]).
why(1, [binding("concept", heavy_vehicle)], 25).
answer(1, [binding("concept", plate_vehicle)]).
why(1, [binding("concept", plate_vehicle)], 26).
answer(1, [binding("concept", passenger_car)]).
why(1, [binding("concept", passenger_car)], 36).
proof(1, broad_match(tel_car, car), rule(6, at(3, 1)), []).
proof(2, broad_match(heavy_vehicle, car), rule(7, at(3, 28)), []).
proof(3, broad_match(plate_vehicle, car), rule(8, at(3, 61)), []).
proof(4, broader(passenger_car, plate_vehicle), rule(9, at(4, 1)), []).
proof(5, broader(tel_car, car), rule(10, at(5, 1)), [uses(1, broad_match(tel_car, car))]).
proof(6, broader(heavy_vehicle, car), rule(10, at(5, 1)), [uses(2, broad_match(heavy_vehicle, car))]).
proof(7, broader(plate_vehicle, car), rule(10, at(5, 1)), [uses(3, broad_match(plate_vehicle, car))]).
proof(8, broader_transitive(passenger_car, plate_vehicle), rule(11, at(6, 1)), [uses(4, broader(passenger_car, plate_vehicle))]).
proof(9, broad_match(tel_car, car), rule(6, at(3, 1)), []).
proof(10, broad_match(heavy_vehicle, car), rule(7, at(3, 28)), []).
proof(11, broad_match(plate_vehicle, car), rule(8, at(3, 61)), []).
proof(12, broader_transitive(tel_car, car), rule(11, at(6, 1)), [uses(5, broader(tel_car, car))]).
proof(13, broader_transitive(heavy_vehicle, car), rule(11, at(6, 1)), [uses(6, broader(heavy_vehicle, car))]).
proof(14, broader_transitive(plate_vehicle, car), rule(11, at(6, 1)), [uses(7, broader(plate_vehicle, car))]).
proof(15, broader(tel_car, car), rule(10, at(5, 1)), [uses(9, broad_match(tel_car, car))]).
proof(16, broader(heavy_vehicle, car), rule(10, at(5, 1)), [uses(10, broad_match(heavy_vehicle, car))]).
proof(17, broader(plate_vehicle, car), rule(10, at(5, 1)), [uses(11, broad_match(plate_vehicle, car))]).
proof(18, rolls_up_to(tel_car, car), rule(13, at(8, 1)), [uses(12, broader_transitive(tel_car, car))]).
proof(19, rolls_up_to(heavy_vehicle, car), rule(13, at(8, 1)), [uses(13, broader_transitive(heavy_vehicle, car))]).
proof(20, rolls_up_to(plate_vehicle, car), rule(13, at(8, 1)), [uses(14, broader_transitive(plate_vehicle, car))]).
proof(21, broader_transitive(tel_car, car), rule(11, at(6, 1)), [uses(15, broader(tel_car, car))]).
proof(22, broader_transitive(heavy_vehicle, car), rule(11, at(6, 1)), [uses(16, broader(heavy_vehicle, car))]).
proof(23, broader_transitive(plate_vehicle, car), rule(11, at(6, 1)), [uses(17, broader(plate_vehicle, car))]).
proof(24, solution([tel_car]), query, [uses(18, rolls_up_to(tel_car, car))]).
proof(25, solution([heavy_vehicle]), query, [uses(19, rolls_up_to(heavy_vehicle, car))]).
proof(26, solution([plate_vehicle]), query, [uses(20, rolls_up_to(plate_vehicle, car))]).
proof(27, broad_match(plate_vehicle, car), rule(8, at(3, 61)), []).
proof(28, broad_match(plate_vehicle, car), rule(8, at(3, 61)), []).
proof(29, broader(plate_vehicle, car), rule(10, at(5, 1)), [uses(27, broad_match(plate_vehicle, car))]).
proof(30, broader(plate_vehicle, car), rule(10, at(5, 1)), [uses(28, broad_match(plate_vehicle, car))]).
proof(31, broader_transitive(plate_vehicle, car), rule(11, at(6, 1)), [uses(29, broader(plate_vehicle, car))]).
proof(32, broader_transitive(plate_vehicle, car), rule(11, at(6, 1)), [uses(30, broader(plate_vehicle, car))]).
proof(33, broader_transitive(passenger_car, car), rule(12, at(7, 1)), [uses(8, broader_transitive(passenger_car, plate_vehicle)), uses(31, broader_transitive(plate_vehicle, car))]).
proof(34, broader_transitive(passenger_car, car), rule(12, at(7, 1)), [uses(8, broader_transitive(passenger_car, plate_vehicle)), uses(32, broader_transitive(plate_vehicle, car))]).
proof(35, rolls_up_to(passenger_car, car), rule(13, at(8, 1)), [uses(34, broader_transitive(passenger_car, car))]).
proof(36, solution([passenger_car]), query, [uses(35, rolls_up_to(passenger_car, car))]).
