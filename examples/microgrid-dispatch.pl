% Representative example: microgrid dispatch planning.
%
% The rules compute renewable supply, reserve-aware battery dispatch, remaining
% grid import, and a concise feasibility report for a campus microgrid interval.

site(campus_interval_17).

load_kW(campus_interval_17, 620.0).
solar_kW(campus_interval_17, 180.0).
wind_kW(campus_interval_17, 90.0).
battery_max_discharge_kW(campus_interval_17, 320.0).
required_battery_reserve_kW(campus_interval_17, 80.0).
grid_contract_limit_kW(campus_interval_17, 150.0).

renewable_kW(Site, Renewable) :-
  solar_kW(Site, Solar),
  wind_kW(Site, Wind),
  add(Solar, Wind, Renewable).

net_deficit_kW(Site, Deficit) :-
  load_kW(Site, Load),
  renewable_kW(Site, Renewable),
  sub(Load, Renewable, Deficit).

reserve_aware_battery_limit_kW(Site, Limit) :-
  battery_max_discharge_kW(Site, MaxDischarge),
  required_battery_reserve_kW(Site, Reserve),
  sub(MaxDischarge, Reserve, Limit).

battery_dispatch_kW(Site, Dispatch) :-
  net_deficit_kW(Site, Deficit),
  reserve_aware_battery_limit_kW(Site, Limit),
  min(Deficit, Limit, Dispatch).

grid_import_kW(Site, Import) :-
  net_deficit_kW(Site, Deficit),
  battery_dispatch_kW(Site, Dispatch),
  sub(Deficit, Dispatch, Import).

battery_reserve_after_dispatch_kW(Site, ReserveLeft) :-
  battery_max_discharge_kW(Site, MaxDischarge),
  battery_dispatch_kW(Site, Dispatch),
  sub(MaxDischarge, Dispatch, ReserveLeft).

contract_ok(Site) :-
  grid_import_kW(Site, Import),
  grid_contract_limit_kW(Site, Limit),
  le(Import, Limit).

reserve_ok(Site) :-
  battery_reserve_after_dispatch_kW(Site, ReserveLeft),
  required_battery_reserve_kW(Site, Required),
  ge(ReserveLeft, Required).

stable_dispatch(Site) :-
  contract_ok(Site),
  reserve_ok(Site).

triple(Site, renewablePower_kW, Renewable) :-
  renewable_kW(Site, Renewable).

triple(Site, batteryDispatch_kW, Dispatch) :-
  battery_dispatch_kW(Site, Dispatch).

triple(Site, gridImport_kW, Import) :-
  grid_import_kW(Site, Import).

triple(Site, reserveAfterDispatch_kW, ReserveLeft) :-
  battery_reserve_after_dispatch_kW(Site, ReserveLeft).

triple(Site, status, stable_dispatch) :-
  stable_dispatch(Site).

triple(Site, reason, "battery dispatch covers the deficit while preserving reserve and grid contract limits") :-
  stable_dispatch(Site).
