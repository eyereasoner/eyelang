% Representative example: manufacturing quality-control capability.
%
% The rules compute process capability indices from measurement summaries and
% classify production lines using a practical Cpk threshold.

run(line7_shift_a).
run(line8_shift_b).

spec(line7_shift_a, lower_mm, 10.0).
spec(line7_shift_a, upper_mm, 10.2).
summary(line7_shift_a, mean_mm, 10.12).
summary(line7_shift_a, sigma_mm, 0.04).

spec(line8_shift_b, lower_mm, 10.0).
spec(line8_shift_b, upper_mm, 10.2).
summary(line8_shift_b, mean_mm, 10.1).
summary(line8_shift_b, sigma_mm, 0.02).

capability_threshold(cpk, 1.33).

upper_margin_mm(Run, Margin) :-
  spec(Run, upper_mm, Upper),
  summary(Run, mean_mm, Mean),
  sub(Upper, Mean, Margin).

lower_margin_mm(Run, Margin) :-
  summary(Run, mean_mm, Mean),
  spec(Run, lower_mm, Lower),
  sub(Mean, Lower, Margin).

nearest_spec_margin_mm(Run, Margin) :-
  upper_margin_mm(Run, UpperMargin),
  lower_margin_mm(Run, LowerMargin),
  min(UpperMargin, LowerMargin, Margin).

three_sigma_mm(Run, ThreeSigma) :-
  summary(Run, sigma_mm, Sigma),
  mul(3.0, Sigma, ThreeSigma).

cpk(Run, Cpk) :-
  nearest_spec_margin_mm(Run, Margin),
  three_sigma_mm(Run, ThreeSigma),
  div(Margin, ThreeSigma, Cpk).

capable(Run) :-
  cpk(Run, Cpk),
  capability_threshold(cpk, Threshold),
  ge(Cpk, Threshold).

needs_adjustment(Run) :-
  cpk(Run, Cpk),
  capability_threshold(cpk, Threshold),
  lt(Cpk, Threshold).

triple(Run, cpk, Cpk) :-
  cpk(Run, Cpk).

triple(Run, status, capable_process) :-
  capable(Run).

triple(Run, status, needs_process_adjustment) :-
  needs_adjustment(Run).

triple(Run, reason, "Cpk meets the production capability threshold") :-
  capable(Run).

triple(Run, reason, "Cpk is below the production capability threshold") :-
  needs_adjustment(Run).
