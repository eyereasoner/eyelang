airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague").
why(
  airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague"),
  proof(
    goal(airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(3))),
    bindings([binding("RouteText", "Ostend-Bruges International Airport -> Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague"), binding("From", "Ostend-Bruges International Airport"), binding("To", "Václav Havel Airport Prague"), binding("MaxStopOvers", 2), binding("Source", res_airport_310), binding("Destination", res_airport_1587), binding("MaxLegs", 3), binding("Path", [res_airport_310, res_airport_309, res_airport_1452, res_airport_1587])]),
    uses([
      proof(goal(route_query("Ostend-Bruges International Airport", "Václav Havel Airport Prague", 2)), by(fact("path-discovery.pl", clause(2)))),
      proof(goal(airport(res_airport_310, "Ostend-Bruges International Airport")), by(fact("path-discovery.pl", clause(1205)))),
      proof(goal(airport(res_airport_1587, "Václav Havel Airport Prague")), by(fact("path-discovery.pl", clause(324)))),
      proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
      proof(goal(bounded_path(flight, res_airport_310, res_airport_1587, 3, [res_airport_310, res_airport_309, res_airport_1452, res_airport_1587])), by(builtin(bounded_path, 5))),
      proof(
        goal(route_text([res_airport_310, res_airport_309, res_airport_1452, res_airport_1587], "Ostend-Bruges International Airport -> Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
        bindings([binding("Node", res_airport_310), binding("Rest", [res_airport_309, res_airport_1452, res_airport_1587]), binding("Text", "Ostend-Bruges International Airport -> Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague"), binding("Label", "Ostend-Bruges International Airport"), binding("Tail", "Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague"), binding("Prefix", "Ostend-Bruges International Airport -> ")]),
        uses([
          proof(goal(neq([res_airport_309, res_airport_1452, res_airport_1587], [])), by(builtin(neq, 2))),
          proof(goal(airport(res_airport_310, "Ostend-Bruges International Airport")), by(fact("path-discovery.pl", clause(1205)))),
          proof(
            goal(route_text([res_airport_309, res_airport_1452, res_airport_1587], "Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
            bindings([binding("Node", res_airport_309), binding("Rest", [res_airport_1452, res_airport_1587]), binding("Text", "Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague"), binding("Label", "Liège Airport"), binding("Tail", "Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague"), binding("Prefix", "Liège Airport -> ")]),
            uses([
              proof(goal(neq([res_airport_1452, res_airport_1587], [])), by(builtin(neq, 2))),
              proof(goal(airport(res_airport_309, "Liège Airport")), by(fact("path-discovery.pl", clause(1198)))),
              proof(
                goal(route_text([res_airport_1452, res_airport_1587], "Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
                bindings([binding("Node", res_airport_1452), binding("Rest", [res_airport_1587]), binding("Text", "Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague"), binding("Label", "Heraklion International Nikos Kazantzakis Airport"), binding("Tail", "Václav Havel Airport Prague"), binding("Prefix", "Heraklion International Nikos Kazantzakis Airport -> ")]),
                uses([
                  proof(goal(neq([res_airport_1587], [])), by(builtin(neq, 2))),
                  proof(goal(airport(res_airport_1452, "Heraklion International Nikos Kazantzakis Airport")), by(fact("path-discovery.pl", clause(248)))),
                  proof(
                    goal(route_text([res_airport_1587], "Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(4))),
                    bindings([binding("Node", res_airport_1587), binding("Text", "Václav Havel Airport Prague")]),
                    uses([
                      proof(goal(airport(res_airport_1587, "Václav Havel Airport Prague")), by(fact("path-discovery.pl", clause(324))))
                    ])
                  ),
                  proof(goal(str_concat("Heraklion International Nikos Kazantzakis Airport", " -> ", "Heraklion International Nikos Kazantzakis Airport -> ")), by(builtin(str_concat, 3))),
                  proof(goal(str_concat("Heraklion International Nikos Kazantzakis Airport -> ", "Václav Havel Airport Prague", "Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
                ])
              ),
              proof(goal(str_concat("Liège Airport", " -> ", "Liège Airport -> ")), by(builtin(str_concat, 3))),
              proof(goal(str_concat("Liège Airport -> ", "Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague", "Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
            ])
          ),
          proof(goal(str_concat("Ostend-Bruges International Airport", " -> ", "Ostend-Bruges International Airport -> ")), by(builtin(str_concat, 3))),
          proof(goal(str_concat("Ostend-Bruges International Airport -> ", "Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague", "Ostend-Bruges International Airport -> Liège Airport -> Heraklion International Nikos Kazantzakis Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
        ])
      )
    ])
  )
).

airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague").
why(
  airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague"),
  proof(
    goal(airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(3))),
    bindings([binding("RouteText", "Ostend-Bruges International Airport -> Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague"), binding("From", "Ostend-Bruges International Airport"), binding("To", "Václav Havel Airport Prague"), binding("MaxStopOvers", 2), binding("Source", res_airport_310), binding("Destination", res_airport_1587), binding("MaxLegs", 3), binding("Path", [res_airport_310, res_airport_309, res_airport_1472, res_airport_1587])]),
    uses([
      proof(goal(route_query("Ostend-Bruges International Airport", "Václav Havel Airport Prague", 2)), by(fact("path-discovery.pl", clause(2)))),
      proof(goal(airport(res_airport_310, "Ostend-Bruges International Airport")), by(fact("path-discovery.pl", clause(1205)))),
      proof(goal(airport(res_airport_1587, "Václav Havel Airport Prague")), by(fact("path-discovery.pl", clause(324)))),
      proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
      proof(goal(bounded_path(flight, res_airport_310, res_airport_1587, 3, [res_airport_310, res_airport_309, res_airport_1472, res_airport_1587])), by(builtin(bounded_path, 5))),
      proof(
        goal(route_text([res_airport_310, res_airport_309, res_airport_1472, res_airport_1587], "Ostend-Bruges International Airport -> Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
        bindings([binding("Node", res_airport_310), binding("Rest", [res_airport_309, res_airport_1472, res_airport_1587]), binding("Text", "Ostend-Bruges International Airport -> Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague"), binding("Label", "Ostend-Bruges International Airport"), binding("Tail", "Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague"), binding("Prefix", "Ostend-Bruges International Airport -> ")]),
        uses([
          proof(goal(neq([res_airport_309, res_airport_1472, res_airport_1587], [])), by(builtin(neq, 2))),
          proof(goal(airport(res_airport_310, "Ostend-Bruges International Airport")), by(fact("path-discovery.pl", clause(1205)))),
          proof(
            goal(route_text([res_airport_309, res_airport_1472, res_airport_1587], "Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
            bindings([binding("Node", res_airport_309), binding("Rest", [res_airport_1472, res_airport_1587]), binding("Text", "Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague"), binding("Label", "Liège Airport"), binding("Tail", "Diagoras Airport -> Václav Havel Airport Prague"), binding("Prefix", "Liège Airport -> ")]),
            uses([
              proof(goal(neq([res_airport_1472, res_airport_1587], [])), by(builtin(neq, 2))),
              proof(goal(airport(res_airport_309, "Liège Airport")), by(fact("path-discovery.pl", clause(1198)))),
              proof(
                goal(route_text([res_airport_1472, res_airport_1587], "Diagoras Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
                bindings([binding("Node", res_airport_1472), binding("Rest", [res_airport_1587]), binding("Text", "Diagoras Airport -> Václav Havel Airport Prague"), binding("Label", "Diagoras Airport"), binding("Tail", "Václav Havel Airport Prague"), binding("Prefix", "Diagoras Airport -> ")]),
                uses([
                  proof(goal(neq([res_airport_1587], [])), by(builtin(neq, 2))),
                  proof(goal(airport(res_airport_1472, "Diagoras Airport")), by(fact("path-discovery.pl", clause(266)))),
                  proof(
                    goal(route_text([res_airport_1587], "Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(4))),
                    bindings([binding("Node", res_airport_1587), binding("Text", "Václav Havel Airport Prague")]),
                    uses([
                      proof(goal(airport(res_airport_1587, "Václav Havel Airport Prague")), by(fact("path-discovery.pl", clause(324))))
                    ])
                  ),
                  proof(goal(str_concat("Diagoras Airport", " -> ", "Diagoras Airport -> ")), by(builtin(str_concat, 3))),
                  proof(goal(str_concat("Diagoras Airport -> ", "Václav Havel Airport Prague", "Diagoras Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
                ])
              ),
              proof(goal(str_concat("Liège Airport", " -> ", "Liège Airport -> ")), by(builtin(str_concat, 3))),
              proof(goal(str_concat("Liège Airport -> ", "Diagoras Airport -> Václav Havel Airport Prague", "Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
            ])
          ),
          proof(goal(str_concat("Ostend-Bruges International Airport", " -> ", "Ostend-Bruges International Airport -> ")), by(builtin(str_concat, 3))),
          proof(goal(str_concat("Ostend-Bruges International Airport -> ", "Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague", "Ostend-Bruges International Airport -> Liège Airport -> Diagoras Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
        ])
      )
    ])
  )
).

airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague").
why(
  airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague"),
  proof(
    goal(airroute(discovered, "Ostend-Bruges International Airport -> Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(3))),
    bindings([binding("RouteText", "Ostend-Bruges International Airport -> Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague"), binding("From", "Ostend-Bruges International Airport"), binding("To", "Václav Havel Airport Prague"), binding("MaxStopOvers", 2), binding("Source", res_airport_310), binding("Destination", res_airport_1587), binding("MaxLegs", 3), binding("Path", [res_airport_310, res_airport_309, res_airport_3998, res_airport_1587])]),
    uses([
      proof(goal(route_query("Ostend-Bruges International Airport", "Václav Havel Airport Prague", 2)), by(fact("path-discovery.pl", clause(2)))),
      proof(goal(airport(res_airport_310, "Ostend-Bruges International Airport")), by(fact("path-discovery.pl", clause(1205)))),
      proof(goal(airport(res_airport_1587, "Václav Havel Airport Prague")), by(fact("path-discovery.pl", clause(324)))),
      proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
      proof(goal(bounded_path(flight, res_airport_310, res_airport_1587, 3, [res_airport_310, res_airport_309, res_airport_3998, res_airport_1587])), by(builtin(bounded_path, 5))),
      proof(
        goal(route_text([res_airport_310, res_airport_309, res_airport_3998, res_airport_1587], "Ostend-Bruges International Airport -> Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
        bindings([binding("Node", res_airport_310), binding("Rest", [res_airport_309, res_airport_3998, res_airport_1587]), binding("Text", "Ostend-Bruges International Airport -> Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague"), binding("Label", "Ostend-Bruges International Airport"), binding("Tail", "Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague"), binding("Prefix", "Ostend-Bruges International Airport -> ")]),
        uses([
          proof(goal(neq([res_airport_309, res_airport_3998, res_airport_1587], [])), by(builtin(neq, 2))),
          proof(goal(airport(res_airport_310, "Ostend-Bruges International Airport")), by(fact("path-discovery.pl", clause(1205)))),
          proof(
            goal(route_text([res_airport_309, res_airport_3998, res_airport_1587], "Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
            bindings([binding("Node", res_airport_309), binding("Rest", [res_airport_3998, res_airport_1587]), binding("Text", "Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague"), binding("Label", "Liège Airport"), binding("Tail", "Palma De Mallorca Airport -> Václav Havel Airport Prague"), binding("Prefix", "Liège Airport -> ")]),
            uses([
              proof(goal(neq([res_airport_3998, res_airport_1587], [])), by(builtin(neq, 2))),
              proof(goal(airport(res_airport_309, "Liège Airport")), by(fact("path-discovery.pl", clause(1198)))),
              proof(
                goal(route_text([res_airport_3998, res_airport_1587], "Palma De Mallorca Airport -> Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(5))),
                bindings([binding("Node", res_airport_3998), binding("Rest", [res_airport_1587]), binding("Text", "Palma De Mallorca Airport -> Václav Havel Airport Prague"), binding("Label", "Palma De Mallorca Airport"), binding("Tail", "Václav Havel Airport Prague"), binding("Prefix", "Palma De Mallorca Airport -> ")]),
                uses([
                  proof(goal(neq([res_airport_1587], [])), by(builtin(neq, 2))),
                  proof(goal(airport(res_airport_3998, "Palma De Mallorca Airport")), by(fact("path-discovery.pl", clause(1731)))),
                  proof(
                    goal(route_text([res_airport_1587], "Václav Havel Airport Prague")), by(rule("path-discovery.pl", clause(4))),
                    bindings([binding("Node", res_airport_1587), binding("Text", "Václav Havel Airport Prague")]),
                    uses([
                      proof(goal(airport(res_airport_1587, "Václav Havel Airport Prague")), by(fact("path-discovery.pl", clause(324))))
                    ])
                  ),
                  proof(goal(str_concat("Palma De Mallorca Airport", " -> ", "Palma De Mallorca Airport -> ")), by(builtin(str_concat, 3))),
                  proof(goal(str_concat("Palma De Mallorca Airport -> ", "Václav Havel Airport Prague", "Palma De Mallorca Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
                ])
              ),
              proof(goal(str_concat("Liège Airport", " -> ", "Liège Airport -> ")), by(builtin(str_concat, 3))),
              proof(goal(str_concat("Liège Airport -> ", "Palma De Mallorca Airport -> Václav Havel Airport Prague", "Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
            ])
          ),
          proof(goal(str_concat("Ostend-Bruges International Airport", " -> ", "Ostend-Bruges International Airport -> ")), by(builtin(str_concat, 3))),
          proof(goal(str_concat("Ostend-Bruges International Airport -> ", "Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague", "Ostend-Bruges International Airport -> Liège Airport -> Palma De Mallorca Airport -> Václav Havel Airport Prague")), by(builtin(str_concat, 3)))
        ])
      )
    ])
  )
).

