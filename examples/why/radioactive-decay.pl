halfLivesElapsed(iodine_sample, 2.0).
why(
  halfLivesElapsed(iodine_sample, 2.0),
  proof(
    goal(halfLivesElapsed(iodine_sample, 2.0)), by(rule("radioactive-decay.pl", clause(15))),
    bindings([binding("Sample", iodine_sample), binding("Count", 2.0)]),
    uses([
      proof(
        goal(half_lives(iodine_sample, 2.0)), by(rule("radioactive-decay.pl", clause(10))),
        bindings([binding("Sample", iodine_sample), binding("Count", 2.0), binding("Elapsed", 16.0), binding("HalfLife", 8.0)]),
        uses([
          proof(goal(sample(iodine_sample, elapsed_h, 16.0)), by(fact("radioactive-decay.pl", clause(8)))),
          proof(goal(sample(iodine_sample, half_life_h, 8.0)), by(fact("radioactive-decay.pl", clause(7)))),
          proof(goal(div(16.0, 8.0, 2.0)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

remainingActivity_Bq(iodine_sample, 20.0).
why(
  remainingActivity_Bq(iodine_sample, 20.0),
  proof(
    goal(remainingActivity_Bq(iodine_sample, 20.0)), by(rule("radioactive-decay.pl", clause(16))),
    bindings([binding("Sample", iodine_sample), binding("Remaining", 20.0)]),
    uses([
      proof(
        goal(remaining_activity(iodine_sample, 20.0)), by(rule("radioactive-decay.pl", clause(12))),
        bindings([binding("Sample", iodine_sample), binding("Remaining", 20.0), binding("Initial", 80.0), binding("Fraction", 0.25)]),
        uses([
          proof(goal(sample(iodine_sample, initial_activity_bq, 80.0)), by(fact("radioactive-decay.pl", clause(6)))),
          proof(
            goal(remaining_fraction(iodine_sample, 0.25)), by(rule("radioactive-decay.pl", clause(11))),
            bindings([binding("Sample", iodine_sample), binding("Fraction", 0.25), binding("Count", 2.0)]),
            uses([
              proof(
                goal(half_lives(iodine_sample, 2.0)), by(rule("radioactive-decay.pl", clause(10))),
                bindings([binding("Sample", iodine_sample), binding("Count", 2.0), binding("Elapsed", 16.0), binding("HalfLife", 8.0)]),
                uses([
                  proof(goal(sample(iodine_sample, elapsed_h, 16.0)), by(fact("radioactive-decay.pl", clause(8)))),
                  proof(goal(sample(iodine_sample, half_life_h, 8.0)), by(fact("radioactive-decay.pl", clause(7)))),
                  proof(goal(div(16.0, 8.0, 2.0)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(pow(0.5, 2.0, 0.25)), by(builtin(pow, 3)))
            ])
          ),
          proof(goal(mul(80.0, 0.25, 20.0)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

decayedActivity_Bq(iodine_sample, 60.0).
why(
  decayedActivity_Bq(iodine_sample, 60.0),
  proof(
    goal(decayedActivity_Bq(iodine_sample, 60.0)), by(rule("radioactive-decay.pl", clause(17))),
    bindings([binding("Sample", iodine_sample), binding("Decayed", 60.0)]),
    uses([
      proof(
        goal(decayed_activity(iodine_sample, 60.0)), by(rule("radioactive-decay.pl", clause(13))),
        bindings([binding("Sample", iodine_sample), binding("Decayed", 60.0), binding("Initial", 80.0), binding("Remaining", 20.0)]),
        uses([
          proof(goal(sample(iodine_sample, initial_activity_bq, 80.0)), by(fact("radioactive-decay.pl", clause(6)))),
          proof(
            goal(remaining_activity(iodine_sample, 20.0)), by(rule("radioactive-decay.pl", clause(12))),
            bindings([binding("Sample", iodine_sample), binding("Remaining", 20.0), binding("Initial", 80.0), binding("Fraction", 0.25)]),
            uses([
              proof(goal(sample(iodine_sample, initial_activity_bq, 80.0)), by(fact("radioactive-decay.pl", clause(6)))),
              proof(
                goal(remaining_fraction(iodine_sample, 0.25)), by(rule("radioactive-decay.pl", clause(11))),
                bindings([binding("Sample", iodine_sample), binding("Fraction", 0.25), binding("Count", 2.0)]),
                uses([
                  proof(
                    goal(half_lives(iodine_sample, 2.0)), by(rule("radioactive-decay.pl", clause(10))),
                    bindings([binding("Sample", iodine_sample), binding("Count", 2.0), binding("Elapsed", 16.0), binding("HalfLife", 8.0)]),
                    uses([
                      proof(goal(sample(iodine_sample, elapsed_h, 16.0)), by(fact("radioactive-decay.pl", clause(8)))),
                      proof(goal(sample(iodine_sample, half_life_h, 8.0)), by(fact("radioactive-decay.pl", clause(7)))),
                      proof(goal(div(16.0, 8.0, 2.0)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(pow(0.5, 2.0, 0.25)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(mul(80.0, 0.25, 20.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(sub(80.0, 20.0, 60.0)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

status(iodine_sample, low_activity).
why(
  status(iodine_sample, low_activity),
  proof(
    goal(status(iodine_sample, low_activity)), by(rule("radioactive-decay.pl", clause(18))),
    bindings([binding("Sample", iodine_sample)]),
    uses([
      proof(
        goal(low_activity(iodine_sample)), by(rule("radioactive-decay.pl", clause(14))),
        bindings([binding("Sample", iodine_sample), binding("Remaining", 20.0), binding("Limit", 25.0)]),
        uses([
          proof(
            goal(remaining_activity(iodine_sample, 20.0)), by(rule("radioactive-decay.pl", clause(12))),
            bindings([binding("Sample", iodine_sample), binding("Remaining", 20.0), binding("Initial", 80.0), binding("Fraction", 0.25)]),
            uses([
              proof(goal(sample(iodine_sample, initial_activity_bq, 80.0)), by(fact("radioactive-decay.pl", clause(6)))),
              proof(
                goal(remaining_fraction(iodine_sample, 0.25)), by(rule("radioactive-decay.pl", clause(11))),
                bindings([binding("Sample", iodine_sample), binding("Fraction", 0.25), binding("Count", 2.0)]),
                uses([
                  proof(
                    goal(half_lives(iodine_sample, 2.0)), by(rule("radioactive-decay.pl", clause(10))),
                    bindings([binding("Sample", iodine_sample), binding("Count", 2.0), binding("Elapsed", 16.0), binding("HalfLife", 8.0)]),
                    uses([
                      proof(goal(sample(iodine_sample, elapsed_h, 16.0)), by(fact("radioactive-decay.pl", clause(8)))),
                      proof(goal(sample(iodine_sample, half_life_h, 8.0)), by(fact("radioactive-decay.pl", clause(7)))),
                      proof(goal(div(16.0, 8.0, 2.0)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(pow(0.5, 2.0, 0.25)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(mul(80.0, 0.25, 20.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(threshold(iodine_sample, low_activity_bq, 25.0)), by(fact("radioactive-decay.pl", clause(9)))),
          proof(goal(lt(20.0, 25.0)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

reason(iodine_sample, "two half-lives leave one quarter of the initial activity").
why(
  reason(iodine_sample, "two half-lives leave one quarter of the initial activity"),
  proof(
    goal(reason(iodine_sample, "two half-lives leave one quarter of the initial activity")), by(rule("radioactive-decay.pl", clause(19))),
    bindings([binding("Sample", iodine_sample)]),
    uses([
      proof(
        goal(low_activity(iodine_sample)), by(rule("radioactive-decay.pl", clause(14))),
        bindings([binding("Sample", iodine_sample), binding("Remaining", 20.0), binding("Limit", 25.0)]),
        uses([
          proof(
            goal(remaining_activity(iodine_sample, 20.0)), by(rule("radioactive-decay.pl", clause(12))),
            bindings([binding("Sample", iodine_sample), binding("Remaining", 20.0), binding("Initial", 80.0), binding("Fraction", 0.25)]),
            uses([
              proof(goal(sample(iodine_sample, initial_activity_bq, 80.0)), by(fact("radioactive-decay.pl", clause(6)))),
              proof(
                goal(remaining_fraction(iodine_sample, 0.25)), by(rule("radioactive-decay.pl", clause(11))),
                bindings([binding("Sample", iodine_sample), binding("Fraction", 0.25), binding("Count", 2.0)]),
                uses([
                  proof(
                    goal(half_lives(iodine_sample, 2.0)), by(rule("radioactive-decay.pl", clause(10))),
                    bindings([binding("Sample", iodine_sample), binding("Count", 2.0), binding("Elapsed", 16.0), binding("HalfLife", 8.0)]),
                    uses([
                      proof(goal(sample(iodine_sample, elapsed_h, 16.0)), by(fact("radioactive-decay.pl", clause(8)))),
                      proof(goal(sample(iodine_sample, half_life_h, 8.0)), by(fact("radioactive-decay.pl", clause(7)))),
                      proof(goal(div(16.0, 8.0, 2.0)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(pow(0.5, 2.0, 0.25)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(mul(80.0, 0.25, 20.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(threshold(iodine_sample, low_activity_bq, 25.0)), by(fact("radioactive-decay.pl", clause(9)))),
          proof(goal(lt(20.0, 25.0)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

