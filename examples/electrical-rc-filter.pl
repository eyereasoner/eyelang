% Ideal unloaded first-order RC low-pass filter.
% Resistance in ohms, capacitance in farads, time constant in seconds,
% cutoff in hertz. Loading and component tolerances are outside this model.

components(filter1, 10000.0, 0.000001).

response(Filter, Tau, Cutoff) :-
  components(Filter, R, C), R > 0, C > 0,
  Tau is R*C,
  Cutoff is 1/(2*pi*Tau).

cutoff_hz(Filter, Rounded) :-
  response(Filter, _, Raw),
  Rounded is round(Raw*100000000)/100000000.

% Answer and Reason
?- cutoff_hz(Filter, Cutoff).
?- why.
?- response(Filter, Tau, _).

% Check
:- assertion(response(filter1, 0.01, _)).
:- assertion((response(filter1, Tau, F), abs(2*pi*Tau*F-1) < 1.0e-12)).
:- assertion((response(filter1, _, F), F > 15.91, F < 15.92)).
