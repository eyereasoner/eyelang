% Engineering example: RC low-pass filter sizing.
%
% The cutoff frequency is 1 / (2*pi*R*C).

materialize(type, 2).
materialize(timeConstant_s, 2).
materialize(cutoffFrequency_Hz, 2).

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

type(Filter, first_order_low_pass) :-
  component(Filter, resistor_ohm, _R),
  component(Filter, capacitor_f, _C).

timeConstant_s(Filter, Tau) :-
  time_constant(Filter, Tau).

cutoffFrequency_Hz(Filter, Frequency) :-
  cutoff_frequency(Filter, Frequency).
