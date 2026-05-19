% Bounded drone corridor planner adapted from Eyeling drone-corridor-planner.n3.
% A fuel list bounds recursion; duration and cost are summed, belief and comfort
% are multiplied along the action sequence.

fuel(:fuel7, [:t, :t, :t, :t, :t, :t, :t]).

step(state(:Gent, :full, P), state(:Brugge, :mid, P), :fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99).
step(state(:Gent, B, P), state(:Brugge, B, P), :train_gent_brugge, 1700.0, 0.012, 0.999, 0.995).
step(state(:Gent, :full, P), state(:Kortrijk, :mid, P), :fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99).
step(state(:Kortrijk, :mid, P), state(:Brugge, :low, P), :fly_kortrijk_brugge, 1600.0, 0.007, 0.99, 0.99).
step(state(:Brugge, :mid, P), state(:Kortrijk, :low, P), :fly_brugge_kortrijk, 1600.0, 0.007, 0.985, 0.98).
step(state(:Kortrijk, B, :none), state(:Kortrijk, B, :yes), :get_zone_permit_kortrijk, 300.0, 0.001, 0.999, 1.0).
step(state(:Brugge, B, :none), state(:Brugge, B, :yes), :buy_permit_brugge, 450.0, 0.002, 0.98, 1.0).
step(state(:Brugge, :low, P), state(:Brugge, :full, P), :quick_charge_brugge, 600.0, 0.004, 0.999, 0.97).
step(state(:Brugge, :mid, P), state(:Brugge, :full, P), :topup_brugge, 400.0, 0.003, 0.999, 0.98).
step(state(:Kortrijk, :mid, P), state(:Kortrijk, :full, P), :emergency_charge_kortrijk, 500.0, 0.003, 0.999, 0.95).
step(state(:Brugge, :full, :yes), state(:Oostende, :mid, :yes), :cross_corridor_brugge_oostende, 900.0, 0.004, 0.98, 1.0).
step(state(:Brugge, :mid, P), state(:Oostende, :low, P), :public_coastline_brugge_oostende, 1300.0, 0.006, 0.97, 0.96).
step(state(:Brugge, :full, P), state(:Oostende, :mid, P), :public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96).
step(state(:Kortrijk, :full, :yes), state(:Oostende, :mid, :yes), :direct_corridor_kortrijk_oostende, 1100.0, 0.009, 0.955, 0.92).

path(From, To, [Act], Duration, Cost, Belief, Comfort, FuelIn, FuelOut) :-
  step(From, To, Act, Duration, Cost, Belief, Comfort),
  rest(FuelIn, FuelOut).

path(From, To, Actions, Duration, Cost, Belief, Comfort, FuelIn, FuelOut) :-
  step(From, Mid, Act, D1, C1, B1, M1),
  rest(FuelIn, FuelMid),
  path(Mid, To, RestActions, D2, C2, B2, M2, FuelMid, FuelOut),
  append([Act], RestActions, Actions),
  add(D1, D2, Duration),
  add(C1, C2, Cost),
  mul(B1, B2, Belief),
  mul(M1, M2, Comfort).

surviving_plan(Actions, Duration, Cost, Belief, Comfort, Battery, Permit, FuelLeft) :-
  fuel(:fuel7, Fuel),
  path(state(:Gent, :full, :none), state(:Oostende, Battery, Permit), Actions, Duration, Cost, Belief, Comfort, Fuel, FuelLeft),
  gt(Belief, 0.94),
  lt(Cost, 0.03).

triple(:d1, gps:plan, plan(Actions, Duration, Cost, Belief, Comfort, Battery, Permit, FuelLeft)) :-
  surviving_plan(Actions, Duration, Cost, Belief, Comfort, Battery, Permit, FuelLeft).
