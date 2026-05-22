% Engineering example: RC low-pass filter sizing.
%
% The cutoff frequency is 1 / (2*pi*R*C).

component(filter1, resistor_ohm, 10000.0).
component(filter1, capacitor_f, 0.000001).
constant(pi, 3.141592653589793).

time_constant(Filter, Tau) :-
  component(Filter, resistor_ohm, R),
  component(Filter, capacitor_f, C),
  mul(R, C, Tau).

cutoff_frequency(Filter, Frequency) :-
  time_constant(Filter, Tau),
  constant(pi, Pi),
  mul(2.0, Pi, TwoPi),
  mul(TwoPi, Tau, Denominator),
  div(1.0, Denominator, Frequency).

triple(Filter, type, first_order_low_pass) :-
  component(Filter, resistor_ohm, _R),
  component(Filter, capacitor_f, _C).

triple(Filter, timeConstant_s, Tau) :-
  time_constant(Filter, Tau).

triple(Filter, cutoffFrequency_Hz, Frequency) :-
  cutoff_frequency(Filter, Frequency).
