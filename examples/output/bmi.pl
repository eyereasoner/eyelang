triple(answer, bmi, 22.72).
triple(answer, category, "Normal").
triple(answer, healthyMaxKg, 78.9).
triple(answer, healthyMinKg, 58.6).
triple(answer, heightCm, 178).
triple(case, bmi, 22.724403484408533).
triple(case, bmiRoundedInt, 2272).
triple(case, healthyMaxKg, 78.893159999999995).
triple(case, healthyMaxKgRoundedInt, 789).
triple(case, healthyMinKg, 58.615400000000001).
triple(case, healthyMinKgRoundedInt, 586).
triple(case, heightM, 1.78).
triple(case, heightSquared, 3.1684000000000001).
triple(case, weightKg, 72.0).
triple(check, c1, "OK - the input was normalized into positive SI values.").
triple(check, c2, "OK - height squared was reconstructed from the normalized height.").
triple(check, c3, "OK - the BMI value matches the BMI = kg / m² formula.").
triple(check, c4, "OK - a BMI of 18.49 stays below the normal-weight threshold.").
triple(check, c5, "OK - the lower boundary is half-open: BMI 18.5 is classified as Normal.").
triple(check, c6, "OK - BMI 25.0 starts the Overweight category.").
triple(check, c7, "OK - BMI 30.0 starts the Obesity I category.").
triple(check, c8, "OK - classification behavior is monotonic across representative BMI values.").
triple(check, c9, "OK - the healthy-weight band was reconstructed from BMI 18.5 to 24.9 at the same height.").
triple(decision, category, "Normal").
triple(input, height, 178.0).
triple(input, unitSystem, metric).
triple(input, weight, 72.0).
triple(reason, calculation, "The normalized weight and height were used to compute BMI, then the result was mapped to the WHO adult category table.").
triple(reason, categoryRule, "Normal").
triple(reason, formula, "BMI is defined as weight in kilograms divided by height in meters squared.").
triple(reason, units, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.").
triple(reason, unitsExplanation, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.").
triple(report, checkPassed, c1).
triple(report, checkPassed, c2).
triple(report, checkPassed, c3).
triple(report, checkPassed, c4).
triple(report, checkPassed, c5).
triple(report, checkPassed, c6).
triple(report, checkPassed, c7).
triple(report, checkPassed, c8).
triple(report, checkPassed, c9).
triple(report, healthyWeightRangeKg, range(58.6, 78.9)).
triple(report, heightCm, 178).
triple(report, result, bmi(22.72, "Normal")).
