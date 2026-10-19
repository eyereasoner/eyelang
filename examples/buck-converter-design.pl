% Ideal buck converter in continuous conduction, ignoring capacitor ESR.
% Check only the two ripple limits; these do not establish control stability.
% Units: volts, amperes, hertz, henries, farads.

% converter(Name, Vin, Vout, LoadA, SwitchHz, InductanceH, CapacitanceF).
converter(demo, 24.0, 5.0, 2.0, 500000.0, 0.000022, 0.000047).
limits(demo, 0.30, 0.05).

ripple(Name, Duty, CurrentPP, Ratio, VoltagePP) :-
  converter(Name, Vin, Vout, Load, Frequency, L, C),
  Vin > Vout, Vout > 0, Load > 0, Frequency > 0, L > 0, C > 0,
  Duty is Vout/Vin,
  CurrentPP is (Vin-Vout)*Duty/(L*Frequency),
  CurrentPP < 2*Load,
  Ratio is CurrentPP/Load,
  VoltagePP is CurrentPP/(8*Frequency*C).

within_ripple_limits(Name) :-
  ripple(Name, _, _, Ratio, Voltage), limits(Name, MaxRatio, MaxVoltage),
  Ratio =< MaxRatio, Voltage =< MaxVoltage.

% Round the report to eight decimal places; evaluate limits on raw values.
ripple_report(Name, Duty, CurrentPP, VoltagePP) :-
  ripple(Name, D, I, _, V),
  Duty is round(D*100000000)/100000000,
  CurrentPP is round(I*100000000)/100000000,
  VoltagePP is round(V*100000000)/100000000.

% Answer and Reason
?- ripple_report(Name, Duty, CurrentPP, VoltagePP).
?- why.
?- within_ripple_limits(Name).

% Check
:- assertion(within_ripple_limits(demo)).
:- assertion((ripple(demo, D, I, Ratio, V), abs(D-5/24) < 1.0e-12, I > 0.35, I < 0.37, Ratio < 0.30, V < 0.002)).
