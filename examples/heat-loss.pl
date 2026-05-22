% Engineering example: one-dimensional conductive heat loss through a wall.
%
% Thermal resistance is L/(k*A), and heat loss is DeltaT/R.

wall(wall1, conductivity_W_mK, 0.8).
wall(wall1, area_m2, 12.0).
wall(wall1, thickness_m, 0.2).
wall(wall1, indoor_C, 21.0).
wall(wall1, outdoor_C, -4.0).

temperature_difference(Wall, DeltaT) :-
  wall(Wall, indoor_C, Indoor),
  wall(Wall, outdoor_C, Outdoor),
  sub(Indoor, Outdoor, DeltaT).

thermal_resistance(Wall, Resistance) :-
  wall(Wall, thickness_m, Thickness),
  wall(Wall, conductivity_W_mK, Conductivity),
  wall(Wall, area_m2, Area),
  mul(Conductivity, Area, Conductance),
  div(Thickness, Conductance, Resistance).

heat_loss(Wall, HeatLoss) :-
  temperature_difference(Wall, DeltaT),
  thermal_resistance(Wall, Resistance),
  div(DeltaT, Resistance, HeatLoss).

triple(Wall, type, conduction_heat_loss) :-
  wall(Wall, thickness_m, _Thickness).

triple(Wall, temperatureDifference_K, DeltaT) :-
  temperature_difference(Wall, DeltaT).

triple(Wall, thermalResistance_K_W, Resistance) :-
  thermal_resistance(Wall, Resistance).

triple(Wall, heatLoss_W, HeatLoss) :-
  heat_loss(Wall, HeatLoss).

triple(Wall, status, high_heat_loss) :-
  heat_loss(Wall, HeatLoss),
  gt(HeatLoss, 1000.0).
