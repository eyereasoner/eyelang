ppvPlanetGivenDetection(rare_wide_orbit, 0.090163934426229442).
why(
  ppvPlanetGivenDetection(rare_wide_orbit, 0.090163934426229442),
  proof(
    goal(ppvPlanetGivenDetection(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(26))),
    bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442)]),
    uses([
      proof(
        goal(ppv_planet(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
        bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.00098999999999999999), binding("NoPlanetPrior", 0.999), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0099900000000000093), binding("Denominator", 0.010980000000000009)]),
        uses([
          proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
          proof(goal(mul(0.99, 0.001, 0.00098999999999999999)), by(builtin(mul, 3))),
          proof(goal(sub(1.0, 0.001, 0.999)), by(builtin(sub, 3))),
          proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
          proof(goal(mul(0.010000000000000009, 0.999, 0.0099900000000000093)), by(builtin(mul, 3))),
          proof(goal(add(0.00098999999999999999, 0.0099900000000000093, 0.010980000000000009)), by(builtin(add, 3))),
          proof(goal(div(0.00098999999999999999, 0.010980000000000009, 0.090163934426229442)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

ppvPlanetGivenDetection(mstar_short_period, 0.96116504854368934).
why(
  ppvPlanetGivenDetection(mstar_short_period, 0.96116504854368934),
  proof(
    goal(ppvPlanetGivenDetection(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(26))),
    bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934)]),
    uses([
      proof(
        goal(ppv_planet(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
        bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.19800000000000001), binding("NoPlanetPrior", 0.80000000000000004), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0080000000000000071), binding("Denominator", 0.20600000000000002)]),
        uses([
          proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
          proof(goal(mul(0.99, 0.20, 0.19800000000000001)), by(builtin(mul, 3))),
          proof(goal(sub(1.0, 0.20, 0.80000000000000004)), by(builtin(sub, 3))),
          proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
          proof(goal(mul(0.010000000000000009, 0.80000000000000004, 0.0080000000000000071)), by(builtin(mul, 3))),
          proof(goal(add(0.19800000000000001, 0.0080000000000000071, 0.20600000000000002)), by(builtin(add, 3))),
          proof(goal(div(0.19800000000000001, 0.20600000000000002, 0.96116504854368934)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

ppvPlanetGivenDetection(common_hot_neptune_good, 0.91346153846153844).
why(
  ppvPlanetGivenDetection(common_hot_neptune_good, 0.91346153846153844),
  proof(
    goal(ppvPlanetGivenDetection(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(26))),
    bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844)]),
    uses([
      proof(
        goal(ppv_planet(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
        bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.030000000000000027), binding("FalsePositiveMass", 0.02250000000000002), binding("Denominator", 0.26000000000000001)]),
        uses([
          proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
          proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
          proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
          proof(goal(sub(1.0, 0.97, 0.030000000000000027)), by(builtin(sub, 3))),
          proof(goal(mul(0.030000000000000027, 0.75, 0.02250000000000002)), by(builtin(mul, 3))),
          proof(goal(add(0.23749999999999999, 0.02250000000000002, 0.26000000000000001)), by(builtin(add, 3))),
          proof(goal(div(0.23749999999999999, 0.26000000000000001, 0.91346153846153844)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

ppvPlanetGivenDetection(common_hot_neptune_low_spec, 0.76000000000000001).
why(
  ppvPlanetGivenDetection(common_hot_neptune_low_spec, 0.76000000000000001),
  proof(
    goal(ppvPlanetGivenDetection(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(26))),
    bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001)]),
    uses([
      proof(
        goal(ppv_planet(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
        bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.099999999999999978), binding("FalsePositiveMass", 0.074999999999999983), binding("Denominator", 0.3125)]),
        uses([
          proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
          proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
          proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
          proof(goal(sub(1.0, 0.90, 0.099999999999999978)), by(builtin(sub, 3))),
          proof(goal(mul(0.099999999999999978, 0.75, 0.074999999999999983)), by(builtin(mul, 3))),
          proof(goal(add(0.23749999999999999, 0.074999999999999983, 0.3125)), by(builtin(add, 3))),
          proof(goal(div(0.23749999999999999, 0.3125, 0.76000000000000001)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

confirmsInWorld(mstar_short_period, w0).
why(
  confirmsInWorld(mstar_short_period, w0),
  proof(
    goal(confirmsInWorld(mstar_short_period, w0)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", mstar_short_period), binding("World", w0)]),
    uses([
      proof(
        goal(confirms_in_world(mstar_short_period, w0)), by(rule("exoplanet-validation-worlds.pl", clause(15))),
        bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934)]),
        uses([
          proof(
            goal(ppv_planet(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.19800000000000001), binding("NoPlanetPrior", 0.80000000000000004), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0080000000000000071), binding("Denominator", 0.20600000000000002)]),
            uses([
              proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
              proof(goal(mul(0.99, 0.20, 0.19800000000000001)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.20, 0.80000000000000004)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
              proof(goal(mul(0.010000000000000009, 0.80000000000000004, 0.0080000000000000071)), by(builtin(mul, 3))),
              proof(goal(add(0.19800000000000001, 0.0080000000000000071, 0.20600000000000002)), by(builtin(add, 3))),
              proof(goal(div(0.19800000000000001, 0.20600000000000002, 0.96116504854368934)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(ge(0.96116504854368934, 0.90)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(common_hot_neptune_good, w0).
why(
  confirmsInWorld(common_hot_neptune_good, w0),
  proof(
    goal(confirmsInWorld(common_hot_neptune_good, w0)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", common_hot_neptune_good), binding("World", w0)]),
    uses([
      proof(
        goal(confirms_in_world(common_hot_neptune_good, w0)), by(rule("exoplanet-validation-worlds.pl", clause(15))),
        bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844)]),
        uses([
          proof(
            goal(ppv_planet(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.030000000000000027), binding("FalsePositiveMass", 0.02250000000000002), binding("Denominator", 0.26000000000000001)]),
            uses([
              proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
              proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.97, 0.030000000000000027)), by(builtin(sub, 3))),
              proof(goal(mul(0.030000000000000027, 0.75, 0.02250000000000002)), by(builtin(mul, 3))),
              proof(goal(add(0.23749999999999999, 0.02250000000000002, 0.26000000000000001)), by(builtin(add, 3))),
              proof(goal(div(0.23749999999999999, 0.26000000000000001, 0.91346153846153844)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(ge(0.91346153846153844, 0.90)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(rare_wide_orbit, w1).
why(
  confirmsInWorld(rare_wide_orbit, w1),
  proof(
    goal(confirmsInWorld(rare_wide_orbit, w1)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", rare_wide_orbit), binding("World", w1)]),
    uses([
      proof(
        goal(confirms_in_world(rare_wide_orbit, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
        bindings([binding("Candidate", rare_wide_orbit), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
        uses([
          proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
          proof(goal(ge(0.99, 0.95)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(mstar_short_period, w1).
why(
  confirmsInWorld(mstar_short_period, w1),
  proof(
    goal(confirmsInWorld(mstar_short_period, w1)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", mstar_short_period), binding("World", w1)]),
    uses([
      proof(
        goal(confirms_in_world(mstar_short_period, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
        bindings([binding("Candidate", mstar_short_period), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
        uses([
          proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
          proof(goal(ge(0.99, 0.95)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(common_hot_neptune_good, w1).
why(
  confirmsInWorld(common_hot_neptune_good, w1),
  proof(
    goal(confirmsInWorld(common_hot_neptune_good, w1)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", common_hot_neptune_good), binding("World", w1)]),
    uses([
      proof(
        goal(confirms_in_world(common_hot_neptune_good, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
        bindings([binding("Candidate", common_hot_neptune_good), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97)]),
        uses([
          proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
          proof(goal(ge(0.95, 0.95)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(common_hot_neptune_low_spec, w1).
why(
  confirmsInWorld(common_hot_neptune_low_spec, w1),
  proof(
    goal(confirmsInWorld(common_hot_neptune_low_spec, w1)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", common_hot_neptune_low_spec), binding("World", w1)]),
    uses([
      proof(
        goal(confirms_in_world(common_hot_neptune_low_spec, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
        bindings([binding("Candidate", common_hot_neptune_low_spec), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90)]),
        uses([
          proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
          proof(goal(ge(0.95, 0.95)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(mstar_short_period, w2).
why(
  confirmsInWorld(mstar_short_period, w2),
  proof(
    goal(confirmsInWorld(mstar_short_period, w2)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", mstar_short_period), binding("World", w2)]),
    uses([
      proof(
        goal(confirms_in_world(mstar_short_period, w2)), by(rule("exoplanet-validation-worlds.pl", clause(19))),
        bindings([binding("Candidate", mstar_short_period), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
        uses([
          proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
          proof(goal(ge(0.20, 0.05)), by(builtin(ge, 2))),
          proof(goal(ge(0.99, 0.90)), by(builtin(ge, 2))),
          proof(goal(ge(0.99, 0.97)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(common_hot_neptune_good, w2).
why(
  confirmsInWorld(common_hot_neptune_good, w2),
  proof(
    goal(confirmsInWorld(common_hot_neptune_good, w2)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", common_hot_neptune_good), binding("World", w2)]),
    uses([
      proof(
        goal(confirms_in_world(common_hot_neptune_good, w2)), by(rule("exoplanet-validation-worlds.pl", clause(19))),
        bindings([binding("Candidate", common_hot_neptune_good), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97)]),
        uses([
          proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
          proof(goal(ge(0.25, 0.05)), by(builtin(ge, 2))),
          proof(goal(ge(0.95, 0.90)), by(builtin(ge, 2))),
          proof(goal(ge(0.97, 0.97)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

confirmsInWorld(mstar_short_period, w3).
why(
  confirmsInWorld(mstar_short_period, w3),
  proof(
    goal(confirmsInWorld(mstar_short_period, w3)), by(rule("exoplanet-validation-worlds.pl", clause(27))),
    bindings([binding("Candidate", mstar_short_period), binding("World", w3)]),
    uses([
      proof(
        goal(confirms_in_world(mstar_short_period, w3)), by(rule("exoplanet-validation-worlds.pl", clause(23))),
        bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934)]),
        uses([
          proof(
            goal(ppv_planet(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.19800000000000001), binding("NoPlanetPrior", 0.80000000000000004), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0080000000000000071), binding("Denominator", 0.20600000000000002)]),
            uses([
              proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
              proof(goal(mul(0.99, 0.20, 0.19800000000000001)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.20, 0.80000000000000004)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
              proof(goal(mul(0.010000000000000009, 0.80000000000000004, 0.0080000000000000071)), by(builtin(mul, 3))),
              proof(goal(add(0.19800000000000001, 0.0080000000000000071, 0.20600000000000002)), by(builtin(add, 3))),
              proof(goal(div(0.19800000000000001, 0.20600000000000002, 0.96116504854368934)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(ge(0.96116504854368934, 0.93)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

rejectsInWorld(rare_wide_orbit, w0).
why(
  rejectsInWorld(rare_wide_orbit, w0),
  proof(
    goal(rejectsInWorld(rare_wide_orbit, w0)), by(rule("exoplanet-validation-worlds.pl", clause(28))),
    bindings([binding("Candidate", rare_wide_orbit), binding("World", w0)]),
    uses([
      proof(
        goal(rejects_in_world(rare_wide_orbit, w0)), by(rule("exoplanet-validation-worlds.pl", clause(16))),
        bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442)]),
        uses([
          proof(
            goal(ppv_planet(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.00098999999999999999), binding("NoPlanetPrior", 0.999), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0099900000000000093), binding("Denominator", 0.010980000000000009)]),
            uses([
              proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
              proof(goal(mul(0.99, 0.001, 0.00098999999999999999)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.001, 0.999)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
              proof(goal(mul(0.010000000000000009, 0.999, 0.0099900000000000093)), by(builtin(mul, 3))),
              proof(goal(add(0.00098999999999999999, 0.0099900000000000093, 0.010980000000000009)), by(builtin(add, 3))),
              proof(goal(div(0.00098999999999999999, 0.010980000000000009, 0.090163934426229442)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(lt(0.090163934426229442, 0.90)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

rejectsInWorld(common_hot_neptune_low_spec, w0).
why(
  rejectsInWorld(common_hot_neptune_low_spec, w0),
  proof(
    goal(rejectsInWorld(common_hot_neptune_low_spec, w0)), by(rule("exoplanet-validation-worlds.pl", clause(28))),
    bindings([binding("Candidate", common_hot_neptune_low_spec), binding("World", w0)]),
    uses([
      proof(
        goal(rejects_in_world(common_hot_neptune_low_spec, w0)), by(rule("exoplanet-validation-worlds.pl", clause(16))),
        bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001)]),
        uses([
          proof(
            goal(ppv_planet(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.099999999999999978), binding("FalsePositiveMass", 0.074999999999999983), binding("Denominator", 0.3125)]),
            uses([
              proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
              proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.90, 0.099999999999999978)), by(builtin(sub, 3))),
              proof(goal(mul(0.099999999999999978, 0.75, 0.074999999999999983)), by(builtin(mul, 3))),
              proof(goal(add(0.23749999999999999, 0.074999999999999983, 0.3125)), by(builtin(add, 3))),
              proof(goal(div(0.23749999999999999, 0.3125, 0.76000000000000001)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(lt(0.76000000000000001, 0.90)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

rejectsInWorld(rare_wide_orbit, w2).
why(
  rejectsInWorld(rare_wide_orbit, w2),
  proof(
    goal(rejectsInWorld(rare_wide_orbit, w2)), by(rule("exoplanet-validation-worlds.pl", clause(28))),
    bindings([binding("Candidate", rare_wide_orbit), binding("World", w2)]),
    uses([
      proof(
        goal(rejects_in_world(rare_wide_orbit, w2)), by(rule("exoplanet-validation-worlds.pl", clause(20))),
        bindings([binding("Candidate", rare_wide_orbit), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
        uses([
          proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
          proof(goal(lt(0.001, 0.05)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

rejectsInWorld(common_hot_neptune_low_spec, w2).
why(
  rejectsInWorld(common_hot_neptune_low_spec, w2),
  proof(
    goal(rejectsInWorld(common_hot_neptune_low_spec, w2)), by(rule("exoplanet-validation-worlds.pl", clause(28))),
    bindings([binding("Candidate", common_hot_neptune_low_spec), binding("World", w2)]),
    uses([
      proof(
        goal(rejects_in_world(common_hot_neptune_low_spec, w2)), by(rule("exoplanet-validation-worlds.pl", clause(22))),
        bindings([binding("Candidate", common_hot_neptune_low_spec), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90)]),
        uses([
          proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
          proof(goal(lt(0.90, 0.97)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

rejectsInWorld(rare_wide_orbit, w3).
why(
  rejectsInWorld(rare_wide_orbit, w3),
  proof(
    goal(rejectsInWorld(rare_wide_orbit, w3)), by(rule("exoplanet-validation-worlds.pl", clause(28))),
    bindings([binding("Candidate", rare_wide_orbit), binding("World", w3)]),
    uses([
      proof(
        goal(rejects_in_world(rare_wide_orbit, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
        bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442)]),
        uses([
          proof(
            goal(ppv_planet(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.00098999999999999999), binding("NoPlanetPrior", 0.999), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0099900000000000093), binding("Denominator", 0.010980000000000009)]),
            uses([
              proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
              proof(goal(mul(0.99, 0.001, 0.00098999999999999999)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.001, 0.999)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
              proof(goal(mul(0.010000000000000009, 0.999, 0.0099900000000000093)), by(builtin(mul, 3))),
              proof(goal(add(0.00098999999999999999, 0.0099900000000000093, 0.010980000000000009)), by(builtin(add, 3))),
              proof(goal(div(0.00098999999999999999, 0.010980000000000009, 0.090163934426229442)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(lt(0.090163934426229442, 0.93)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

rejectsInWorld(common_hot_neptune_good, w3).
why(
  rejectsInWorld(common_hot_neptune_good, w3),
  proof(
    goal(rejectsInWorld(common_hot_neptune_good, w3)), by(rule("exoplanet-validation-worlds.pl", clause(28))),
    bindings([binding("Candidate", common_hot_neptune_good), binding("World", w3)]),
    uses([
      proof(
        goal(rejects_in_world(common_hot_neptune_good, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
        bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844)]),
        uses([
          proof(
            goal(ppv_planet(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.030000000000000027), binding("FalsePositiveMass", 0.02250000000000002), binding("Denominator", 0.26000000000000001)]),
            uses([
              proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
              proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.97, 0.030000000000000027)), by(builtin(sub, 3))),
              proof(goal(mul(0.030000000000000027, 0.75, 0.02250000000000002)), by(builtin(mul, 3))),
              proof(goal(add(0.23749999999999999, 0.02250000000000002, 0.26000000000000001)), by(builtin(add, 3))),
              proof(goal(div(0.23749999999999999, 0.26000000000000001, 0.91346153846153844)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(lt(0.91346153846153844, 0.93)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

rejectsInWorld(common_hot_neptune_low_spec, w3).
why(
  rejectsInWorld(common_hot_neptune_low_spec, w3),
  proof(
    goal(rejectsInWorld(common_hot_neptune_low_spec, w3)), by(rule("exoplanet-validation-worlds.pl", clause(28))),
    bindings([binding("Candidate", common_hot_neptune_low_spec), binding("World", w3)]),
    uses([
      proof(
        goal(rejects_in_world(common_hot_neptune_low_spec, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
        bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001)]),
        uses([
          proof(
            goal(ppv_planet(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.099999999999999978), binding("FalsePositiveMass", 0.074999999999999983), binding("Denominator", 0.3125)]),
            uses([
              proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
              proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
              proof(goal(sub(1.0, 0.90, 0.099999999999999978)), by(builtin(sub, 3))),
              proof(goal(mul(0.099999999999999978, 0.75, 0.074999999999999983)), by(builtin(mul, 3))),
              proof(goal(add(0.23749999999999999, 0.074999999999999983, 0.3125)), by(builtin(add, 3))),
              proof(goal(div(0.23749999999999999, 0.3125, 0.76000000000000001)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(lt(0.76000000000000001, 0.93)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

status(exoplanet_validation_worlds, expected_world_pattern).
why(
  status(exoplanet_validation_worlds, expected_world_pattern),
  proof(
    goal(status(exoplanet_validation_worlds, expected_world_pattern)), by(rule("exoplanet-validation-worlds.pl", clause(29))),
    uses([
      proof(
        goal(pattern_matches(report)), by(rule("exoplanet-validation-worlds.pl", clause(25))),
        uses([
          proof(
            goal(confirms_in_world(rare_wide_orbit, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", rare_wide_orbit), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
              proof(goal(ge(0.99, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(rare_wide_orbit, w0)), by(rule("exoplanet-validation-worlds.pl", clause(16))),
            bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442)]),
            uses([
              proof(
                goal(ppv_planet(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.00098999999999999999), binding("NoPlanetPrior", 0.999), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0099900000000000093), binding("Denominator", 0.010980000000000009)]),
                uses([
                  proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
                  proof(goal(mul(0.99, 0.001, 0.00098999999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.001, 0.999)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.999, 0.0099900000000000093)), by(builtin(mul, 3))),
                  proof(goal(add(0.00098999999999999999, 0.0099900000000000093, 0.010980000000000009)), by(builtin(add, 3))),
                  proof(goal(div(0.00098999999999999999, 0.010980000000000009, 0.090163934426229442)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.090163934426229442, 0.90)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(rare_wide_orbit, w2)), by(rule("exoplanet-validation-worlds.pl", clause(20))),
            bindings([binding("Candidate", rare_wide_orbit), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
              proof(goal(lt(0.001, 0.05)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(rare_wide_orbit, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
            bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442)]),
            uses([
              proof(
                goal(ppv_planet(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.00098999999999999999), binding("NoPlanetPrior", 0.999), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0099900000000000093), binding("Denominator", 0.010980000000000009)]),
                uses([
                  proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
                  proof(goal(mul(0.99, 0.001, 0.00098999999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.001, 0.999)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.999, 0.0099900000000000093)), by(builtin(mul, 3))),
                  proof(goal(add(0.00098999999999999999, 0.0099900000000000093, 0.010980000000000009)), by(builtin(add, 3))),
                  proof(goal(div(0.00098999999999999999, 0.010980000000000009, 0.090163934426229442)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.090163934426229442, 0.93)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w0)), by(rule("exoplanet-validation-worlds.pl", clause(15))),
            bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934)]),
            uses([
              proof(
                goal(ppv_planet(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.19800000000000001), binding("NoPlanetPrior", 0.80000000000000004), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0080000000000000071), binding("Denominator", 0.20600000000000002)]),
                uses([
                  proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
                  proof(goal(mul(0.99, 0.20, 0.19800000000000001)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.20, 0.80000000000000004)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.80000000000000004, 0.0080000000000000071)), by(builtin(mul, 3))),
                  proof(goal(add(0.19800000000000001, 0.0080000000000000071, 0.20600000000000002)), by(builtin(add, 3))),
                  proof(goal(div(0.19800000000000001, 0.20600000000000002, 0.96116504854368934)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(ge(0.96116504854368934, 0.90)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", mstar_short_period), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
              proof(goal(ge(0.99, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w2)), by(rule("exoplanet-validation-worlds.pl", clause(19))),
            bindings([binding("Candidate", mstar_short_period), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
              proof(goal(ge(0.20, 0.05)), by(builtin(ge, 2))),
              proof(goal(ge(0.99, 0.90)), by(builtin(ge, 2))),
              proof(goal(ge(0.99, 0.97)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w3)), by(rule("exoplanet-validation-worlds.pl", clause(23))),
            bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934)]),
            uses([
              proof(
                goal(ppv_planet(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.19800000000000001), binding("NoPlanetPrior", 0.80000000000000004), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0080000000000000071), binding("Denominator", 0.20600000000000002)]),
                uses([
                  proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
                  proof(goal(mul(0.99, 0.20, 0.19800000000000001)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.20, 0.80000000000000004)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.80000000000000004, 0.0080000000000000071)), by(builtin(mul, 3))),
                  proof(goal(add(0.19800000000000001, 0.0080000000000000071, 0.20600000000000002)), by(builtin(add, 3))),
                  proof(goal(div(0.19800000000000001, 0.20600000000000002, 0.96116504854368934)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(ge(0.96116504854368934, 0.93)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_good, w0)), by(rule("exoplanet-validation-worlds.pl", clause(15))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.030000000000000027), binding("FalsePositiveMass", 0.02250000000000002), binding("Denominator", 0.26000000000000001)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.97, 0.030000000000000027)), by(builtin(sub, 3))),
                  proof(goal(mul(0.030000000000000027, 0.75, 0.02250000000000002)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.02250000000000002, 0.26000000000000001)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.26000000000000001, 0.91346153846153844)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(ge(0.91346153846153844, 0.90)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_good, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97)]),
            uses([
              proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
              proof(goal(ge(0.95, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_good, w2)), by(rule("exoplanet-validation-worlds.pl", clause(19))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97)]),
            uses([
              proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
              proof(goal(ge(0.25, 0.05)), by(builtin(ge, 2))),
              proof(goal(ge(0.95, 0.90)), by(builtin(ge, 2))),
              proof(goal(ge(0.97, 0.97)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_good, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.030000000000000027), binding("FalsePositiveMass", 0.02250000000000002), binding("Denominator", 0.26000000000000001)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.97, 0.030000000000000027)), by(builtin(sub, 3))),
                  proof(goal(mul(0.030000000000000027, 0.75, 0.02250000000000002)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.02250000000000002, 0.26000000000000001)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.26000000000000001, 0.91346153846153844)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.91346153846153844, 0.93)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_low_spec, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90)]),
            uses([
              proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
              proof(goal(ge(0.95, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_low_spec, w0)), by(rule("exoplanet-validation-worlds.pl", clause(16))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.099999999999999978), binding("FalsePositiveMass", 0.074999999999999983), binding("Denominator", 0.3125)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.90, 0.099999999999999978)), by(builtin(sub, 3))),
                  proof(goal(mul(0.099999999999999978, 0.75, 0.074999999999999983)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.074999999999999983, 0.3125)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.3125, 0.76000000000000001)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.76000000000000001, 0.90)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_low_spec, w2)), by(rule("exoplanet-validation-worlds.pl", clause(22))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90)]),
            uses([
              proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
              proof(goal(lt(0.90, 0.97)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_low_spec, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.099999999999999978), binding("FalsePositiveMass", 0.074999999999999983), binding("Denominator", 0.3125)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.90, 0.099999999999999978)), by(builtin(sub, 3))),
                  proof(goal(mul(0.099999999999999978, 0.75, 0.074999999999999983)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.074999999999999983, 0.3125)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.3125, 0.76000000000000001)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.76000000000000001, 0.93)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

reason(exoplanet_validation_worlds, "Bayesian worlds account for occurrence and false positives while the naive world trusts sensitivity alone").
why(
  reason(exoplanet_validation_worlds, "Bayesian worlds account for occurrence and false positives while the naive world trusts sensitivity alone"),
  proof(
    goal(reason(exoplanet_validation_worlds, "Bayesian worlds account for occurrence and false positives while the naive world trusts sensitivity alone")), by(rule("exoplanet-validation-worlds.pl", clause(30))),
    uses([
      proof(
        goal(pattern_matches(report)), by(rule("exoplanet-validation-worlds.pl", clause(25))),
        uses([
          proof(
            goal(confirms_in_world(rare_wide_orbit, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", rare_wide_orbit), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
              proof(goal(ge(0.99, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(rare_wide_orbit, w0)), by(rule("exoplanet-validation-worlds.pl", clause(16))),
            bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442)]),
            uses([
              proof(
                goal(ppv_planet(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.00098999999999999999), binding("NoPlanetPrior", 0.999), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0099900000000000093), binding("Denominator", 0.010980000000000009)]),
                uses([
                  proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
                  proof(goal(mul(0.99, 0.001, 0.00098999999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.001, 0.999)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.999, 0.0099900000000000093)), by(builtin(mul, 3))),
                  proof(goal(add(0.00098999999999999999, 0.0099900000000000093, 0.010980000000000009)), by(builtin(add, 3))),
                  proof(goal(div(0.00098999999999999999, 0.010980000000000009, 0.090163934426229442)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.090163934426229442, 0.90)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(rare_wide_orbit, w2)), by(rule("exoplanet-validation-worlds.pl", clause(20))),
            bindings([binding("Candidate", rare_wide_orbit), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
              proof(goal(lt(0.001, 0.05)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(rare_wide_orbit, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
            bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442)]),
            uses([
              proof(
                goal(ppv_planet(rare_wide_orbit, 0.090163934426229442)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", rare_wide_orbit), binding("PPV", 0.090163934426229442), binding("Occurrence", 0.001), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.00098999999999999999), binding("NoPlanetPrior", 0.999), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0099900000000000093), binding("Denominator", 0.010980000000000009)]),
                uses([
                  proof(goal(candidate(rare_wide_orbit, 0.001, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(6)))),
                  proof(goal(mul(0.99, 0.001, 0.00098999999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.001, 0.999)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.999, 0.0099900000000000093)), by(builtin(mul, 3))),
                  proof(goal(add(0.00098999999999999999, 0.0099900000000000093, 0.010980000000000009)), by(builtin(add, 3))),
                  proof(goal(div(0.00098999999999999999, 0.010980000000000009, 0.090163934426229442)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.090163934426229442, 0.93)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w0)), by(rule("exoplanet-validation-worlds.pl", clause(15))),
            bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934)]),
            uses([
              proof(
                goal(ppv_planet(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.19800000000000001), binding("NoPlanetPrior", 0.80000000000000004), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0080000000000000071), binding("Denominator", 0.20600000000000002)]),
                uses([
                  proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
                  proof(goal(mul(0.99, 0.20, 0.19800000000000001)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.20, 0.80000000000000004)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.80000000000000004, 0.0080000000000000071)), by(builtin(mul, 3))),
                  proof(goal(add(0.19800000000000001, 0.0080000000000000071, 0.20600000000000002)), by(builtin(add, 3))),
                  proof(goal(div(0.19800000000000001, 0.20600000000000002, 0.96116504854368934)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(ge(0.96116504854368934, 0.90)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", mstar_short_period), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
              proof(goal(ge(0.99, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w2)), by(rule("exoplanet-validation-worlds.pl", clause(19))),
            bindings([binding("Candidate", mstar_short_period), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99)]),
            uses([
              proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
              proof(goal(ge(0.20, 0.05)), by(builtin(ge, 2))),
              proof(goal(ge(0.99, 0.90)), by(builtin(ge, 2))),
              proof(goal(ge(0.99, 0.97)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(mstar_short_period, w3)), by(rule("exoplanet-validation-worlds.pl", clause(23))),
            bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934)]),
            uses([
              proof(
                goal(ppv_planet(mstar_short_period, 0.96116504854368934)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", mstar_short_period), binding("PPV", 0.96116504854368934), binding("Occurrence", 0.20), binding("Sensitivity", 0.99), binding("Specificity", 0.99), binding("Numerator", 0.19800000000000001), binding("NoPlanetPrior", 0.80000000000000004), binding("FalsePositiveRate", 0.010000000000000009), binding("FalsePositiveMass", 0.0080000000000000071), binding("Denominator", 0.20600000000000002)]),
                uses([
                  proof(goal(candidate(mstar_short_period, 0.20, 0.99, 0.99)), by(fact("exoplanet-validation-worlds.pl", clause(7)))),
                  proof(goal(mul(0.99, 0.20, 0.19800000000000001)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.20, 0.80000000000000004)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.99, 0.010000000000000009)), by(builtin(sub, 3))),
                  proof(goal(mul(0.010000000000000009, 0.80000000000000004, 0.0080000000000000071)), by(builtin(mul, 3))),
                  proof(goal(add(0.19800000000000001, 0.0080000000000000071, 0.20600000000000002)), by(builtin(add, 3))),
                  proof(goal(div(0.19800000000000001, 0.20600000000000002, 0.96116504854368934)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(ge(0.96116504854368934, 0.93)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_good, w0)), by(rule("exoplanet-validation-worlds.pl", clause(15))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.030000000000000027), binding("FalsePositiveMass", 0.02250000000000002), binding("Denominator", 0.26000000000000001)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.97, 0.030000000000000027)), by(builtin(sub, 3))),
                  proof(goal(mul(0.030000000000000027, 0.75, 0.02250000000000002)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.02250000000000002, 0.26000000000000001)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.26000000000000001, 0.91346153846153844)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(ge(0.91346153846153844, 0.90)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_good, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97)]),
            uses([
              proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
              proof(goal(ge(0.95, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_good, w2)), by(rule("exoplanet-validation-worlds.pl", clause(19))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97)]),
            uses([
              proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
              proof(goal(ge(0.25, 0.05)), by(builtin(ge, 2))),
              proof(goal(ge(0.95, 0.90)), by(builtin(ge, 2))),
              proof(goal(ge(0.97, 0.97)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_good, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
            bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_good, 0.91346153846153844)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_good), binding("PPV", 0.91346153846153844), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.97), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.030000000000000027), binding("FalsePositiveMass", 0.02250000000000002), binding("Denominator", 0.26000000000000001)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_good, 0.25, 0.95, 0.97)), by(fact("exoplanet-validation-worlds.pl", clause(8)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.97, 0.030000000000000027)), by(builtin(sub, 3))),
                  proof(goal(mul(0.030000000000000027, 0.75, 0.02250000000000002)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.02250000000000002, 0.26000000000000001)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.26000000000000001, 0.91346153846153844)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.91346153846153844, 0.93)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(confirms_in_world(common_hot_neptune_low_spec, w1)), by(rule("exoplanet-validation-worlds.pl", clause(17))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90)]),
            uses([
              proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
              proof(goal(ge(0.95, 0.95)), by(builtin(ge, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_low_spec, w0)), by(rule("exoplanet-validation-worlds.pl", clause(16))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.099999999999999978), binding("FalsePositiveMass", 0.074999999999999983), binding("Denominator", 0.3125)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.90, 0.099999999999999978)), by(builtin(sub, 3))),
                  proof(goal(mul(0.099999999999999978, 0.75, 0.074999999999999983)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.074999999999999983, 0.3125)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.3125, 0.76000000000000001)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.76000000000000001, 0.90)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_low_spec, w2)), by(rule("exoplanet-validation-worlds.pl", clause(22))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90)]),
            uses([
              proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
              proof(goal(lt(0.90, 0.97)), by(builtin(lt, 2)))
            ])
          ),
          proof(
            goal(rejects_in_world(common_hot_neptune_low_spec, w3)), by(rule("exoplanet-validation-worlds.pl", clause(24))),
            bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001)]),
            uses([
              proof(
                goal(ppv_planet(common_hot_neptune_low_spec, 0.76000000000000001)), by(rule("exoplanet-validation-worlds.pl", clause(14))),
                bindings([binding("Candidate", common_hot_neptune_low_spec), binding("PPV", 0.76000000000000001), binding("Occurrence", 0.25), binding("Sensitivity", 0.95), binding("Specificity", 0.90), binding("Numerator", 0.23749999999999999), binding("NoPlanetPrior", 0.75), binding("FalsePositiveRate", 0.099999999999999978), binding("FalsePositiveMass", 0.074999999999999983), binding("Denominator", 0.3125)]),
                uses([
                  proof(goal(candidate(common_hot_neptune_low_spec, 0.25, 0.95, 0.90)), by(fact("exoplanet-validation-worlds.pl", clause(9)))),
                  proof(goal(mul(0.95, 0.25, 0.23749999999999999)), by(builtin(mul, 3))),
                  proof(goal(sub(1.0, 0.25, 0.75)), by(builtin(sub, 3))),
                  proof(goal(sub(1.0, 0.90, 0.099999999999999978)), by(builtin(sub, 3))),
                  proof(goal(mul(0.099999999999999978, 0.75, 0.074999999999999983)), by(builtin(mul, 3))),
                  proof(goal(add(0.23749999999999999, 0.074999999999999983, 0.3125)), by(builtin(add, 3))),
                  proof(goal(div(0.23749999999999999, 0.3125, 0.76000000000000001)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(lt(0.76000000000000001, 0.93)), by(builtin(lt, 2)))
            ])
          )
        ])
      )
    ])
  )
).

