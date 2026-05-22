% Science example: simple pendulum period.
%
% For small oscillations, T = 2*pi*sqrt(length / gravity).  Gravity is chosen
% as pi^2 m/s^2 so a one-meter pendulum has a period of two seconds.

constant(pi, 3.141592653589793).
experiment(pendulum1, length_m, 1.0).
experiment(pendulum1, gravity_m_s2, 9.869604401089358).
limit(pendulum1, target_period_s, 2.0).
limit(pendulum1, tolerance_s, 0.01).

period(Experiment, Period) :-
  experiment(Experiment, length_m, Length),
  experiment(Experiment, gravity_m_s2, Gravity),
  div(Length, Gravity, Ratio),
  pow(Ratio, 0.5, Root),
  constant(pi, Pi),
  mul(2.0, Pi, TwoPi),
  mul(TwoPi, Root, Period).

period_error(Experiment, Error) :-
  period(Experiment, Period),
  limit(Experiment, target_period_s, Target),
  sub(Period, Target, RawError),
  abs(RawError, Error).

within_period_tolerance(Experiment) :-
  period_error(Experiment, Error),
  limit(Experiment, tolerance_s, Tolerance),
  lt(Error, Tolerance).

triple(Experiment, period_s, Period) :-
  period(Experiment, Period).

triple(Experiment, periodError_s, Error) :-
  period_error(Experiment, Error).

triple(Experiment, status, within_period_tolerance) :-
  within_period_tolerance(Experiment).

triple(Experiment, reason, "small-angle period matches the two-second target") :-
  within_period_tolerance(Experiment).
