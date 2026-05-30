oddVertices(eulerian_path_case, []).
why(
  oddVertices(eulerian_path_case, []),
  proof(
    goal(oddVertices(eulerian_path_case, [])), by(rule("eulerian-path.pl", clause(33))),
    bindings([binding("Odds", [])]),
    uses([
      proof(
        goal(odd_vertices([])), by(rule("eulerian-path.pl", clause(25))),
        bindings([binding("Odds", []), binding("Raw", [])]),
        uses([
          proof(goal(findall(V, odd_degree(V), [])), by(builtin(findall, 3))),
          proof(goal(sort([], [])), by(builtin(sort, 2)))
        ])
      )
    ])
  )
).

path(eulerian_path_case, [v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1]).
why(
  path(eulerian_path_case, [v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1]),
  proof(
    goal(path(eulerian_path_case, [v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1])), by(rule("eulerian-path.pl", clause(34))),
    bindings([binding("Path", [v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1])]),
    uses([
      proof(
        goal(once(eulerian_path([v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1]))), by(builtin(once, 1)),
        uses([
          proof(
            goal(eulerian_path([v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1])), by(rule("eulerian-path.pl", clause(30))),
            bindings([binding("Path", [v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1]), binding("Start", v1), binding("Edges", [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46]), binding("ReversedPath", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])]),
            uses([
              proof(
                goal(eulerian_start(v1)), by(rule("eulerian-path.pl", clause(29))),
                bindings([binding("Start", v1), binding("_Rest", [v2, v3, v4, v5, v6])]),
                uses([
                  proof(
                    goal(odd_vertices([])), by(rule("eulerian-path.pl", clause(25))),
                    bindings([binding("Odds", []), binding("Raw", [])]),
                    uses([
                      proof(goal(findall(V, odd_degree(V), [])), by(builtin(findall, 3))),
                      proof(goal(sort([], [])), by(builtin(sort, 2)))
                    ])
                  ),
                  proof(
                    goal(vertices([v1, v2, v3, v4, v5, v6])), by(rule("eulerian-path.pl", clause(27))),
                    bindings([binding("Vertices", [v1, v2, v3, v4, v5, v6]), binding("Raw", [v1, v1, v1, v1, v2, v2, v2, v3, v3, v4, v4, v2, v3, v5, v6, v3, v4, v6, v4, v6, v5, v6])]),
                    uses([
                      proof(goal(findall(V, vertex(V), [v1, v1, v1, v1, v2, v2, v2, v3, v3, v4, v4, v2, v3, v5, v6, v3, v4, v6, v4, v6, v5, v6])), by(builtin(findall, 3))),
                      proof(goal(sort([v1, v1, v1, v1, v2, v2, v2, v3, v3, v4, v4, v2, v3, v5, v6, v3, v4, v6, v4, v6, v5, v6], [v1, v2, v3, v4, v5, v6])), by(builtin(sort, 2)))
                    ])
                  )
                ])
              ),
              proof(
                goal(all_edges([e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])), by(rule("eulerian-path.pl", clause(26))),
                bindings([binding("Edges", [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46]), binding("Raw", [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])]),
                uses([
                  proof(goal(findall(E, edge(E, _A, _B), [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])), by(builtin(findall, 3))),
                  proof(goal(sort([e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46], [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])), by(builtin(sort, 2)))
                ])
              ),
              proof(
                goal(dfs_euler(v1, [v1], [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                bindings([binding("Current", v1), binding("Visited", [v1]), binding("Remaining", [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v2), binding("Edge", e12), binding("NewRemaining", [e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])]),
                uses([
                  proof(
                    goal(adjacent_by_edge(v1, v2, e12)), by(rule("eulerian-path.pl", clause(20))),
                    bindings([binding("V", v1), binding("U", v2), binding("E", e12)]),
                    uses([
                      proof(goal(edge(e12, v1, v2)), by(fact("eulerian-path.pl", clause(5))))
                    ])
                  ),
                  proof(goal(select(e12, [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46], [e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])), by(builtin(select, 3))),
                  proof(
                    goal(dfs_euler(v2, [v2, v1], [e13, e15, e16, e23, e24, e26, e34, e36, e45, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                    bindings([binding("Current", v2), binding("Visited", [v2, v1]), binding("Remaining", [e13, e15, e16, e23, e24, e26, e34, e36, e45, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v3), binding("Edge", e23), binding("NewRemaining", [e13, e15, e16, e24, e26, e34, e36, e45, e46])]),
                    uses([
                      proof(
                        goal(adjacent_by_edge(v2, v3, e23)), by(rule("eulerian-path.pl", clause(20))),
                        bindings([binding("V", v2), binding("U", v3), binding("E", e23)]),
                        uses([
                          proof(goal(edge(e23, v2, v3)), by(fact("eulerian-path.pl", clause(9))))
                        ])
                      ),
                      proof(goal(select(e23, [e13, e15, e16, e23, e24, e26, e34, e36, e45, e46], [e13, e15, e16, e24, e26, e34, e36, e45, e46])), by(builtin(select, 3))),
                      proof(
                        goal(dfs_euler(v3, [v3, v2, v1], [e13, e15, e16, e24, e26, e34, e36, e45, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                        bindings([binding("Current", v3), binding("Visited", [v3, v2, v1]), binding("Remaining", [e13, e15, e16, e24, e26, e34, e36, e45, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v4), binding("Edge", e34), binding("NewRemaining", [e13, e15, e16, e24, e26, e36, e45, e46])]),
                        uses([
                          proof(
                            goal(adjacent_by_edge(v3, v4, e34)), by(rule("eulerian-path.pl", clause(20))),
                            bindings([binding("V", v3), binding("U", v4), binding("E", e34)]),
                            uses([
                              proof(goal(edge(e34, v3, v4)), by(fact("eulerian-path.pl", clause(12))))
                            ])
                          ),
                          proof(goal(select(e34, [e13, e15, e16, e24, e26, e34, e36, e45, e46], [e13, e15, e16, e24, e26, e36, e45, e46])), by(builtin(select, 3))),
                          proof(
                            goal(dfs_euler(v4, [v4, v3, v2, v1], [e13, e15, e16, e24, e26, e36, e45, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                            bindings([binding("Current", v4), binding("Visited", [v4, v3, v2, v1]), binding("Remaining", [e13, e15, e16, e24, e26, e36, e45, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v5), binding("Edge", e45), binding("NewRemaining", [e13, e15, e16, e24, e26, e36, e46])]),
                            uses([
                              proof(
                                goal(adjacent_by_edge(v4, v5, e45)), by(rule("eulerian-path.pl", clause(20))),
                                bindings([binding("V", v4), binding("U", v5), binding("E", e45)]),
                                uses([
                                  proof(goal(edge(e45, v4, v5)), by(fact("eulerian-path.pl", clause(14))))
                                ])
                              ),
                              proof(goal(select(e45, [e13, e15, e16, e24, e26, e36, e45, e46], [e13, e15, e16, e24, e26, e36, e46])), by(builtin(select, 3))),
                              proof(
                                goal(dfs_euler(v5, [v5, v4, v3, v2, v1], [e13, e15, e16, e24, e26, e36, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                                bindings([binding("Current", v5), binding("Visited", [v5, v4, v3, v2, v1]), binding("Remaining", [e13, e15, e16, e24, e26, e36, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v1), binding("Edge", e15), binding("NewRemaining", [e13, e16, e24, e26, e36, e46])]),
                                uses([
                                  proof(
                                    goal(adjacent_by_edge(v5, v1, e15)), by(rule("eulerian-path.pl", clause(21))),
                                    bindings([binding("V", v5), binding("U", v1), binding("E", e15)]),
                                    uses([
                                      proof(goal(edge(e15, v1, v5)), by(fact("eulerian-path.pl", clause(7))))
                                    ])
                                  ),
                                  proof(goal(select(e15, [e13, e15, e16, e24, e26, e36, e46], [e13, e16, e24, e26, e36, e46])), by(builtin(select, 3))),
                                  proof(
                                    goal(dfs_euler(v1, [v1, v5, v4, v3, v2, v1], [e13, e16, e24, e26, e36, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                                    bindings([binding("Current", v1), binding("Visited", [v1, v5, v4, v3, v2, v1]), binding("Remaining", [e13, e16, e24, e26, e36, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v3), binding("Edge", e13), binding("NewRemaining", [e16, e24, e26, e36, e46])]),
                                    uses([
                                      proof(
                                        goal(adjacent_by_edge(v1, v3, e13)), by(rule("eulerian-path.pl", clause(20))),
                                        bindings([binding("V", v1), binding("U", v3), binding("E", e13)]),
                                        uses([
                                          proof(goal(edge(e13, v1, v3)), by(fact("eulerian-path.pl", clause(6))))
                                        ])
                                      ),
                                      proof(goal(select(e13, [e13, e16, e24, e26, e36, e46], [e16, e24, e26, e36, e46])), by(builtin(select, 3))),
                                      proof(
                                        goal(dfs_euler(v3, [v3, v1, v5, v4, v3, v2, v1], [e16, e24, e26, e36, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                                        bindings([binding("Current", v3), binding("Visited", [v3, v1, v5, v4, v3, v2, v1]), binding("Remaining", [e16, e24, e26, e36, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v6), binding("Edge", e36), binding("NewRemaining", [e16, e24, e26, e46])]),
                                        uses([
                                          proof(
                                            goal(adjacent_by_edge(v3, v6, e36)), by(rule("eulerian-path.pl", clause(20))),
                                            bindings([binding("V", v3), binding("U", v6), binding("E", e36)]),
                                            uses([
                                              proof(goal(edge(e36, v3, v6)), by(fact("eulerian-path.pl", clause(13))))
                                            ])
                                          ),
                                          proof(goal(select(e36, [e16, e24, e26, e36, e46], [e16, e24, e26, e46])), by(builtin(select, 3))),
                                          proof(
                                            goal(dfs_euler(v6, [v6, v3, v1, v5, v4, v3, v2, v1], [e16, e24, e26, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                                            bindings([binding("Current", v6), binding("Visited", [v6, v3, v1, v5, v4, v3, v2, v1]), binding("Remaining", [e16, e24, e26, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v2), binding("Edge", e26), binding("NewRemaining", [e16, e24, e46])]),
                                            uses([
                                              proof(
                                                goal(adjacent_by_edge(v6, v2, e26)), by(rule("eulerian-path.pl", clause(21))),
                                                bindings([binding("V", v6), binding("U", v2), binding("E", e26)]),
                                                uses([
                                                  proof(goal(edge(e26, v2, v6)), by(fact("eulerian-path.pl", clause(11))))
                                                ])
                                              ),
                                              proof(goal(select(e26, [e16, e24, e26, e46], [e16, e24, e46])), by(builtin(select, 3))),
                                              proof(
                                                goal(dfs_euler(v2, [v2, v6, v3, v1, v5, v4, v3, v2, v1], [e16, e24, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                                                bindings([binding("Current", v2), binding("Visited", [v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Remaining", [e16, e24, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v4), binding("Edge", e24), binding("NewRemaining", [e16, e46])]),
                                                uses([
                                                  proof(
                                                    goal(adjacent_by_edge(v2, v4, e24)), by(rule("eulerian-path.pl", clause(20))),
                                                    bindings([binding("V", v2), binding("U", v4), binding("E", e24)]),
                                                    uses([
                                                      proof(goal(edge(e24, v2, v4)), by(fact("eulerian-path.pl", clause(10))))
                                                    ])
                                                  ),
                                                  proof(goal(select(e24, [e16, e24, e46], [e16, e46])), by(builtin(select, 3))),
                                                  proof(
                                                    goal(dfs_euler(v4, [v4, v2, v6, v3, v1, v5, v4, v3, v2, v1], [e16, e46], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                                                    bindings([binding("Current", v4), binding("Visited", [v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Remaining", [e16, e46]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v6), binding("Edge", e46), binding("NewRemaining", [e16])]),
                                                    uses([
                                                      proof(
                                                        goal(adjacent_by_edge(v4, v6, e46)), by(rule("eulerian-path.pl", clause(20))),
                                                        bindings([binding("V", v4), binding("U", v6), binding("E", e46)]),
                                                        uses([
                                                          proof(goal(edge(e46, v4, v6)), by(fact("eulerian-path.pl", clause(15))))
                                                        ])
                                                      ),
                                                      proof(goal(select(e46, [e16, e46], [e16])), by(builtin(select, 3))),
                                                      proof(
                                                        goal(dfs_euler(v6, [v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1], [e16], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(rule("eulerian-path.pl", clause(32))),
                                                        bindings([binding("Current", v6), binding("Visited", [v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Remaining", [e16]), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1]), binding("Next", v1), binding("Edge", e16), binding("NewRemaining", [])]),
                                                        uses([
                                                          proof(
                                                            goal(adjacent_by_edge(v6, v1, e16)), by(rule("eulerian-path.pl", clause(21))),
                                                            bindings([binding("V", v6), binding("U", v1), binding("E", e16)]),
                                                            uses([
                                                              proof(goal(edge(e16, v1, v6)), by(fact("eulerian-path.pl", clause(8))))
                                                            ])
                                                          ),
                                                          proof(goal(select(e16, [e16], [])), by(builtin(select, 3))),
                                                          proof(
                                                            goal(dfs_euler(v1, [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1], [], [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])), by(fact("eulerian-path.pl", clause(31))),
                                                            bindings([binding("_Current", v1), binding("Path", [v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1])])
                                                          )
                                                        ])
                                                      )
                                                    ])
                                                  )
                                                ])
                                              )
                                            ])
                                          )
                                        ])
                                      )
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(goal(reverse([v1, v6, v4, v2, v6, v3, v1, v5, v4, v3, v2, v1], [v1, v2, v3, v4, v5, v1, v3, v6, v2, v4, v6, v1])), by(builtin(reverse, 2)))
            ])
          )
        ])
      )
    ])
  )
).

edgeCount(eulerian_path_case, 11).
why(
  edgeCount(eulerian_path_case, 11),
  proof(
    goal(edgeCount(eulerian_path_case, 11)), by(rule("eulerian-path.pl", clause(35))),
    bindings([binding("Count", 11), binding("Edges", [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])]),
    uses([
      proof(
        goal(all_edges([e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])), by(rule("eulerian-path.pl", clause(26))),
        bindings([binding("Edges", [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46]), binding("Raw", [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])]),
        uses([
          proof(goal(findall(E, edge(E, _A, _B), [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])), by(builtin(findall, 3))),
          proof(goal(sort([e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46], [e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46])), by(builtin(sort, 2)))
        ])
      ),
      proof(goal(length([e12, e13, e15, e16, e23, e24, e26, e34, e36, e45, e46], 11)), by(builtin(length, 2)))
    ])
  )
).

