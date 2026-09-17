# Eyelang result format 1
query(1, at(4, 1), [call(distance_km(?v0, ?v1))], [binding("route", ?v0), binding("kilometers", ?v1)]).
result(1, complete, 2).
answer(1, [binding("route", route1), binding("kilometers", 16.0934)]).
why(1, [binding("route", route1), binding("kilometers", 16.0934)], 5).
answer(1, [binding("route", route2), binding("kilometers", 8.0467)]).
why(1, [binding("route", route2), binding("kilometers", 8.0467)], 6).
proof(1, distance_miles(route1, 10), rule(1, at(2, 1)), []).
proof(2, distance_miles(route2, 5), rule(2, at(2, 29)), []).
proof(3, distance_km(route1, 16.0934), rule(3, at(3, 1)), [uses(1, distance_miles(route1, 10)), calculated(16.0934, binary("*", value(10), value(1.60934)))]).
proof(4, distance_km(route2, 8.0467), rule(3, at(3, 1)), [uses(2, distance_miles(route2, 5)), calculated(8.0467, binary("*", value(5), value(1.60934)))]).
proof(5, solution([route1, 16.0934]), query, [uses(3, distance_km(route1, 16.0934))]).
proof(6, solution([route2, 8.0467]), query, [uses(4, distance_km(route2, 8.0467))]).
