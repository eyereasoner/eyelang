outcome(decision, "Take the direct route via Brugge.").
why(
  outcome(decision, "Take the direct route via Brugge."),
  proof(
    goal(outcome(decision, "Take the direct route via Brugge.")), by(rule("gps.pl", clause(33))),
    bindings([binding("Outcome", "Take the direct route via Brugge."), binding("Route", routeDirect)]),
    uses([
      proof(
        goal(recommended_route(routeDirect)), by(rule("gps.pl", clause(25))),
        bindings([binding("DirectDuration", 2400.0), binding("DirectCost", 0.01), binding("DirectBelief", 0.94079999999999997), binding("DirectComfort", 0.98999999999999999), binding("ViaDuration", 4100.0), binding("ViaCost", 0.017999999999999999), binding("ViaBelief", 0.90316799999999997), binding("ViaComfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(2400.0, 4100.0)), by(builtin(lt, 2))),
          proof(goal(lt(0.01, 0.017999999999999999)), by(builtin(lt, 2))),
          proof(goal(gt(0.94079999999999997, 0.90316799999999997)), by(builtin(gt, 2))),
          proof(goal(gt(0.98999999999999999, 0.98009999999999997)), by(builtin(gt, 2)))
        ])
      ),
      proof(goal(outcome(routeDirect, "Take the direct route via Brugge.")), by(fact("gps.pl", clause(26))))
    ])
  )
).

recommendedRoute(decision, routeDirect).
why(
  recommendedRoute(decision, routeDirect),
  proof(
    goal(recommendedRoute(decision, routeDirect)), by(rule("gps.pl", clause(32))),
    bindings([binding("Route", routeDirect)]),
    uses([
      proof(
        goal(recommended_route(routeDirect)), by(rule("gps.pl", clause(25))),
        bindings([binding("DirectDuration", 2400.0), binding("DirectCost", 0.01), binding("DirectBelief", 0.94079999999999997), binding("DirectComfort", 0.98999999999999999), binding("ViaDuration", 4100.0), binding("ViaCost", 0.017999999999999999), binding("ViaBelief", 0.90316799999999997), binding("ViaComfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(2400.0, 4100.0)), by(builtin(lt, 2))),
          proof(goal(lt(0.01, 0.017999999999999999)), by(builtin(lt, 2))),
          proof(goal(gt(0.94079999999999997, 0.90316799999999997)), by(builtin(gt, 2))),
          proof(goal(gt(0.98999999999999999, 0.98009999999999997)), by(builtin(gt, 2)))
        ])
      )
    ])
  )
).

statement(check, c1, true).
why(
  statement(check, c1, true),
  proof(
    goal(statement(check, c1, true)), by(rule("gps.pl", clause(34))),
    bindings([binding("Check", c1)]),
    uses([
      proof(
        goal(check(c1, true)), by(rule("gps.pl", clause(27))),
        bindings([binding("__anon0", 2400.0), binding("__anon1", 0.01), binding("__anon2", 0.94079999999999997), binding("__anon3", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(check, c2, true).
why(
  statement(check, c2, true),
  proof(
    goal(statement(check, c2, true)), by(rule("gps.pl", clause(34))),
    bindings([binding("Check", c2)]),
    uses([
      proof(
        goal(check(c2, true)), by(rule("gps.pl", clause(28))),
        bindings([binding("__anon4", 4100.0), binding("__anon5", 0.017999999999999999), binding("__anon6", 0.90316799999999997), binding("__anon7", 0.98009999999999997)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

statement(check, c3, true).
why(
  statement(check, c3, true),
  proof(
    goal(statement(check, c3, true)), by(rule("gps.pl", clause(34))),
    bindings([binding("Check", c3)]),
    uses([
      proof(
        goal(check(c3, true)), by(rule("gps.pl", clause(29))),
        bindings([binding("D1", 2400.0), binding("__anon8", 0.01), binding("__anon9", 0.94079999999999997), binding("__anon10", 0.98999999999999999), binding("D2", 4100.0), binding("__anon11", 0.017999999999999999), binding("__anon12", 0.90316799999999997), binding("__anon13", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(2400.0, 4100.0)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(check, c4, true).
why(
  statement(check, c4, true),
  proof(
    goal(statement(check, c4, true)), by(rule("gps.pl", clause(34))),
    bindings([binding("Check", c4)]),
    uses([
      proof(
        goal(check(c4, true)), by(rule("gps.pl", clause(30))),
        bindings([binding("__anon14", 2400.0), binding("C1", 0.01), binding("__anon15", 0.94079999999999997), binding("__anon16", 0.98999999999999999), binding("__anon17", 4100.0), binding("C2", 0.017999999999999999), binding("__anon18", 0.90316799999999997), binding("__anon19", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(0.01, 0.017999999999999999)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

statement(check, c5, true).
why(
  statement(check, c5, true),
  proof(
    goal(statement(check, c5, true)), by(rule("gps.pl", clause(34))),
    bindings([binding("Check", c5)]),
    uses([
      proof(
        goal(check(c5, true)), by(rule("gps.pl", clause(31))),
        bindings([binding("__anon20", 2400.0), binding("__anon21", 0.01), binding("B1", 0.94079999999999997), binding("F1", 0.98999999999999999), binding("__anon22", 4100.0), binding("__anon23", 0.017999999999999999), binding("B2", 0.90316799999999997), binding("F2", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(gt(0.94079999999999997, 0.90316799999999997)), by(builtin(gt, 2))),
          proof(goal(gt(0.98999999999999999, 0.98009999999999997)), by(builtin(gt, 2)))
        ])
      )
    ])
  )
).

label(routeDirect, "Gent -> Brugge -> Oostende").
why(
  label(routeDirect, "Gent -> Brugge -> Oostende"),
  proof(
    goal(label(routeDirect, "Gent -> Brugge -> Oostende")), by(rule("gps.pl", clause(37))),
    bindings([binding("Route", routeDirect), binding("Label", "Gent -> Brugge -> Oostende"), binding("_Duration", 2400.0), binding("_Cost", 0.01), binding("_Belief", 0.94079999999999997), binding("_Comfort", 0.98999999999999999)]),
    uses([
      proof(
        goal(case_statement(routeDirect, label, "Gent -> Brugge -> Oostende")), by(rule("gps.pl", clause(16))),
        bindings([binding("S", routeDirect), binding("P", label), binding("O", "Gent -> Brugge -> Oostende"), binding("Formula", (location(i1, gent), text(question, "Which route should we take from Gent to Oostende?"), label(routeDirect, "Gent -> Brugge -> Oostende"), label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende")))]),
        uses([
          proof(goal(case_graph(caseGraph, (location(i1, gent), text(question, "Which route should we take from Gent to Oostende?"), label(routeDirect, "Gent -> Brugge -> Oostende"), label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende")))), by(fact("gps.pl", clause(14)))),
          proof(goal(formula_binary((location(i1, gent), text(question, "Which route should we take from Gent to Oostende?"), label(routeDirect, "Gent -> Brugge -> Oostende"), label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende")), routeDirect, label, "Gent -> Brugge -> Oostende")), by(builtin(formula_binary, 4)))
        ])
      ),
      proof(
        goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
        bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende").
why(
  label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende"),
  proof(
    goal(label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende")), by(rule("gps.pl", clause(37))),
    bindings([binding("Route", routeViaKortrijk), binding("Label", "Gent -> Kortrijk -> Brugge -> Oostende"), binding("_Duration", 4100.0), binding("_Cost", 0.017999999999999999), binding("_Belief", 0.90316799999999997), binding("_Comfort", 0.98009999999999997)]),
    uses([
      proof(
        goal(case_statement(routeViaKortrijk, label, "Gent -> Kortrijk -> Brugge -> Oostende")), by(rule("gps.pl", clause(16))),
        bindings([binding("S", routeViaKortrijk), binding("P", label), binding("O", "Gent -> Kortrijk -> Brugge -> Oostende"), binding("Formula", (location(i1, gent), text(question, "Which route should we take from Gent to Oostende?"), label(routeDirect, "Gent -> Brugge -> Oostende"), label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende")))]),
        uses([
          proof(goal(case_graph(caseGraph, (location(i1, gent), text(question, "Which route should we take from Gent to Oostende?"), label(routeDirect, "Gent -> Brugge -> Oostende"), label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende")))), by(fact("gps.pl", clause(14)))),
          proof(goal(formula_binary((location(i1, gent), text(question, "Which route should we take from Gent to Oostende?"), label(routeDirect, "Gent -> Brugge -> Oostende"), label(routeViaKortrijk, "Gent -> Kortrijk -> Brugge -> Oostende")), routeViaKortrijk, label, "Gent -> Kortrijk -> Brugge -> Oostende")), by(builtin(formula_binary, 4)))
        ])
      ),
      proof(
        goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
        bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

actionSequence(routeDirect, [drive_gent_brugge, drive_brugge_oostende]).
why(
  actionSequence(routeDirect, [drive_gent_brugge, drive_brugge_oostende]),
  proof(
    goal(actionSequence(routeDirect, [drive_gent_brugge, drive_brugge_oostende])), by(rule("gps.pl", clause(38))),
    bindings([binding("Route", routeDirect), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("_Duration", 2400.0), binding("_Cost", 0.01), binding("_Belief", 0.94079999999999997), binding("_Comfort", 0.98999999999999999)]),
    uses([
      proof(goal(route_actions(routeDirect, [drive_gent_brugge, drive_brugge_oostende])), by(fact("gps.pl", clause(35)))),
      proof(
        goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
        bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

actionSequence(routeViaKortrijk, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]).
why(
  actionSequence(routeViaKortrijk, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]),
  proof(
    goal(actionSequence(routeViaKortrijk, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(rule("gps.pl", clause(38))),
    bindings([binding("Route", routeViaKortrijk), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("_Duration", 4100.0), binding("_Cost", 0.017999999999999999), binding("_Belief", 0.90316799999999997), binding("_Comfort", 0.98009999999999997)]),
    uses([
      proof(goal(route_actions(routeViaKortrijk, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(fact("gps.pl", clause(36)))),
      proof(
        goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
        bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

durationSeconds(routeDirect, 2400.0).
why(
  durationSeconds(routeDirect, 2400.0),
  proof(
    goal(durationSeconds(routeDirect, 2400.0)), by(rule("gps.pl", clause(39))),
    bindings([binding("Route", routeDirect), binding("Duration", 2400.0), binding("_Cost", 0.01), binding("_Belief", 0.94079999999999997), binding("_Comfort", 0.98999999999999999)]),
    uses([
      proof(
        goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
        bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

durationSeconds(routeViaKortrijk, 4100.0).
why(
  durationSeconds(routeViaKortrijk, 4100.0),
  proof(
    goal(durationSeconds(routeViaKortrijk, 4100.0)), by(rule("gps.pl", clause(39))),
    bindings([binding("Route", routeViaKortrijk), binding("Duration", 4100.0), binding("_Cost", 0.017999999999999999), binding("_Belief", 0.90316799999999997), binding("_Comfort", 0.98009999999999997)]),
    uses([
      proof(
        goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
        bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

cost(routeDirect, 0.01).
why(
  cost(routeDirect, 0.01),
  proof(
    goal(cost(routeDirect, 0.01)), by(rule("gps.pl", clause(40))),
    bindings([binding("Route", routeDirect), binding("Cost", 0.01), binding("_Duration", 2400.0), binding("_Belief", 0.94079999999999997), binding("_Comfort", 0.98999999999999999)]),
    uses([
      proof(
        goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
        bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

cost(routeViaKortrijk, 0.017999999999999999).
why(
  cost(routeViaKortrijk, 0.017999999999999999),
  proof(
    goal(cost(routeViaKortrijk, 0.017999999999999999)), by(rule("gps.pl", clause(40))),
    bindings([binding("Route", routeViaKortrijk), binding("Cost", 0.017999999999999999), binding("_Duration", 4100.0), binding("_Belief", 0.90316799999999997), binding("_Comfort", 0.98009999999999997)]),
    uses([
      proof(
        goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
        bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

belief(routeDirect, 0.94079999999999997).
why(
  belief(routeDirect, 0.94079999999999997),
  proof(
    goal(belief(routeDirect, 0.94079999999999997)), by(rule("gps.pl", clause(41))),
    bindings([binding("Route", routeDirect), binding("Belief", 0.94079999999999997), binding("_Duration", 2400.0), binding("_Cost", 0.01), binding("_Comfort", 0.98999999999999999)]),
    uses([
      proof(
        goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
        bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

belief(routeViaKortrijk, 0.90316799999999997).
why(
  belief(routeViaKortrijk, 0.90316799999999997),
  proof(
    goal(belief(routeViaKortrijk, 0.90316799999999997)), by(rule("gps.pl", clause(41))),
    bindings([binding("Route", routeViaKortrijk), binding("Belief", 0.90316799999999997), binding("_Duration", 4100.0), binding("_Cost", 0.017999999999999999), binding("_Comfort", 0.98009999999999997)]),
    uses([
      proof(
        goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
        bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

comfort(routeDirect, 0.98999999999999999).
why(
  comfort(routeDirect, 0.98999999999999999),
  proof(
    goal(comfort(routeDirect, 0.98999999999999999)), by(rule("gps.pl", clause(42))),
    bindings([binding("Route", routeDirect), binding("Comfort", 0.98999999999999999), binding("_Duration", 2400.0), binding("_Cost", 0.01), binding("_Belief", 0.94079999999999997)]),
    uses([
      proof(
        goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
        bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

comfort(routeViaKortrijk, 0.98009999999999997).
why(
  comfort(routeViaKortrijk, 0.98009999999999997),
  proof(
    goal(comfort(routeViaKortrijk, 0.98009999999999997)), by(rule("gps.pl", clause(42))),
    bindings([binding("Route", routeViaKortrijk), binding("Comfort", 0.98009999999999997), binding("_Duration", 4100.0), binding("_Cost", 0.017999999999999999), binding("_Belief", 0.90316799999999997)]),
    uses([
      proof(
        goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
        bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                  proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

selectedRoute(report, route(routeDirect, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)).
why(
  selectedRoute(report, route(routeDirect, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)),
  proof(
    goal(selectedRoute(report, route(routeDirect, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999))), by(rule("gps.pl", clause(43))),
    bindings([binding("Route", routeDirect), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
    uses([
      proof(
        goal(recommended_route(routeDirect)), by(rule("gps.pl", clause(25))),
        bindings([binding("DirectDuration", 2400.0), binding("DirectCost", 0.01), binding("DirectBelief", 0.94079999999999997), binding("DirectComfort", 0.98999999999999999), binding("ViaDuration", 4100.0), binding("ViaCost", 0.017999999999999999), binding("ViaBelief", 0.90316799999999997), binding("ViaComfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(2400.0, 4100.0)), by(builtin(lt, 2))),
          proof(goal(lt(0.01, 0.017999999999999999)), by(builtin(lt, 2))),
          proof(goal(gt(0.94079999999999997, 0.90316799999999997)), by(builtin(gt, 2))),
          proof(goal(gt(0.98999999999999999, 0.98009999999999997)), by(builtin(gt, 2)))
        ])
      ),
      proof(goal(route_actions(routeDirect, [drive_gent_brugge, drive_brugge_oostende])), by(fact("gps.pl", clause(35)))),
      proof(
        goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
        bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
        uses([
          proof(
            goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
            bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
            uses([
              proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
              proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
              proof(
                goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                uses([
                  proof(
                    goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                    uses([
                      proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                      proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                    bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                  proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                  proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                  proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                  proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

comparison(report, dominates(routeDirect, routeViaKortrijk)).
why(
  comparison(report, dominates(routeDirect, routeViaKortrijk)),
  proof(
    goal(comparison(report, dominates(routeDirect, routeViaKortrijk))), by(rule("gps.pl", clause(44))),
    uses([
      proof(
        goal(recommended_route(routeDirect)), by(rule("gps.pl", clause(25))),
        bindings([binding("DirectDuration", 2400.0), binding("DirectCost", 0.01), binding("DirectBelief", 0.94079999999999997), binding("DirectComfort", 0.98999999999999999), binding("ViaDuration", 4100.0), binding("ViaCost", 0.017999999999999999), binding("ViaBelief", 0.90316799999999997), binding("ViaComfort", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(2400.0, 4100.0)), by(builtin(lt, 2))),
          proof(goal(lt(0.01, 0.017999999999999999)), by(builtin(lt, 2))),
          proof(goal(gt(0.94079999999999997, 0.90316799999999997)), by(builtin(gt, 2))),
          proof(goal(gt(0.98999999999999999, 0.98009999999999997)), by(builtin(gt, 2)))
        ])
      ),
      proof(
        goal(check(c3, true)), by(rule("gps.pl", clause(29))),
        bindings([binding("D1", 2400.0), binding("__anon8", 0.01), binding("__anon9", 0.94079999999999997), binding("__anon10", 0.98999999999999999), binding("D2", 4100.0), binding("__anon11", 0.017999999999999999), binding("__anon12", 0.90316799999999997), binding("__anon13", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(2400.0, 4100.0)), by(builtin(lt, 2)))
        ])
      ),
      proof(
        goal(check(c4, true)), by(rule("gps.pl", clause(30))),
        bindings([binding("__anon14", 2400.0), binding("C1", 0.01), binding("__anon15", 0.94079999999999997), binding("__anon16", 0.98999999999999999), binding("__anon17", 4100.0), binding("C2", 0.017999999999999999), binding("__anon18", 0.90316799999999997), binding("__anon19", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(lt(0.01, 0.017999999999999999)), by(builtin(lt, 2)))
        ])
      ),
      proof(
        goal(check(c5, true)), by(rule("gps.pl", clause(31))),
        bindings([binding("__anon20", 2400.0), binding("__anon21", 0.01), binding("B1", 0.94079999999999997), binding("F1", 0.98999999999999999), binding("__anon22", 4100.0), binding("__anon23", 0.017999999999999999), binding("B2", 0.90316799999999997), binding("F2", 0.98009999999999997)]),
        uses([
          proof(
            goal(route_metrics(routeDirect, 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(23))),
            bindings([binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_brugge, drive_brugge_oostende], 2400.0, 0.01, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_brugge, drive_brugge_oostende]), binding("Duration", 2400.0), binding("Cost", 0.01), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("D1", 1500.0), binding("C1", 0.006), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, brugge)), binding("Action", drive_gent_brugge), binding("Duration", 1500.0), binding("Cost", 0.006), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                        bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                            ])
                          )
                        ])
                      ),
                      proof(goal(append([drive_gent_brugge], [drive_brugge_oostende], [drive_gent_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1500.0, 900.0, 2400.0)), by(builtin(add, 3))),
                      proof(goal(add(0.006, 0.004, 0.01)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(route_metrics(routeViaKortrijk, 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(24))),
            bindings([binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997)]),
            uses([
              proof(
                goal(traveller_path(i1, [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(22))),
                bindings([binding("Traveller", i1), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("From", location(i1, gent)), binding("To", location(i1, oostende))]),
                uses([
                  proof(goal(traveller_start(i1, location(i1, gent))), by(fact("gps.pl", clause(20)))),
                  proof(goal(traveller_goal(i1, location(i1, oostende))), by(fact("gps.pl", clause(21)))),
                  proof(
                    goal(path(location(i1, gent), location(i1, oostende), [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende], 4100.0, 0.017999999999999999, 0.90316799999999997, 0.98009999999999997)), by(rule("gps.pl", clause(19))),
                    bindings([binding("From", location(i1, gent)), binding("To", location(i1, oostende)), binding("Actions", [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 4100.0), binding("Cost", 0.017999999999999999), binding("Belief", 0.90316799999999997), binding("Comfort", 0.98009999999999997), binding("Mid", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("D2", 2500.0), binding("C2", 0.010999999999999999), binding("B2", 0.94079999999999997), binding("F2", 0.98999999999999999)]),
                    uses([
                      proof(
                        goal(map_description(location(i1, gent), location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                        bindings([binding("From", location(i1, gent)), binding("To", location(i1, kortrijk)), binding("Action", drive_gent_kortrijk), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                        uses([
                          proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                          proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(path(location(i1, kortrijk), location(i1, oostende), [drive_kortrijk_brugge, drive_brugge_oostende], 2500.0, 0.010999999999999999, 0.94079999999999997, 0.98999999999999999)), by(rule("gps.pl", clause(19))),
                        bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, oostende)), binding("Actions", [drive_kortrijk_brugge, drive_brugge_oostende]), binding("Duration", 2500.0), binding("Cost", 0.010999999999999999), binding("Belief", 0.94079999999999997), binding("Comfort", 0.98999999999999999), binding("Mid", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("D1", 1600.0), binding("C1", 0.007), binding("B1", 0.96), binding("F1", 0.99), binding("RestActions", [drive_brugge_oostende]), binding("D2", 900.0), binding("C2", 0.004), binding("B2", 0.98), binding("F2", 1.0)]),
                        uses([
                          proof(
                            goal(map_description(location(i1, kortrijk), location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), by(rule("gps.pl", clause(17))),
                            bindings([binding("From", location(i1, kortrijk)), binding("To", location(i1, brugge)), binding("Action", drive_kortrijk_brugge), binding("Duration", 1600.0), binding("Cost", 0.007), binding("Belief", 0.96), binding("Comfort", 0.99), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                            uses([
                              proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                              proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(path(location(i1, brugge), location(i1, oostende), [drive_brugge_oostende], 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(18))),
                            bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0)]),
                            uses([
                              proof(
                                goal(map_description(location(i1, brugge), location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0)), by(rule("gps.pl", clause(17))),
                                bindings([binding("From", location(i1, brugge)), binding("To", location(i1, oostende)), binding("Action", drive_brugge_oostende), binding("Duration", 900.0), binding("Cost", 0.004), binding("Belief", 0.98), binding("Comfort", 1.0), binding("Formula", (gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))]),
                                uses([
                                  proof(goal(map_graph(mapBE, (gps_description(mapBE, description(location(S, gent), true, location(S, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(S, gent), true, location(S, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, kortrijk), true, location(S, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(S, brugge), true, location(S, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))))), by(fact("gps.pl", clause(15)))),
                                  proof(goal(formula_binary((gps_description(mapBE, description(location(i1, gent), true, location(i1, brugge), drive_gent_brugge, 1500.0, 0.006, 0.96, 0.99)), gps_description(mapBE, description(location(i1, gent), true, location(i1, kortrijk), drive_gent_kortrijk, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, kortrijk), true, location(i1, brugge), drive_kortrijk_brugge, 1600.0, 0.007, 0.96, 0.99)), gps_description(mapBE, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), mapBE, gps_description, description(location(i1, brugge), true, location(i1, oostende), drive_brugge_oostende, 900.0, 0.004, 0.98, 1.0))), by(builtin(formula_binary, 4)))
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([drive_kortrijk_brugge], [drive_brugge_oostende], [drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                          proof(goal(add(1600.0, 900.0, 2500.0)), by(builtin(add, 3))),
                          proof(goal(add(0.007, 0.004, 0.010999999999999999)), by(builtin(add, 3))),
                          proof(goal(mul(0.96, 0.98, 0.94079999999999997)), by(builtin(mul, 3))),
                          proof(goal(mul(0.99, 1.0, 0.98999999999999999)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(append([drive_gent_kortrijk], [drive_kortrijk_brugge, drive_brugge_oostende], [drive_gent_kortrijk, drive_kortrijk_brugge, drive_brugge_oostende])), by(builtin(append, 3))),
                      proof(goal(add(1600.0, 2500.0, 4100.0)), by(builtin(add, 3))),
                      proof(goal(add(0.007, 0.010999999999999999, 0.017999999999999999)), by(builtin(add, 3))),
                      proof(goal(mul(0.96, 0.94079999999999997, 0.90316799999999997)), by(builtin(mul, 3))),
                      proof(goal(mul(0.99, 0.98999999999999999, 0.98009999999999997)), by(builtin(mul, 3)))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(gt(0.94079999999999997, 0.90316799999999997)), by(builtin(gt, 2))),
          proof(goal(gt(0.98999999999999999, 0.98009999999999997)), by(builtin(gt, 2)))
        ])
      )
    ])
  )
).

