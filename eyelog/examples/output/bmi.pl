bmi(answer, 22.72).
bmi(case, 22.724403484408533).
bmiRoundedInt(case, 2272).
c1(check, "OK - the input was normalized into positive SI values.").
c2(check, "OK - height squared was reconstructed from the normalized height.").
c3(check, "OK - the BMI value matches the BMI = kg / m² formula.").
c4(check, "OK - a BMI of 18.49 stays below the normal-weight threshold.").
c5(check, "OK - the lower boundary is half-open: BMI 18.5 is classified as Normal.").
c6(check, "OK - BMI 25.0 starts the Overweight category.").
c7(check, "OK - BMI 30.0 starts the Obesity I category.").
c8(check, "OK - classification behavior is monotonic across representative BMI values.").
c9(check, "OK - the healthy-weight band was reconstructed from BMI 18.5 to 24.9 at the same height.").
calculation(reason, "The normalized weight and height were used to compute BMI, then the result was mapped to the WHO adult category table.").
category(answer, "Normal").
category(decision, "Normal").
categoryRule(reason, "Normal").
formula(reason, "BMI is defined as weight in kilograms divided by height in meters squared.").
healthyMaxKg(answer, 78.9).
healthyMaxKg(case, 78.893159999999995).
healthyMaxKgRoundedInt(case, 789).
healthyMinKg(answer, 58.6).
healthyMinKg(case, 58.615400000000001).
healthyMinKgRoundedInt(case, 586).
healthyWeightRangeKg(report, range(58.6, 78.9)).
heightCm(answer, 178).
heightCm(report, 178).
heightM(case, 1.78).
heightSquared(case, 3.1684000000000001).
result(report, bmi(22.72, "Normal")).
units(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.").
unitsExplanation(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.").
weightKg(case, 72.0).
