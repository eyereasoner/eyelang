# Eyelang result format 1
query(1, at(6, 1), [call(mentions_sensor(?v0, ?v1))], [binding("envelope", ?v0), binding("sensor", ?v1)]).
result(1, complete, 1).
answer(1, [binding("envelope", envelope1), binding("sensor", thermometer1)]).
query(2, at(6, 42), [call(heartbeat(?v0))], [binding("envelope", ?v0)]).
result(2, complete, 1).
answer(2, [binding("envelope", envelope2)]).
