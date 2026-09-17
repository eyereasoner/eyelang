# Eyelang result format 1
query(1, at(6, 1), [call(mentions_sensor(?v0, ?v1))], [binding("envelope", ?v0), binding("sensor", ?v1)]).
result(1, complete, 1).
answer(1, [binding("envelope", envelope1), binding("sensor", thermometer1)]).
why(1, [binding("envelope", envelope1), binding("sensor", thermometer1)], 4).
query(2, at(6, 42), [call(heartbeat(?v0))], [binding("envelope", ?v0)]).
result(2, complete, 1).
answer(2, [binding("envelope", envelope2)]).
why(2, [binding("envelope", envelope2)], 7).
proof(1, payload_graph(envelope1, payload1), rule(1, at(2, 1)), []).
proof(2, payload_triple(payload1, triple(reading1, sensor, thermometer1)), rule(2, at(2, 37)), []).
proof(3, mentions_sensor(envelope1, thermometer1), rule(4, at(4, 1)), [uses(1, payload_graph(envelope1, payload1)), uses(2, payload_triple(payload1, triple(reading1, sensor, thermometer1)))]).
proof(4, solution([envelope1, thermometer1]), query, [uses(3, mentions_sensor(envelope1, thermometer1))]).
proof(5, payload_kind(envelope2, empty), rule(3, at(3, 1)), []).
proof(6, heartbeat(envelope2), rule(5, at(5, 1)), [uses(5, payload_kind(envelope2, empty))]).
proof(7, solution([envelope2]), query, [uses(6, heartbeat(envelope2))]).
