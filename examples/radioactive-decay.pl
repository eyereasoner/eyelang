% Science example: radioactive decay.
%
% Activity remaining after elapsed time is initial_activity * 0.5^(t/half_life).

sample(iodine_sample, initial_activity_bq, 80.0).
sample(iodine_sample, half_life_h, 8.0).
sample(iodine_sample, elapsed_h, 16.0).
threshold(iodine_sample, low_activity_bq, 25.0).

half_lives(Sample, Count) :-
  sample(Sample, elapsed_h, Elapsed),
  sample(Sample, half_life_h, HalfLife),
  div(Elapsed, HalfLife, Count).

remaining_fraction(Sample, Fraction) :-
  half_lives(Sample, Count),
  pow(0.5, Count, Fraction).

remaining_activity(Sample, Remaining) :-
  sample(Sample, initial_activity_bq, Initial),
  remaining_fraction(Sample, Fraction),
  mul(Initial, Fraction, Remaining).

decayed_activity(Sample, Decayed) :-
  sample(Sample, initial_activity_bq, Initial),
  remaining_activity(Sample, Remaining),
  sub(Initial, Remaining, Decayed).

low_activity(Sample) :-
  remaining_activity(Sample, Remaining),
  threshold(Sample, low_activity_bq, Limit),
  lt(Remaining, Limit).

triple(Sample, halfLivesElapsed, Count) :-
  half_lives(Sample, Count).

triple(Sample, remainingActivity_Bq, Remaining) :-
  remaining_activity(Sample, Remaining).

triple(Sample, decayedActivity_Bq, Decayed) :-
  decayed_activity(Sample, Decayed).

triple(Sample, status, low_activity) :-
  low_activity(Sample).

triple(Sample, reason, "two half-lives leave one quarter of the initial activity") :-
  low_activity(Sample).
