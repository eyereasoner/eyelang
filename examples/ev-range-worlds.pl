% EYE-inspired electric-vehicle range worlds.
% Four simple worlds estimate whether trips fit the available battery.

trip(city_errand).
trip(winter_highway).
trip(heavy_delivery).
trip(cold_commute).

% trip_data(Trip, DistanceKm, SpeedKmh, TemperatureC, PayloadKg, BatteryKWh, BaseKWhPerKm).
trip_data(city_errand, 40, 45, 20, 100, 30, 0.18).
trip_data(winter_highway, 260, 115, -5, 400, 60, 0.20).
trip_data(heavy_delivery, 180, 80, 15, 700, 55, 0.22).
trip_data(cold_commute, 120, 90, -8, 100, 35, 0.19).

speed_factor(T, 1.20) :- trip_data(T, _, S, _, _, _, _), gt(S, 100).
speed_factor(T, 1.00) :- trip_data(T, _, S, _, _, _, _), le(S, 100).

temperature_factor(T, 1.15) :- trip_data(T, _, _, Temp, _, _, _), lt(Temp, 0).
temperature_factor(T, 1.00) :- trip_data(T, _, _, Temp, _, _, _), ge(Temp, 0).

payload_factor(T, 1.15) :- trip_data(T, _, _, _, P, _, _), gt(P, 500).
payload_factor(T, 1.08) :- trip_data(T, _, _, _, P, _, _), gt(P, 250), le(P, 500).
payload_factor(T, 1.00) :- trip_data(T, _, _, _, P, _, _), le(P, 250).

base_energy(T, E) :-
  trip_data(T, D, _, _, _, _, B),
  mul(D, B, E).

required_energy(T, w1, E) :-
  base_energy(T, E).

required_energy(T, w2, E) :-
  base_energy(T, Base),
  speed_factor(T, SF),
  mul(Base, SF, E).

required_energy(T, w0, E) :-
  base_energy(T, Base),
  speed_factor(T, SF),
  temperature_factor(T, TF),
  payload_factor(T, PF),
  mul(Base, SF, A),
  mul(A, TF, B),
  mul(B, PF, E).

required_energy(T, w3, E) :-
  required_energy(T, w0, W0),
  mul(W0, 1.30, E).

safe_in_world(T, W) :-
  trip_data(T, _, _, _, _, Battery, _),
  required_energy(T, W, Required),
  le(Required, Battery).

risky_in_world(T, W) :-
  trip_data(T, _, _, _, _, Battery, _),
  required_energy(T, W, Required),
  gt(Required, Battery).

triple(T, safeInWorld, W) :- safe_in_world(T, W).
triple(T, riskyInWorld, W) :- risky_in_world(T, W).
triple(winter_highway, reason, "cold fast payload trip exceeds battery in physics-aware worlds") :-
  risky_in_world(winter_highway, w0),
  risky_in_world(winter_highway, w2),
  risky_in_world(winter_highway, w3),
  safe_in_world(winter_highway, w1).
triple(heavy_delivery, reason, "safety buffer turns a physics-safe delivery into a cautious risk") :-
  safe_in_world(heavy_delivery, w0),
  risky_in_world(heavy_delivery, w3).
triple(ev_range_worlds, status, expected_world_pattern) :-
  safe_in_world(city_errand, w3),
  risky_in_world(winter_highway, w0),
  risky_in_world(heavy_delivery, w3),
  safe_in_world(cold_commute, w3).
