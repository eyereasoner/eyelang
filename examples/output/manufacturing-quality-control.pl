cpk(line7_shift_a, 0.6666666666666673).
why(
  cpk(line7_shift_a, 0.6666666666666673),
  proof(
    goal(cpk(line7_shift_a, 0.6666666666666673)), by(rule("manufacturing-quality-control.pl", clause(19))),
    bindings([binding("Run", line7_shift_a), binding("Cpk", 0.6666666666666673), binding("Margin", 0.080000000000000071), binding("ThreeSigma", 0.12)]),
    uses([
      proof(
        goal(nearest_spec_margin_mm(line7_shift_a, 0.080000000000000071)), by(rule("manufacturing-quality-control.pl", clause(17))),
        bindings([binding("Run", line7_shift_a), binding("Margin", 0.080000000000000071), binding("UpperMargin", 0.080000000000000071), binding("LowerMargin", 0.11999999999999922)]),
        uses([
          proof(
            goal(upper_margin_mm(line7_shift_a, 0.080000000000000071)), by(rule("manufacturing-quality-control.pl", clause(15))),
            bindings([binding("Run", line7_shift_a), binding("Margin", 0.080000000000000071), binding("Upper", 10.2), binding("Mean", 10.12)]),
            uses([
              proof(goal(spec(line7_shift_a, upper_mm, 10.2)), by(fact("manufacturing-quality-control.pl", clause(7)))),
              proof(goal(summary(line7_shift_a, mean_mm, 10.12)), by(fact("manufacturing-quality-control.pl", clause(8)))),
              proof(goal(sub(10.2, 10.12, 0.080000000000000071)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(lower_margin_mm(line7_shift_a, 0.11999999999999922)), by(rule("manufacturing-quality-control.pl", clause(16))),
            bindings([binding("Run", line7_shift_a), binding("Margin", 0.11999999999999922), binding("Mean", 10.12), binding("Lower", 10.0)]),
            uses([
              proof(goal(summary(line7_shift_a, mean_mm, 10.12)), by(fact("manufacturing-quality-control.pl", clause(8)))),
              proof(goal(spec(line7_shift_a, lower_mm, 10.0)), by(fact("manufacturing-quality-control.pl", clause(6)))),
              proof(goal(sub(10.12, 10.0, 0.11999999999999922)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(min(0.080000000000000071, 0.11999999999999922, 0.080000000000000071)), by(builtin(min, 3)))
        ])
      ),
      proof(
        goal(three_sigma_mm(line7_shift_a, 0.12)), by(rule("manufacturing-quality-control.pl", clause(18))),
        bindings([binding("Run", line7_shift_a), binding("ThreeSigma", 0.12), binding("Sigma", 0.04)]),
        uses([
          proof(goal(summary(line7_shift_a, sigma_mm, 0.04)), by(fact("manufacturing-quality-control.pl", clause(9)))),
          proof(goal(mul(3.0, 0.04, 0.12)), by(builtin(mul, 3)))
        ])
      ),
      proof(goal(div(0.080000000000000071, 0.12, 0.6666666666666673)), by(builtin(div, 3)))
    ])
  )
).

cpk(line8_shift_b, 1.6666666666666607).
why(
  cpk(line8_shift_b, 1.6666666666666607),
  proof(
    goal(cpk(line8_shift_b, 1.6666666666666607)), by(rule("manufacturing-quality-control.pl", clause(19))),
    bindings([binding("Run", line8_shift_b), binding("Cpk", 1.6666666666666607), binding("Margin", 0.099999999999999645), binding("ThreeSigma", 0.059999999999999998)]),
    uses([
      proof(
        goal(nearest_spec_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(17))),
        bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("UpperMargin", 0.099999999999999645), binding("LowerMargin", 0.099999999999999645)]),
        uses([
          proof(
            goal(upper_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(15))),
            bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("Upper", 10.2), binding("Mean", 10.1)]),
            uses([
              proof(goal(spec(line8_shift_b, upper_mm, 10.2)), by(fact("manufacturing-quality-control.pl", clause(11)))),
              proof(goal(summary(line8_shift_b, mean_mm, 10.1)), by(fact("manufacturing-quality-control.pl", clause(12)))),
              proof(goal(sub(10.2, 10.1, 0.099999999999999645)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(lower_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(16))),
            bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("Mean", 10.1), binding("Lower", 10.0)]),
            uses([
              proof(goal(summary(line8_shift_b, mean_mm, 10.1)), by(fact("manufacturing-quality-control.pl", clause(12)))),
              proof(goal(spec(line8_shift_b, lower_mm, 10.0)), by(fact("manufacturing-quality-control.pl", clause(10)))),
              proof(goal(sub(10.1, 10.0, 0.099999999999999645)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(min(0.099999999999999645, 0.099999999999999645, 0.099999999999999645)), by(builtin(min, 3)))
        ])
      ),
      proof(
        goal(three_sigma_mm(line8_shift_b, 0.059999999999999998)), by(rule("manufacturing-quality-control.pl", clause(18))),
        bindings([binding("Run", line8_shift_b), binding("ThreeSigma", 0.059999999999999998), binding("Sigma", 0.02)]),
        uses([
          proof(goal(summary(line8_shift_b, sigma_mm, 0.02)), by(fact("manufacturing-quality-control.pl", clause(13)))),
          proof(goal(mul(3.0, 0.02, 0.059999999999999998)), by(builtin(mul, 3)))
        ])
      ),
      proof(goal(div(0.099999999999999645, 0.059999999999999998, 1.6666666666666607)), by(builtin(div, 3)))
    ])
  )
).

status(line8_shift_b, capable_process).
why(
  status(line8_shift_b, capable_process),
  proof(
    goal(status(line8_shift_b, capable_process)), by(rule("manufacturing-quality-control.pl", clause(22))),
    bindings([binding("Run", line8_shift_b)]),
    uses([
      proof(
        goal(capable(line8_shift_b)), by(rule("manufacturing-quality-control.pl", clause(20))),
        bindings([binding("Run", line8_shift_b), binding("Cpk", 1.6666666666666607), binding("Threshold", 1.33)]),
        uses([
          proof(
            goal(cpk(line8_shift_b, 1.6666666666666607)), by(rule("manufacturing-quality-control.pl", clause(19))),
            bindings([binding("Run", line8_shift_b), binding("Cpk", 1.6666666666666607), binding("Margin", 0.099999999999999645), binding("ThreeSigma", 0.059999999999999998)]),
            uses([
              proof(
                goal(nearest_spec_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(17))),
                bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("UpperMargin", 0.099999999999999645), binding("LowerMargin", 0.099999999999999645)]),
                uses([
                  proof(
                    goal(upper_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(15))),
                    bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("Upper", 10.2), binding("Mean", 10.1)]),
                    uses([
                      proof(goal(spec(line8_shift_b, upper_mm, 10.2)), by(fact("manufacturing-quality-control.pl", clause(11)))),
                      proof(goal(summary(line8_shift_b, mean_mm, 10.1)), by(fact("manufacturing-quality-control.pl", clause(12)))),
                      proof(goal(sub(10.2, 10.1, 0.099999999999999645)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(
                    goal(lower_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(16))),
                    bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("Mean", 10.1), binding("Lower", 10.0)]),
                    uses([
                      proof(goal(summary(line8_shift_b, mean_mm, 10.1)), by(fact("manufacturing-quality-control.pl", clause(12)))),
                      proof(goal(spec(line8_shift_b, lower_mm, 10.0)), by(fact("manufacturing-quality-control.pl", clause(10)))),
                      proof(goal(sub(10.1, 10.0, 0.099999999999999645)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(min(0.099999999999999645, 0.099999999999999645, 0.099999999999999645)), by(builtin(min, 3)))
                ])
              ),
              proof(
                goal(three_sigma_mm(line8_shift_b, 0.059999999999999998)), by(rule("manufacturing-quality-control.pl", clause(18))),
                bindings([binding("Run", line8_shift_b), binding("ThreeSigma", 0.059999999999999998), binding("Sigma", 0.02)]),
                uses([
                  proof(goal(summary(line8_shift_b, sigma_mm, 0.02)), by(fact("manufacturing-quality-control.pl", clause(13)))),
                  proof(goal(mul(3.0, 0.02, 0.059999999999999998)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(div(0.099999999999999645, 0.059999999999999998, 1.6666666666666607)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(capability_threshold(cpk, 1.33)), by(fact("manufacturing-quality-control.pl", clause(14)))),
          proof(goal(ge(1.6666666666666607, 1.33)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

status(line7_shift_a, needs_process_adjustment).
why(
  status(line7_shift_a, needs_process_adjustment),
  proof(
    goal(status(line7_shift_a, needs_process_adjustment)), by(rule("manufacturing-quality-control.pl", clause(23))),
    bindings([binding("Run", line7_shift_a)]),
    uses([
      proof(
        goal(needs_adjustment(line7_shift_a)), by(rule("manufacturing-quality-control.pl", clause(21))),
        bindings([binding("Run", line7_shift_a), binding("Cpk", 0.6666666666666673), binding("Threshold", 1.33)]),
        uses([
          proof(
            goal(cpk(line7_shift_a, 0.6666666666666673)), by(rule("manufacturing-quality-control.pl", clause(19))),
            bindings([binding("Run", line7_shift_a), binding("Cpk", 0.6666666666666673), binding("Margin", 0.080000000000000071), binding("ThreeSigma", 0.12)]),
            uses([
              proof(
                goal(nearest_spec_margin_mm(line7_shift_a, 0.080000000000000071)), by(rule("manufacturing-quality-control.pl", clause(17))),
                bindings([binding("Run", line7_shift_a), binding("Margin", 0.080000000000000071), binding("UpperMargin", 0.080000000000000071), binding("LowerMargin", 0.11999999999999922)]),
                uses([
                  proof(
                    goal(upper_margin_mm(line7_shift_a, 0.080000000000000071)), by(rule("manufacturing-quality-control.pl", clause(15))),
                    bindings([binding("Run", line7_shift_a), binding("Margin", 0.080000000000000071), binding("Upper", 10.2), binding("Mean", 10.12)]),
                    uses([
                      proof(goal(spec(line7_shift_a, upper_mm, 10.2)), by(fact("manufacturing-quality-control.pl", clause(7)))),
                      proof(goal(summary(line7_shift_a, mean_mm, 10.12)), by(fact("manufacturing-quality-control.pl", clause(8)))),
                      proof(goal(sub(10.2, 10.12, 0.080000000000000071)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(
                    goal(lower_margin_mm(line7_shift_a, 0.11999999999999922)), by(rule("manufacturing-quality-control.pl", clause(16))),
                    bindings([binding("Run", line7_shift_a), binding("Margin", 0.11999999999999922), binding("Mean", 10.12), binding("Lower", 10.0)]),
                    uses([
                      proof(goal(summary(line7_shift_a, mean_mm, 10.12)), by(fact("manufacturing-quality-control.pl", clause(8)))),
                      proof(goal(spec(line7_shift_a, lower_mm, 10.0)), by(fact("manufacturing-quality-control.pl", clause(6)))),
                      proof(goal(sub(10.12, 10.0, 0.11999999999999922)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(min(0.080000000000000071, 0.11999999999999922, 0.080000000000000071)), by(builtin(min, 3)))
                ])
              ),
              proof(
                goal(three_sigma_mm(line7_shift_a, 0.12)), by(rule("manufacturing-quality-control.pl", clause(18))),
                bindings([binding("Run", line7_shift_a), binding("ThreeSigma", 0.12), binding("Sigma", 0.04)]),
                uses([
                  proof(goal(summary(line7_shift_a, sigma_mm, 0.04)), by(fact("manufacturing-quality-control.pl", clause(9)))),
                  proof(goal(mul(3.0, 0.04, 0.12)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(div(0.080000000000000071, 0.12, 0.6666666666666673)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(capability_threshold(cpk, 1.33)), by(fact("manufacturing-quality-control.pl", clause(14)))),
          proof(goal(lt(0.6666666666666673, 1.33)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

reason(line8_shift_b, "Cpk meets the production capability threshold").
why(
  reason(line8_shift_b, "Cpk meets the production capability threshold"),
  proof(
    goal(reason(line8_shift_b, "Cpk meets the production capability threshold")), by(rule("manufacturing-quality-control.pl", clause(24))),
    bindings([binding("Run", line8_shift_b)]),
    uses([
      proof(
        goal(capable(line8_shift_b)), by(rule("manufacturing-quality-control.pl", clause(20))),
        bindings([binding("Run", line8_shift_b), binding("Cpk", 1.6666666666666607), binding("Threshold", 1.33)]),
        uses([
          proof(
            goal(cpk(line8_shift_b, 1.6666666666666607)), by(rule("manufacturing-quality-control.pl", clause(19))),
            bindings([binding("Run", line8_shift_b), binding("Cpk", 1.6666666666666607), binding("Margin", 0.099999999999999645), binding("ThreeSigma", 0.059999999999999998)]),
            uses([
              proof(
                goal(nearest_spec_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(17))),
                bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("UpperMargin", 0.099999999999999645), binding("LowerMargin", 0.099999999999999645)]),
                uses([
                  proof(
                    goal(upper_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(15))),
                    bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("Upper", 10.2), binding("Mean", 10.1)]),
                    uses([
                      proof(goal(spec(line8_shift_b, upper_mm, 10.2)), by(fact("manufacturing-quality-control.pl", clause(11)))),
                      proof(goal(summary(line8_shift_b, mean_mm, 10.1)), by(fact("manufacturing-quality-control.pl", clause(12)))),
                      proof(goal(sub(10.2, 10.1, 0.099999999999999645)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(
                    goal(lower_margin_mm(line8_shift_b, 0.099999999999999645)), by(rule("manufacturing-quality-control.pl", clause(16))),
                    bindings([binding("Run", line8_shift_b), binding("Margin", 0.099999999999999645), binding("Mean", 10.1), binding("Lower", 10.0)]),
                    uses([
                      proof(goal(summary(line8_shift_b, mean_mm, 10.1)), by(fact("manufacturing-quality-control.pl", clause(12)))),
                      proof(goal(spec(line8_shift_b, lower_mm, 10.0)), by(fact("manufacturing-quality-control.pl", clause(10)))),
                      proof(goal(sub(10.1, 10.0, 0.099999999999999645)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(min(0.099999999999999645, 0.099999999999999645, 0.099999999999999645)), by(builtin(min, 3)))
                ])
              ),
              proof(
                goal(three_sigma_mm(line8_shift_b, 0.059999999999999998)), by(rule("manufacturing-quality-control.pl", clause(18))),
                bindings([binding("Run", line8_shift_b), binding("ThreeSigma", 0.059999999999999998), binding("Sigma", 0.02)]),
                uses([
                  proof(goal(summary(line8_shift_b, sigma_mm, 0.02)), by(fact("manufacturing-quality-control.pl", clause(13)))),
                  proof(goal(mul(3.0, 0.02, 0.059999999999999998)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(div(0.099999999999999645, 0.059999999999999998, 1.6666666666666607)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(capability_threshold(cpk, 1.33)), by(fact("manufacturing-quality-control.pl", clause(14)))),
          proof(goal(ge(1.6666666666666607, 1.33)), by(builtin(ge, 2)))
        ])
      )
    ])
  )
).

reason(line7_shift_a, "Cpk is below the production capability threshold").
why(
  reason(line7_shift_a, "Cpk is below the production capability threshold"),
  proof(
    goal(reason(line7_shift_a, "Cpk is below the production capability threshold")), by(rule("manufacturing-quality-control.pl", clause(25))),
    bindings([binding("Run", line7_shift_a)]),
    uses([
      proof(
        goal(needs_adjustment(line7_shift_a)), by(rule("manufacturing-quality-control.pl", clause(21))),
        bindings([binding("Run", line7_shift_a), binding("Cpk", 0.6666666666666673), binding("Threshold", 1.33)]),
        uses([
          proof(
            goal(cpk(line7_shift_a, 0.6666666666666673)), by(rule("manufacturing-quality-control.pl", clause(19))),
            bindings([binding("Run", line7_shift_a), binding("Cpk", 0.6666666666666673), binding("Margin", 0.080000000000000071), binding("ThreeSigma", 0.12)]),
            uses([
              proof(
                goal(nearest_spec_margin_mm(line7_shift_a, 0.080000000000000071)), by(rule("manufacturing-quality-control.pl", clause(17))),
                bindings([binding("Run", line7_shift_a), binding("Margin", 0.080000000000000071), binding("UpperMargin", 0.080000000000000071), binding("LowerMargin", 0.11999999999999922)]),
                uses([
                  proof(
                    goal(upper_margin_mm(line7_shift_a, 0.080000000000000071)), by(rule("manufacturing-quality-control.pl", clause(15))),
                    bindings([binding("Run", line7_shift_a), binding("Margin", 0.080000000000000071), binding("Upper", 10.2), binding("Mean", 10.12)]),
                    uses([
                      proof(goal(spec(line7_shift_a, upper_mm, 10.2)), by(fact("manufacturing-quality-control.pl", clause(7)))),
                      proof(goal(summary(line7_shift_a, mean_mm, 10.12)), by(fact("manufacturing-quality-control.pl", clause(8)))),
                      proof(goal(sub(10.2, 10.12, 0.080000000000000071)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(
                    goal(lower_margin_mm(line7_shift_a, 0.11999999999999922)), by(rule("manufacturing-quality-control.pl", clause(16))),
                    bindings([binding("Run", line7_shift_a), binding("Margin", 0.11999999999999922), binding("Mean", 10.12), binding("Lower", 10.0)]),
                    uses([
                      proof(goal(summary(line7_shift_a, mean_mm, 10.12)), by(fact("manufacturing-quality-control.pl", clause(8)))),
                      proof(goal(spec(line7_shift_a, lower_mm, 10.0)), by(fact("manufacturing-quality-control.pl", clause(6)))),
                      proof(goal(sub(10.12, 10.0, 0.11999999999999922)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(min(0.080000000000000071, 0.11999999999999922, 0.080000000000000071)), by(builtin(min, 3)))
                ])
              ),
              proof(
                goal(three_sigma_mm(line7_shift_a, 0.12)), by(rule("manufacturing-quality-control.pl", clause(18))),
                bindings([binding("Run", line7_shift_a), binding("ThreeSigma", 0.12), binding("Sigma", 0.04)]),
                uses([
                  proof(goal(summary(line7_shift_a, sigma_mm, 0.04)), by(fact("manufacturing-quality-control.pl", clause(9)))),
                  proof(goal(mul(3.0, 0.04, 0.12)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(div(0.080000000000000071, 0.12, 0.6666666666666673)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(capability_threshold(cpk, 1.33)), by(fact("manufacturing-quality-control.pl", clause(14)))),
          proof(goal(lt(0.6666666666666673, 1.33)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

