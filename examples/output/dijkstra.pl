edge([b, a], 4).
why(
  edge([b, a], 4),
  proof(
    goal(edge([b, a], 4)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", b), binding("A", a), binding("Cost", 4)]),
    uses([
      proof(
        goal(base_link(a, b, 4)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", a), binding("B", b), binding("Cost", 4), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(b, 4))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([c, a], 2).
why(
  edge([c, a], 2),
  proof(
    goal(edge([c, a], 2)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", c), binding("A", a), binding("Cost", 2)]),
    uses([
      proof(
        goal(base_link(a, c, 2)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", a), binding("B", c), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(c, 2))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([c, b], 1).
why(
  edge([c, b], 1),
  proof(
    goal(edge([c, b], 1)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", c), binding("A", b), binding("Cost", 1)]),
    uses([
      proof(
        goal(base_link(b, c, 1)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", b), binding("B", c), binding("Cost", 1), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(c, 1))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([d, b], 5).
why(
  edge([d, b], 5),
  proof(
    goal(edge([d, b], 5)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", d), binding("A", b), binding("Cost", 5)]),
    uses([
      proof(
        goal(base_link(b, d, 5)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", b), binding("B", d), binding("Cost", 5), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(d, 5))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([d, c], 8).
why(
  edge([d, c], 8),
  proof(
    goal(edge([d, c], 8)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", d), binding("A", c), binding("Cost", 8)]),
    uses([
      proof(
        goal(base_link(c, d, 8)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", c), binding("B", d), binding("Cost", 8), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), c, edge, arc(d, 8))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([e, c], 10).
why(
  edge([e, c], 10),
  proof(
    goal(edge([e, c], 10)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", e), binding("A", c), binding("Cost", 10)]),
    uses([
      proof(
        goal(base_link(c, e, 10)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", c), binding("B", e), binding("Cost", 10), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), c, edge, arc(e, 10))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([e, d], 2).
why(
  edge([e, d], 2),
  proof(
    goal(edge([e, d], 2)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", e), binding("A", d), binding("Cost", 2)]),
    uses([
      proof(
        goal(base_link(d, e, 2)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", d), binding("B", e), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(e, 2))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([f, d], 6).
why(
  edge([f, d], 6),
  proof(
    goal(edge([f, d], 6)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", f), binding("A", d), binding("Cost", 6)]),
    uses([
      proof(
        goal(base_link(d, f, 6)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", d), binding("B", f), binding("Cost", 6), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(f, 6))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

edge([f, e], 3).
why(
  edge([f, e], 3),
  proof(
    goal(edge([f, e], 3)),
    by(rule("dijkstra.pl", clause(9))),
    bindings([binding("B", f), binding("A", e), binding("Cost", 3)]),
    uses([
      proof(
        goal(base_link(e, f, 3)),
        by(rule("dijkstra.pl", clause(4))),
        bindings([binding("A", e), binding("B", f), binding("Cost", 3), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
        uses([
          proof(
            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
            by(fact("dijkstra.pl", clause(3)))
          ),
          proof(
            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), e, edge, arc(f, 3))),
            by(builtin(formula_binary, 4))
          )
        ])
      )
    ])
  )
).

path([a, f], [[a, b, d, e, f], 14]).
why(
  path([a, f], [[a, b, d, e, f], 14]),
  proof(
    goal(path([a, f], [[a, b, d, e, f], 14])),
    by(rule("dijkstra.pl", clause(10))),
    bindings([binding("Path", [a, b, d, e, f]), binding("Cost", 14)]),
    uses([
      proof(
        goal(path(a, f, [a], [a, b, d, e, f], 14)),
        by(rule("dijkstra.pl", clause(8))),
        bindings([binding("Node", a), binding("Goal", f), binding("Visited", [a]), binding("Path", [b, d, e, f]), binding("Cost", 14), binding("Next", b), binding("StepCost", 4), binding("RestCost", 10)]),
        uses([
          proof(
            goal(link(a, b, 4)),
            by(rule("dijkstra.pl", clause(5))),
            bindings([binding("A", a), binding("B", b), binding("Cost", 4)]),
            uses([
              proof(
                goal(base_link(a, b, 4)),
                by(rule("dijkstra.pl", clause(4))),
                bindings([binding("A", a), binding("B", b), binding("Cost", 4), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                uses([
                  proof(
                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                    by(fact("dijkstra.pl", clause(3)))
                  ),
                  proof(
                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(b, 4))),
                    by(builtin(formula_binary, 4))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(not_member(b, [a])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(path(b, f, [b, a], [b, d, e, f], 10)),
            by(rule("dijkstra.pl", clause(8))),
            bindings([binding("Node", b), binding("Goal", f), binding("Visited", [b, a]), binding("Path", [d, e, f]), binding("Cost", 10), binding("Next", d), binding("StepCost", 5), binding("RestCost", 5)]),
            uses([
              proof(
                goal(link(b, d, 5)),
                by(rule("dijkstra.pl", clause(5))),
                bindings([binding("A", b), binding("B", d), binding("Cost", 5)]),
                uses([
                  proof(
                    goal(base_link(b, d, 5)),
                    by(rule("dijkstra.pl", clause(4))),
                    bindings([binding("A", b), binding("B", d), binding("Cost", 5), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                    uses([
                      proof(
                        goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                        by(fact("dijkstra.pl", clause(3)))
                      ),
                      proof(
                        goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(d, 5))),
                        by(builtin(formula_binary, 4))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(not_member(d, [b, a])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(path(d, f, [d, b, a], [d, e, f], 5)),
                by(rule("dijkstra.pl", clause(8))),
                bindings([binding("Node", d), binding("Goal", f), binding("Visited", [d, b, a]), binding("Path", [e, f]), binding("Cost", 5), binding("Next", e), binding("StepCost", 2), binding("RestCost", 3)]),
                uses([
                  proof(
                    goal(link(d, e, 2)),
                    by(rule("dijkstra.pl", clause(5))),
                    bindings([binding("A", d), binding("B", e), binding("Cost", 2)]),
                    uses([
                      proof(
                        goal(base_link(d, e, 2)),
                        by(rule("dijkstra.pl", clause(4))),
                        bindings([binding("A", d), binding("B", e), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                        uses([
                          proof(
                            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                            by(fact("dijkstra.pl", clause(3)))
                          ),
                          proof(
                            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(e, 2))),
                            by(builtin(formula_binary, 4))
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member(e, [d, b, a])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(path(e, f, [e, d, b, a], [e, f], 3)),
                    by(rule("dijkstra.pl", clause(8))),
                    bindings([binding("Node", e), binding("Goal", f), binding("Visited", [e, d, b, a]), binding("Path", [f]), binding("Cost", 3), binding("Next", f), binding("StepCost", 3), binding("RestCost", 0)]),
                    uses([
                      proof(
                        goal(link(e, f, 3)),
                        by(rule("dijkstra.pl", clause(5))),
                        bindings([binding("A", e), binding("B", f), binding("Cost", 3)]),
                        uses([
                          proof(
                            goal(base_link(e, f, 3)),
                            by(rule("dijkstra.pl", clause(4))),
                            bindings([binding("A", e), binding("B", f), binding("Cost", 3), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                            uses([
                              proof(
                                goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                                by(fact("dijkstra.pl", clause(3)))
                              ),
                              proof(
                                goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), e, edge, arc(f, 3))),
                                by(builtin(formula_binary, 4))
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(not_member(f, [e, d, b, a])),
                        by(builtin(not_member, 2))
                      ),
                      proof(
                        goal(path(f, f, [f, e, d, b, a], [f], 0)),
                        by(fact("dijkstra.pl", clause(7))),
                        bindings([binding("Goal", f), binding("_Visited", [f, e, d, b, a])])
                      ),
                      proof(
                        goal(add(3, 0, 3)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(2, 3, 5)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(5, 5, 10)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(4, 10, 14)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(le(14, 16)),
        by(builtin(le, 2))
      )
    ])
  )
).

path([a, f], [[a, b, d, f], 15]).
why(
  path([a, f], [[a, b, d, f], 15]),
  proof(
    goal(path([a, f], [[a, b, d, f], 15])),
    by(rule("dijkstra.pl", clause(10))),
    bindings([binding("Path", [a, b, d, f]), binding("Cost", 15)]),
    uses([
      proof(
        goal(path(a, f, [a], [a, b, d, f], 15)),
        by(rule("dijkstra.pl", clause(8))),
        bindings([binding("Node", a), binding("Goal", f), binding("Visited", [a]), binding("Path", [b, d, f]), binding("Cost", 15), binding("Next", b), binding("StepCost", 4), binding("RestCost", 11)]),
        uses([
          proof(
            goal(link(a, b, 4)),
            by(rule("dijkstra.pl", clause(5))),
            bindings([binding("A", a), binding("B", b), binding("Cost", 4)]),
            uses([
              proof(
                goal(base_link(a, b, 4)),
                by(rule("dijkstra.pl", clause(4))),
                bindings([binding("A", a), binding("B", b), binding("Cost", 4), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                uses([
                  proof(
                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                    by(fact("dijkstra.pl", clause(3)))
                  ),
                  proof(
                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(b, 4))),
                    by(builtin(formula_binary, 4))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(not_member(b, [a])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(path(b, f, [b, a], [b, d, f], 11)),
            by(rule("dijkstra.pl", clause(8))),
            bindings([binding("Node", b), binding("Goal", f), binding("Visited", [b, a]), binding("Path", [d, f]), binding("Cost", 11), binding("Next", d), binding("StepCost", 5), binding("RestCost", 6)]),
            uses([
              proof(
                goal(link(b, d, 5)),
                by(rule("dijkstra.pl", clause(5))),
                bindings([binding("A", b), binding("B", d), binding("Cost", 5)]),
                uses([
                  proof(
                    goal(base_link(b, d, 5)),
                    by(rule("dijkstra.pl", clause(4))),
                    bindings([binding("A", b), binding("B", d), binding("Cost", 5), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                    uses([
                      proof(
                        goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                        by(fact("dijkstra.pl", clause(3)))
                      ),
                      proof(
                        goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(d, 5))),
                        by(builtin(formula_binary, 4))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(not_member(d, [b, a])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(path(d, f, [d, b, a], [d, f], 6)),
                by(rule("dijkstra.pl", clause(8))),
                bindings([binding("Node", d), binding("Goal", f), binding("Visited", [d, b, a]), binding("Path", [f]), binding("Cost", 6), binding("Next", f), binding("StepCost", 6), binding("RestCost", 0)]),
                uses([
                  proof(
                    goal(link(d, f, 6)),
                    by(rule("dijkstra.pl", clause(5))),
                    bindings([binding("A", d), binding("B", f), binding("Cost", 6)]),
                    uses([
                      proof(
                        goal(base_link(d, f, 6)),
                        by(rule("dijkstra.pl", clause(4))),
                        bindings([binding("A", d), binding("B", f), binding("Cost", 6), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                        uses([
                          proof(
                            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                            by(fact("dijkstra.pl", clause(3)))
                          ),
                          proof(
                            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(f, 6))),
                            by(builtin(formula_binary, 4))
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member(f, [d, b, a])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(path(f, f, [f, d, b, a], [f], 0)),
                    by(fact("dijkstra.pl", clause(7))),
                    bindings([binding("Goal", f), binding("_Visited", [f, d, b, a])])
                  ),
                  proof(
                    goal(add(6, 0, 6)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(5, 6, 11)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(4, 11, 15)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(le(15, 16)),
        by(builtin(le, 2))
      )
    ])
  )
).

path([a, f], [[a, c, d, e, f], 15]).
why(
  path([a, f], [[a, c, d, e, f], 15]),
  proof(
    goal(path([a, f], [[a, c, d, e, f], 15])),
    by(rule("dijkstra.pl", clause(10))),
    bindings([binding("Path", [a, c, d, e, f]), binding("Cost", 15)]),
    uses([
      proof(
        goal(path(a, f, [a], [a, c, d, e, f], 15)),
        by(rule("dijkstra.pl", clause(8))),
        bindings([binding("Node", a), binding("Goal", f), binding("Visited", [a]), binding("Path", [c, d, e, f]), binding("Cost", 15), binding("Next", c), binding("StepCost", 2), binding("RestCost", 13)]),
        uses([
          proof(
            goal(link(a, c, 2)),
            by(rule("dijkstra.pl", clause(5))),
            bindings([binding("A", a), binding("B", c), binding("Cost", 2)]),
            uses([
              proof(
                goal(base_link(a, c, 2)),
                by(rule("dijkstra.pl", clause(4))),
                bindings([binding("A", a), binding("B", c), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                uses([
                  proof(
                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                    by(fact("dijkstra.pl", clause(3)))
                  ),
                  proof(
                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(c, 2))),
                    by(builtin(formula_binary, 4))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(not_member(c, [a])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(path(c, f, [c, a], [c, d, e, f], 13)),
            by(rule("dijkstra.pl", clause(8))),
            bindings([binding("Node", c), binding("Goal", f), binding("Visited", [c, a]), binding("Path", [d, e, f]), binding("Cost", 13), binding("Next", d), binding("StepCost", 8), binding("RestCost", 5)]),
            uses([
              proof(
                goal(link(c, d, 8)),
                by(rule("dijkstra.pl", clause(5))),
                bindings([binding("A", c), binding("B", d), binding("Cost", 8)]),
                uses([
                  proof(
                    goal(base_link(c, d, 8)),
                    by(rule("dijkstra.pl", clause(4))),
                    bindings([binding("A", c), binding("B", d), binding("Cost", 8), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                    uses([
                      proof(
                        goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                        by(fact("dijkstra.pl", clause(3)))
                      ),
                      proof(
                        goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), c, edge, arc(d, 8))),
                        by(builtin(formula_binary, 4))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(not_member(d, [c, a])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(path(d, f, [d, c, a], [d, e, f], 5)),
                by(rule("dijkstra.pl", clause(8))),
                bindings([binding("Node", d), binding("Goal", f), binding("Visited", [d, c, a]), binding("Path", [e, f]), binding("Cost", 5), binding("Next", e), binding("StepCost", 2), binding("RestCost", 3)]),
                uses([
                  proof(
                    goal(link(d, e, 2)),
                    by(rule("dijkstra.pl", clause(5))),
                    bindings([binding("A", d), binding("B", e), binding("Cost", 2)]),
                    uses([
                      proof(
                        goal(base_link(d, e, 2)),
                        by(rule("dijkstra.pl", clause(4))),
                        bindings([binding("A", d), binding("B", e), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                        uses([
                          proof(
                            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                            by(fact("dijkstra.pl", clause(3)))
                          ),
                          proof(
                            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(e, 2))),
                            by(builtin(formula_binary, 4))
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member(e, [d, c, a])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(path(e, f, [e, d, c, a], [e, f], 3)),
                    by(rule("dijkstra.pl", clause(8))),
                    bindings([binding("Node", e), binding("Goal", f), binding("Visited", [e, d, c, a]), binding("Path", [f]), binding("Cost", 3), binding("Next", f), binding("StepCost", 3), binding("RestCost", 0)]),
                    uses([
                      proof(
                        goal(link(e, f, 3)),
                        by(rule("dijkstra.pl", clause(5))),
                        bindings([binding("A", e), binding("B", f), binding("Cost", 3)]),
                        uses([
                          proof(
                            goal(base_link(e, f, 3)),
                            by(rule("dijkstra.pl", clause(4))),
                            bindings([binding("A", e), binding("B", f), binding("Cost", 3), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                            uses([
                              proof(
                                goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                                by(fact("dijkstra.pl", clause(3)))
                              ),
                              proof(
                                goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), e, edge, arc(f, 3))),
                                by(builtin(formula_binary, 4))
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(not_member(f, [e, d, c, a])),
                        by(builtin(not_member, 2))
                      ),
                      proof(
                        goal(path(f, f, [f, e, d, c, a], [f], 0)),
                        by(fact("dijkstra.pl", clause(7))),
                        bindings([binding("Goal", f), binding("_Visited", [f, e, d, c, a])])
                      ),
                      proof(
                        goal(add(3, 0, 3)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(2, 3, 5)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(8, 5, 13)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(2, 13, 15)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(le(15, 16)),
        by(builtin(le, 2))
      )
    ])
  )
).

path([a, f], [[a, c, d, f], 16]).
why(
  path([a, f], [[a, c, d, f], 16]),
  proof(
    goal(path([a, f], [[a, c, d, f], 16])),
    by(rule("dijkstra.pl", clause(10))),
    bindings([binding("Path", [a, c, d, f]), binding("Cost", 16)]),
    uses([
      proof(
        goal(path(a, f, [a], [a, c, d, f], 16)),
        by(rule("dijkstra.pl", clause(8))),
        bindings([binding("Node", a), binding("Goal", f), binding("Visited", [a]), binding("Path", [c, d, f]), binding("Cost", 16), binding("Next", c), binding("StepCost", 2), binding("RestCost", 14)]),
        uses([
          proof(
            goal(link(a, c, 2)),
            by(rule("dijkstra.pl", clause(5))),
            bindings([binding("A", a), binding("B", c), binding("Cost", 2)]),
            uses([
              proof(
                goal(base_link(a, c, 2)),
                by(rule("dijkstra.pl", clause(4))),
                bindings([binding("A", a), binding("B", c), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                uses([
                  proof(
                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                    by(fact("dijkstra.pl", clause(3)))
                  ),
                  proof(
                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(c, 2))),
                    by(builtin(formula_binary, 4))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(not_member(c, [a])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(path(c, f, [c, a], [c, d, f], 14)),
            by(rule("dijkstra.pl", clause(8))),
            bindings([binding("Node", c), binding("Goal", f), binding("Visited", [c, a]), binding("Path", [d, f]), binding("Cost", 14), binding("Next", d), binding("StepCost", 8), binding("RestCost", 6)]),
            uses([
              proof(
                goal(link(c, d, 8)),
                by(rule("dijkstra.pl", clause(5))),
                bindings([binding("A", c), binding("B", d), binding("Cost", 8)]),
                uses([
                  proof(
                    goal(base_link(c, d, 8)),
                    by(rule("dijkstra.pl", clause(4))),
                    bindings([binding("A", c), binding("B", d), binding("Cost", 8), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                    uses([
                      proof(
                        goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                        by(fact("dijkstra.pl", clause(3)))
                      ),
                      proof(
                        goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), c, edge, arc(d, 8))),
                        by(builtin(formula_binary, 4))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(not_member(d, [c, a])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(path(d, f, [d, c, a], [d, f], 6)),
                by(rule("dijkstra.pl", clause(8))),
                bindings([binding("Node", d), binding("Goal", f), binding("Visited", [d, c, a]), binding("Path", [f]), binding("Cost", 6), binding("Next", f), binding("StepCost", 6), binding("RestCost", 0)]),
                uses([
                  proof(
                    goal(link(d, f, 6)),
                    by(rule("dijkstra.pl", clause(5))),
                    bindings([binding("A", d), binding("B", f), binding("Cost", 6)]),
                    uses([
                      proof(
                        goal(base_link(d, f, 6)),
                        by(rule("dijkstra.pl", clause(4))),
                        bindings([binding("A", d), binding("B", f), binding("Cost", 6), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                        uses([
                          proof(
                            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                            by(fact("dijkstra.pl", clause(3)))
                          ),
                          proof(
                            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(f, 6))),
                            by(builtin(formula_binary, 4))
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member(f, [d, c, a])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(path(f, f, [f, d, c, a], [f], 0)),
                    by(fact("dijkstra.pl", clause(7))),
                    bindings([binding("Goal", f), binding("_Visited", [f, d, c, a])])
                  ),
                  proof(
                    goal(add(6, 0, 6)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(8, 6, 14)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(2, 14, 16)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(le(16, 16)),
        by(builtin(le, 2))
      )
    ])
  )
).

path([a, f], [[a, c, e, f], 15]).
why(
  path([a, f], [[a, c, e, f], 15]),
  proof(
    goal(path([a, f], [[a, c, e, f], 15])),
    by(rule("dijkstra.pl", clause(10))),
    bindings([binding("Path", [a, c, e, f]), binding("Cost", 15)]),
    uses([
      proof(
        goal(path(a, f, [a], [a, c, e, f], 15)),
        by(rule("dijkstra.pl", clause(8))),
        bindings([binding("Node", a), binding("Goal", f), binding("Visited", [a]), binding("Path", [c, e, f]), binding("Cost", 15), binding("Next", c), binding("StepCost", 2), binding("RestCost", 13)]),
        uses([
          proof(
            goal(link(a, c, 2)),
            by(rule("dijkstra.pl", clause(5))),
            bindings([binding("A", a), binding("B", c), binding("Cost", 2)]),
            uses([
              proof(
                goal(base_link(a, c, 2)),
                by(rule("dijkstra.pl", clause(4))),
                bindings([binding("A", a), binding("B", c), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                uses([
                  proof(
                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                    by(fact("dijkstra.pl", clause(3)))
                  ),
                  proof(
                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(c, 2))),
                    by(builtin(formula_binary, 4))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(not_member(c, [a])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(path(c, f, [c, a], [c, e, f], 13)),
            by(rule("dijkstra.pl", clause(8))),
            bindings([binding("Node", c), binding("Goal", f), binding("Visited", [c, a]), binding("Path", [e, f]), binding("Cost", 13), binding("Next", e), binding("StepCost", 10), binding("RestCost", 3)]),
            uses([
              proof(
                goal(link(c, e, 10)),
                by(rule("dijkstra.pl", clause(5))),
                bindings([binding("A", c), binding("B", e), binding("Cost", 10)]),
                uses([
                  proof(
                    goal(base_link(c, e, 10)),
                    by(rule("dijkstra.pl", clause(4))),
                    bindings([binding("A", c), binding("B", e), binding("Cost", 10), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                    uses([
                      proof(
                        goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                        by(fact("dijkstra.pl", clause(3)))
                      ),
                      proof(
                        goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), c, edge, arc(e, 10))),
                        by(builtin(formula_binary, 4))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(not_member(e, [c, a])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(path(e, f, [e, c, a], [e, f], 3)),
                by(rule("dijkstra.pl", clause(8))),
                bindings([binding("Node", e), binding("Goal", f), binding("Visited", [e, c, a]), binding("Path", [f]), binding("Cost", 3), binding("Next", f), binding("StepCost", 3), binding("RestCost", 0)]),
                uses([
                  proof(
                    goal(link(e, f, 3)),
                    by(rule("dijkstra.pl", clause(5))),
                    bindings([binding("A", e), binding("B", f), binding("Cost", 3)]),
                    uses([
                      proof(
                        goal(base_link(e, f, 3)),
                        by(rule("dijkstra.pl", clause(4))),
                        bindings([binding("A", e), binding("B", f), binding("Cost", 3), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                        uses([
                          proof(
                            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                            by(fact("dijkstra.pl", clause(3)))
                          ),
                          proof(
                            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), e, edge, arc(f, 3))),
                            by(builtin(formula_binary, 4))
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member(f, [e, c, a])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(path(f, f, [f, e, c, a], [f], 0)),
                    by(fact("dijkstra.pl", clause(7))),
                    bindings([binding("Goal", f), binding("_Visited", [f, e, c, a])])
                  ),
                  proof(
                    goal(add(3, 0, 3)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(10, 3, 13)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(2, 13, 15)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(le(15, 16)),
        by(builtin(le, 2))
      )
    ])
  )
).

path([a, f], [[a, c, b, d, e, f], 13]).
why(
  path([a, f], [[a, c, b, d, e, f], 13]),
  proof(
    goal(path([a, f], [[a, c, b, d, e, f], 13])),
    by(rule("dijkstra.pl", clause(10))),
    bindings([binding("Path", [a, c, b, d, e, f]), binding("Cost", 13)]),
    uses([
      proof(
        goal(path(a, f, [a], [a, c, b, d, e, f], 13)),
        by(rule("dijkstra.pl", clause(8))),
        bindings([binding("Node", a), binding("Goal", f), binding("Visited", [a]), binding("Path", [c, b, d, e, f]), binding("Cost", 13), binding("Next", c), binding("StepCost", 2), binding("RestCost", 11)]),
        uses([
          proof(
            goal(link(a, c, 2)),
            by(rule("dijkstra.pl", clause(5))),
            bindings([binding("A", a), binding("B", c), binding("Cost", 2)]),
            uses([
              proof(
                goal(base_link(a, c, 2)),
                by(rule("dijkstra.pl", clause(4))),
                bindings([binding("A", a), binding("B", c), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                uses([
                  proof(
                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                    by(fact("dijkstra.pl", clause(3)))
                  ),
                  proof(
                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(c, 2))),
                    by(builtin(formula_binary, 4))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(not_member(c, [a])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(path(c, f, [c, a], [c, b, d, e, f], 11)),
            by(rule("dijkstra.pl", clause(8))),
            bindings([binding("Node", c), binding("Goal", f), binding("Visited", [c, a]), binding("Path", [b, d, e, f]), binding("Cost", 11), binding("Next", b), binding("StepCost", 1), binding("RestCost", 10)]),
            uses([
              proof(
                goal(link(c, b, 1)),
                by(rule("dijkstra.pl", clause(6))),
                bindings([binding("B", c), binding("A", b), binding("Cost", 1)]),
                uses([
                  proof(
                    goal(base_link(b, c, 1)),
                    by(rule("dijkstra.pl", clause(4))),
                    bindings([binding("A", b), binding("B", c), binding("Cost", 1), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                    uses([
                      proof(
                        goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                        by(fact("dijkstra.pl", clause(3)))
                      ),
                      proof(
                        goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(c, 1))),
                        by(builtin(formula_binary, 4))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(not_member(b, [c, a])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(path(b, f, [b, c, a], [b, d, e, f], 10)),
                by(rule("dijkstra.pl", clause(8))),
                bindings([binding("Node", b), binding("Goal", f), binding("Visited", [b, c, a]), binding("Path", [d, e, f]), binding("Cost", 10), binding("Next", d), binding("StepCost", 5), binding("RestCost", 5)]),
                uses([
                  proof(
                    goal(link(b, d, 5)),
                    by(rule("dijkstra.pl", clause(5))),
                    bindings([binding("A", b), binding("B", d), binding("Cost", 5)]),
                    uses([
                      proof(
                        goal(base_link(b, d, 5)),
                        by(rule("dijkstra.pl", clause(4))),
                        bindings([binding("A", b), binding("B", d), binding("Cost", 5), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                        uses([
                          proof(
                            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                            by(fact("dijkstra.pl", clause(3)))
                          ),
                          proof(
                            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(d, 5))),
                            by(builtin(formula_binary, 4))
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member(d, [b, c, a])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(path(d, f, [d, b, c, a], [d, e, f], 5)),
                    by(rule("dijkstra.pl", clause(8))),
                    bindings([binding("Node", d), binding("Goal", f), binding("Visited", [d, b, c, a]), binding("Path", [e, f]), binding("Cost", 5), binding("Next", e), binding("StepCost", 2), binding("RestCost", 3)]),
                    uses([
                      proof(
                        goal(link(d, e, 2)),
                        by(rule("dijkstra.pl", clause(5))),
                        bindings([binding("A", d), binding("B", e), binding("Cost", 2)]),
                        uses([
                          proof(
                            goal(base_link(d, e, 2)),
                            by(rule("dijkstra.pl", clause(4))),
                            bindings([binding("A", d), binding("B", e), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                            uses([
                              proof(
                                goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                                by(fact("dijkstra.pl", clause(3)))
                              ),
                              proof(
                                goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(e, 2))),
                                by(builtin(formula_binary, 4))
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(not_member(e, [d, b, c, a])),
                        by(builtin(not_member, 2))
                      ),
                      proof(
                        goal(path(e, f, [e, d, b, c, a], [e, f], 3)),
                        by(rule("dijkstra.pl", clause(8))),
                        bindings([binding("Node", e), binding("Goal", f), binding("Visited", [e, d, b, c, a]), binding("Path", [f]), binding("Cost", 3), binding("Next", f), binding("StepCost", 3), binding("RestCost", 0)]),
                        uses([
                          proof(
                            goal(link(e, f, 3)),
                            by(rule("dijkstra.pl", clause(5))),
                            bindings([binding("A", e), binding("B", f), binding("Cost", 3)]),
                            uses([
                              proof(
                                goal(base_link(e, f, 3)),
                                by(rule("dijkstra.pl", clause(4))),
                                bindings([binding("A", e), binding("B", f), binding("Cost", 3), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                                uses([
                                  proof(
                                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                                    by(fact("dijkstra.pl", clause(3)))
                                  ),
                                  proof(
                                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), e, edge, arc(f, 3))),
                                    by(builtin(formula_binary, 4))
                                  )
                                ])
                              )
                            ])
                          ),
                          proof(
                            goal(not_member(f, [e, d, b, c, a])),
                            by(builtin(not_member, 2))
                          ),
                          proof(
                            goal(path(f, f, [f, e, d, b, c, a], [f], 0)),
                            by(fact("dijkstra.pl", clause(7))),
                            bindings([binding("Goal", f), binding("_Visited", [f, e, d, b, c, a])])
                          ),
                          proof(
                            goal(add(3, 0, 3)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(2, 3, 5)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(5, 5, 10)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(1, 10, 11)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(2, 11, 13)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(le(13, 16)),
        by(builtin(le, 2))
      )
    ])
  )
).

path([a, f], [[a, c, b, d, f], 14]).
why(
  path([a, f], [[a, c, b, d, f], 14]),
  proof(
    goal(path([a, f], [[a, c, b, d, f], 14])),
    by(rule("dijkstra.pl", clause(10))),
    bindings([binding("Path", [a, c, b, d, f]), binding("Cost", 14)]),
    uses([
      proof(
        goal(path(a, f, [a], [a, c, b, d, f], 14)),
        by(rule("dijkstra.pl", clause(8))),
        bindings([binding("Node", a), binding("Goal", f), binding("Visited", [a]), binding("Path", [c, b, d, f]), binding("Cost", 14), binding("Next", c), binding("StepCost", 2), binding("RestCost", 12)]),
        uses([
          proof(
            goal(link(a, c, 2)),
            by(rule("dijkstra.pl", clause(5))),
            bindings([binding("A", a), binding("B", c), binding("Cost", 2)]),
            uses([
              proof(
                goal(base_link(a, c, 2)),
                by(rule("dijkstra.pl", clause(4))),
                bindings([binding("A", a), binding("B", c), binding("Cost", 2), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                uses([
                  proof(
                    goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                    by(fact("dijkstra.pl", clause(3)))
                  ),
                  proof(
                    goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), a, edge, arc(c, 2))),
                    by(builtin(formula_binary, 4))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(not_member(c, [a])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(path(c, f, [c, a], [c, b, d, f], 12)),
            by(rule("dijkstra.pl", clause(8))),
            bindings([binding("Node", c), binding("Goal", f), binding("Visited", [c, a]), binding("Path", [b, d, f]), binding("Cost", 12), binding("Next", b), binding("StepCost", 1), binding("RestCost", 11)]),
            uses([
              proof(
                goal(link(c, b, 1)),
                by(rule("dijkstra.pl", clause(6))),
                bindings([binding("B", c), binding("A", b), binding("Cost", 1)]),
                uses([
                  proof(
                    goal(base_link(b, c, 1)),
                    by(rule("dijkstra.pl", clause(4))),
                    bindings([binding("A", b), binding("B", c), binding("Cost", 1), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                    uses([
                      proof(
                        goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                        by(fact("dijkstra.pl", clause(3)))
                      ),
                      proof(
                        goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(c, 1))),
                        by(builtin(formula_binary, 4))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(not_member(b, [c, a])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(path(b, f, [b, c, a], [b, d, f], 11)),
                by(rule("dijkstra.pl", clause(8))),
                bindings([binding("Node", b), binding("Goal", f), binding("Visited", [b, c, a]), binding("Path", [d, f]), binding("Cost", 11), binding("Next", d), binding("StepCost", 5), binding("RestCost", 6)]),
                uses([
                  proof(
                    goal(link(b, d, 5)),
                    by(rule("dijkstra.pl", clause(5))),
                    bindings([binding("A", b), binding("B", d), binding("Cost", 5)]),
                    uses([
                      proof(
                        goal(base_link(b, d, 5)),
                        by(rule("dijkstra.pl", clause(4))),
                        bindings([binding("A", b), binding("B", d), binding("Cost", 5), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                        uses([
                          proof(
                            goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                            by(fact("dijkstra.pl", clause(3)))
                          ),
                          proof(
                            goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), b, edge, arc(d, 5))),
                            by(builtin(formula_binary, 4))
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member(d, [b, c, a])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(path(d, f, [d, b, c, a], [d, f], 6)),
                    by(rule("dijkstra.pl", clause(8))),
                    bindings([binding("Node", d), binding("Goal", f), binding("Visited", [d, b, c, a]), binding("Path", [f]), binding("Cost", 6), binding("Next", f), binding("StepCost", 6), binding("RestCost", 0)]),
                    uses([
                      proof(
                        goal(link(d, f, 6)),
                        by(rule("dijkstra.pl", clause(5))),
                        bindings([binding("A", d), binding("B", f), binding("Cost", 6)]),
                        uses([
                          proof(
                            goal(base_link(d, f, 6)),
                            by(rule("dijkstra.pl", clause(4))),
                            bindings([binding("A", d), binding("B", f), binding("Cost", 6), binding("Formula", (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))]),
                            uses([
                              proof(
                                goal(weighted_graph(dijkstraGraph, (edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))))),
                                by(fact("dijkstra.pl", clause(3)))
                              ),
                              proof(
                                goal(formula_binary((edge(a, arc(b, 4)), edge(a, arc(c, 2)), edge(b, arc(c, 1)), edge(b, arc(d, 5)), edge(c, arc(d, 8)), edge(c, arc(e, 10)), edge(d, arc(e, 2)), edge(d, arc(f, 6)), edge(e, arc(f, 3))), d, edge, arc(f, 6))),
                                by(builtin(formula_binary, 4))
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(not_member(f, [d, b, c, a])),
                        by(builtin(not_member, 2))
                      ),
                      proof(
                        goal(path(f, f, [f, d, b, c, a], [f], 0)),
                        by(fact("dijkstra.pl", clause(7))),
                        bindings([binding("Goal", f), binding("_Visited", [f, d, b, c, a])])
                      ),
                      proof(
                        goal(add(6, 0, 6)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(5, 6, 11)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(1, 11, 12)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(2, 12, 14)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(le(14, 16)),
        by(builtin(le, 2))
      )
    ])
  )
).

