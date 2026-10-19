% Exponential decay with a constant half-life and no replenishment.
% Illustrative sample: initial activity in Bq, half-life and elapsed time in h.

sample(demo, 80.0, 8.0, 16.0).

decay(Sample, HalfLives, Remaining, Decayed) :-
  sample(Sample, Initial, HalfLife, Elapsed),
  Initial >= 0, HalfLife > 0, Elapsed >= 0,
  HalfLives is Elapsed/HalfLife,
  Remaining is Initial*0.5**HalfLives,
  Decayed is Initial-Remaining.

% Answer and Reason
?- decay(Sample, HalfLives, Remaining, Decayed).
?- why.

% Check
:- assertion(decay(demo, 2.0, 20.0, 60.0)).
:- assertion((sample(demo, Initial, _, _), decay(demo, _, Remaining, Decayed), Remaining+Decayed =:= Initial)).
