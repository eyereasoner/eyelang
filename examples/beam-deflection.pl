% Linear elastic cantilever with a point load at its free end.
% Small deflection, uniform beam: delta = F*L^3/(3*E*I).
% Units: force N, length m, Young's modulus Pa, second moment m^4, limit mm.

beam(demo, 1200.0, 2.5, 200000000000.0, 0.000008, 5.0).

deflection_mm(Beam, Delta) :-
  beam(Beam, Force, Length, Modulus, Moment, _),
  Force >= 0, Length > 0, Modulus > 0, Moment > 0,
  Delta is 1000*Force*Length**3/(3*Modulus*Moment).

within_limit(Beam) :-
  deflection_mm(Beam, Delta), beam(Beam, _, _, _, _, Limit),
  Delta =< Limit.

% Answer and Reason
?- deflection_mm(Beam, Delta).
?- why.
?- within_limit(Beam).

% Check
:- assertion(deflection_mm(demo, 3.90625)).
:- assertion(within_limit(demo)).
:- assertion((deflection_mm(demo, Delta), beam(demo, F, L, E, I, _), abs(Delta*3*E*I-1000*F*L**3) < 1.0e-6)).
