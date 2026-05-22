% Science example: ideal gas law.
%
% A simple gas cell uses P*V = n*R*T.  The constants are chosen so that the
% computed pressure is exactly near one atmosphere in this small example.

gas_cell(cell1, 1.0, 8.0, 300.0, 0.024).
pressure_limit(cell1, low_Pa, 95000.0).
pressure_limit(cell1, high_Pa, 105000.0).

pressure(Cell, Pressure) :-
  gas_cell(Cell, Moles, GasConstant, Temperature, Volume),
  mul(Moles, GasConstant, NR),
  mul(NR, Temperature, NRT),
  div(NRT, Volume, Pressure).

near_atmospheric(Cell) :-
  pressure(Cell, Pressure),
  pressure_limit(Cell, low_Pa, Low),
  pressure_limit(Cell, high_Pa, High),
  gt(Pressure, Low),
  lt(Pressure, High).

triple(Cell, pressure_Pa, Pressure) :-
  pressure(Cell, Pressure).

triple(Cell, status, near_atmospheric) :-
  near_atmospheric(Cell).

triple(Cell, reason, "pressure is inside the one-atmosphere tolerance band") :-
  near_atmospheric(Cell).
