period_s(pendulum1, 2.0).
why(
  period_s(pendulum1, 2.0),
  proof(
    goal(period_s(pendulum1, 2.0)),
    by(rule("pendulum-period.pl", clause(13))),
    bindings([binding("Experiment", pendulum1), binding("Period", 2.0)]),
    uses([
      proof(
        goal(period(pendulum1, 2.0)),
        by(rule("pendulum-period.pl", clause(10))),
        bindings([binding("Experiment", pendulum1), binding("Period", 2.0), binding("Length", 1.0), binding("Gravity", 9.869604401089358), binding("Ratio", 0.10132118364233778), binding("Root", 0.31830988618379069), binding("Pi", 3.141592653589793), binding("TwoPi", 6.2831853071795862)]),
        uses([
          proof(
            goal(experiment(pendulum1, length_m, 1.0)),
            by(fact("pendulum-period.pl", clause(6)))
          ),
          proof(
            goal(experiment(pendulum1, gravity_m_s2, 9.869604401089358)),
            by(fact("pendulum-period.pl", clause(7)))
          ),
          proof(
            goal(div(1.0, 9.869604401089358, 0.10132118364233778)),
            by(builtin(div, 3))
          ),
          proof(
            goal(pow(0.10132118364233778, 0.5, 0.31830988618379069)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(constant(pi, 3.141592653589793)),
            by(fact("pendulum-period.pl", clause(5)))
          ),
          proof(
            goal(mul(2.0, 3.141592653589793, 6.2831853071795862)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(6.2831853071795862, 0.31830988618379069, 2.0)),
            by(builtin(mul, 3))
          )
        ])
      )
    ])
  )
).

periodError_s(pendulum1, 0.0).
why(
  periodError_s(pendulum1, 0.0),
  proof(
    goal(periodError_s(pendulum1, 0.0)),
    by(rule("pendulum-period.pl", clause(14))),
    bindings([binding("Experiment", pendulum1), binding("Error", 0.0)]),
    uses([
      proof(
        goal(period_error(pendulum1, 0.0)),
        by(rule("pendulum-period.pl", clause(11))),
        bindings([binding("Experiment", pendulum1), binding("Error", 0.0), binding("Period", 2.0), binding("Target", 2.0), binding("RawError", 0.0)]),
        uses([
          proof(
            goal(period(pendulum1, 2.0)),
            by(rule("pendulum-period.pl", clause(10))),
            bindings([binding("Experiment", pendulum1), binding("Period", 2.0), binding("Length", 1.0), binding("Gravity", 9.869604401089358), binding("Ratio", 0.10132118364233778), binding("Root", 0.31830988618379069), binding("Pi", 3.141592653589793), binding("TwoPi", 6.2831853071795862)]),
            uses([
              proof(
                goal(experiment(pendulum1, length_m, 1.0)),
                by(fact("pendulum-period.pl", clause(6)))
              ),
              proof(
                goal(experiment(pendulum1, gravity_m_s2, 9.869604401089358)),
                by(fact("pendulum-period.pl", clause(7)))
              ),
              proof(
                goal(div(1.0, 9.869604401089358, 0.10132118364233778)),
                by(builtin(div, 3))
              ),
              proof(
                goal(pow(0.10132118364233778, 0.5, 0.31830988618379069)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(constant(pi, 3.141592653589793)),
                by(fact("pendulum-period.pl", clause(5)))
              ),
              proof(
                goal(mul(2.0, 3.141592653589793, 6.2831853071795862)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(6.2831853071795862, 0.31830988618379069, 2.0)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(limit(pendulum1, target_period_s, 2.0)),
            by(fact("pendulum-period.pl", clause(8)))
          ),
          proof(
            goal(sub(2.0, 2.0, 0.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(abs(0.0, 0.0)),
            by(builtin(abs, 2))
          )
        ])
      )
    ])
  )
).

status(pendulum1, within_period_tolerance).
why(
  status(pendulum1, within_period_tolerance),
  proof(
    goal(status(pendulum1, within_period_tolerance)),
    by(rule("pendulum-period.pl", clause(15))),
    bindings([binding("Experiment", pendulum1)]),
    uses([
      proof(
        goal(within_period_tolerance(pendulum1)),
        by(rule("pendulum-period.pl", clause(12))),
        bindings([binding("Experiment", pendulum1), binding("Error", 0.0), binding("Tolerance", 0.01)]),
        uses([
          proof(
            goal(period_error(pendulum1, 0.0)),
            by(rule("pendulum-period.pl", clause(11))),
            bindings([binding("Experiment", pendulum1), binding("Error", 0.0), binding("Period", 2.0), binding("Target", 2.0), binding("RawError", 0.0)]),
            uses([
              proof(
                goal(period(pendulum1, 2.0)),
                by(rule("pendulum-period.pl", clause(10))),
                bindings([binding("Experiment", pendulum1), binding("Period", 2.0), binding("Length", 1.0), binding("Gravity", 9.869604401089358), binding("Ratio", 0.10132118364233778), binding("Root", 0.31830988618379069), binding("Pi", 3.141592653589793), binding("TwoPi", 6.2831853071795862)]),
                uses([
                  proof(
                    goal(experiment(pendulum1, length_m, 1.0)),
                    by(fact("pendulum-period.pl", clause(6)))
                  ),
                  proof(
                    goal(experiment(pendulum1, gravity_m_s2, 9.869604401089358)),
                    by(fact("pendulum-period.pl", clause(7)))
                  ),
                  proof(
                    goal(div(1.0, 9.869604401089358, 0.10132118364233778)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(pow(0.10132118364233778, 0.5, 0.31830988618379069)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(constant(pi, 3.141592653589793)),
                    by(fact("pendulum-period.pl", clause(5)))
                  ),
                  proof(
                    goal(mul(2.0, 3.141592653589793, 6.2831853071795862)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(6.2831853071795862, 0.31830988618379069, 2.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(limit(pendulum1, target_period_s, 2.0)),
                by(fact("pendulum-period.pl", clause(8)))
              ),
              proof(
                goal(sub(2.0, 2.0, 0.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(abs(0.0, 0.0)),
                by(builtin(abs, 2))
              )
            ])
          ),
          proof(
            goal(limit(pendulum1, tolerance_s, 0.01)),
            by(fact("pendulum-period.pl", clause(9)))
          ),
          proof(
            goal(lt(0.0, 0.01)),
            by(builtin(lt, 2))
          )
        ])
      )
    ])
  )
).

reason(pendulum1, "small-angle period matches the two-second target").
why(
  reason(pendulum1, "small-angle period matches the two-second target"),
  proof(
    goal(reason(pendulum1, "small-angle period matches the two-second target")),
    by(rule("pendulum-period.pl", clause(16))),
    bindings([binding("Experiment", pendulum1)]),
    uses([
      proof(
        goal(within_period_tolerance(pendulum1)),
        by(rule("pendulum-period.pl", clause(12))),
        bindings([binding("Experiment", pendulum1), binding("Error", 0.0), binding("Tolerance", 0.01)]),
        uses([
          proof(
            goal(period_error(pendulum1, 0.0)),
            by(rule("pendulum-period.pl", clause(11))),
            bindings([binding("Experiment", pendulum1), binding("Error", 0.0), binding("Period", 2.0), binding("Target", 2.0), binding("RawError", 0.0)]),
            uses([
              proof(
                goal(period(pendulum1, 2.0)),
                by(rule("pendulum-period.pl", clause(10))),
                bindings([binding("Experiment", pendulum1), binding("Period", 2.0), binding("Length", 1.0), binding("Gravity", 9.869604401089358), binding("Ratio", 0.10132118364233778), binding("Root", 0.31830988618379069), binding("Pi", 3.141592653589793), binding("TwoPi", 6.2831853071795862)]),
                uses([
                  proof(
                    goal(experiment(pendulum1, length_m, 1.0)),
                    by(fact("pendulum-period.pl", clause(6)))
                  ),
                  proof(
                    goal(experiment(pendulum1, gravity_m_s2, 9.869604401089358)),
                    by(fact("pendulum-period.pl", clause(7)))
                  ),
                  proof(
                    goal(div(1.0, 9.869604401089358, 0.10132118364233778)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(pow(0.10132118364233778, 0.5, 0.31830988618379069)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(constant(pi, 3.141592653589793)),
                    by(fact("pendulum-period.pl", clause(5)))
                  ),
                  proof(
                    goal(mul(2.0, 3.141592653589793, 6.2831853071795862)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(6.2831853071795862, 0.31830988618379069, 2.0)),
                    by(builtin(mul, 3))
                  )
                ])
              ),
              proof(
                goal(limit(pendulum1, target_period_s, 2.0)),
                by(fact("pendulum-period.pl", clause(8)))
              ),
              proof(
                goal(sub(2.0, 2.0, 0.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(abs(0.0, 0.0)),
                by(builtin(abs, 2))
              )
            ])
          ),
          proof(
            goal(limit(pendulum1, tolerance_s, 0.01)),
            by(fact("pendulum-period.pl", clause(9)))
          ),
          proof(
            goal(lt(0.0, 0.01)),
            by(builtin(lt, 2))
          )
        ])
      )
    ])
  )
).

