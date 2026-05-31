weightKg(case, 72.0).
why(
  weightKg(case, 72.0),
  proof(
    goal(weightKg(case, 72.0)),
    by(rule("bmi.pl", clause(35))),
    bindings([binding("W", 72.0)]),
    uses([
      proof(
        goal(unitSystem(input, metric)),
        by(fact("bmi.pl", clause(32)))
      ),
      proof(
        goal(weight(input, 72.0)),
        by(fact("bmi.pl", clause(33)))
      )
    ])
  )
).

heightM(case, 1.78).
why(
  heightM(case, 1.78),
  proof(
    goal(heightM(case, 1.78)),
    by(rule("bmi.pl", clause(36))),
    bindings([binding("M", 1.78), binding("H", 178.0)]),
    uses([
      proof(
        goal(unitSystem(input, metric)),
        by(fact("bmi.pl", clause(32)))
      ),
      proof(
        goal(height(input, 178.0)),
        by(fact("bmi.pl", clause(34)))
      ),
      proof(
        goal(div(178.0, 100.0, 1.78)),
        by(builtin(div, 3))
      )
    ])
  )
).

units(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.").
why(
  units(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters."),
  proof(
    goal(units(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.")),
    by(rule("bmi.pl", clause(37))),
    uses([
      proof(
        goal(unitSystem(input, metric)),
        by(fact("bmi.pl", clause(32)))
      )
    ])
  )
).

heightSquared(case, 3.1684000000000001).
why(
  heightSquared(case, 3.1684000000000001),
  proof(
    goal(heightSquared(case, 3.1684000000000001)),
    by(rule("bmi.pl", clause(41))),
    bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
    uses([
      proof(
        goal(heightM(case, 1.78)),
        by(rule("bmi.pl", clause(36))),
        bindings([binding("M", 1.78), binding("H", 178.0)]),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          ),
          proof(
            goal(height(input, 178.0)),
            by(fact("bmi.pl", clause(34)))
          ),
          proof(
            goal(div(178.0, 100.0, 1.78)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(mul(1.78, 1.78, 3.1684000000000001)),
        by(builtin(mul, 3))
      )
    ])
  )
).

bmi(case, 22.724403484408533).
why(
  bmi(case, 22.724403484408533),
  proof(
    goal(bmi(case, 22.724403484408533)),
    by(rule("bmi.pl", clause(42))),
    bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
    uses([
      proof(
        goal(weightKg(case, 72.0)),
        by(rule("bmi.pl", clause(35))),
        bindings([binding("W", 72.0)]),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          ),
          proof(
            goal(weight(input, 72.0)),
            by(fact("bmi.pl", clause(33)))
          )
        ])
      ),
      proof(
        goal(heightSquared(case, 3.1684000000000001)),
        by(rule("bmi.pl", clause(41))),
        bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
        uses([
          proof(
            goal(heightM(case, 1.78)),
            by(rule("bmi.pl", clause(36))),
            bindings([binding("M", 1.78), binding("H", 178.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(height(input, 178.0)),
                by(fact("bmi.pl", clause(34)))
              ),
              proof(
                goal(div(178.0, 100.0, 1.78)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(1.78, 1.78, 3.1684000000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
        by(builtin(div, 3))
      )
    ])
  )
).

bmi(answer, 22.72).
why(
  bmi(answer, 22.72),
  proof(
    goal(bmi(answer, 22.72)),
    by(rule("bmi.pl", clause(54))),
    uses([
      proof(
        goal(bmiRoundedInt(case, 2272)),
        by(rule("bmi.pl", clause(43))),
        bindings([binding("BmiRoundedInt", 2272), binding("Bmi", 22.724403484408533), binding("BmiX100", 2272.4403484408535)]),
        uses([
          proof(
            goal(bmi(case, 22.724403484408533)),
            by(rule("bmi.pl", clause(42))),
            bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
            uses([
              proof(
                goal(weightKg(case, 72.0)),
                by(rule("bmi.pl", clause(35))),
                bindings([binding("W", 72.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(weight(input, 72.0)),
                    by(fact("bmi.pl", clause(33)))
                  )
                ])
              ),
              proof(
                goal(heightSquared(case, 3.1684000000000001)),
                by(rule("bmi.pl", clause(41))),
                bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                uses([
                  proof(
                    goal(heightM(case, 1.78)),
                    by(rule("bmi.pl", clause(36))),
                    bindings([binding("M", 1.78), binding("H", 178.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(height(input, 178.0)),
                        by(fact("bmi.pl", clause(34)))
                      ),
                      proof(
                        goal(div(178.0, 100.0, 1.78)),
                        by(builtin(div, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(1.78, 1.78, 3.1684000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(22.724403484408533, 100.0, 2272.4403484408535)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(rounded(2272.4403484408535, 2272)),
            by(builtin(rounded, 2))
          )
        ])
      )
    ])
  )
).

bmiRoundedInt(case, 2272).
why(
  bmiRoundedInt(case, 2272),
  proof(
    goal(bmiRoundedInt(case, 2272)),
    by(rule("bmi.pl", clause(43))),
    bindings([binding("BmiRoundedInt", 2272), binding("Bmi", 22.724403484408533), binding("BmiX100", 2272.4403484408535)]),
    uses([
      proof(
        goal(bmi(case, 22.724403484408533)),
        by(rule("bmi.pl", clause(42))),
        bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(weightKg(case, 72.0)),
            by(rule("bmi.pl", clause(35))),
            bindings([binding("W", 72.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(weight(input, 72.0)),
                by(fact("bmi.pl", clause(33)))
              )
            ])
          ),
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(mul(22.724403484408533, 100.0, 2272.4403484408535)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(rounded(2272.4403484408535, 2272)),
        by(builtin(rounded, 2))
      )
    ])
  )
).

healthyMinKg(case, 58.615400000000001).
why(
  healthyMinKg(case, 58.615400000000001),
  proof(
    goal(healthyMinKg(case, 58.615400000000001)),
    by(rule("bmi.pl", clause(44))),
    bindings([binding("HealthyMin", 58.615400000000001), binding("M2", 3.1684000000000001)]),
    uses([
      proof(
        goal(heightSquared(case, 3.1684000000000001)),
        by(rule("bmi.pl", clause(41))),
        bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
        uses([
          proof(
            goal(heightM(case, 1.78)),
            by(rule("bmi.pl", clause(36))),
            bindings([binding("M", 1.78), binding("H", 178.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(height(input, 178.0)),
                by(fact("bmi.pl", clause(34)))
              ),
              proof(
                goal(div(178.0, 100.0, 1.78)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(1.78, 1.78, 3.1684000000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(mul(18.5, 3.1684000000000001, 58.615400000000001)),
        by(builtin(mul, 3))
      )
    ])
  )
).

healthyMinKg(answer, 58.6).
why(
  healthyMinKg(answer, 58.6),
  proof(
    goal(healthyMinKg(answer, 58.6)),
    by(rule("bmi.pl", clause(56))),
    uses([
      proof(
        goal(healthyMinKgRoundedInt(case, 586)),
        by(rule("bmi.pl", clause(46))),
        bindings([binding("MinRoundedInt", 586), binding("HealthyMin", 58.615400000000001), binding("MinX10", 586.154)]),
        uses([
          proof(
            goal(healthyMinKg(case, 58.615400000000001)),
            by(rule("bmi.pl", clause(44))),
            bindings([binding("HealthyMin", 58.615400000000001), binding("M2", 3.1684000000000001)]),
            uses([
              proof(
                goal(heightSquared(case, 3.1684000000000001)),
                by(rule("bmi.pl", clause(41))),
                bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                uses([
                  proof(
                    goal(heightM(case, 1.78)),
                    by(rule("bmi.pl", clause(36))),
                    bindings([binding("M", 1.78), binding("H", 178.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(height(input, 178.0)),
                        by(fact("bmi.pl", clause(34)))
                      ),
                      proof(
                        goal(div(178.0, 100.0, 1.78)),
                        by(builtin(div, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(1.78, 1.78, 3.1684000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(18.5, 3.1684000000000001, 58.615400000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(mul(58.615400000000001, 10.0, 586.154)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(rounded(586.154, 586)),
            by(builtin(rounded, 2))
          )
        ])
      )
    ])
  )
).

healthyMaxKg(case, 78.893159999999995).
why(
  healthyMaxKg(case, 78.893159999999995),
  proof(
    goal(healthyMaxKg(case, 78.893159999999995)),
    by(rule("bmi.pl", clause(45))),
    bindings([binding("HealthyMax", 78.893159999999995), binding("M2", 3.1684000000000001)]),
    uses([
      proof(
        goal(heightSquared(case, 3.1684000000000001)),
        by(rule("bmi.pl", clause(41))),
        bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
        uses([
          proof(
            goal(heightM(case, 1.78)),
            by(rule("bmi.pl", clause(36))),
            bindings([binding("M", 1.78), binding("H", 178.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(height(input, 178.0)),
                by(fact("bmi.pl", clause(34)))
              ),
              proof(
                goal(div(178.0, 100.0, 1.78)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(1.78, 1.78, 3.1684000000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(mul(24.9, 3.1684000000000001, 78.893159999999995)),
        by(builtin(mul, 3))
      )
    ])
  )
).

healthyMaxKg(answer, 78.9).
why(
  healthyMaxKg(answer, 78.9),
  proof(
    goal(healthyMaxKg(answer, 78.9)),
    by(rule("bmi.pl", clause(57))),
    uses([
      proof(
        goal(healthyMaxKgRoundedInt(case, 789)),
        by(rule("bmi.pl", clause(47))),
        bindings([binding("MaxRoundedInt", 789), binding("HealthyMax", 78.893159999999995), binding("MaxX10", 788.93159999999989)]),
        uses([
          proof(
            goal(healthyMaxKg(case, 78.893159999999995)),
            by(rule("bmi.pl", clause(45))),
            bindings([binding("HealthyMax", 78.893159999999995), binding("M2", 3.1684000000000001)]),
            uses([
              proof(
                goal(heightSquared(case, 3.1684000000000001)),
                by(rule("bmi.pl", clause(41))),
                bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                uses([
                  proof(
                    goal(heightM(case, 1.78)),
                    by(rule("bmi.pl", clause(36))),
                    bindings([binding("M", 1.78), binding("H", 178.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(height(input, 178.0)),
                        by(fact("bmi.pl", clause(34)))
                      ),
                      proof(
                        goal(div(178.0, 100.0, 1.78)),
                        by(builtin(div, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(1.78, 1.78, 3.1684000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(24.9, 3.1684000000000001, 78.893159999999995)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(mul(78.893159999999995, 10.0, 788.93159999999989)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(rounded(788.93159999999989, 789)),
            by(builtin(rounded, 2))
          )
        ])
      )
    ])
  )
).

healthyMinKgRoundedInt(case, 586).
why(
  healthyMinKgRoundedInt(case, 586),
  proof(
    goal(healthyMinKgRoundedInt(case, 586)),
    by(rule("bmi.pl", clause(46))),
    bindings([binding("MinRoundedInt", 586), binding("HealthyMin", 58.615400000000001), binding("MinX10", 586.154)]),
    uses([
      proof(
        goal(healthyMinKg(case, 58.615400000000001)),
        by(rule("bmi.pl", clause(44))),
        bindings([binding("HealthyMin", 58.615400000000001), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(mul(18.5, 3.1684000000000001, 58.615400000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(mul(58.615400000000001, 10.0, 586.154)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(rounded(586.154, 586)),
        by(builtin(rounded, 2))
      )
    ])
  )
).

healthyMaxKgRoundedInt(case, 789).
why(
  healthyMaxKgRoundedInt(case, 789),
  proof(
    goal(healthyMaxKgRoundedInt(case, 789)),
    by(rule("bmi.pl", clause(47))),
    bindings([binding("MaxRoundedInt", 789), binding("HealthyMax", 78.893159999999995), binding("MaxX10", 788.93159999999989)]),
    uses([
      proof(
        goal(healthyMaxKg(case, 78.893159999999995)),
        by(rule("bmi.pl", clause(45))),
        bindings([binding("HealthyMax", 78.893159999999995), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(mul(24.9, 3.1684000000000001, 78.893159999999995)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(mul(78.893159999999995, 10.0, 788.93159999999989)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(rounded(788.93159999999989, 789)),
        by(builtin(rounded, 2))
      )
    ])
  )
).

category(decision, "Normal").
why(
  category(decision, "Normal"),
  proof(
    goal(category(decision, "Normal")),
    by(rule("bmi.pl", clause(49))),
    bindings([binding("Bmi", 22.724403484408533)]),
    uses([
      proof(
        goal(bmi(case, 22.724403484408533)),
        by(rule("bmi.pl", clause(42))),
        bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(weightKg(case, 72.0)),
            by(rule("bmi.pl", clause(35))),
            bindings([binding("W", 72.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(weight(input, 72.0)),
                by(fact("bmi.pl", clause(33)))
              )
            ])
          ),
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(ge(22.724403484408533, 18.5)),
        by(builtin(ge, 2))
      ),
      proof(
        goal(lt(22.724403484408533, 25.0)),
        by(builtin(lt, 2))
      )
    ])
  )
).

category(answer, "Normal").
why(
  category(answer, "Normal"),
  proof(
    goal(category(answer, "Normal")),
    by(rule("bmi.pl", clause(55))),
    bindings([binding("Category", "Normal")]),
    uses([
      proof(
        goal(category(decision, "Normal")),
        by(rule("bmi.pl", clause(49))),
        bindings([binding("Bmi", 22.724403484408533)]),
        uses([
          proof(
            goal(bmi(case, 22.724403484408533)),
            by(rule("bmi.pl", clause(42))),
            bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
            uses([
              proof(
                goal(weightKg(case, 72.0)),
                by(rule("bmi.pl", clause(35))),
                bindings([binding("W", 72.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(weight(input, 72.0)),
                    by(fact("bmi.pl", clause(33)))
                  )
                ])
              ),
              proof(
                goal(heightSquared(case, 3.1684000000000001)),
                by(rule("bmi.pl", clause(41))),
                bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                uses([
                  proof(
                    goal(heightM(case, 1.78)),
                    by(rule("bmi.pl", clause(36))),
                    bindings([binding("M", 1.78), binding("H", 178.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(height(input, 178.0)),
                        by(fact("bmi.pl", clause(34)))
                      ),
                      proof(
                        goal(div(178.0, 100.0, 1.78)),
                        by(builtin(div, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(1.78, 1.78, 3.1684000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(ge(22.724403484408533, 18.5)),
            by(builtin(ge, 2))
          ),
          proof(
            goal(lt(22.724403484408533, 25.0)),
            by(builtin(lt, 2))
          )
        ])
      )
    ])
  )
).

heightCm(answer, 178).
why(
  heightCm(answer, 178),
  proof(
    goal(heightCm(answer, 178)),
    by(rule("bmi.pl", clause(58))),
    bindings([binding("CmRounded", 178), binding("M", 1.78), binding("Cm", 178.0)]),
    uses([
      proof(
        goal(heightM(case, 1.78)),
        by(rule("bmi.pl", clause(36))),
        bindings([binding("M", 1.78), binding("H", 178.0)]),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          ),
          proof(
            goal(height(input, 178.0)),
            by(fact("bmi.pl", clause(34)))
          ),
          proof(
            goal(div(178.0, 100.0, 1.78)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(mul(1.78, 100.0, 178.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(rounded(178.0, 178)),
        by(builtin(rounded, 2))
      )
    ])
  )
).

heightCm(report, 178).
why(
  heightCm(report, 178),
  proof(
    goal(heightCm(report, 178)),
    by(rule("bmi.pl", clause(74))),
    bindings([binding("Height", 178)]),
    uses([
      proof(
        goal(heightCm(answer, 178)),
        by(rule("bmi.pl", clause(58))),
        bindings([binding("CmRounded", 178), binding("M", 1.78), binding("Cm", 178.0)]),
        uses([
          proof(
            goal(heightM(case, 1.78)),
            by(rule("bmi.pl", clause(36))),
            bindings([binding("M", 1.78), binding("H", 178.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(height(input, 178.0)),
                by(fact("bmi.pl", clause(34)))
              ),
              proof(
                goal(div(178.0, 100.0, 1.78)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(1.78, 100.0, 178.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(rounded(178.0, 178)),
            by(builtin(rounded, 2))
          )
        ])
      )
    ])
  )
).

formula(reason, "BMI is defined as weight in kilograms divided by height in meters squared.").
why(
  formula(reason, "BMI is defined as weight in kilograms divided by height in meters squared."),
  proof(
    goal(formula(reason, "BMI is defined as weight in kilograms divided by height in meters squared.")),
    by(rule("bmi.pl", clause(59))),
    bindings([binding("_Bmi", 22.724403484408533)]),
    uses([
      proof(
        goal(bmi(case, 22.724403484408533)),
        by(rule("bmi.pl", clause(42))),
        bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(weightKg(case, 72.0)),
            by(rule("bmi.pl", clause(35))),
            bindings([binding("W", 72.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(weight(input, 72.0)),
                by(fact("bmi.pl", clause(33)))
              )
            ])
          ),
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

calculation(reason, "The normalized weight and height were used to compute BMI, then the result was mapped to the WHO adult category table.").
why(
  calculation(reason, "The normalized weight and height were used to compute BMI, then the result was mapped to the WHO adult category table."),
  proof(
    goal(calculation(reason, "The normalized weight and height were used to compute BMI, then the result was mapped to the WHO adult category table.")),
    by(rule("bmi.pl", clause(60))),
    bindings([binding("_Category", "Normal")]),
    uses([
      proof(
        goal(category(decision, "Normal")),
        by(rule("bmi.pl", clause(49))),
        bindings([binding("Bmi", 22.724403484408533)]),
        uses([
          proof(
            goal(bmi(case, 22.724403484408533)),
            by(rule("bmi.pl", clause(42))),
            bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
            uses([
              proof(
                goal(weightKg(case, 72.0)),
                by(rule("bmi.pl", clause(35))),
                bindings([binding("W", 72.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(weight(input, 72.0)),
                    by(fact("bmi.pl", clause(33)))
                  )
                ])
              ),
              proof(
                goal(heightSquared(case, 3.1684000000000001)),
                by(rule("bmi.pl", clause(41))),
                bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                uses([
                  proof(
                    goal(heightM(case, 1.78)),
                    by(rule("bmi.pl", clause(36))),
                    bindings([binding("M", 1.78), binding("H", 178.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(height(input, 178.0)),
                        by(fact("bmi.pl", clause(34)))
                      ),
                      proof(
                        goal(div(178.0, 100.0, 1.78)),
                        by(builtin(div, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(1.78, 1.78, 3.1684000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(ge(22.724403484408533, 18.5)),
            by(builtin(ge, 2))
          ),
          proof(
            goal(lt(22.724403484408533, 25.0)),
            by(builtin(lt, 2))
          )
        ])
      )
    ])
  )
).

categoryRule(reason, "Normal").
why(
  categoryRule(reason, "Normal"),
  proof(
    goal(categoryRule(reason, "Normal")),
    by(rule("bmi.pl", clause(61))),
    bindings([binding("Category", "Normal")]),
    uses([
      proof(
        goal(category(decision, "Normal")),
        by(rule("bmi.pl", clause(49))),
        bindings([binding("Bmi", 22.724403484408533)]),
        uses([
          proof(
            goal(bmi(case, 22.724403484408533)),
            by(rule("bmi.pl", clause(42))),
            bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
            uses([
              proof(
                goal(weightKg(case, 72.0)),
                by(rule("bmi.pl", clause(35))),
                bindings([binding("W", 72.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(weight(input, 72.0)),
                    by(fact("bmi.pl", clause(33)))
                  )
                ])
              ),
              proof(
                goal(heightSquared(case, 3.1684000000000001)),
                by(rule("bmi.pl", clause(41))),
                bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                uses([
                  proof(
                    goal(heightM(case, 1.78)),
                    by(rule("bmi.pl", clause(36))),
                    bindings([binding("M", 1.78), binding("H", 178.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(height(input, 178.0)),
                        by(fact("bmi.pl", clause(34)))
                      ),
                      proof(
                        goal(div(178.0, 100.0, 1.78)),
                        by(builtin(div, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(1.78, 1.78, 3.1684000000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(ge(22.724403484408533, 18.5)),
            by(builtin(ge, 2))
          ),
          proof(
            goal(lt(22.724403484408533, 25.0)),
            by(builtin(lt, 2))
          )
        ])
      )
    ])
  )
).

unitsExplanation(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.").
why(
  unitsExplanation(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters."),
  proof(
    goal(unitsExplanation(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.")),
    by(rule("bmi.pl", clause(62))),
    bindings([binding("Units", "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.")]),
    uses([
      proof(
        goal(units(reason, "Inputs were already metric, so kilograms stay kilograms and centimeters are divided by 100 to obtain meters.")),
        by(rule("bmi.pl", clause(37))),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          )
        ])
      )
    ])
  )
).

c1(check, "OK - the input was normalized into positive SI values.").
why(
  c1(check, "OK - the input was normalized into positive SI values."),
  proof(
    goal(c1(check, "OK - the input was normalized into positive SI values.")),
    by(rule("bmi.pl", clause(63))),
    bindings([binding("Kg", 72.0), binding("M", 1.78)]),
    uses([
      proof(
        goal(weightKg(case, 72.0)),
        by(rule("bmi.pl", clause(35))),
        bindings([binding("W", 72.0)]),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          ),
          proof(
            goal(weight(input, 72.0)),
            by(fact("bmi.pl", clause(33)))
          )
        ])
      ),
      proof(
        goal(heightM(case, 1.78)),
        by(rule("bmi.pl", clause(36))),
        bindings([binding("M", 1.78), binding("H", 178.0)]),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          ),
          proof(
            goal(height(input, 178.0)),
            by(fact("bmi.pl", clause(34)))
          ),
          proof(
            goal(div(178.0, 100.0, 1.78)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(gt(72.0, 0)),
        by(builtin(gt, 2))
      ),
      proof(
        goal(gt(1.78, 0)),
        by(builtin(gt, 2))
      )
    ])
  )
).

c2(check, "OK - height squared was reconstructed from the normalized height.").
why(
  c2(check, "OK - height squared was reconstructed from the normalized height."),
  proof(
    goal(c2(check, "OK - height squared was reconstructed from the normalized height.")),
    by(rule("bmi.pl", clause(64))),
    bindings([binding("M", 1.78), binding("M2", 3.1684000000000001)]),
    uses([
      proof(
        goal(heightM(case, 1.78)),
        by(rule("bmi.pl", clause(36))),
        bindings([binding("M", 1.78), binding("H", 178.0)]),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          ),
          proof(
            goal(height(input, 178.0)),
            by(fact("bmi.pl", clause(34)))
          ),
          proof(
            goal(div(178.0, 100.0, 1.78)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(heightSquared(case, 3.1684000000000001)),
        by(rule("bmi.pl", clause(41))),
        bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
        uses([
          proof(
            goal(heightM(case, 1.78)),
            by(rule("bmi.pl", clause(36))),
            bindings([binding("M", 1.78), binding("H", 178.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(height(input, 178.0)),
                by(fact("bmi.pl", clause(34)))
              ),
              proof(
                goal(div(178.0, 100.0, 1.78)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(1.78, 1.78, 3.1684000000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(mul(1.78, 1.78, 3.1684000000000001)),
        by(builtin(mul, 3))
      )
    ])
  )
).

c3(check, "OK - the BMI value matches the BMI = kg / m² formula.").
why(
  c3(check, "OK - the BMI value matches the BMI = kg / m² formula."),
  proof(
    goal(c3(check, "OK - the BMI value matches the BMI = kg / m² formula.")),
    by(rule("bmi.pl", clause(65))),
    bindings([binding("Kg", 72.0), binding("M2", 3.1684000000000001), binding("Bmi", 22.724403484408533)]),
    uses([
      proof(
        goal(weightKg(case, 72.0)),
        by(rule("bmi.pl", clause(35))),
        bindings([binding("W", 72.0)]),
        uses([
          proof(
            goal(unitSystem(input, metric)),
            by(fact("bmi.pl", clause(32)))
          ),
          proof(
            goal(weight(input, 72.0)),
            by(fact("bmi.pl", clause(33)))
          )
        ])
      ),
      proof(
        goal(heightSquared(case, 3.1684000000000001)),
        by(rule("bmi.pl", clause(41))),
        bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
        uses([
          proof(
            goal(heightM(case, 1.78)),
            by(rule("bmi.pl", clause(36))),
            bindings([binding("M", 1.78), binding("H", 178.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(height(input, 178.0)),
                by(fact("bmi.pl", clause(34)))
              ),
              proof(
                goal(div(178.0, 100.0, 1.78)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(1.78, 1.78, 3.1684000000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(bmi(case, 22.724403484408533)),
        by(rule("bmi.pl", clause(42))),
        bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(weightKg(case, 72.0)),
            by(rule("bmi.pl", clause(35))),
            bindings([binding("W", 72.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(weight(input, 72.0)),
                by(fact("bmi.pl", clause(33)))
              )
            ])
          ),
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
        by(builtin(div, 3))
      )
    ])
  )
).

c4(check, "OK - a BMI of 18.49 stays below the normal-weight threshold.").
why(
  c4(check, "OK - a BMI of 18.49 stays below the normal-weight threshold."),
  proof(
    goal(c4(check, "OK - a BMI of 18.49 stays below the normal-weight threshold.")),
    by(rule("bmi.pl", clause(66))),
    uses([
      proof(
        goal(lt(18.49, 18.5)),
        by(builtin(lt, 2))
      )
    ])
  )
).

c5(check, "OK - the lower boundary is half-open: BMI 18.5 is classified as Normal.").
why(
  c5(check, "OK - the lower boundary is half-open: BMI 18.5 is classified as Normal."),
  proof(
    goal(c5(check, "OK - the lower boundary is half-open: BMI 18.5 is classified as Normal.")),
    by(rule("bmi.pl", clause(67))),
    uses([
      proof(
        goal(ge(18.5, 18.5)),
        by(builtin(ge, 2))
      ),
      proof(
        goal(lt(18.5, 25.0)),
        by(builtin(lt, 2))
      )
    ])
  )
).

c6(check, "OK - BMI 25.0 starts the Overweight category.").
why(
  c6(check, "OK - BMI 25.0 starts the Overweight category."),
  proof(
    goal(c6(check, "OK - BMI 25.0 starts the Overweight category.")),
    by(rule("bmi.pl", clause(68))),
    uses([
      proof(
        goal(ge(25.0, 25.0)),
        by(builtin(ge, 2))
      ),
      proof(
        goal(lt(25.0, 30.0)),
        by(builtin(lt, 2))
      )
    ])
  )
).

c7(check, "OK - BMI 30.0 starts the Obesity I category.").
why(
  c7(check, "OK - BMI 30.0 starts the Obesity I category."),
  proof(
    goal(c7(check, "OK - BMI 30.0 starts the Obesity I category.")),
    by(rule("bmi.pl", clause(69))),
    uses([
      proof(
        goal(ge(30.0, 30.0)),
        by(builtin(ge, 2))
      ),
      proof(
        goal(lt(30.0, 35.0)),
        by(builtin(lt, 2))
      )
    ])
  )
).

c8(check, "OK - classification behavior is monotonic across representative BMI values.").
why(
  c8(check, "OK - classification behavior is monotonic across representative BMI values."),
  proof(
    goal(c8(check, "OK - classification behavior is monotonic across representative BMI values.")),
    by(rule("bmi.pl", clause(70))),
    uses([
      proof(
        goal(ge(22.0, 18.5)),
        by(builtin(ge, 2))
      ),
      proof(
        goal(lt(22.0, 25.0)),
        by(builtin(lt, 2))
      ),
      proof(
        goal(ge(27.0, 25.0)),
        by(builtin(ge, 2))
      ),
      proof(
        goal(lt(27.0, 30.0)),
        by(builtin(lt, 2))
      ),
      proof(
        goal(ge(41.0, 40.0)),
        by(builtin(ge, 2))
      )
    ])
  )
).

c9(check, "OK - the healthy-weight band was reconstructed from BMI 18.5 to 24.9 at the same height.").
why(
  c9(check, "OK - the healthy-weight band was reconstructed from BMI 18.5 to 24.9 at the same height."),
  proof(
    goal(c9(check, "OK - the healthy-weight band was reconstructed from BMI 18.5 to 24.9 at the same height.")),
    by(rule("bmi.pl", clause(71))),
    bindings([binding("M2", 3.1684000000000001), binding("Min", 58.615400000000001), binding("Max", 78.893159999999995)]),
    uses([
      proof(
        goal(heightSquared(case, 3.1684000000000001)),
        by(rule("bmi.pl", clause(41))),
        bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
        uses([
          proof(
            goal(heightM(case, 1.78)),
            by(rule("bmi.pl", clause(36))),
            bindings([binding("M", 1.78), binding("H", 178.0)]),
            uses([
              proof(
                goal(unitSystem(input, metric)),
                by(fact("bmi.pl", clause(32)))
              ),
              proof(
                goal(height(input, 178.0)),
                by(fact("bmi.pl", clause(34)))
              ),
              proof(
                goal(div(178.0, 100.0, 1.78)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(mul(1.78, 1.78, 3.1684000000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(healthyMinKg(case, 58.615400000000001)),
        by(rule("bmi.pl", clause(44))),
        bindings([binding("HealthyMin", 58.615400000000001), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(mul(18.5, 3.1684000000000001, 58.615400000000001)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(healthyMaxKg(case, 78.893159999999995)),
        by(rule("bmi.pl", clause(45))),
        bindings([binding("HealthyMax", 78.893159999999995), binding("M2", 3.1684000000000001)]),
        uses([
          proof(
            goal(heightSquared(case, 3.1684000000000001)),
            by(rule("bmi.pl", clause(41))),
            bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
            uses([
              proof(
                goal(heightM(case, 1.78)),
                by(rule("bmi.pl", clause(36))),
                bindings([binding("M", 1.78), binding("H", 178.0)]),
                uses([
                  proof(
                    goal(unitSystem(input, metric)),
                    by(fact("bmi.pl", clause(32)))
                  ),
                  proof(
                    goal(height(input, 178.0)),
                    by(fact("bmi.pl", clause(34)))
                  ),
                  proof(
                    goal(div(178.0, 100.0, 1.78)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(1.78, 1.78, 3.1684000000000001)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(mul(24.9, 3.1684000000000001, 78.893159999999995)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(mul(18.5, 3.1684000000000001, 58.615400000000001)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(mul(24.9, 3.1684000000000001, 78.893159999999995)),
        by(builtin(mul, 3))
      )
    ])
  )
).

result(report, bmi(22.72, "Normal")).
why(
  result(report, bmi(22.72, "Normal")),
  proof(
    goal(result(report, bmi(22.72, "Normal"))),
    by(rule("bmi.pl", clause(72))),
    bindings([binding("Bmi", 22.72), binding("Category", "Normal")]),
    uses([
      proof(
        goal(bmi(answer, 22.72)),
        by(rule("bmi.pl", clause(54))),
        uses([
          proof(
            goal(bmiRoundedInt(case, 2272)),
            by(rule("bmi.pl", clause(43))),
            bindings([binding("BmiRoundedInt", 2272), binding("Bmi", 22.724403484408533), binding("BmiX100", 2272.4403484408535)]),
            uses([
              proof(
                goal(bmi(case, 22.724403484408533)),
                by(rule("bmi.pl", clause(42))),
                bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
                uses([
                  proof(
                    goal(weightKg(case, 72.0)),
                    by(rule("bmi.pl", clause(35))),
                    bindings([binding("W", 72.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(weight(input, 72.0)),
                        by(fact("bmi.pl", clause(33)))
                      )
                    ])
                  ),
                  proof(
                    goal(heightSquared(case, 3.1684000000000001)),
                    by(rule("bmi.pl", clause(41))),
                    bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                    uses([
                      proof(
                        goal(heightM(case, 1.78)),
                        by(rule("bmi.pl", clause(36))),
                        bindings([binding("M", 1.78), binding("H", 178.0)]),
                        uses([
                          proof(
                            goal(unitSystem(input, metric)),
                            by(fact("bmi.pl", clause(32)))
                          ),
                          proof(
                            goal(height(input, 178.0)),
                            by(fact("bmi.pl", clause(34)))
                          ),
                          proof(
                            goal(div(178.0, 100.0, 1.78)),
                            by(builtin(div, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(1.78, 1.78, 3.1684000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(mul(22.724403484408533, 100.0, 2272.4403484408535)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(rounded(2272.4403484408535, 2272)),
                by(builtin(rounded, 2))
              )
            ])
          )
        ])
      ),
      proof(
        goal(category(answer, "Normal")),
        by(rule("bmi.pl", clause(55))),
        bindings([binding("Category", "Normal")]),
        uses([
          proof(
            goal(category(decision, "Normal")),
            by(rule("bmi.pl", clause(49))),
            bindings([binding("Bmi", 22.724403484408533)]),
            uses([
              proof(
                goal(bmi(case, 22.724403484408533)),
                by(rule("bmi.pl", clause(42))),
                bindings([binding("Bmi", 22.724403484408533), binding("Kg", 72.0), binding("M2", 3.1684000000000001)]),
                uses([
                  proof(
                    goal(weightKg(case, 72.0)),
                    by(rule("bmi.pl", clause(35))),
                    bindings([binding("W", 72.0)]),
                    uses([
                      proof(
                        goal(unitSystem(input, metric)),
                        by(fact("bmi.pl", clause(32)))
                      ),
                      proof(
                        goal(weight(input, 72.0)),
                        by(fact("bmi.pl", clause(33)))
                      )
                    ])
                  ),
                  proof(
                    goal(heightSquared(case, 3.1684000000000001)),
                    by(rule("bmi.pl", clause(41))),
                    bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                    uses([
                      proof(
                        goal(heightM(case, 1.78)),
                        by(rule("bmi.pl", clause(36))),
                        bindings([binding("M", 1.78), binding("H", 178.0)]),
                        uses([
                          proof(
                            goal(unitSystem(input, metric)),
                            by(fact("bmi.pl", clause(32)))
                          ),
                          proof(
                            goal(height(input, 178.0)),
                            by(fact("bmi.pl", clause(34)))
                          ),
                          proof(
                            goal(div(178.0, 100.0, 1.78)),
                            by(builtin(div, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(1.78, 1.78, 3.1684000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(div(72.0, 3.1684000000000001, 22.724403484408533)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(ge(22.724403484408533, 18.5)),
                by(builtin(ge, 2))
              ),
              proof(
                goal(lt(22.724403484408533, 25.0)),
                by(builtin(lt, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

healthyWeightRangeKg(report, range(58.6, 78.9)).
why(
  healthyWeightRangeKg(report, range(58.6, 78.9)),
  proof(
    goal(healthyWeightRangeKg(report, range(58.6, 78.9))),
    by(rule("bmi.pl", clause(73))),
    bindings([binding("Min", 58.6), binding("Max", 78.9)]),
    uses([
      proof(
        goal(healthyMinKg(answer, 58.6)),
        by(rule("bmi.pl", clause(56))),
        uses([
          proof(
            goal(healthyMinKgRoundedInt(case, 586)),
            by(rule("bmi.pl", clause(46))),
            bindings([binding("MinRoundedInt", 586), binding("HealthyMin", 58.615400000000001), binding("MinX10", 586.154)]),
            uses([
              proof(
                goal(healthyMinKg(case, 58.615400000000001)),
                by(rule("bmi.pl", clause(44))),
                bindings([binding("HealthyMin", 58.615400000000001), binding("M2", 3.1684000000000001)]),
                uses([
                  proof(
                    goal(heightSquared(case, 3.1684000000000001)),
                    by(rule("bmi.pl", clause(41))),
                    bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                    uses([
                      proof(
                        goal(heightM(case, 1.78)),
                        by(rule("bmi.pl", clause(36))),
                        bindings([binding("M", 1.78), binding("H", 178.0)]),
                        uses([
                          proof(
                            goal(unitSystem(input, metric)),
                            by(fact("bmi.pl", clause(32)))
                          ),
                          proof(
                            goal(height(input, 178.0)),
                            by(fact("bmi.pl", clause(34)))
                          ),
                          proof(
                            goal(div(178.0, 100.0, 1.78)),
                            by(builtin(div, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(1.78, 1.78, 3.1684000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(18.5, 3.1684000000000001, 58.615400000000001)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(58.615400000000001, 10.0, 586.154)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(rounded(586.154, 586)),
                by(builtin(rounded, 2))
              )
            ])
          )
        ])
      ),
      proof(
        goal(healthyMaxKg(answer, 78.9)),
        by(rule("bmi.pl", clause(57))),
        uses([
          proof(
            goal(healthyMaxKgRoundedInt(case, 789)),
            by(rule("bmi.pl", clause(47))),
            bindings([binding("MaxRoundedInt", 789), binding("HealthyMax", 78.893159999999995), binding("MaxX10", 788.93159999999989)]),
            uses([
              proof(
                goal(healthyMaxKg(case, 78.893159999999995)),
                by(rule("bmi.pl", clause(45))),
                bindings([binding("HealthyMax", 78.893159999999995), binding("M2", 3.1684000000000001)]),
                uses([
                  proof(
                    goal(heightSquared(case, 3.1684000000000001)),
                    by(rule("bmi.pl", clause(41))),
                    bindings([binding("M2", 3.1684000000000001), binding("M", 1.78)]),
                    uses([
                      proof(
                        goal(heightM(case, 1.78)),
                        by(rule("bmi.pl", clause(36))),
                        bindings([binding("M", 1.78), binding("H", 178.0)]),
                        uses([
                          proof(
                            goal(unitSystem(input, metric)),
                            by(fact("bmi.pl", clause(32)))
                          ),
                          proof(
                            goal(height(input, 178.0)),
                            by(fact("bmi.pl", clause(34)))
                          ),
                          proof(
                            goal(div(178.0, 100.0, 1.78)),
                            by(builtin(div, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(1.78, 1.78, 3.1684000000000001)),
                        by(builtin(mul, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(24.9, 3.1684000000000001, 78.893159999999995)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(mul(78.893159999999995, 10.0, 788.93159999999989)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(rounded(788.93159999999989, 789)),
                by(builtin(rounded, 2))
              )
            ])
          )
        ])
      )
    ])
  )
).

