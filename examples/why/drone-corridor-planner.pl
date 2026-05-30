gps_plan(d1, plan([fly_gent_brugge, public_coastline_brugge_oostende], 2800.0, 0.012, 0.96029999999999993, 0.95039999999999991, low, none, [t, t, t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_brugge, public_coastline_brugge_oostende], 2800.0, 0.012, 0.96029999999999993, 0.95039999999999991, low, none, [t, t, t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_brugge, public_coastline_brugge_oostende], 2800.0, 0.012, 0.96029999999999993, 0.95039999999999991, low, none, [t, t, t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_brugge, public_coastline_brugge_oostende]), binding("Duration", 2800.0), binding("Cost", 0.012), binding("Belief", 0.96029999999999993), binding("Comfort", 0.95039999999999991), binding("Battery", low), binding("Permit", none), binding("FuelLeft", [t, t, t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_brugge, public_coastline_brugge_oostende], 2800.0, 0.012, 0.96029999999999993, 0.95039999999999991, low, none, [t, t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_brugge, public_coastline_brugge_oostende]), binding("Duration", 2800.0), binding("Cost", 0.012), binding("Belief", 0.96029999999999993), binding("Comfort", 0.95039999999999991), binding("Battery", low), binding("Permit", none), binding("FuelLeft", [t, t, t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, low, none), [fly_gent_brugge, public_coastline_brugge_oostende], 2800.0, 0.012, 0.96029999999999993, 0.95039999999999991, [t, t, t, t, t, t, t], [t, t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, low, none)), binding("Actions", [fly_gent_brugge, public_coastline_brugge_oostende]), binding("Duration", 2800.0), binding("Cost", 0.012), binding("Belief", 0.96029999999999993), binding("Comfort", 0.95039999999999991), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t, t]), binding("Mid", state(brugge, mid, none)), binding("Act", fly_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1300.0), binding("C2", 0.006), binding("B2", 0.97), binding("M2", 0.96)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, mid, none), fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(4))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, mid, none), state(oostende, low, none), [public_coastline_brugge_oostende], 1300.0, 0.006, 0.97, 0.96, [t, t, t, t, t, t], [t, t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                bindings([binding("From", state(brugge, mid, none)), binding("To", state(oostende, low, none)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1300.0), binding("Cost", 0.006), binding("Belief", 0.97), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t, t])]),
                uses([
                  proof(
                    goal(step(state(brugge, mid, none), state(oostende, low, none), public_coastline_brugge_oostende, 1300.0, 0.006, 0.97, 0.96)), by(fact("drone-corridor-planner.pl", clause(15))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2)))
                ])
              ),
              proof(goal(append([fly_gent_brugge], [public_coastline_brugge_oostende], [fly_gent_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1500.0, 1300.0, 2800.0)), by(builtin(add, 3))),
              proof(goal(add(0.006, 0.006, 0.012)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.97, 0.96029999999999993)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.96, 0.95039999999999991)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.96029999999999993, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.012, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3250.0, 0.014, 0.94109399999999999, 0.95039999999999991, low, yes, [t, t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3250.0, 0.014, 0.94109399999999999, 0.95039999999999991, low, yes, [t, t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3250.0, 0.014, 0.94109399999999999, 0.95039999999999991, low, yes, [t, t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.014), binding("Belief", 0.94109399999999999), binding("Comfort", 0.95039999999999991), binding("Battery", low), binding("Permit", yes), binding("FuelLeft", [t, t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3250.0, 0.014, 0.94109399999999999, 0.95039999999999991, low, yes, [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.014), binding("Belief", 0.94109399999999999), binding("Comfort", 0.95039999999999991), binding("Battery", low), binding("Permit", yes), binding("FuelLeft", [t, t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, low, yes), [fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3250.0, 0.014, 0.94109399999999999, 0.95039999999999991, [t, t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, low, yes)), binding("Actions", [fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.014), binding("Belief", 0.94109399999999999), binding("Comfort", 0.95039999999999991), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, mid, none)), binding("Act", fly_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, public_coastline_brugge_oostende]), binding("D2", 1750.0), binding("C2", 0.0080000000000000002), binding("B2", 0.9506), binding("M2", 0.95999999999999996)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, mid, none), fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(4))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, mid, none), state(oostende, low, yes), [buy_permit_brugge, public_coastline_brugge_oostende], 1750.0, 0.0080000000000000002, 0.9506, 0.95999999999999996, [t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, mid, none)), binding("To", state(oostende, low, yes)), binding("Actions", [buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 1750.0), binding("Cost", 0.0080000000000000002), binding("Belief", 0.9506), binding("Comfort", 0.95999999999999996), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, mid, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1300.0), binding("C2", 0.006), binding("B2", 0.97), binding("M2", 0.96)]),
                uses([
                  proof(
                    goal(step(state(brugge, mid, none), state(brugge, mid, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                    bindings([binding("B", mid)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, mid, yes), state(oostende, low, yes), [public_coastline_brugge_oostende], 1300.0, 0.006, 0.97, 0.96, [t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                    bindings([binding("From", state(brugge, mid, yes)), binding("To", state(oostende, low, yes)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1300.0), binding("Cost", 0.006), binding("Belief", 0.97), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t, t])]),
                    uses([
                      proof(
                        goal(step(state(brugge, mid, yes), state(oostende, low, yes), public_coastline_brugge_oostende, 1300.0, 0.006, 0.97, 0.96)), by(fact("drone-corridor-planner.pl", clause(15))),
                        bindings([binding("P", yes)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2)))
                    ])
                  ),
                  proof(goal(append([buy_permit_brugge], [public_coastline_brugge_oostende], [buy_permit_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(450.0, 1300.0, 1750.0)), by(builtin(add, 3))),
                  proof(goal(add(0.002, 0.006, 0.0080000000000000002)), by(builtin(add, 3))),
                  proof(goal(mul(0.98, 0.97, 0.9506)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 0.96, 0.95999999999999996)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_brugge], [buy_permit_brugge, public_coastline_brugge_oostende], [fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1500.0, 1750.0, 3250.0)), by(builtin(add, 3))),
              proof(goal(add(0.006, 0.0080000000000000002, 0.014)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.9506, 0.94109399999999999)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.95999999999999996, 0.95039999999999991)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94109399999999999, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.014, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.97019999999999995), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.97019999999999995), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, [t, t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.97019999999999995), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, mid, none)), binding("Act", fly_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende]), binding("D2", 1750.0), binding("C2", 0.0090000000000000011), binding("B2", 0.95943959999999995), binding("M2", 0.97999999999999998)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, mid, none), fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(4))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, mid, none), state(oostende, mid, yes), [buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende], 1750.0, 0.0090000000000000011, 0.95943959999999995, 0.97999999999999998, [t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1750.0), binding("Cost", 0.0090000000000000011), binding("Belief", 0.95943959999999995), binding("Comfort", 0.97999999999999998), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, mid, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [topup_brugge, cross_corridor_brugge_oostende]), binding("D2", 1300.0), binding("C2", 0.0070000000000000001), binding("B2", 0.97902), binding("M2", 0.97999999999999998)]),
                uses([
                  proof(
                    goal(step(state(brugge, mid, none), state(brugge, mid, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                    bindings([binding("B", mid)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, mid, yes), state(oostende, mid, yes), [topup_brugge, cross_corridor_brugge_oostende], 1300.0, 0.0070000000000000001, 0.97902, 0.97999999999999998, [t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(brugge, mid, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [topup_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1300.0), binding("Cost", 0.0070000000000000001), binding("Belief", 0.97902), binding("Comfort", 0.97999999999999998), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", topup_brugge), binding("D1", 400.0), binding("C1", 0.003), binding("B1", 0.999), binding("M1", 0.98), binding("FuelMid", [t, t, t, t]), binding("RestActions", [cross_corridor_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("M2", 1.0)]),
                    uses([
                      proof(
                        goal(step(state(brugge, mid, yes), state(brugge, full, yes), topup_brugge, 400.0, 0.003, 0.999, 0.98)), by(fact("drone-corridor-planner.pl", clause(12))),
                        bindings([binding("P", yes)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, full, yes), state(oostende, mid, yes), [cross_corridor_brugge_oostende], 900.0, 0.004, 0.98, 1.0, [t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                        bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", cross_corridor_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t, t])]),
                        uses([
                          proof(goal(step(state(brugge, full, yes), state(oostende, mid, yes), cross_corridor_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(14)))),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2)))
                        ])
                      ),
                      proof(goal(append([topup_brugge], [cross_corridor_brugge_oostende], [topup_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(400.0, 900.0, 1300.0)), by(builtin(add, 3))),
                      proof(goal(add(0.003, 0.004, 0.0070000000000000001)), by(builtin(add, 3))),
                      proof(goal(mul(0.999, 0.98, 0.97902)), by(builtin(mul, 3))),
                      proof(goal(mul(0.98, 1.0, 0.97999999999999998)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([buy_permit_brugge], [topup_brugge, cross_corridor_brugge_oostende], [buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(450.0, 1300.0, 1750.0)), by(builtin(add, 3))),
                  proof(goal(add(0.002, 0.0070000000000000001, 0.0090000000000000011)), by(builtin(add, 3))),
                  proof(goal(mul(0.98, 0.97902, 0.95943959999999995)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 0.97999999999999998, 0.97999999999999998)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_brugge], [buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende], [fly_gent_brugge, buy_permit_brugge, topup_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1500.0, 1750.0, 3250.0)), by(builtin(add, 3))),
              proof(goal(add(0.006, 0.0090000000000000011, 0.015000000000000001)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.95943959999999995, 0.94984520399999994)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.97999999999999998, 0.97019999999999995)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94984520399999994, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.015000000000000001, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94499905500000003), binding("Comfort", 0.931392), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94499905500000003), binding("Comfort", 0.931392), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, [t, t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94499905500000003), binding("Comfort", 0.931392), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, mid, none)), binding("Act", fly_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("D2", 2050.0), binding("C2", 0.011000000000000001), binding("B2", 0.95454450000000002), binding("M2", 0.94079999999999997)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, mid, none), fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(4))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, mid, none), state(oostende, mid, yes), [buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende], 2050.0, 0.011000000000000001, 0.95454450000000002, 0.94079999999999997, [t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 2050.0), binding("Cost", 0.011000000000000001), binding("Belief", 0.95454450000000002), binding("Comfort", 0.94079999999999997), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, mid, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [topup_brugge, public_coastline_brugge_oostende]), binding("D2", 1600.0), binding("C2", 0.0090000000000000011), binding("B2", 0.97402500000000003), binding("M2", 0.94079999999999997)]),
                uses([
                  proof(
                    goal(step(state(brugge, mid, none), state(brugge, mid, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                    bindings([binding("B", mid)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, mid, yes), state(oostende, mid, yes), [topup_brugge, public_coastline_brugge_oostende], 1600.0, 0.0090000000000000011, 0.97402500000000003, 0.94079999999999997, [t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(brugge, mid, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 1600.0), binding("Cost", 0.0090000000000000011), binding("Belief", 0.97402500000000003), binding("Comfort", 0.94079999999999997), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", topup_brugge), binding("D1", 400.0), binding("C1", 0.003), binding("B1", 0.999), binding("M1", 0.98), binding("FuelMid", [t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1200.0), binding("C2", 0.006), binding("B2", 0.975), binding("M2", 0.96)]),
                    uses([
                      proof(
                        goal(step(state(brugge, mid, yes), state(brugge, full, yes), topup_brugge, 400.0, 0.003, 0.999, 0.98)), by(fact("drone-corridor-planner.pl", clause(12))),
                        bindings([binding("P", yes)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, full, yes), state(oostende, mid, yes), [public_coastline_brugge_oostende], 1200.0, 0.006, 0.975, 0.96, [t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                        bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1200.0), binding("Cost", 0.006), binding("Belief", 0.975), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t, t])]),
                        uses([
                          proof(
                            goal(step(state(brugge, full, yes), state(oostende, mid, yes), public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96)), by(fact("drone-corridor-planner.pl", clause(16))),
                            bindings([binding("P", yes)])
                          ),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2)))
                        ])
                      ),
                      proof(goal(append([topup_brugge], [public_coastline_brugge_oostende], [topup_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(400.0, 1200.0, 1600.0)), by(builtin(add, 3))),
                      proof(goal(add(0.003, 0.006, 0.0090000000000000011)), by(builtin(add, 3))),
                      proof(goal(mul(0.999, 0.975, 0.97402500000000003)), by(builtin(mul, 3))),
                      proof(goal(mul(0.98, 0.96, 0.94079999999999997)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([buy_permit_brugge], [topup_brugge, public_coastline_brugge_oostende], [buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(450.0, 1600.0, 2050.0)), by(builtin(add, 3))),
                  proof(goal(add(0.002, 0.0090000000000000011, 0.011000000000000001)), by(builtin(add, 3))),
                  proof(goal(mul(0.98, 0.97402500000000003, 0.95454450000000002)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 0.94079999999999997, 0.94079999999999997)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_brugge], [buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende], [fly_gent_brugge, buy_permit_brugge, topup_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1500.0, 2050.0, 3550.0)), by(builtin(add, 3))),
              proof(goal(add(0.006, 0.011000000000000001, 0.017000000000000001)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.95454450000000002, 0.94499905500000003)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.94079999999999997, 0.931392)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94499905500000003, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.017000000000000001, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende], 3100.0, 0.015000000000000001, 0.96428475000000002, 0.931392, mid, none, [t, t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende], 3100.0, 0.015000000000000001, 0.96428475000000002, 0.931392, mid, none, [t, t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende], 3100.0, 0.015000000000000001, 0.96428475000000002, 0.931392, mid, none, [t, t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 3100.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.96428475000000002), binding("Comfort", 0.931392), binding("Battery", mid), binding("Permit", none), binding("FuelLeft", [t, t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende], 3100.0, 0.015000000000000001, 0.96428475000000002, 0.931392, mid, none, [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 3100.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.96428475000000002), binding("Comfort", 0.931392), binding("Battery", mid), binding("Permit", none), binding("FuelLeft", [t, t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, none), [fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende], 3100.0, 0.015000000000000001, 0.96428475000000002, 0.931392, [t, t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, none)), binding("Actions", [fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 3100.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.96428475000000002), binding("Comfort", 0.931392), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, mid, none)), binding("Act", fly_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [topup_brugge, public_coastline_brugge_oostende]), binding("D2", 1600.0), binding("C2", 0.0090000000000000011), binding("B2", 0.97402500000000003), binding("M2", 0.94079999999999997)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, mid, none), fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(4))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, mid, none), state(oostende, mid, none), [topup_brugge, public_coastline_brugge_oostende], 1600.0, 0.0090000000000000011, 0.97402500000000003, 0.94079999999999997, [t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, mid, none)), binding("To", state(oostende, mid, none)), binding("Actions", [topup_brugge, public_coastline_brugge_oostende]), binding("Duration", 1600.0), binding("Cost", 0.0090000000000000011), binding("Belief", 0.97402500000000003), binding("Comfort", 0.94079999999999997), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, full, none)), binding("Act", topup_brugge), binding("D1", 400.0), binding("C1", 0.003), binding("B1", 0.999), binding("M1", 0.98), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1200.0), binding("C2", 0.006), binding("B2", 0.975), binding("M2", 0.96)]),
                uses([
                  proof(
                    goal(step(state(brugge, mid, none), state(brugge, full, none), topup_brugge, 400.0, 0.003, 0.999, 0.98)), by(fact("drone-corridor-planner.pl", clause(12))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, full, none), state(oostende, mid, none), [public_coastline_brugge_oostende], 1200.0, 0.006, 0.975, 0.96, [t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                    bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, none)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1200.0), binding("Cost", 0.006), binding("Belief", 0.975), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t, t])]),
                    uses([
                      proof(
                        goal(step(state(brugge, full, none), state(oostende, mid, none), public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96)), by(fact("drone-corridor-planner.pl", clause(16))),
                        bindings([binding("P", none)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2)))
                    ])
                  ),
                  proof(goal(append([topup_brugge], [public_coastline_brugge_oostende], [topup_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(400.0, 1200.0, 1600.0)), by(builtin(add, 3))),
                  proof(goal(add(0.003, 0.006, 0.0090000000000000011)), by(builtin(add, 3))),
                  proof(goal(mul(0.999, 0.975, 0.97402500000000003)), by(builtin(mul, 3))),
                  proof(goal(mul(0.98, 0.96, 0.94079999999999997)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_brugge], [topup_brugge, public_coastline_brugge_oostende], [fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1500.0, 1600.0, 3100.0)), by(builtin(add, 3))),
              proof(goal(add(0.006, 0.0090000000000000011, 0.015000000000000001)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.97402500000000003, 0.96428475000000002)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.94079999999999997, 0.931392)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.96428475000000002, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.015000000000000001, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.97019999999999995), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, mid, yes, [t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.97019999999999995), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3250.0, 0.015000000000000001, 0.94984520399999994, 0.97019999999999995, [t, t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3250.0), binding("Cost", 0.015000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.97019999999999995), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, mid, none)), binding("Act", fly_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("D2", 1750.0), binding("C2", 0.0090000000000000011), binding("B2", 0.95943959999999995), binding("M2", 0.97999999999999998)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, mid, none), fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(4))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, mid, none), state(oostende, mid, yes), [topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 1750.0, 0.0090000000000000011, 0.95943959999999995, 0.97999999999999998, [t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1750.0), binding("Cost", 0.0090000000000000011), binding("Belief", 0.95943959999999995), binding("Comfort", 0.97999999999999998), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, full, none)), binding("Act", topup_brugge), binding("D1", 400.0), binding("C1", 0.003), binding("B1", 0.999), binding("M1", 0.98), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, cross_corridor_brugge_oostende]), binding("D2", 1350.0), binding("C2", 0.0060000000000000001), binding("B2", 0.96039999999999992), binding("M2", 1.0)]),
                uses([
                  proof(
                    goal(step(state(brugge, mid, none), state(brugge, full, none), topup_brugge, 400.0, 0.003, 0.999, 0.98)), by(fact("drone-corridor-planner.pl", clause(12))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, full, none), state(oostende, mid, yes), [buy_permit_brugge, cross_corridor_brugge_oostende], 1350.0, 0.0060000000000000001, 0.96039999999999992, 1.0, [t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1350.0), binding("Cost", 0.0060000000000000001), binding("Belief", 0.96039999999999992), binding("Comfort", 1.0), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t]), binding("RestActions", [cross_corridor_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("M2", 1.0)]),
                    uses([
                      proof(
                        goal(step(state(brugge, full, none), state(brugge, full, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                        bindings([binding("B", full)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, full, yes), state(oostende, mid, yes), [cross_corridor_brugge_oostende], 900.0, 0.004, 0.98, 1.0, [t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                        bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", cross_corridor_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t, t])]),
                        uses([
                          proof(goal(step(state(brugge, full, yes), state(oostende, mid, yes), cross_corridor_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(14)))),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2)))
                        ])
                      ),
                      proof(goal(append([buy_permit_brugge], [cross_corridor_brugge_oostende], [buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(450.0, 900.0, 1350.0)), by(builtin(add, 3))),
                      proof(goal(add(0.002, 0.004, 0.0060000000000000001)), by(builtin(add, 3))),
                      proof(goal(mul(0.98, 0.98, 0.96039999999999992)), by(builtin(mul, 3))),
                      proof(goal(mul(1.0, 1.0, 1.0)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([topup_brugge], [buy_permit_brugge, cross_corridor_brugge_oostende], [topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(400.0, 1350.0, 1750.0)), by(builtin(add, 3))),
                  proof(goal(add(0.003, 0.0060000000000000001, 0.0090000000000000011)), by(builtin(add, 3))),
                  proof(goal(mul(0.999, 0.96039999999999992, 0.95943959999999995)), by(builtin(mul, 3))),
                  proof(goal(mul(0.98, 1.0, 0.97999999999999998)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_brugge], [topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], [fly_gent_brugge, topup_brugge, buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1500.0, 1750.0, 3250.0)), by(builtin(add, 3))),
              proof(goal(add(0.006, 0.0090000000000000011, 0.015000000000000001)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.95943959999999995, 0.94984520399999994)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.97999999999999998, 0.97019999999999995)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94984520399999994, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.015000000000000001, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94499905500000003), binding("Comfort", 0.931392), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, mid, yes, [t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94499905500000003), binding("Comfort", 0.931392), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3550.0, 0.017000000000000001, 0.94499905500000003, 0.931392, [t, t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94499905500000003), binding("Comfort", 0.931392), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, mid, none)), binding("Act", fly_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("D2", 2050.0), binding("C2", 0.010999999999999999), binding("B2", 0.95454450000000002), binding("M2", 0.94079999999999997)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, mid, none), fly_gent_brugge, 1500.0, 0.006, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(4))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, mid, none), state(oostende, mid, yes), [topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 2050.0, 0.010999999999999999, 0.95454450000000002, 0.94079999999999997, [t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 2050.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.95454450000000002), binding("Comfort", 0.94079999999999997), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, full, none)), binding("Act", topup_brugge), binding("D1", 400.0), binding("C1", 0.003), binding("B1", 0.999), binding("M1", 0.98), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, public_coastline_brugge_oostende]), binding("D2", 1650.0), binding("C2", 0.0080000000000000002), binding("B2", 0.95550000000000002), binding("M2", 0.95999999999999996)]),
                uses([
                  proof(
                    goal(step(state(brugge, mid, none), state(brugge, full, none), topup_brugge, 400.0, 0.003, 0.999, 0.98)), by(fact("drone-corridor-planner.pl", clause(12))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, full, none), state(oostende, mid, yes), [buy_permit_brugge, public_coastline_brugge_oostende], 1650.0, 0.0080000000000000002, 0.95550000000000002, 0.95999999999999996, [t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 1650.0), binding("Cost", 0.0080000000000000002), binding("Belief", 0.95550000000000002), binding("Comfort", 0.95999999999999996), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1200.0), binding("C2", 0.006), binding("B2", 0.975), binding("M2", 0.96)]),
                    uses([
                      proof(
                        goal(step(state(brugge, full, none), state(brugge, full, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                        bindings([binding("B", full)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, full, yes), state(oostende, mid, yes), [public_coastline_brugge_oostende], 1200.0, 0.006, 0.975, 0.96, [t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                        bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1200.0), binding("Cost", 0.006), binding("Belief", 0.975), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t, t])]),
                        uses([
                          proof(
                            goal(step(state(brugge, full, yes), state(oostende, mid, yes), public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96)), by(fact("drone-corridor-planner.pl", clause(16))),
                            bindings([binding("P", yes)])
                          ),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2)))
                        ])
                      ),
                      proof(goal(append([buy_permit_brugge], [public_coastline_brugge_oostende], [buy_permit_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(450.0, 1200.0, 1650.0)), by(builtin(add, 3))),
                      proof(goal(add(0.002, 0.006, 0.0080000000000000002)), by(builtin(add, 3))),
                      proof(goal(mul(0.98, 0.975, 0.95550000000000002)), by(builtin(mul, 3))),
                      proof(goal(mul(1.0, 0.96, 0.95999999999999996)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([topup_brugge], [buy_permit_brugge, public_coastline_brugge_oostende], [topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(400.0, 1650.0, 2050.0)), by(builtin(add, 3))),
                  proof(goal(add(0.003, 0.0080000000000000002, 0.010999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.999, 0.95550000000000002, 0.95454450000000002)), by(builtin(mul, 3))),
                  proof(goal(mul(0.98, 0.95999999999999996, 0.94079999999999997)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_brugge], [topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende], [fly_gent_brugge, topup_brugge, buy_permit_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1500.0, 2050.0, 3550.0)), by(builtin(add, 3))),
              proof(goal(add(0.006, 0.010999999999999999, 0.017000000000000001)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.95454450000000002, 0.94499905500000003)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.94079999999999997, 0.931392)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94499905500000003, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.017000000000000001, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([train_gent_brugge, public_coastline_brugge_oostende], 2900.0, 0.018000000000000002, 0.97402500000000003, 0.95519999999999994, mid, none, [t, t, t, t, t])).
why(
  gps_plan(d1, plan([train_gent_brugge, public_coastline_brugge_oostende], 2900.0, 0.018000000000000002, 0.97402500000000003, 0.95519999999999994, mid, none, [t, t, t, t, t])),
  proof(
    goal(gps_plan(d1, plan([train_gent_brugge, public_coastline_brugge_oostende], 2900.0, 0.018000000000000002, 0.97402500000000003, 0.95519999999999994, mid, none, [t, t, t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [train_gent_brugge, public_coastline_brugge_oostende]), binding("Duration", 2900.0), binding("Cost", 0.018000000000000002), binding("Belief", 0.97402500000000003), binding("Comfort", 0.95519999999999994), binding("Battery", mid), binding("Permit", none), binding("FuelLeft", [t, t, t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([train_gent_brugge, public_coastline_brugge_oostende], 2900.0, 0.018000000000000002, 0.97402500000000003, 0.95519999999999994, mid, none, [t, t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [train_gent_brugge, public_coastline_brugge_oostende]), binding("Duration", 2900.0), binding("Cost", 0.018000000000000002), binding("Belief", 0.97402500000000003), binding("Comfort", 0.95519999999999994), binding("Battery", mid), binding("Permit", none), binding("FuelLeft", [t, t, t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, none), [train_gent_brugge, public_coastline_brugge_oostende], 2900.0, 0.018000000000000002, 0.97402500000000003, 0.95519999999999994, [t, t, t, t, t, t, t], [t, t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, none)), binding("Actions", [train_gent_brugge, public_coastline_brugge_oostende]), binding("Duration", 2900.0), binding("Cost", 0.018000000000000002), binding("Belief", 0.97402500000000003), binding("Comfort", 0.95519999999999994), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t, t]), binding("Mid", state(brugge, full, none)), binding("Act", train_gent_brugge), binding("D1", 1700.0), binding("C1", 0.012), binding("B1", 0.999), binding("M1", 0.995), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1200.0), binding("C2", 0.006), binding("B2", 0.975), binding("M2", 0.96)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, full, none), train_gent_brugge, 1700.0, 0.012, 0.999, 0.995)), by(fact("drone-corridor-planner.pl", clause(5))),
                bindings([binding("B", full), binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, full, none), state(oostende, mid, none), [public_coastline_brugge_oostende], 1200.0, 0.006, 0.975, 0.96, [t, t, t, t, t, t], [t, t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, none)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1200.0), binding("Cost", 0.006), binding("Belief", 0.975), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t, t])]),
                uses([
                  proof(
                    goal(step(state(brugge, full, none), state(oostende, mid, none), public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96)), by(fact("drone-corridor-planner.pl", clause(16))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2)))
                ])
              ),
              proof(goal(append([train_gent_brugge], [public_coastline_brugge_oostende], [train_gent_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1700.0, 1200.0, 2900.0)), by(builtin(add, 3))),
              proof(goal(add(0.012, 0.006, 0.018000000000000002)), by(builtin(add, 3))),
              proof(goal(mul(0.999, 0.975, 0.97402500000000003)), by(builtin(mul, 3))),
              proof(goal(mul(0.995, 0.96, 0.95519999999999994)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.97402500000000003, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.018000000000000002, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3050.0, 0.018000000000000002, 0.95943959999999995, 0.995, mid, yes, [t, t, t, t])).
why(
  gps_plan(d1, plan([train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3050.0, 0.018000000000000002, 0.95943959999999995, 0.995, mid, yes, [t, t, t, t])),
  proof(
    goal(gps_plan(d1, plan([train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3050.0, 0.018000000000000002, 0.95943959999999995, 0.995, mid, yes, [t, t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3050.0), binding("Cost", 0.018000000000000002), binding("Belief", 0.95943959999999995), binding("Comfort", 0.995), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3050.0, 0.018000000000000002, 0.95943959999999995, 0.995, mid, yes, [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3050.0), binding("Cost", 0.018000000000000002), binding("Belief", 0.95943959999999995), binding("Comfort", 0.995), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3050.0, 0.018000000000000002, 0.95943959999999995, 0.995, [t, t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3050.0), binding("Cost", 0.018000000000000002), binding("Belief", 0.95943959999999995), binding("Comfort", 0.995), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, full, none)), binding("Act", train_gent_brugge), binding("D1", 1700.0), binding("C1", 0.012), binding("B1", 0.999), binding("M1", 0.995), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, cross_corridor_brugge_oostende]), binding("D2", 1350.0), binding("C2", 0.0060000000000000001), binding("B2", 0.96039999999999992), binding("M2", 1.0)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, full, none), train_gent_brugge, 1700.0, 0.012, 0.999, 0.995)), by(fact("drone-corridor-planner.pl", clause(5))),
                bindings([binding("B", full), binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, full, none), state(oostende, mid, yes), [buy_permit_brugge, cross_corridor_brugge_oostende], 1350.0, 0.0060000000000000001, 0.96039999999999992, 1.0, [t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1350.0), binding("Cost", 0.0060000000000000001), binding("Belief", 0.96039999999999992), binding("Comfort", 1.0), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [cross_corridor_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("M2", 1.0)]),
                uses([
                  proof(
                    goal(step(state(brugge, full, none), state(brugge, full, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                    bindings([binding("B", full)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, full, yes), state(oostende, mid, yes), [cross_corridor_brugge_oostende], 900.0, 0.004, 0.98, 1.0, [t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                    bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", cross_corridor_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t, t])]),
                    uses([
                      proof(goal(step(state(brugge, full, yes), state(oostende, mid, yes), cross_corridor_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(14)))),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2)))
                    ])
                  ),
                  proof(goal(append([buy_permit_brugge], [cross_corridor_brugge_oostende], [buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(450.0, 900.0, 1350.0)), by(builtin(add, 3))),
                  proof(goal(add(0.002, 0.004, 0.0060000000000000001)), by(builtin(add, 3))),
                  proof(goal(mul(0.98, 0.98, 0.96039999999999992)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 1.0, 1.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([train_gent_brugge], [buy_permit_brugge, cross_corridor_brugge_oostende], [train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1700.0, 1350.0, 3050.0)), by(builtin(add, 3))),
              proof(goal(add(0.012, 0.0060000000000000001, 0.018000000000000002)), by(builtin(add, 3))),
              proof(goal(mul(0.999, 0.96039999999999992, 0.95943959999999995)), by(builtin(mul, 3))),
              proof(goal(mul(0.995, 1.0, 0.995)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.95943959999999995, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.018000000000000002, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3350.0, 0.02, 0.95454450000000002, 0.95519999999999994, mid, yes, [t, t, t, t])).
why(
  gps_plan(d1, plan([train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3350.0, 0.02, 0.95454450000000002, 0.95519999999999994, mid, yes, [t, t, t, t])),
  proof(
    goal(gps_plan(d1, plan([train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3350.0, 0.02, 0.95454450000000002, 0.95519999999999994, mid, yes, [t, t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3350.0), binding("Cost", 0.02), binding("Belief", 0.95454450000000002), binding("Comfort", 0.95519999999999994), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3350.0, 0.02, 0.95454450000000002, 0.95519999999999994, mid, yes, [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3350.0), binding("Cost", 0.02), binding("Belief", 0.95454450000000002), binding("Comfort", 0.95519999999999994), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende], 3350.0, 0.02, 0.95454450000000002, 0.95519999999999994, [t, t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 3350.0), binding("Cost", 0.02), binding("Belief", 0.95454450000000002), binding("Comfort", 0.95519999999999994), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, full, none)), binding("Act", train_gent_brugge), binding("D1", 1700.0), binding("C1", 0.012), binding("B1", 0.999), binding("M1", 0.995), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, public_coastline_brugge_oostende]), binding("D2", 1650.0), binding("C2", 0.0080000000000000002), binding("B2", 0.95550000000000002), binding("M2", 0.95999999999999996)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(brugge, full, none), train_gent_brugge, 1700.0, 0.012, 0.999, 0.995)), by(fact("drone-corridor-planner.pl", clause(5))),
                bindings([binding("B", full), binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(brugge, full, none), state(oostende, mid, yes), [buy_permit_brugge, public_coastline_brugge_oostende], 1650.0, 0.0080000000000000002, 0.95550000000000002, 0.95999999999999996, [t, t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, public_coastline_brugge_oostende]), binding("Duration", 1650.0), binding("Cost", 0.0080000000000000002), binding("Belief", 0.95550000000000002), binding("Comfort", 0.95999999999999996), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1200.0), binding("C2", 0.006), binding("B2", 0.975), binding("M2", 0.96)]),
                uses([
                  proof(
                    goal(step(state(brugge, full, none), state(brugge, full, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                    bindings([binding("B", full)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, full, yes), state(oostende, mid, yes), [public_coastline_brugge_oostende], 1200.0, 0.006, 0.975, 0.96, [t, t, t, t, t], [t, t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                    bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1200.0), binding("Cost", 0.006), binding("Belief", 0.975), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t, t])]),
                    uses([
                      proof(
                        goal(step(state(brugge, full, yes), state(oostende, mid, yes), public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96)), by(fact("drone-corridor-planner.pl", clause(16))),
                        bindings([binding("P", yes)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2)))
                    ])
                  ),
                  proof(goal(append([buy_permit_brugge], [public_coastline_brugge_oostende], [buy_permit_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(450.0, 1200.0, 1650.0)), by(builtin(add, 3))),
                  proof(goal(add(0.002, 0.006, 0.0080000000000000002)), by(builtin(add, 3))),
                  proof(goal(mul(0.98, 0.975, 0.95550000000000002)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 0.96, 0.95999999999999996)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([train_gent_brugge], [buy_permit_brugge, public_coastline_brugge_oostende], [train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1700.0, 1650.0, 3350.0)), by(builtin(add, 3))),
              proof(goal(add(0.012, 0.0080000000000000002, 0.02)), by(builtin(add, 3))),
              proof(goal(mul(0.999, 0.95550000000000002, 0.95454450000000002)), by(builtin(mul, 3))),
              proof(goal(mul(0.995, 0.95999999999999996, 0.95519999999999994)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.95454450000000002, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.02, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t])).
why(
  gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5150.0), binding("Cost", 0.024), binding("Belief", 0.94034675195999995), binding("Comfort", 0.9506969999999999), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5150.0), binding("Cost", 0.024), binding("Belief", 0.94034675195999995), binding("Comfort", 0.9506969999999999), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, [t, t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5150.0), binding("Cost", 0.024), binding("Belief", 0.94034675195999995), binding("Comfort", 0.9506969999999999), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(kortrijk, mid, none)), binding("Act", fly_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("D2", 3550.0), binding("C2", 0.017000000000000001), binding("B2", 0.94984520399999994), binding("M2", 0.96029999999999993)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(kortrijk, mid, none), fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(6))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(kortrijk, mid, none), state(oostende, mid, yes), [fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 3550.0, 0.017000000000000001, 0.94984520399999994, 0.96029999999999993, [t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(kortrijk, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.96029999999999993), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, low, none)), binding("Act", fly_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("D2", 1950.0), binding("C2", 0.01), binding("B2", 0.95943959999999995), binding("M2", 0.96999999999999997)]),
                uses([
                  proof(
                    goal(step(state(kortrijk, mid, none), state(brugge, low, none), fly_kortrijk_brugge, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(7))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, low, none), state(oostende, mid, yes), [buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 1950.0, 0.01, 0.95943959999999995, 0.96999999999999997, [t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(brugge, low, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1950.0), binding("Cost", 0.01), binding("Belief", 0.95943959999999995), binding("Comfort", 0.96999999999999997), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, low, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t, t]), binding("RestActions", [quick_charge_brugge, cross_corridor_brugge_oostende]), binding("D2", 1500.0), binding("C2", 0.0080000000000000002), binding("B2", 0.97902), binding("M2", 0.96999999999999997)]),
                    uses([
                      proof(
                        goal(step(state(brugge, low, none), state(brugge, low, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                        bindings([binding("B", low)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, low, yes), state(oostende, mid, yes), [quick_charge_brugge, cross_corridor_brugge_oostende], 1500.0, 0.0080000000000000002, 0.97902, 0.96999999999999997, [t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                        bindings([binding("From", state(brugge, low, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1500.0), binding("Cost", 0.0080000000000000002), binding("Belief", 0.97902), binding("Comfort", 0.96999999999999997), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", quick_charge_brugge), binding("D1", 600.0), binding("C1", 0.004), binding("B1", 0.999), binding("M1", 0.97), binding("FuelMid", [t, t, t]), binding("RestActions", [cross_corridor_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("M2", 1.0)]),
                        uses([
                          proof(
                            goal(step(state(brugge, low, yes), state(brugge, full, yes), quick_charge_brugge, 600.0, 0.004, 0.999, 0.97)), by(fact("drone-corridor-planner.pl", clause(11))),
                            bindings([binding("P", yes)])
                          ),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2))),
                          proof(
                            goal(path(state(brugge, full, yes), state(oostende, mid, yes), [cross_corridor_brugge_oostende], 900.0, 0.004, 0.98, 1.0, [t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                            bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", cross_corridor_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("FuelIn", [t, t, t]), binding("FuelOut", [t, t])]),
                            uses([
                              proof(goal(step(state(brugge, full, yes), state(oostende, mid, yes), cross_corridor_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(14)))),
                              proof(goal(rest([t, t, t], [t, t])), by(builtin(rest, 2)))
                            ])
                          ),
                          proof(goal(append([quick_charge_brugge], [cross_corridor_brugge_oostende], [quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(600.0, 900.0, 1500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.004, 0.004, 0.0080000000000000002)), by(builtin(add, 3))),
                          proof(goal(mul(0.999, 0.98, 0.97902)), by(builtin(mul, 3))),
                          proof(goal(mul(0.97, 1.0, 0.96999999999999997)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([buy_permit_brugge], [quick_charge_brugge, cross_corridor_brugge_oostende], [buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(450.0, 1500.0, 1950.0)), by(builtin(add, 3))),
                      proof(goal(add(0.002, 0.0080000000000000002, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.98, 0.97902, 0.95943959999999995)), by(builtin(mul, 3))),
                      proof(goal(mul(1.0, 0.96999999999999997, 0.96999999999999997)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([fly_kortrijk_brugge], [buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], [fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 1950.0, 3550.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.01, 0.017000000000000001)), by(builtin(add, 3))),
                  proof(goal(mul(0.99, 0.95943959999999995, 0.94984520399999994)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.96999999999999997, 0.96029999999999993)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_kortrijk], [fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], [fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge, quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1600.0, 3550.0, 5150.0)), by(builtin(add, 3))),
              proof(goal(add(0.007, 0.017000000000000001, 0.024)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.94984520399999994, 0.94034675195999995)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.96029999999999993, 0.9506969999999999)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94034675195999995, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.024, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5000.0, 0.024, 0.95464190250000003, 0.91266911999999989, mid, none, [t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5000.0, 0.024, 0.95464190250000003, 0.91266911999999989, mid, none, [t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5000.0, 0.024, 0.95464190250000003, 0.91266911999999989, mid, none, [t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 5000.0), binding("Cost", 0.024), binding("Belief", 0.95464190250000003), binding("Comfort", 0.91266911999999989), binding("Battery", mid), binding("Permit", none), binding("FuelLeft", [t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5000.0, 0.024, 0.95464190250000003, 0.91266911999999989, mid, none, [t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 5000.0), binding("Cost", 0.024), binding("Belief", 0.95464190250000003), binding("Comfort", 0.91266911999999989), binding("Battery", mid), binding("Permit", none), binding("FuelLeft", [t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, none), [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5000.0, 0.024, 0.95464190250000003, 0.91266911999999989, [t, t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, none)), binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 5000.0), binding("Cost", 0.024), binding("Belief", 0.95464190250000003), binding("Comfort", 0.91266911999999989), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(kortrijk, mid, none)), binding("Act", fly_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("D2", 3400.0), binding("C2", 0.017000000000000001), binding("B2", 0.96428475000000002), binding("M2", 0.92188799999999993)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(kortrijk, mid, none), fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(6))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(kortrijk, mid, none), state(oostende, mid, none), [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 3400.0, 0.017000000000000001, 0.96428475000000002, 0.92188799999999993, [t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(kortrijk, mid, none)), binding("To", state(oostende, mid, none)), binding("Actions", [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 3400.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.96428475000000002), binding("Comfort", 0.92188799999999993), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, low, none)), binding("Act", fly_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [quick_charge_brugge, public_coastline_brugge_oostende]), binding("D2", 1800.0), binding("C2", 0.01), binding("B2", 0.97402500000000003), binding("M2", 0.93119999999999992)]),
                uses([
                  proof(
                    goal(step(state(kortrijk, mid, none), state(brugge, low, none), fly_kortrijk_brugge, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(7))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, low, none), state(oostende, mid, none), [quick_charge_brugge, public_coastline_brugge_oostende], 1800.0, 0.01, 0.97402500000000003, 0.93119999999999992, [t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(brugge, low, none)), binding("To", state(oostende, mid, none)), binding("Actions", [quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 1800.0), binding("Cost", 0.01), binding("Belief", 0.97402500000000003), binding("Comfort", 0.93119999999999992), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(brugge, full, none)), binding("Act", quick_charge_brugge), binding("D1", 600.0), binding("C1", 0.004), binding("B1", 0.999), binding("M1", 0.97), binding("FuelMid", [t, t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1200.0), binding("C2", 0.006), binding("B2", 0.975), binding("M2", 0.96)]),
                    uses([
                      proof(
                        goal(step(state(brugge, low, none), state(brugge, full, none), quick_charge_brugge, 600.0, 0.004, 0.999, 0.97)), by(fact("drone-corridor-planner.pl", clause(11))),
                        bindings([binding("P", none)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, full, none), state(oostende, mid, none), [public_coastline_brugge_oostende], 1200.0, 0.006, 0.975, 0.96, [t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                        bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, none)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1200.0), binding("Cost", 0.006), binding("Belief", 0.975), binding("Comfort", 0.96), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t, t])]),
                        uses([
                          proof(
                            goal(step(state(brugge, full, none), state(oostende, mid, none), public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96)), by(fact("drone-corridor-planner.pl", clause(16))),
                            bindings([binding("P", none)])
                          ),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2)))
                        ])
                      ),
                      proof(goal(append([quick_charge_brugge], [public_coastline_brugge_oostende], [quick_charge_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(600.0, 1200.0, 1800.0)), by(builtin(add, 3))),
                      proof(goal(add(0.004, 0.006, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.999, 0.975, 0.97402500000000003)), by(builtin(mul, 3))),
                      proof(goal(mul(0.97, 0.96, 0.93119999999999992)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([fly_kortrijk_brugge], [quick_charge_brugge, public_coastline_brugge_oostende], [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 1800.0, 3400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.01, 0.017000000000000001)), by(builtin(add, 3))),
                  proof(goal(mul(0.99, 0.97402500000000003, 0.96428475000000002)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.93119999999999992, 0.92188799999999993)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_kortrijk], [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1600.0, 3400.0, 5000.0)), by(builtin(add, 3))),
              proof(goal(add(0.007, 0.017000000000000001, 0.024)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.96428475000000002, 0.95464190250000003)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.92188799999999993, 0.91266911999999989)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.95464190250000003, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.024, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t])).
why(
  gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5150.0), binding("Cost", 0.024), binding("Belief", 0.94034675195999995), binding("Comfort", 0.9506969999999999), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, mid, yes, [t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5150.0), binding("Cost", 0.024), binding("Belief", 0.94034675195999995), binding("Comfort", 0.9506969999999999), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 5150.0, 0.024, 0.94034675195999995, 0.9506969999999999, [t, t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5150.0), binding("Cost", 0.024), binding("Belief", 0.94034675195999995), binding("Comfort", 0.9506969999999999), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(kortrijk, mid, none)), binding("Act", fly_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("D2", 3550.0), binding("C2", 0.017000000000000001), binding("B2", 0.94984520399999994), binding("M2", 0.96029999999999993)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(kortrijk, mid, none), fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(6))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(kortrijk, mid, none), state(oostende, mid, yes), [fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 3550.0, 0.017000000000000001, 0.94984520399999994, 0.96029999999999993, [t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(kortrijk, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3550.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.94984520399999994), binding("Comfort", 0.96029999999999993), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, low, none)), binding("Act", fly_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("D2", 1950.0), binding("C2", 0.01), binding("B2", 0.95943959999999995), binding("M2", 0.96999999999999997)]),
                uses([
                  proof(
                    goal(step(state(kortrijk, mid, none), state(brugge, low, none), fly_kortrijk_brugge, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(7))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(brugge, low, none), state(oostende, mid, yes), [quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], 1950.0, 0.01, 0.95943959999999995, 0.96999999999999997, [t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(brugge, low, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1950.0), binding("Cost", 0.01), binding("Belief", 0.95943959999999995), binding("Comfort", 0.96999999999999997), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, full, none)), binding("Act", quick_charge_brugge), binding("D1", 600.0), binding("C1", 0.004), binding("B1", 0.999), binding("M1", 0.97), binding("FuelMid", [t, t, t, t]), binding("RestActions", [buy_permit_brugge, cross_corridor_brugge_oostende]), binding("D2", 1350.0), binding("C2", 0.0060000000000000001), binding("B2", 0.96039999999999992), binding("M2", 1.0)]),
                    uses([
                      proof(
                        goal(step(state(brugge, low, none), state(brugge, full, none), quick_charge_brugge, 600.0, 0.004, 0.999, 0.97)), by(fact("drone-corridor-planner.pl", clause(11))),
                        bindings([binding("P", none)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, full, none), state(oostende, mid, yes), [buy_permit_brugge, cross_corridor_brugge_oostende], 1350.0, 0.0060000000000000001, 0.96039999999999992, 1.0, [t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                        bindings([binding("From", state(brugge, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [buy_permit_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1350.0), binding("Cost", 0.0060000000000000001), binding("Belief", 0.96039999999999992), binding("Comfort", 1.0), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", buy_permit_brugge), binding("D1", 450.0), binding("C1", 0.002), binding("B1", 0.98), binding("M1", 1.0), binding("FuelMid", [t, t, t]), binding("RestActions", [cross_corridor_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("M2", 1.0)]),
                        uses([
                          proof(
                            goal(step(state(brugge, full, none), state(brugge, full, yes), buy_permit_brugge, 450.0, 0.002, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(10))),
                            bindings([binding("B", full)])
                          ),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2))),
                          proof(
                            goal(path(state(brugge, full, yes), state(oostende, mid, yes), [cross_corridor_brugge_oostende], 900.0, 0.004, 0.98, 1.0, [t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                            bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", cross_corridor_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("FuelIn", [t, t, t]), binding("FuelOut", [t, t])]),
                            uses([
                              proof(goal(step(state(brugge, full, yes), state(oostende, mid, yes), cross_corridor_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(14)))),
                              proof(goal(rest([t, t, t], [t, t])), by(builtin(rest, 2)))
                            ])
                          ),
                          proof(goal(append([buy_permit_brugge], [cross_corridor_brugge_oostende], [buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(450.0, 900.0, 1350.0)), by(builtin(add, 3))),
                          proof(goal(add(0.002, 0.004, 0.0060000000000000001)), by(builtin(add, 3))),
                          proof(goal(mul(0.98, 0.98, 0.96039999999999992)), by(builtin(mul, 3))),
                          proof(goal(mul(1.0, 1.0, 1.0)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([quick_charge_brugge], [buy_permit_brugge, cross_corridor_brugge_oostende], [quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(600.0, 1350.0, 1950.0)), by(builtin(add, 3))),
                      proof(goal(add(0.004, 0.0060000000000000001, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.999, 0.96039999999999992, 0.95943959999999995)), by(builtin(mul, 3))),
                      proof(goal(mul(0.97, 1.0, 0.96999999999999997)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([fly_kortrijk_brugge], [quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], [fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 1950.0, 3550.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.01, 0.017000000000000001)), by(builtin(add, 3))),
                  proof(goal(mul(0.99, 0.95943959999999995, 0.94984520399999994)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.96999999999999997, 0.96029999999999993)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_kortrijk], [fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende], [fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, buy_permit_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1600.0, 3550.0, 5150.0)), by(builtin(add, 3))),
              proof(goal(add(0.007, 0.017000000000000001, 0.024)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.94984520399999994, 0.94034675195999995)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.96029999999999993, 0.9506969999999999)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94034675195999995, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.024, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5000.0, 0.023, 0.95857796449800003, 0.9506969999999999, mid, yes, [t, t])).
why(
  gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5000.0, 0.023, 0.95857796449800003, 0.9506969999999999, mid, yes, [t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5000.0, 0.023, 0.95857796449800003, 0.9506969999999999, mid, yes, [t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5000.0), binding("Cost", 0.023), binding("Belief", 0.95857796449800003), binding("Comfort", 0.9506969999999999), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5000.0, 0.023, 0.95857796449800003, 0.9506969999999999, mid, yes, [t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5000.0), binding("Cost", 0.023), binding("Belief", 0.95857796449800003), binding("Comfort", 0.9506969999999999), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 5000.0, 0.023, 0.95857796449800003, 0.9506969999999999, [t, t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 5000.0), binding("Cost", 0.023), binding("Belief", 0.95857796449800003), binding("Comfort", 0.9506969999999999), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(kortrijk, mid, none)), binding("Act", fly_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("D2", 3400.0), binding("C2", 0.016), binding("B2", 0.9682605702), binding("M2", 0.96029999999999993)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(kortrijk, mid, none), fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(6))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(kortrijk, mid, none), state(oostende, mid, yes), [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 3400.0, 0.016, 0.9682605702, 0.96029999999999993, [t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(kortrijk, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3400.0), binding("Cost", 0.016), binding("Belief", 0.9682605702), binding("Comfort", 0.96029999999999993), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(kortrijk, mid, yes)), binding("Act", get_zone_permit_kortrijk), binding("D1", 300.0), binding("C1", 0.001), binding("B1", 0.999), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("D2", 3100.0), binding("C2", 0.014999999999999999), binding("B2", 0.96922980000000003), binding("M2", 0.96029999999999993)]),
                uses([
                  proof(
                    goal(step(state(kortrijk, mid, none), state(kortrijk, mid, yes), get_zone_permit_kortrijk, 300.0, 0.001, 0.999, 1.0)), by(fact("drone-corridor-planner.pl", clause(9))),
                    bindings([binding("B", mid)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(kortrijk, mid, yes), state(oostende, mid, yes), [fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], 3100.0, 0.014999999999999999, 0.96922980000000003, 0.96029999999999993, [t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(kortrijk, mid, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 3100.0), binding("Cost", 0.014999999999999999), binding("Belief", 0.96922980000000003), binding("Comfort", 0.96029999999999993), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, low, yes)), binding("Act", fly_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t]), binding("RestActions", [quick_charge_brugge, cross_corridor_brugge_oostende]), binding("D2", 1500.0), binding("C2", 0.0080000000000000002), binding("B2", 0.97902), binding("M2", 0.96999999999999997)]),
                    uses([
                      proof(
                        goal(step(state(kortrijk, mid, yes), state(brugge, low, yes), fly_kortrijk_brugge, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(7))),
                        bindings([binding("P", yes)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, low, yes), state(oostende, mid, yes), [quick_charge_brugge, cross_corridor_brugge_oostende], 1500.0, 0.0080000000000000002, 0.97902, 0.96999999999999997, [t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                        bindings([binding("From", state(brugge, low, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [quick_charge_brugge, cross_corridor_brugge_oostende]), binding("Duration", 1500.0), binding("Cost", 0.0080000000000000002), binding("Belief", 0.97902), binding("Comfort", 0.96999999999999997), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", quick_charge_brugge), binding("D1", 600.0), binding("C1", 0.004), binding("B1", 0.999), binding("M1", 0.97), binding("FuelMid", [t, t, t]), binding("RestActions", [cross_corridor_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("M2", 1.0)]),
                        uses([
                          proof(
                            goal(step(state(brugge, low, yes), state(brugge, full, yes), quick_charge_brugge, 600.0, 0.004, 0.999, 0.97)), by(fact("drone-corridor-planner.pl", clause(11))),
                            bindings([binding("P", yes)])
                          ),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2))),
                          proof(
                            goal(path(state(brugge, full, yes), state(oostende, mid, yes), [cross_corridor_brugge_oostende], 900.0, 0.004, 0.98, 1.0, [t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                            bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", cross_corridor_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("FuelIn", [t, t, t]), binding("FuelOut", [t, t])]),
                            uses([
                              proof(goal(step(state(brugge, full, yes), state(oostende, mid, yes), cross_corridor_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(fact("drone-corridor-planner.pl", clause(14)))),
                              proof(goal(rest([t, t, t], [t, t])), by(builtin(rest, 2)))
                            ])
                          ),
                          proof(goal(append([quick_charge_brugge], [cross_corridor_brugge_oostende], [quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(600.0, 900.0, 1500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.004, 0.004, 0.0080000000000000002)), by(builtin(add, 3))),
                          proof(goal(mul(0.999, 0.98, 0.97902)), by(builtin(mul, 3))),
                          proof(goal(mul(0.97, 1.0, 0.96999999999999997)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([fly_kortrijk_brugge], [quick_charge_brugge, cross_corridor_brugge_oostende], [fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 1500.0, 3100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.0080000000000000002, 0.014999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.99, 0.97902, 0.96922980000000003)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.96999999999999997, 0.96029999999999993)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([get_zone_permit_kortrijk], [fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(300.0, 3100.0, 3400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.001, 0.014999999999999999, 0.016)), by(builtin(add, 3))),
                  proof(goal(mul(0.999, 0.96922980000000003, 0.9682605702)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 0.96029999999999993, 0.96029999999999993)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_kortrijk], [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende], [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, cross_corridor_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1600.0, 3400.0, 5000.0)), by(builtin(add, 3))),
              proof(goal(add(0.007, 0.016, 0.023)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.9682605702, 0.95857796449800003)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.96029999999999993, 0.9506969999999999)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.95857796449800003, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.023, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5300.0, 0.025000000000000001, 0.95368726059749998, 0.91266911999999989, mid, yes, [t, t])).
why(
  gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5300.0, 0.025000000000000001, 0.95368726059749998, 0.91266911999999989, mid, yes, [t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5300.0, 0.025000000000000001, 0.95368726059749998, 0.91266911999999989, mid, yes, [t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 5300.0), binding("Cost", 0.025000000000000001), binding("Belief", 0.95368726059749998), binding("Comfort", 0.91266911999999989), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5300.0, 0.025000000000000001, 0.95368726059749998, 0.91266911999999989, mid, yes, [t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 5300.0), binding("Cost", 0.025000000000000001), binding("Belief", 0.95368726059749998), binding("Comfort", 0.91266911999999989), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 5300.0, 0.025000000000000001, 0.95368726059749998, 0.91266911999999989, [t, t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 5300.0), binding("Cost", 0.025000000000000001), binding("Belief", 0.95368726059749998), binding("Comfort", 0.91266911999999989), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(kortrijk, mid, none)), binding("Act", fly_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("D2", 3700.0), binding("C2", 0.018000000000000002), binding("B2", 0.96332046525000004), binding("M2", 0.92188799999999993)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(kortrijk, mid, none), fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(6))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(kortrijk, mid, none), state(oostende, mid, yes), [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 3700.0, 0.018000000000000002, 0.96332046525000004, 0.92188799999999993, [t, t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(kortrijk, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 3700.0), binding("Cost", 0.018000000000000002), binding("Belief", 0.96332046525000004), binding("Comfort", 0.92188799999999993), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(kortrijk, mid, yes)), binding("Act", get_zone_permit_kortrijk), binding("D1", 300.0), binding("C1", 0.001), binding("B1", 0.999), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("D2", 3400.0), binding("C2", 0.017000000000000001), binding("B2", 0.96428475000000002), binding("M2", 0.92188799999999993)]),
                uses([
                  proof(
                    goal(step(state(kortrijk, mid, none), state(kortrijk, mid, yes), get_zone_permit_kortrijk, 300.0, 0.001, 0.999, 1.0)), by(fact("drone-corridor-planner.pl", clause(9))),
                    bindings([binding("B", mid)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(kortrijk, mid, yes), state(oostende, mid, yes), [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], 3400.0, 0.017000000000000001, 0.96428475000000002, 0.92188799999999993, [t, t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(kortrijk, mid, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 3400.0), binding("Cost", 0.017000000000000001), binding("Belief", 0.96428475000000002), binding("Comfort", 0.92188799999999993), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, low, yes)), binding("Act", fly_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t]), binding("RestActions", [quick_charge_brugge, public_coastline_brugge_oostende]), binding("D2", 1800.0), binding("C2", 0.01), binding("B2", 0.97402500000000003), binding("M2", 0.93119999999999992)]),
                    uses([
                      proof(
                        goal(step(state(kortrijk, mid, yes), state(brugge, low, yes), fly_kortrijk_brugge, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(7))),
                        bindings([binding("P", yes)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(brugge, low, yes), state(oostende, mid, yes), [quick_charge_brugge, public_coastline_brugge_oostende], 1800.0, 0.01, 0.97402500000000003, 0.93119999999999992, [t, t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                        bindings([binding("From", state(brugge, low, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [quick_charge_brugge, public_coastline_brugge_oostende]), binding("Duration", 1800.0), binding("Cost", 0.01), binding("Belief", 0.97402500000000003), binding("Comfort", 0.93119999999999992), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t]), binding("Mid", state(brugge, full, yes)), binding("Act", quick_charge_brugge), binding("D1", 600.0), binding("C1", 0.004), binding("B1", 0.999), binding("M1", 0.97), binding("FuelMid", [t, t, t]), binding("RestActions", [public_coastline_brugge_oostende]), binding("D2", 1200.0), binding("C2", 0.006), binding("B2", 0.975), binding("M2", 0.96)]),
                        uses([
                          proof(
                            goal(step(state(brugge, low, yes), state(brugge, full, yes), quick_charge_brugge, 600.0, 0.004, 0.999, 0.97)), by(fact("drone-corridor-planner.pl", clause(11))),
                            bindings([binding("P", yes)])
                          ),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2))),
                          proof(
                            goal(path(state(brugge, full, yes), state(oostende, mid, yes), [public_coastline_brugge_oostende], 1200.0, 0.006, 0.975, 0.96, [t, t, t], [t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                            bindings([binding("From", state(brugge, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", public_coastline_brugge_oostende), binding("Duration", 1200.0), binding("Cost", 0.006), binding("Belief", 0.975), binding("Comfort", 0.96), binding("FuelIn", [t, t, t]), binding("FuelOut", [t, t])]),
                            uses([
                              proof(
                                goal(step(state(brugge, full, yes), state(oostende, mid, yes), public_coastline_brugge_oostende, 1200.0, 0.006, 0.975, 0.96)), by(fact("drone-corridor-planner.pl", clause(16))),
                                bindings([binding("P", yes)])
                              ),
                              proof(goal(rest([t, t, t], [t, t])), by(builtin(rest, 2)))
                            ])
                          ),
                          proof(goal(append([quick_charge_brugge], [public_coastline_brugge_oostende], [quick_charge_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(600.0, 1200.0, 1800.0)), by(builtin(add, 3))),
                          proof(goal(add(0.004, 0.006, 0.01)), by(builtin(add, 3))),
                          proof(goal(mul(0.999, 0.975, 0.97402500000000003)), by(builtin(mul, 3))),
                          proof(goal(mul(0.97, 0.96, 0.93119999999999992)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([fly_kortrijk_brugge], [quick_charge_brugge, public_coastline_brugge_oostende], [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 1800.0, 3400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.01, 0.017000000000000001)), by(builtin(add, 3))),
                      proof(goal(mul(0.99, 0.97402500000000003, 0.96428475000000002)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.93119999999999992, 0.92188799999999993)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([get_zone_permit_kortrijk], [fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(300.0, 3400.0, 3700.0)), by(builtin(add, 3))),
                  proof(goal(add(0.001, 0.017000000000000001, 0.018000000000000002)), by(builtin(add, 3))),
                  proof(goal(mul(0.999, 0.96428475000000002, 0.96332046525000004)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 0.92188799999999993, 0.92188799999999993)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_kortrijk], [get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende], [fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge, quick_charge_brugge, public_coastline_brugge_oostende])), by(builtin(append, 3))),
              proof(goal(add(1600.0, 3700.0, 5300.0)), by(builtin(add, 3))),
              proof(goal(add(0.007, 0.018000000000000002, 0.025000000000000001)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.96332046525000004, 0.95368726059749998)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.92188799999999993, 0.91266911999999989)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.95368726059749998, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.025000000000000001, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.02, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.02, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.02, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 3500.0), binding("Cost", 0.02), binding("Belief", 0.94356004544999994), binding("Comfort", 0.86526000000000003), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.02, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 3500.0), binding("Cost", 0.02), binding("Belief", 0.94356004544999994), binding("Comfort", 0.86526000000000003), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.02, 0.94356004544999994, 0.86526000000000003, [t, t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 3500.0), binding("Cost", 0.02), binding("Belief", 0.94356004544999994), binding("Comfort", 0.86526000000000003), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(kortrijk, mid, none)), binding("Act", fly_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende]), binding("D2", 1900.0), binding("C2", 0.013000000000000001), binding("B2", 0.95309095499999996), binding("M2", 0.874)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(kortrijk, mid, none), fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(6))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(kortrijk, mid, none), state(oostende, mid, yes), [get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], 1900.0, 0.013000000000000001, 0.95309095499999996, 0.874, [t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(kortrijk, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 1900.0), binding("Cost", 0.013000000000000001), binding("Belief", 0.95309095499999996), binding("Comfort", 0.874), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(kortrijk, mid, yes)), binding("Act", get_zone_permit_kortrijk), binding("D1", 300.0), binding("C1", 0.001), binding("B1", 0.999), binding("M1", 1.0), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [emergency_charge_kortrijk, direct_corridor_kortrijk_oostende]), binding("D2", 1600.0), binding("C2", 0.012), binding("B2", 0.95404499999999992), binding("M2", 0.874)]),
                uses([
                  proof(
                    goal(step(state(kortrijk, mid, none), state(kortrijk, mid, yes), get_zone_permit_kortrijk, 300.0, 0.001, 0.999, 1.0)), by(fact("drone-corridor-planner.pl", clause(9))),
                    bindings([binding("B", mid)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(kortrijk, mid, yes), state(oostende, mid, yes), [emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], 1600.0, 0.012, 0.95404499999999992, 0.874, [t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(kortrijk, mid, yes)), binding("To", state(oostende, mid, yes)), binding("Actions", [emergency_charge_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 1600.0), binding("Cost", 0.012), binding("Belief", 0.95404499999999992), binding("Comfort", 0.874), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(kortrijk, full, yes)), binding("Act", emergency_charge_kortrijk), binding("D1", 500.0), binding("C1", 0.003), binding("B1", 0.999), binding("M1", 0.95), binding("FuelMid", [t, t, t, t]), binding("RestActions", [direct_corridor_kortrijk_oostende]), binding("D2", 1100.0), binding("C2", 0.009), binding("B2", 0.955), binding("M2", 0.92)]),
                    uses([
                      proof(
                        goal(step(state(kortrijk, mid, yes), state(kortrijk, full, yes), emergency_charge_kortrijk, 500.0, 0.003, 0.999, 0.95)), by(fact("drone-corridor-planner.pl", clause(13))),
                        bindings([binding("P", yes)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(kortrijk, full, yes), state(oostende, mid, yes), [direct_corridor_kortrijk_oostende], 1100.0, 0.009, 0.955, 0.92, [t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                        bindings([binding("From", state(kortrijk, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", direct_corridor_kortrijk_oostende), binding("Duration", 1100.0), binding("Cost", 0.009), binding("Belief", 0.955), binding("Comfort", 0.92), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t, t])]),
                        uses([
                          proof(goal(step(state(kortrijk, full, yes), state(oostende, mid, yes), direct_corridor_kortrijk_oostende, 1100.0, 0.009, 0.955, 0.92)), by(fact("drone-corridor-planner.pl", clause(17)))),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2)))
                        ])
                      ),
                      proof(goal(append([emergency_charge_kortrijk], [direct_corridor_kortrijk_oostende], [emergency_charge_kortrijk, direct_corridor_kortrijk_oostende])), by(builtin(append, 3))),
                      proof(goal(add(500.0, 1100.0, 1600.0)), by(builtin(add, 3))),
                      proof(goal(add(0.003, 0.009, 0.012)), by(builtin(add, 3))),
                      proof(goal(mul(0.999, 0.955, 0.95404499999999992)), by(builtin(mul, 3))),
                      proof(goal(mul(0.95, 0.92, 0.874)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([get_zone_permit_kortrijk], [emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], [get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende])), by(builtin(append, 3))),
                  proof(goal(add(300.0, 1600.0, 1900.0)), by(builtin(add, 3))),
                  proof(goal(add(0.001, 0.012, 0.013000000000000001)), by(builtin(add, 3))),
                  proof(goal(mul(0.999, 0.95404499999999992, 0.95309095499999996)), by(builtin(mul, 3))),
                  proof(goal(mul(1.0, 0.874, 0.874)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_kortrijk], [get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende], [fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk, direct_corridor_kortrijk_oostende])), by(builtin(append, 3))),
              proof(goal(add(1600.0, 1900.0, 3500.0)), by(builtin(add, 3))),
              proof(goal(add(0.007, 0.013000000000000001, 0.02)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.95309095499999996, 0.94356004544999994)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.874, 0.86526000000000003)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94356004544999994, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.02, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

gps_plan(d1, plan([fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.019999999999999997, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t])).
why(
  gps_plan(d1, plan([fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.019999999999999997, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t])),
  proof(
    goal(gps_plan(d1, plan([fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.019999999999999997, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t]))), by(rule("drone-corridor-planner.pl", clause(21))),
    bindings([binding("Actions", [fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 3500.0), binding("Cost", 0.019999999999999997), binding("Belief", 0.94356004544999994), binding("Comfort", 0.86526000000000003), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t])]),
    uses([
      proof(
        goal(surviving_plan([fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.019999999999999997, 0.94356004544999994, 0.86526000000000003, mid, yes, [t, t, t])), by(rule("drone-corridor-planner.pl", clause(20))),
        bindings([binding("Actions", [fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 3500.0), binding("Cost", 0.019999999999999997), binding("Belief", 0.94356004544999994), binding("Comfort", 0.86526000000000003), binding("Battery", mid), binding("Permit", yes), binding("FuelLeft", [t, t, t]), binding("Fuel", [t, t, t, t, t, t, t])]),
        uses([
          proof(goal(fuel(fuel7, [t, t, t, t, t, t, t])), by(fact("drone-corridor-planner.pl", clause(3)))),
          proof(
            goal(path(state(gent, full, none), state(oostende, mid, yes), [fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], 3500.0, 0.019999999999999997, 0.94356004544999994, 0.86526000000000003, [t, t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
            bindings([binding("From", state(gent, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 3500.0), binding("Cost", 0.019999999999999997), binding("Belief", 0.94356004544999994), binding("Comfort", 0.86526000000000003), binding("FuelIn", [t, t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(kortrijk, mid, none)), binding("Act", fly_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.99), binding("M1", 0.99), binding("FuelMid", [t, t, t, t, t, t]), binding("RestActions", [emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende]), binding("D2", 1900.0), binding("C2", 0.012999999999999998), binding("B2", 0.95309095499999996), binding("M2", 0.874)]),
            uses([
              proof(
                goal(step(state(gent, full, none), state(kortrijk, mid, none), fly_gent_kortrijk, 1600.0, 0.007, 0.99, 0.99)), by(fact("drone-corridor-planner.pl", clause(6))),
                bindings([binding("P", none)])
              ),
              proof(goal(rest([t, t, t, t, t, t, t], [t, t, t, t, t, t])), by(builtin(rest, 2))),
              proof(
                goal(path(state(kortrijk, mid, none), state(oostende, mid, yes), [emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], 1900.0, 0.012999999999999998, 0.95309095499999996, 0.874, [t, t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                bindings([binding("From", state(kortrijk, mid, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 1900.0), binding("Cost", 0.012999999999999998), binding("Belief", 0.95309095499999996), binding("Comfort", 0.874), binding("FuelIn", [t, t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(kortrijk, full, none)), binding("Act", emergency_charge_kortrijk), binding("D1", 500.0), binding("C1", 0.003), binding("B1", 0.999), binding("M1", 0.95), binding("FuelMid", [t, t, t, t, t]), binding("RestActions", [get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende]), binding("D2", 1400.0), binding("C2", 0.0099999999999999985), binding("B2", 0.95404499999999992), binding("M2", 0.92000000000000004)]),
                uses([
                  proof(
                    goal(step(state(kortrijk, mid, none), state(kortrijk, full, none), emergency_charge_kortrijk, 500.0, 0.003, 0.999, 0.95)), by(fact("drone-corridor-planner.pl", clause(13))),
                    bindings([binding("P", none)])
                  ),
                  proof(goal(rest([t, t, t, t, t, t], [t, t, t, t, t])), by(builtin(rest, 2))),
                  proof(
                    goal(path(state(kortrijk, full, none), state(oostende, mid, yes), [get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], 1400.0, 0.0099999999999999985, 0.95404499999999992, 0.92000000000000004, [t, t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(19))),
                    bindings([binding("From", state(kortrijk, full, none)), binding("To", state(oostende, mid, yes)), binding("Actions", [get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende]), binding("Duration", 1400.0), binding("Cost", 0.0099999999999999985), binding("Belief", 0.95404499999999992), binding("Comfort", 0.92000000000000004), binding("FuelIn", [t, t, t, t, t]), binding("FuelOut", [t, t, t]), binding("Mid", state(kortrijk, full, yes)), binding("Act", get_zone_permit_kortrijk), binding("D1", 300.0), binding("C1", 0.001), binding("B1", 0.999), binding("M1", 1.0), binding("FuelMid", [t, t, t, t]), binding("RestActions", [direct_corridor_kortrijk_oostende]), binding("D2", 1100.0), binding("C2", 0.009), binding("B2", 0.955), binding("M2", 0.92)]),
                    uses([
                      proof(
                        goal(step(state(kortrijk, full, none), state(kortrijk, full, yes), get_zone_permit_kortrijk, 300.0, 0.001, 0.999, 1.0)), by(fact("drone-corridor-planner.pl", clause(9))),
                        bindings([binding("B", full)])
                      ),
                      proof(goal(rest([t, t, t, t, t], [t, t, t, t])), by(builtin(rest, 2))),
                      proof(
                        goal(path(state(kortrijk, full, yes), state(oostende, mid, yes), [direct_corridor_kortrijk_oostende], 1100.0, 0.009, 0.955, 0.92, [t, t, t, t], [t, t, t])), by(rule("drone-corridor-planner.pl", clause(18))),
                        bindings([binding("From", state(kortrijk, full, yes)), binding("To", state(oostende, mid, yes)), binding("Act", direct_corridor_kortrijk_oostende), binding("Duration", 1100.0), binding("Cost", 0.009), binding("Belief", 0.955), binding("Comfort", 0.92), binding("FuelIn", [t, t, t, t]), binding("FuelOut", [t, t, t])]),
                        uses([
                          proof(goal(step(state(kortrijk, full, yes), state(oostende, mid, yes), direct_corridor_kortrijk_oostende, 1100.0, 0.009, 0.955, 0.92)), by(fact("drone-corridor-planner.pl", clause(17)))),
                          proof(goal(rest([t, t, t, t], [t, t, t])), by(builtin(rest, 2)))
                        ])
                      ),
                      proof(goal(append([get_zone_permit_kortrijk], [direct_corridor_kortrijk_oostende], [get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende])), by(builtin(append, 3))),
                      proof(goal(add(300.0, 1100.0, 1400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.001, 0.009, 0.0099999999999999985)), by(builtin(add, 3))),
                      proof(goal(mul(0.999, 0.955, 0.95404499999999992)), by(builtin(mul, 3))),
                      proof(goal(mul(1.0, 0.92, 0.92000000000000004)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([emergency_charge_kortrijk], [get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], [emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende])), by(builtin(append, 3))),
                  proof(goal(add(500.0, 1400.0, 1900.0)), by(builtin(add, 3))),
                  proof(goal(add(0.003, 0.0099999999999999985, 0.012999999999999998)), by(builtin(add, 3))),
                  proof(goal(mul(0.999, 0.95404499999999992, 0.95309095499999996)), by(builtin(mul, 3))),
                  proof(goal(mul(0.95, 0.92000000000000004, 0.874)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(append([fly_gent_kortrijk], [emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende], [fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk, direct_corridor_kortrijk_oostende])), by(builtin(append, 3))),
              proof(goal(add(1600.0, 1900.0, 3500.0)), by(builtin(add, 3))),
              proof(goal(add(0.007, 0.012999999999999998, 0.019999999999999997)), by(builtin(add, 3))),
              proof(goal(mul(0.99, 0.95309095499999996, 0.94356004544999994)), by(builtin(mul, 3))),
              proof(goal(mul(0.99, 0.874, 0.86526000000000003)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(gt(0.94356004544999994, 0.94)), by(builtin(gt, 2))),
          proof(goal(lt(0.019999999999999997, 0.03)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

