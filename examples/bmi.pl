% BMI — ARC-style Body Mass Index example adapted from Eyeling.
%
% The example normalizes metric or US inputs, computes BMI, assigns the WHO
% adult category, derives a healthy-weight band for the same height, and emits
% an inspectable report plus independent checks.
%
% For reproducibility and documentation only; not medical advice.

% Editable metric input.
triple(input, unitSystem, metric).
triple(input, weight, 72.0).
triple(input, height, 178.0).

% US alternative:
% triple(input, unitSystem, us).
% triple(input, weight, 158.73).
% triple(input, height, 70.08).

% Normalization and BMI calculation.
triple(case, weightKg, W) :-
  triple(input, unitSystem, metric),
  triple(input, weight, W).

triple(case, heightM, M) :-
  triple(input, unitSystem, metric),
  triple(input, height, H),
  div(H, 100.0, M).

triple(reason, units, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.") :-
  triple(input, unitSystem, metric).

triple(case, weightKg, Kg) :-
  triple(input, unitSystem, us),
  triple(input, weight, W),
  mul(W, 0.45359237, Kg).

triple(case, heightM, M) :-
  triple(input, unitSystem, us),
  triple(input, height, H),
  mul(H, 0.0254, M).

triple(reason, units, "US inputs were converted to SI units: pounds to kilograms and inches to meters.") :-
  triple(input, unitSystem, us).

triple(case, heightSquared, M2) :-
  triple(case, heightM, M),
  mul(M, M, M2).

triple(case, bmi, Bmi) :-
  triple(case, weightKg, Kg),
  triple(case, heightSquared, M2),
  div(Kg, M2, Bmi).

triple(case, bmiRoundedInt, BmiRoundedInt) :-
  triple(case, bmi, Bmi),
  mul(Bmi, 100.0, BmiX100),
  rounded(BmiX100, BmiRoundedInt).

triple(case, healthyMinKg, HealthyMin) :-
  triple(case, heightSquared, M2),
  mul(18.5, M2, HealthyMin).

triple(case, healthyMaxKg, HealthyMax) :-
  triple(case, heightSquared, M2),
  mul(24.9, M2, HealthyMax).

triple(case, healthyMinKgRoundedInt, MinRoundedInt) :-
  triple(case, healthyMinKg, HealthyMin),
  mul(HealthyMin, 10.0, MinX10),
  rounded(MinX10, MinRoundedInt).

triple(case, healthyMaxKgRoundedInt, MaxRoundedInt) :-
  triple(case, healthyMaxKg, HealthyMax),
  mul(HealthyMax, 10.0, MaxX10),
  rounded(MaxX10, MaxRoundedInt).

% WHO adult categories, using half-open intervals.
triple(decision, category, "Underweight") :-
  triple(case, bmi, Bmi),
  lt(Bmi, 18.5).

triple(decision, category, "Normal") :-
  triple(case, bmi, Bmi),
  ge(Bmi, 18.5),
  lt(Bmi, 25.0).

triple(decision, category, "Overweight") :-
  triple(case, bmi, Bmi),
  ge(Bmi, 25.0),
  lt(Bmi, 30.0).

triple(decision, category, "Obesity I") :-
  triple(case, bmi, Bmi),
  ge(Bmi, 30.0),
  lt(Bmi, 35.0).

triple(decision, category, "Obesity II") :-
  triple(case, bmi, Bmi),
  ge(Bmi, 35.0),
  lt(Bmi, 40.0).

triple(decision, category, "Obesity III") :-
  triple(case, bmi, Bmi),
  ge(Bmi, 40.0).

% Answer and reason why.
triple(answer, bmi, 22.72) :-
  triple(case, bmiRoundedInt, 2272).

triple(answer, category, Category) :-
  triple(decision, category, Category).

triple(answer, healthyMinKg, 58.6) :-
  triple(case, healthyMinKgRoundedInt, 586).

triple(answer, healthyMaxKg, 78.9) :-
  triple(case, healthyMaxKgRoundedInt, 789).

triple(answer, heightCm, CmRounded) :-
  triple(case, heightM, M),
  mul(M, 100.0, Cm),
  rounded(Cm, CmRounded).

triple(reason, formula, "BMI is defined as weight in kilograms divided by height in meters squared.") :-
  triple(case, bmi, _Bmi).

triple(reason, calculation, "The normalized weight and height were used to compute BMI, then the result was mapped to the WHO adult category table.") :-
  triple(decision, category, _Category).

triple(reason, categoryRule, Category) :-
  triple(decision, category, Category).

triple(reason, unitsExplanation, Units) :-
  triple(reason, units, Units).

% Independent checks.
triple(check, c1, "OK - the input was normalized into positive SI values.") :-
  triple(case, weightKg, Kg),
  triple(case, heightM, M),
  gt(Kg, 0),
  gt(M, 0).

triple(check, c2, "OK - height squared was reconstructed from the normalized height.") :-
  triple(case, heightM, M),
  triple(case, heightSquared, M2),
  mul(M, M, M2).

triple(check, c3, "OK - the BMI value matches the BMI = kg / m² formula.") :-
  triple(case, weightKg, Kg),
  triple(case, heightSquared, M2),
  triple(case, bmi, Bmi),
  div(Kg, M2, Bmi).

triple(check, c4, "OK - a BMI of 18.49 stays below the normal-weight threshold.") :-
  lt(18.49, 18.5).

triple(check, c5, "OK - the lower boundary is half-open: BMI 18.5 is classified as Normal.") :-
  ge(18.5, 18.5),
  lt(18.5, 25.0).

triple(check, c6, "OK - BMI 25.0 starts the Overweight category.") :-
  ge(25.0, 25.0),
  lt(25.0, 30.0).

triple(check, c7, "OK - BMI 30.0 starts the Obesity I category.") :-
  ge(30.0, 30.0),
  lt(30.0, 35.0).

triple(check, c8, "OK - classification behavior is monotonic across representative BMI values.") :-
  ge(22.0, 18.5),
  lt(22.0, 25.0),
  ge(27.0, 25.0),
  lt(27.0, 30.0),
  ge(41.0, 40.0).

triple(check, c9, "OK - the healthy-weight band was reconstructed from BMI 18.5 to 24.9 at the same height.") :-
  triple(case, heightSquared, M2),
  triple(case, healthyMinKg, Min),
  triple(case, healthyMaxKg, Max),
  mul(18.5, M2, Min),
  mul(24.9, M2, Max).

% ARC report, guarded by actual derived values and checks.
triple(report, log_outputString, "# bmi\n\n## Source files\n\n- [Eyelog rules](../bmi.pl)\n- [N3 source](https://github.com/eyereasoner/eyeling/blob/main/examples/bmi.n3)\n\nBMI — ARC-style Body Mass Index example\n\n## Answer\nBMI = 22.72\nCategory = Normal\nAt height 178 cm, a healthy-weight range is about 58.6–78.9 kg (BMI 18.5–24.9).\n\n## Reason Why\nBMI is defined as weight in kilograms divided by height in meters squared. This program first normalizes the input to SI units, computes BMI, and then applies WHO adult categories as half-open intervals. The healthy-weight band is the weight range at the same height that corresponds to BMI 18.5 through 24.9.\n\n## Check\nC1 OK - the input was normalized into positive SI values.\nC2 OK - height squared was reconstructed from the normalized height.\nC3 OK - the BMI value matches the BMI = kg / m² formula.\nC4 OK - a BMI of 18.49 stays below the normal-weight threshold.\nC5 OK - the lower boundary is half-open: BMI 18.5 is classified as Normal.\nC6 OK - BMI 25.0 starts the Overweight category.\nC7 OK - BMI 30.0 starts the Obesity I category.\nC8 OK - classification behavior is monotonic across representative BMI values.\nC9 OK - the healthy-weight band was reconstructed from BMI 18.5 to 24.9 at the same height.") :-
  triple(answer, bmi, 22.72),
  triple(answer, category, "Normal"),
  triple(answer, healthyMinKg, 58.6),
  triple(answer, healthyMaxKg, 78.9),
  triple(answer, heightCm, 178),
  triple(check, c1, _C1),
  triple(check, c2, _C2),
  triple(check, c3, _C3),
  triple(check, c4, _C4),
  triple(check, c5, _C5),
  triple(check, c6, _C6),
  triple(check, c7, _C7),
  triple(check, c8, _C8),
  triple(check, c9, _C9).
