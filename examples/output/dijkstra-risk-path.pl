route(pathB, [depotA, depotB, labD]).
why(
  route(pathB, [depotA, depotB, labD]),
  proof(
    goal(route(pathB, [depotA, depotB, labD])), by(rule("dijkstra-risk-path.pl", clause(24))),
    bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("_Raw", 8.0), binding("_Risk", 0.5), binding("_Score", 13.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
          proof(
            goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
            uses([
              proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
              proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

route(pathC, [depotA, depotC, labD]).
why(
  route(pathC, [depotA, depotC, labD]),
  proof(
    goal(route(pathC, [depotA, depotC, labD])), by(rule("dijkstra-risk-path.pl", clause(24))),
    bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("_Raw", 9.0), binding("_Risk", 1.2), binding("_Score", 21.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
          proof(
            goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
            uses([
              proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
              proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

route(pathRelay, [depotA, relay, labD]).
why(
  route(pathRelay, [depotA, relay, labD]),
  proof(
    goal(route(pathRelay, [depotA, relay, labD])), by(rule("dijkstra-risk-path.pl", clause(24))),
    bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("_Raw", 10.0), binding("_Risk", 0.40000000000000002), binding("_Score", 14.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
          proof(
            goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
            uses([
              proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
              proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

route(pathDirectC, [depotA, labD]).
why(
  route(pathDirectC, [depotA, labD]),
  proof(
    goal(route(pathDirectC, [depotA, labD])), by(rule("dijkstra-risk-path.pl", clause(24))),
    bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("_Raw", 14.0), binding("_Risk", 0.050000000000000003), binding("_Score", 14.5), binding("_Edges", 1)]),
    uses([
      proof(
        goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
        uses([
          proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
          proof(
            goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
            uses([
              proof(
                goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                bindings([binding("__anon0", labD)])
              ),
              proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
              proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
              proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
            uses([
              proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
              proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

route(pathViaC, [depotA, depotC, depotB, labD]).
why(
  route(pathViaC, [depotA, depotC, depotB, labD]),
  proof(
    goal(route(pathViaC, [depotA, depotC, depotB, labD])), by(rule("dijkstra-risk-path.pl", clause(24))),
    bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("_Raw", 7.5), binding("_Risk", 1.7000000000000002), binding("_Score", 24.5), binding("_Edges", 3)]),
    uses([
      proof(
        goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
        uses([
          proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
          proof(
            goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                  proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
            uses([
              proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
              proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

rawCost(pathB, 8.0).
why(
  rawCost(pathB, 8.0),
  proof(
    goal(rawCost(pathB, 8.0)), by(rule("dijkstra-risk-path.pl", clause(25))),
    bindings([binding("Path", pathB), binding("Raw", 8.0), binding("_Route", [depotA, depotB, labD]), binding("_Risk", 0.5), binding("_Score", 13.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
          proof(
            goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
            uses([
              proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
              proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

rawCost(pathC, 9.0).
why(
  rawCost(pathC, 9.0),
  proof(
    goal(rawCost(pathC, 9.0)), by(rule("dijkstra-risk-path.pl", clause(25))),
    bindings([binding("Path", pathC), binding("Raw", 9.0), binding("_Route", [depotA, depotC, labD]), binding("_Risk", 1.2), binding("_Score", 21.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
          proof(
            goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
            uses([
              proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
              proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

rawCost(pathRelay, 10.0).
why(
  rawCost(pathRelay, 10.0),
  proof(
    goal(rawCost(pathRelay, 10.0)), by(rule("dijkstra-risk-path.pl", clause(25))),
    bindings([binding("Path", pathRelay), binding("Raw", 10.0), binding("_Route", [depotA, relay, labD]), binding("_Risk", 0.40000000000000002), binding("_Score", 14.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
          proof(
            goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
            uses([
              proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
              proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

rawCost(pathDirectC, 14.0).
why(
  rawCost(pathDirectC, 14.0),
  proof(
    goal(rawCost(pathDirectC, 14.0)), by(rule("dijkstra-risk-path.pl", clause(25))),
    bindings([binding("Path", pathDirectC), binding("Raw", 14.0), binding("_Route", [depotA, labD]), binding("_Risk", 0.050000000000000003), binding("_Score", 14.5), binding("_Edges", 1)]),
    uses([
      proof(
        goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
        uses([
          proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
          proof(
            goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
            uses([
              proof(
                goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                bindings([binding("__anon0", labD)])
              ),
              proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
              proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
              proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
            uses([
              proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
              proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

rawCost(pathViaC, 7.5).
why(
  rawCost(pathViaC, 7.5),
  proof(
    goal(rawCost(pathViaC, 7.5)), by(rule("dijkstra-risk-path.pl", clause(25))),
    bindings([binding("Path", pathViaC), binding("Raw", 7.5), binding("_Route", [depotA, depotC, depotB, labD]), binding("_Risk", 1.7000000000000002), binding("_Score", 24.5), binding("_Edges", 3)]),
    uses([
      proof(
        goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
        uses([
          proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
          proof(
            goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                  proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
            uses([
              proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
              proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

riskSum(pathB, 0.5).
why(
  riskSum(pathB, 0.5),
  proof(
    goal(riskSum(pathB, 0.5)), by(rule("dijkstra-risk-path.pl", clause(26))),
    bindings([binding("Path", pathB), binding("Risk", 0.5), binding("_Route", [depotA, depotB, labD]), binding("_Raw", 8.0), binding("_Score", 13.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
          proof(
            goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
            uses([
              proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
              proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

riskSum(pathC, 1.2).
why(
  riskSum(pathC, 1.2),
  proof(
    goal(riskSum(pathC, 1.2)), by(rule("dijkstra-risk-path.pl", clause(26))),
    bindings([binding("Path", pathC), binding("Risk", 1.2), binding("_Route", [depotA, depotC, labD]), binding("_Raw", 9.0), binding("_Score", 21.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
          proof(
            goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
            uses([
              proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
              proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

riskSum(pathRelay, 0.40000000000000002).
why(
  riskSum(pathRelay, 0.40000000000000002),
  proof(
    goal(riskSum(pathRelay, 0.40000000000000002)), by(rule("dijkstra-risk-path.pl", clause(26))),
    bindings([binding("Path", pathRelay), binding("Risk", 0.40000000000000002), binding("_Route", [depotA, relay, labD]), binding("_Raw", 10.0), binding("_Score", 14.0), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
          proof(
            goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
            uses([
              proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
              proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

riskSum(pathDirectC, 0.050000000000000003).
why(
  riskSum(pathDirectC, 0.050000000000000003),
  proof(
    goal(riskSum(pathDirectC, 0.050000000000000003)), by(rule("dijkstra-risk-path.pl", clause(26))),
    bindings([binding("Path", pathDirectC), binding("Risk", 0.050000000000000003), binding("_Route", [depotA, labD]), binding("_Raw", 14.0), binding("_Score", 14.5), binding("_Edges", 1)]),
    uses([
      proof(
        goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
        uses([
          proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
          proof(
            goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
            uses([
              proof(
                goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                bindings([binding("__anon0", labD)])
              ),
              proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
              proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
              proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
            uses([
              proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
              proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

riskSum(pathViaC, 1.7000000000000002).
why(
  riskSum(pathViaC, 1.7000000000000002),
  proof(
    goal(riskSum(pathViaC, 1.7000000000000002)), by(rule("dijkstra-risk-path.pl", clause(26))),
    bindings([binding("Path", pathViaC), binding("Risk", 1.7000000000000002), binding("_Route", [depotA, depotC, depotB, labD]), binding("_Raw", 7.5), binding("_Score", 24.5), binding("_Edges", 3)]),
    uses([
      proof(
        goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
        uses([
          proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
          proof(
            goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                  proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
            uses([
              proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
              proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

score(pathB, 13.0).
why(
  score(pathB, 13.0),
  proof(
    goal(score(pathB, 13.0)), by(rule("dijkstra-risk-path.pl", clause(27))),
    bindings([binding("Path", pathB), binding("Score", 13.0), binding("_Route", [depotA, depotB, labD]), binding("_Raw", 8.0), binding("_Risk", 0.5), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
          proof(
            goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
            uses([
              proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
              proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

score(pathC, 21.0).
why(
  score(pathC, 21.0),
  proof(
    goal(score(pathC, 21.0)), by(rule("dijkstra-risk-path.pl", clause(27))),
    bindings([binding("Path", pathC), binding("Score", 21.0), binding("_Route", [depotA, depotC, labD]), binding("_Raw", 9.0), binding("_Risk", 1.2), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
          proof(
            goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
            uses([
              proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
              proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

score(pathRelay, 14.0).
why(
  score(pathRelay, 14.0),
  proof(
    goal(score(pathRelay, 14.0)), by(rule("dijkstra-risk-path.pl", clause(27))),
    bindings([binding("Path", pathRelay), binding("Score", 14.0), binding("_Route", [depotA, relay, labD]), binding("_Raw", 10.0), binding("_Risk", 0.40000000000000002), binding("_Edges", 2)]),
    uses([
      proof(
        goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
          proof(
            goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
            uses([
              proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
              proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

score(pathDirectC, 14.5).
why(
  score(pathDirectC, 14.5),
  proof(
    goal(score(pathDirectC, 14.5)), by(rule("dijkstra-risk-path.pl", clause(27))),
    bindings([binding("Path", pathDirectC), binding("Score", 14.5), binding("_Route", [depotA, labD]), binding("_Raw", 14.0), binding("_Risk", 0.050000000000000003), binding("_Edges", 1)]),
    uses([
      proof(
        goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
        uses([
          proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
          proof(
            goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
            uses([
              proof(
                goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                bindings([binding("__anon0", labD)])
              ),
              proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
              proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
              proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
            uses([
              proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
              proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

score(pathViaC, 24.5).
why(
  score(pathViaC, 24.5),
  proof(
    goal(score(pathViaC, 24.5)), by(rule("dijkstra-risk-path.pl", clause(27))),
    bindings([binding("Path", pathViaC), binding("Score", 24.5), binding("_Route", [depotA, depotC, depotB, labD]), binding("_Raw", 7.5), binding("_Risk", 1.7000000000000002), binding("_Edges", 3)]),
    uses([
      proof(
        goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
        uses([
          proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
          proof(
            goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                  proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
            uses([
              proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
              proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

edgeCount(pathB, 2).
why(
  edgeCount(pathB, 2),
  proof(
    goal(edgeCount(pathB, 2)), by(rule("dijkstra-risk-path.pl", clause(28))),
    bindings([binding("Path", pathB), binding("Edges", 2), binding("_Route", [depotA, depotB, labD]), binding("_Raw", 8.0), binding("_Risk", 0.5), binding("_Score", 13.0)]),
    uses([
      proof(
        goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
          proof(
            goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
            uses([
              proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
              proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

edgeCount(pathC, 2).
why(
  edgeCount(pathC, 2),
  proof(
    goal(edgeCount(pathC, 2)), by(rule("dijkstra-risk-path.pl", clause(28))),
    bindings([binding("Path", pathC), binding("Edges", 2), binding("_Route", [depotA, depotC, labD]), binding("_Raw", 9.0), binding("_Risk", 1.2), binding("_Score", 21.0)]),
    uses([
      proof(
        goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
          proof(
            goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                  proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
            uses([
              proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
              proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

edgeCount(pathRelay, 2).
why(
  edgeCount(pathRelay, 2),
  proof(
    goal(edgeCount(pathRelay, 2)), by(rule("dijkstra-risk-path.pl", clause(28))),
    bindings([binding("Path", pathRelay), binding("Edges", 2), binding("_Route", [depotA, relay, labD]), binding("_Raw", 10.0), binding("_Risk", 0.40000000000000002), binding("_Score", 14.0)]),
    uses([
      proof(
        goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
        uses([
          proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
          proof(
            goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
            uses([
              proof(
                goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
              proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
            uses([
              proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
              proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

edgeCount(pathDirectC, 1).
why(
  edgeCount(pathDirectC, 1),
  proof(
    goal(edgeCount(pathDirectC, 1)), by(rule("dijkstra-risk-path.pl", clause(28))),
    bindings([binding("Path", pathDirectC), binding("Edges", 1), binding("_Route", [depotA, labD]), binding("_Raw", 14.0), binding("_Risk", 0.050000000000000003), binding("_Score", 14.5)]),
    uses([
      proof(
        goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
        uses([
          proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
          proof(
            goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
            uses([
              proof(
                goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                bindings([binding("__anon0", labD)])
              ),
              proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
              proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
              proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
            uses([
              proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
              proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

edgeCount(pathViaC, 3).
why(
  edgeCount(pathViaC, 3),
  proof(
    goal(edgeCount(pathViaC, 3)), by(rule("dijkstra-risk-path.pl", clause(28))),
    bindings([binding("Path", pathViaC), binding("Edges", 3), binding("_Route", [depotA, depotC, depotB, labD]), binding("_Raw", 7.5), binding("_Risk", 1.7000000000000002), binding("_Score", 24.5)]),
    uses([
      proof(
        goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
        bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
        uses([
          proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
          proof(
            goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
            bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
            uses([
              proof(
                goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                uses([
                  proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                  proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                ])
              ),
              proof(
                goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                  proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
              proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
              proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
            bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
            uses([
              proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
              proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
            ])
          )
        ])
      )
    ])
  )
).

selectedPath(case, pathB).
why(
  selectedPath(case, pathB),
  proof(
    goal(selectedPath(case, pathB)), by(rule("dijkstra-risk-path.pl", clause(29))),
    bindings([binding("Path", pathB)]),
    uses([
      proof(
        goal(best_path(pathB)), by(rule("dijkstra-risk-path.pl", clause(22))),
        bindings([binding("_BestRoute", [depotA, depotB, labD]), binding("_BestRaw", 8.0), binding("_BestRisk", 0.5), binding("BestScore", 13.0), binding("_BestEdges", 2), binding("_CRoute", [depotA, depotC, labD]), binding("_CRaw", 9.0), binding("_CRisk", 1.2), binding("CScore", 21.0), binding("_CEdges", 2), binding("_RRoute", [depotA, relay, labD]), binding("_RRaw", 10.0), binding("_RRisk", 0.40000000000000002), binding("RelayScore", 14.0), binding("_REdges", 2), binding("_DRoute", [depotA, labD]), binding("_DRaw", 14.0), binding("_DRisk", 0.050000000000000003), binding("DirectScore", 14.5), binding("_DEdges", 1), binding("_VRoute", [depotA, depotC, depotB, labD]), binding("_VRaw", 7.5), binding("_VRisk", 1.7000000000000002), binding("ViaScore", 24.5), binding("_VEdges", 3)]),
        uses([
          proof(
            goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
              proof(
                goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
                uses([
                  proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
                  proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
              proof(
                goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
                uses([
                  proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
                  proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
              proof(
                goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                      proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
                uses([
                  proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
                  proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
            uses([
              proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
              proof(
                goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
                  proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
                uses([
                  proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
                  proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
            uses([
              proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
              proof(
                goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                        uses([
                          proof(
                            goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                            bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                            uses([
                              proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                              proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                            bindings([binding("__anon0", labD)])
                          ),
                          proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                          proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                          proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                      proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
                uses([
                  proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
                  proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(goal(lt(13.0, 21.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 14.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 14.5)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 24.5)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

trustGate(case, noEnumeratedPathIsLower).
why(
  trustGate(case, noEnumeratedPathIsLower),
  proof(
    goal(trustGate(case, noEnumeratedPathIsLower)), by(rule("dijkstra-risk-path.pl", clause(30))),
    bindings([binding("_Path", pathB)]),
    uses([
      proof(
        goal(best_path(pathB)), by(rule("dijkstra-risk-path.pl", clause(22))),
        bindings([binding("_BestRoute", [depotA, depotB, labD]), binding("_BestRaw", 8.0), binding("_BestRisk", 0.5), binding("BestScore", 13.0), binding("_BestEdges", 2), binding("_CRoute", [depotA, depotC, labD]), binding("_CRaw", 9.0), binding("_CRisk", 1.2), binding("CScore", 21.0), binding("_CEdges", 2), binding("_RRoute", [depotA, relay, labD]), binding("_RRaw", 10.0), binding("_RRisk", 0.40000000000000002), binding("RelayScore", 14.0), binding("_REdges", 2), binding("_DRoute", [depotA, labD]), binding("_DRaw", 14.0), binding("_DRisk", 0.050000000000000003), binding("DirectScore", 14.5), binding("_DEdges", 1), binding("_VRoute", [depotA, depotC, depotB, labD]), binding("_VRaw", 7.5), binding("_VRisk", 1.7000000000000002), binding("ViaScore", 24.5), binding("_VEdges", 3)]),
        uses([
          proof(
            goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
              proof(
                goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
                uses([
                  proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
                  proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
              proof(
                goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
                uses([
                  proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
                  proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
              proof(
                goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                      proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
                uses([
                  proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
                  proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
            uses([
              proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
              proof(
                goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
                  proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
                uses([
                  proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
                  proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
            uses([
              proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
              proof(
                goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                        uses([
                          proof(
                            goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                            bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                            uses([
                              proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                              proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                            bindings([binding("__anon0", labD)])
                          ),
                          proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                          proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                          proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                      proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
                uses([
                  proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
                  proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(goal(lt(13.0, 21.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 14.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 14.5)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 24.5)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

notes(case, riskCanOutweighRawCost).
why(
  notes(case, riskCanOutweighRawCost),
  proof(
    goal(notes(case, riskCanOutweighRawCost)), by(rule("dijkstra-risk-path.pl", clause(31))),
    uses([
      proof(
        goal(risk_outweighs_raw_cost(true)), by(rule("dijkstra-risk-path.pl", clause(23))),
        bindings([binding("_BR", [depotA, depotB, labD]), binding("BestRaw", 8.0), binding("_BRS", 0.5), binding("BestScore", 13.0), binding("_BE", 2), binding("_VR", [depotA, depotC, depotB, labD]), binding("ViaRaw", 7.5), binding("_VRS", 1.7000000000000002), binding("ViaScore", 24.5), binding("_VE", 3)]),
        uses([
          proof(
            goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
              proof(
                goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
                uses([
                  proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
                  proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
            uses([
              proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
              proof(
                goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                        uses([
                          proof(
                            goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                            bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                            uses([
                              proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                              proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                            bindings([binding("__anon0", labD)])
                          ),
                          proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                          proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                          proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                      proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
                uses([
                  proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
                  proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(goal(lt(7.5, 8.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 24.5)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

selects(dijkstraRiskPath, pathB).
why(
  selects(dijkstraRiskPath, pathB),
  proof(
    goal(selects(dijkstraRiskPath, pathB)), by(rule("dijkstra-risk-path.pl", clause(32))),
    bindings([binding("Path", pathB)]),
    uses([
      proof(
        goal(best_path(pathB)), by(rule("dijkstra-risk-path.pl", clause(22))),
        bindings([binding("_BestRoute", [depotA, depotB, labD]), binding("_BestRaw", 8.0), binding("_BestRisk", 0.5), binding("BestScore", 13.0), binding("_BestEdges", 2), binding("_CRoute", [depotA, depotC, labD]), binding("_CRaw", 9.0), binding("_CRisk", 1.2), binding("CScore", 21.0), binding("_CEdges", 2), binding("_RRoute", [depotA, relay, labD]), binding("_RRaw", 10.0), binding("_RRisk", 0.40000000000000002), binding("RelayScore", 14.0), binding("_REdges", 2), binding("_DRoute", [depotA, labD]), binding("_DRaw", 14.0), binding("_DRisk", 0.050000000000000003), binding("DirectScore", 14.5), binding("_DEdges", 1), binding("_VRoute", [depotA, depotC, depotB, labD]), binding("_VRaw", 7.5), binding("_VRisk", 1.7000000000000002), binding("ViaScore", 24.5), binding("_VEdges", 3)]),
        uses([
          proof(
            goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
              proof(
                goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
                uses([
                  proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
                  proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathC, [depotA, depotC, labD], 9.0, 1.2, 21.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathC), binding("Route", [depotA, depotC, labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathC, [depotA, depotC, labD])), by(fact("dijkstra-risk-path.pl", clause(14)))),
              proof(
                goal(route_cost([depotA, depotC, labD], 9.0, 1.2, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [labD]), binding("Raw", 9.0), binding("Risk", 1.2), binding("Edges", 2), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 6.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, labD], 6.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", labD), binding("Rest", []), binding("Raw", 6.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 6.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, labD, 6.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", labD), binding("Raw", 6.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(labD, 6.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(6.0, 0.0, 6.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 6.0, 9.0)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.29999999999999999, 1.2)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(9.0, 1.2, 21.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 9.0), binding("Risk", 1.2), binding("Score", 21.0), binding("Penalty", 12.0)]),
                uses([
                  proof(goal(mul(1.2, 10.0, 12.0)), by(builtin(mul, 3))),
                  proof(goal(add(9.0, 12.0, 21.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathRelay, [depotA, relay, labD], 10.0, 0.40000000000000002, 14.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathRelay), binding("Route", [depotA, relay, labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathRelay, [depotA, relay, labD])), by(fact("dijkstra-risk-path.pl", clause(15)))),
              proof(
                goal(route_cost([depotA, relay, labD], 10.0, 0.40000000000000002, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", relay), binding("Rest", [labD]), binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Edges", 2), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 5.0), binding("RestRisk", 0.20000000000000001), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, relay, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", relay), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(relay, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([relay, labD], 5.0, 0.20000000000000001, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", relay), binding("To", labD), binding("Rest", []), binding("Raw", 5.0), binding("Risk", 0.20000000000000001), binding("Edges", 1), binding("StepRaw", 5.0), binding("StepRisk", 0.2), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(relay, labD, 5.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", relay), binding("To", labD), binding("Raw", 5.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), relay, segment, segment(labD, 5.0, 0.2))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(5.0, 0.0, 5.0)), by(builtin(add, 3))),
                      proof(goal(add(0.2, 0.0, 0.20000000000000001)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(5.0, 5.0, 10.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.20000000000000001, 0.40000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(10.0, 0.40000000000000002, 14.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 10.0), binding("Risk", 0.40000000000000002), binding("Score", 14.0), binding("Penalty", 4.0)]),
                uses([
                  proof(goal(mul(0.40000000000000002, 10.0, 4.0)), by(builtin(mul, 3))),
                  proof(goal(add(10.0, 4.0, 14.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathDirectC, [depotA, labD], 14.0, 0.050000000000000003, 14.5, 1)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathDirectC), binding("Route", [depotA, labD]), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Edges", 1)]),
            uses([
              proof(goal(candidate(pathDirectC, [depotA, labD])), by(fact("dijkstra-risk-path.pl", clause(16)))),
              proof(
                goal(route_cost([depotA, labD], 14.0, 0.050000000000000003, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", labD), binding("Rest", []), binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Edges", 1), binding("StepRaw", 14.0), binding("StepRisk", 0.05), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                uses([
                  proof(
                    goal(route_segment(depotA, labD, 14.0, 0.05)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", labD), binding("Raw", 14.0), binding("Risk", 0.05), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(labD, 14.0, 0.05))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                    bindings([binding("__anon0", labD)])
                  ),
                  proof(goal(add(14.0, 0.0, 14.0)), by(builtin(add, 3))),
                  proof(goal(add(0.05, 0.0, 0.050000000000000003)), by(builtin(add, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(14.0, 0.050000000000000003, 14.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 14.0), binding("Risk", 0.050000000000000003), binding("Score", 14.5), binding("Penalty", 0.5)]),
                uses([
                  proof(goal(mul(0.050000000000000003, 10.0, 0.5)), by(builtin(mul, 3))),
                  proof(goal(add(14.0, 0.5, 14.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
            uses([
              proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
              proof(
                goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                        uses([
                          proof(
                            goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                            bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                            uses([
                              proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                              proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                            bindings([binding("__anon0", labD)])
                          ),
                          proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                          proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                          proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                      proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
                uses([
                  proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
                  proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(goal(lt(13.0, 21.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 14.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 14.5)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 24.5)), by(builtin(lt, 2)))
        ])
      ),
      proof(
        goal(risk_outweighs_raw_cost(true)), by(rule("dijkstra-risk-path.pl", clause(23))),
        bindings([binding("_BR", [depotA, depotB, labD]), binding("BestRaw", 8.0), binding("_BRS", 0.5), binding("BestScore", 13.0), binding("_BE", 2), binding("_VR", [depotA, depotC, depotB, labD]), binding("ViaRaw", 7.5), binding("_VRS", 1.7000000000000002), binding("ViaScore", 24.5), binding("_VE", 3)]),
        uses([
          proof(
            goal(path_metrics(pathB, [depotA, depotB, labD], 8.0, 0.5, 13.0, 2)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathB), binding("Route", [depotA, depotB, labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Edges", 2)]),
            uses([
              proof(goal(candidate(pathB, [depotA, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(13)))),
              proof(
                goal(route_cost([depotA, depotB, labD], 8.0, 0.5, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 8.0), binding("Risk", 0.5), binding("Edges", 2), binding("StepRaw", 4.0), binding("StepRisk", 0.2), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotB, 4.0, 0.2)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotB), binding("Raw", 4.0), binding("Risk", 0.2), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotB, 4.0, 0.2))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                    uses([
                      proof(
                        goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                        bindings([binding("__anon0", labD)])
                      ),
                      proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                      proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(4.0, 4.0, 8.0)), by(builtin(add, 3))),
                  proof(goal(add(0.2, 0.29999999999999999, 0.5)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(8.0, 0.5, 13.0)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 8.0), binding("Risk", 0.5), binding("Score", 13.0), binding("Penalty", 5.0)]),
                uses([
                  proof(goal(mul(0.5, 10.0, 5.0)), by(builtin(mul, 3))),
                  proof(goal(add(8.0, 5.0, 13.0)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(path_metrics(pathViaC, [depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 24.5, 3)), by(rule("dijkstra-risk-path.pl", clause(21))),
            bindings([binding("Path", pathViaC), binding("Route", [depotA, depotC, depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Edges", 3)]),
            uses([
              proof(goal(candidate(pathViaC, [depotA, depotC, depotB, labD])), by(fact("dijkstra-risk-path.pl", clause(17)))),
              proof(
                goal(route_cost([depotA, depotC, depotB, labD], 7.5, 1.7000000000000002, 3)), by(rule("dijkstra-risk-path.pl", clause(19))),
                bindings([binding("From", depotA), binding("To", depotC), binding("Rest", [depotB, labD]), binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Edges", 3), binding("StepRaw", 3.0), binding("StepRisk", 0.9), binding("RestRaw", 4.5), binding("RestRisk", 0.80000000000000004), binding("RestEdges", 2)]),
                uses([
                  proof(
                    goal(route_segment(depotA, depotC, 3.0, 0.9)), by(rule("dijkstra-risk-path.pl", clause(12))),
                    bindings([binding("From", depotA), binding("To", depotC), binding("Raw", 3.0), binding("Risk", 0.9), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                    uses([
                      proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                      proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotA, segment, segment(depotC, 3.0, 0.9))), by(builtin(formula_binary, 4)))
                    ])
                  ),
                  proof(
                    goal(route_cost([depotC, depotB, labD], 4.5, 0.80000000000000004, 2)), by(rule("dijkstra-risk-path.pl", clause(19))),
                    bindings([binding("From", depotC), binding("To", depotB), binding("Rest", [labD]), binding("Raw", 4.5), binding("Risk", 0.80000000000000004), binding("Edges", 2), binding("StepRaw", 0.5), binding("StepRisk", 0.5), binding("RestRaw", 4.0), binding("RestRisk", 0.29999999999999999), binding("RestEdges", 1)]),
                    uses([
                      proof(
                        goal(route_segment(depotC, depotB, 0.5, 0.5)), by(rule("dijkstra-risk-path.pl", clause(12))),
                        bindings([binding("From", depotC), binding("To", depotB), binding("Raw", 0.5), binding("Risk", 0.5), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                        uses([
                          proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                          proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotC, segment, segment(depotB, 0.5, 0.5))), by(builtin(formula_binary, 4)))
                        ])
                      ),
                      proof(
                        goal(route_cost([depotB, labD], 4.0, 0.29999999999999999, 1)), by(rule("dijkstra-risk-path.pl", clause(19))),
                        bindings([binding("From", depotB), binding("To", labD), binding("Rest", []), binding("Raw", 4.0), binding("Risk", 0.29999999999999999), binding("Edges", 1), binding("StepRaw", 4.0), binding("StepRisk", 0.3), binding("RestRaw", 0.0), binding("RestRisk", 0.0), binding("RestEdges", 0)]),
                        uses([
                          proof(
                            goal(route_segment(depotB, labD, 4.0, 0.3)), by(rule("dijkstra-risk-path.pl", clause(12))),
                            bindings([binding("From", depotB), binding("To", labD), binding("Raw", 4.0), binding("Risk", 0.3), binding("Formula", (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))]),
                            uses([
                              proof(goal(route_network(riskNetwork, (segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))))), by(fact("dijkstra-risk-path.pl", clause(11)))),
                              proof(goal(formula_binary((segment(depotA, segment(depotB, 4.0, 0.2)), segment(depotB, segment(labD, 4.0, 0.3)), segment(depotA, segment(depotC, 3.0, 0.9)), segment(depotC, segment(labD, 6.0, 0.3)), segment(depotC, segment(depotB, 0.5, 0.5)), segment(depotB, segment(depotC, 1.0, 0.5)), segment(depotA, segment(relay, 5.0, 0.2)), segment(relay, segment(labD, 5.0, 0.2)), segment(depotA, segment(labD, 14.0, 0.05))), depotB, segment, segment(labD, 4.0, 0.3))), by(builtin(formula_binary, 4)))
                            ])
                          ),
                          proof(
                            goal(route_cost([labD], 0.0, 0.0, 0)), by(fact("dijkstra-risk-path.pl", clause(18))),
                            bindings([binding("__anon0", labD)])
                          ),
                          proof(goal(add(4.0, 0.0, 4.0)), by(builtin(add, 3))),
                          proof(goal(add(0.3, 0.0, 0.29999999999999999)), by(builtin(add, 3))),
                          proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(0.5, 4.0, 4.5)), by(builtin(add, 3))),
                      proof(goal(add(0.5, 0.29999999999999999, 0.80000000000000004)), by(builtin(add, 3))),
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(3.0, 4.5, 7.5)), by(builtin(add, 3))),
                  proof(goal(add(0.9, 0.80000000000000004, 1.7000000000000002)), by(builtin(add, 3))),
                  proof(goal(add(1, 2, 3)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(score(7.5, 1.7000000000000002, 24.5)), by(rule("dijkstra-risk-path.pl", clause(20))),
                bindings([binding("Raw", 7.5), binding("Risk", 1.7000000000000002), binding("Score", 24.5), binding("Penalty", 17.0)]),
                uses([
                  proof(goal(mul(1.7000000000000002, 10.0, 17.0)), by(builtin(mul, 3))),
                  proof(goal(add(7.5, 17.0, 24.5)), by(builtin(add, 3)))
                ])
              )
            ])
          ),
          proof(goal(lt(7.5, 8.0)), by(builtin(lt, 2))),
          proof(goal(lt(13.0, 24.5)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

