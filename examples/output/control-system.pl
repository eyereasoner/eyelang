log10(disturbance1, 4.5534703722131207).
why(
  log10(disturbance1, 4.5534703722131207),
  proof(
    goal(log10(disturbance1, 4.5534703722131207)),
    by(rule("control-system.pl", clause(23))),
    bindings([binding("C", 4.5534703722131207), binding("D", 35766)]),
    uses([
      proof(
        goal(measurement(disturbance1, 35766)),
        by(fact("control-system.pl", clause(9)))
      ),
      proof(
        goal(log10(35766, 4.5534703722131207)),
        by(rule("control-system.pl", clause(17))),
        bindings([binding("Value", 35766), binding("Result", 4.5534703722131207), binding("NaturalLog", 10.484753000447981), binding("NaturalLog10", 2.3025850929940459)]),
        uses([
          proof(
            goal(log(35766, 10.484753000447981)),
            by(builtin(log, 2))
          ),
          proof(
            goal(log(10, 2.3025850929940459)),
            by(builtin(log, 2))
          ),
          proof(
            goal(div(10.484753000447981, 2.3025850929940459, 4.5534703722131207)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

controlSignal(actuator1, 39.273461986782763).
why(
  controlSignal(actuator1, 39.273461986782763),
  proof(
    goal(controlSignal(actuator1, 39.273461986782763)),
    by(rule("control-system.pl", clause(20))),
    bindings([binding("Actuator", actuator1), binding("C", 39.273461986782763)]),
    uses([
      proof(
        goal(control(actuator1, 39.273461986782763)),
        by(rule("control-system.pl", clause(18))),
        bindings([binding("C", 39.273461986782763), binding("M1", 2.2360679774997898), binding("D1", 35766), binding("Proportional", 43.826932358995883), binding("Compensation", 4.5534703722131207)]),
        uses([
          proof(
            goal(measurement_normalized(input1, 2.2360679774997898)),
            by(rule("control-system.pl", clause(15))),
            bindings([binding("I", input1), binding("M", 2.2360679774997898), binding("M1", 6), binding("M2", 11), binding("Delta", 5)]),
            uses([
              proof(
                goal(measurement(input1, [6, 11])),
                by(fact("control-system.pl", clause(5)))
              ),
              proof(
                goal(lt(6, 11)),
                by(builtin(lt, 2))
              ),
              proof(
                goal(sub(11, 6, 5)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(pow(5, 0.5, 2.2360679774997898)),
                by(builtin(pow, 3))
              )
            ])
          ),
          proof(
            goal(measurement(input2, true)),
            by(fact("control-system.pl", clause(7)))
          ),
          proof(
            goal(measurement(disturbance1, 35766)),
            by(fact("control-system.pl", clause(9)))
          ),
          proof(
            goal(mul(2.2360679774997898, 19.6, 43.826932358995883)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(log10(35766, 4.5534703722131207)),
            by(rule("control-system.pl", clause(17))),
            bindings([binding("Value", 35766), binding("Result", 4.5534703722131207), binding("NaturalLog", 10.484753000447981), binding("NaturalLog10", 2.3025850929940459)]),
            uses([
              proof(
                goal(log(35766, 10.484753000447981)),
                by(builtin(log, 2))
              ),
              proof(
                goal(log(10, 2.3025850929940459)),
                by(builtin(log, 2))
              ),
              proof(
                goal(div(10.484753000447981, 2.3025850929940459, 4.5534703722131207)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(sub(43.826932358995883, 4.5534703722131207, 39.273461986782763)),
            by(builtin(sub, 3))
          )
        ])
      )
    ])
  )
).

controlSignal(actuator2, 26.079999999999998).
why(
  controlSignal(actuator2, 26.079999999999998),
  proof(
    goal(controlSignal(actuator2, 26.079999999999998)),
    by(rule("control-system.pl", clause(20))),
    bindings([binding("Actuator", actuator2), binding("C", 26.079999999999998)]),
    uses([
      proof(
        goal(control(actuator2, 26.079999999999998)),
        by(rule("control-system.pl", clause(19))),
        bindings([binding("C", 26.079999999999998), binding("P3", 22), binding("M4", 24), binding("T2", 29), binding("Error", 5), binding("DifferentialError", -2), binding("Proportional", 29.0), binding("NonlinearFactor", 1.46), binding("Differential", -2.9199999999999999)]),
        uses([
          proof(
            goal(observation(state3, 22)),
            by(fact("control-system.pl", clause(13)))
          ),
          proof(
            goal(measurement(output2, 24)),
            by(fact("control-system.pl", clause(10)))
          ),
          proof(
            goal(target(output2, 29)),
            by(fact("control-system.pl", clause(14)))
          ),
          proof(
            goal(sub(29, 24, 5)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(sub(22, 24, -2)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(mul(5.8, 5, 29.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(div(7.3, 5, 1.46)),
            by(builtin(div, 3))
          ),
          proof(
            goal(mul(1.46, -2, -2.9199999999999999)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(29.0, -2.9199999999999999, 26.079999999999998)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

status(actuator1, active).
why(
  status(actuator1, active),
  proof(
    goal(status(actuator1, active)),
    by(rule("control-system.pl", clause(21))),
    bindings([binding("Actuator", actuator1), binding("_C", 39.273461986782763)]),
    uses([
      proof(
        goal(control(actuator1, 39.273461986782763)),
        by(rule("control-system.pl", clause(18))),
        bindings([binding("C", 39.273461986782763), binding("M1", 2.2360679774997898), binding("D1", 35766), binding("Proportional", 43.826932358995883), binding("Compensation", 4.5534703722131207)]),
        uses([
          proof(
            goal(measurement_normalized(input1, 2.2360679774997898)),
            by(rule("control-system.pl", clause(15))),
            bindings([binding("I", input1), binding("M", 2.2360679774997898), binding("M1", 6), binding("M2", 11), binding("Delta", 5)]),
            uses([
              proof(
                goal(measurement(input1, [6, 11])),
                by(fact("control-system.pl", clause(5)))
              ),
              proof(
                goal(lt(6, 11)),
                by(builtin(lt, 2))
              ),
              proof(
                goal(sub(11, 6, 5)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(pow(5, 0.5, 2.2360679774997898)),
                by(builtin(pow, 3))
              )
            ])
          ),
          proof(
            goal(measurement(input2, true)),
            by(fact("control-system.pl", clause(7)))
          ),
          proof(
            goal(measurement(disturbance1, 35766)),
            by(fact("control-system.pl", clause(9)))
          ),
          proof(
            goal(mul(2.2360679774997898, 19.6, 43.826932358995883)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(log10(35766, 4.5534703722131207)),
            by(rule("control-system.pl", clause(17))),
            bindings([binding("Value", 35766), binding("Result", 4.5534703722131207), binding("NaturalLog", 10.484753000447981), binding("NaturalLog10", 2.3025850929940459)]),
            uses([
              proof(
                goal(log(35766, 10.484753000447981)),
                by(builtin(log, 2))
              ),
              proof(
                goal(log(10, 2.3025850929940459)),
                by(builtin(log, 2))
              ),
              proof(
                goal(div(10.484753000447981, 2.3025850929940459, 4.5534703722131207)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(sub(43.826932358995883, 4.5534703722131207, 39.273461986782763)),
            by(builtin(sub, 3))
          )
        ])
      )
    ])
  )
).

status(actuator2, active).
why(
  status(actuator2, active),
  proof(
    goal(status(actuator2, active)),
    by(rule("control-system.pl", clause(21))),
    bindings([binding("Actuator", actuator2), binding("_C", 26.079999999999998)]),
    uses([
      proof(
        goal(control(actuator2, 26.079999999999998)),
        by(rule("control-system.pl", clause(19))),
        bindings([binding("C", 26.079999999999998), binding("P3", 22), binding("M4", 24), binding("T2", 29), binding("Error", 5), binding("DifferentialError", -2), binding("Proportional", 29.0), binding("NonlinearFactor", 1.46), binding("Differential", -2.9199999999999999)]),
        uses([
          proof(
            goal(observation(state3, 22)),
            by(fact("control-system.pl", clause(13)))
          ),
          proof(
            goal(measurement(output2, 24)),
            by(fact("control-system.pl", clause(10)))
          ),
          proof(
            goal(target(output2, 29)),
            by(fact("control-system.pl", clause(14)))
          ),
          proof(
            goal(sub(29, 24, 5)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(sub(22, 24, -2)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(mul(5.8, 5, 29.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(div(7.3, 5, 1.46)),
            by(builtin(div, 3))
          ),
          proof(
            goal(mul(1.46, -2, -2.9199999999999999)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(29.0, -2.9199999999999999, 26.079999999999998)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

normalizedMeasurement(input1, 2.2360679774997898).
why(
  normalizedMeasurement(input1, 2.2360679774997898),
  proof(
    goal(normalizedMeasurement(input1, 2.2360679774997898)),
    by(rule("control-system.pl", clause(22))),
    bindings([binding("M", 2.2360679774997898)]),
    uses([
      proof(
        goal(measurement_normalized(input1, 2.2360679774997898)),
        by(rule("control-system.pl", clause(15))),
        bindings([binding("I", input1), binding("M", 2.2360679774997898), binding("M1", 6), binding("M2", 11), binding("Delta", 5)]),
        uses([
          proof(
            goal(measurement(input1, [6, 11])),
            by(fact("control-system.pl", clause(5)))
          ),
          proof(
            goal(lt(6, 11)),
            by(builtin(lt, 2))
          ),
          proof(
            goal(sub(11, 6, 5)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(pow(5, 0.5, 2.2360679774997898)),
            by(builtin(pow, 3))
          )
        ])
      )
    ])
  )
).

