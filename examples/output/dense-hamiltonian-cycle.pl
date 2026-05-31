best(dense_hamiltonian_cycle, result(52, [a, b, c, d, e, f, g, h, a])).
why(
  best(dense_hamiltonian_cycle, result(52, [a, b, c, d, e, f, g, h, a])),
  proof(
    goal(best(dense_hamiltonian_cycle, result(52, [a, b, c, d, e, f, g, h, a]))), by(rule("dense-hamiltonian-cycle.pl", clause(46))),
    bindings([binding("Cost", 52), binding("Cycle", [a, b, c, d, e, f, g, h, a]), binding("Cities", [a, b, c, d, e, f, g, h]), binding("_Key", [52, [a, b, c, d, e, f, g, h, a]])]),
    uses([
      proof(goal(cities([a, b, c, d, e, f, g, h])), by(fact("dense-hamiltonian-cycle.pl", clause(5)))),
      proof(goal(aggregate_min([52, [a, b, c, d, e, f, g, h, a]], result(52, [a, b, c, d, e, f, g, h, a]), candidate_cycle([a, b, c, d, e, f, g, h], [a, b, c, d, e, f, g, h, a], 52), [52, [a, b, c, d, e, f, g, h, a]], result(52, [a, b, c, d, e, f, g, h, a]))), by(builtin(aggregate_min, 5)))
    ])
  )
).

candidateCount(dense_hamiltonian_cycle, 2520).
why(
  candidateCount(dense_hamiltonian_cycle, 2520),
  proof(
    goal(candidateCount(dense_hamiltonian_cycle, 2520)), by(rule("dense-hamiltonian-cycle.pl", clause(47))),
    bindings([binding("Count", 2520), binding("_Start", a), binding("Rest", [b, c, d, e, f, g, h]), binding("N", 7), binding("Permutations", 5040)]),
    uses([
      proof(goal(cities([a, b, c, d, e, f, g, h])), by(fact("dense-hamiltonian-cycle.pl", clause(5)))),
      proof(goal(length([b, c, d, e, f, g, h], 7)), by(builtin(length, 2))),
      proof(
        goal(factorial(7, 5040)), by(rule("dense-hamiltonian-cycle.pl", clause(45))),
        bindings([binding("N", 7), binding("F", 5040), binding("N0", 6), binding("F0", 720)]),
        uses([
          proof(goal(gt(7, 0)), by(builtin(gt, 2))),
          proof(goal(sub(7, 1, 6)), by(builtin(sub, 3))),
          proof(
            goal(factorial(6, 720)), by(rule("dense-hamiltonian-cycle.pl", clause(45))),
            bindings([binding("N", 6), binding("F", 720), binding("N0", 5), binding("F0", 120)]),
            uses([
              proof(goal(gt(6, 0)), by(builtin(gt, 2))),
              proof(goal(sub(6, 1, 5)), by(builtin(sub, 3))),
              proof(
                goal(factorial(5, 120)), by(rule("dense-hamiltonian-cycle.pl", clause(45))),
                bindings([binding("N", 5), binding("F", 120), binding("N0", 4), binding("F0", 24)]),
                uses([
                  proof(goal(gt(5, 0)), by(builtin(gt, 2))),
                  proof(goal(sub(5, 1, 4)), by(builtin(sub, 3))),
                  proof(
                    goal(factorial(4, 24)), by(rule("dense-hamiltonian-cycle.pl", clause(45))),
                    bindings([binding("N", 4), binding("F", 24), binding("N0", 3), binding("F0", 6)]),
                    uses([
                      proof(goal(gt(4, 0)), by(builtin(gt, 2))),
                      proof(goal(sub(4, 1, 3)), by(builtin(sub, 3))),
                      proof(
                        goal(factorial(3, 6)), by(rule("dense-hamiltonian-cycle.pl", clause(45))),
                        bindings([binding("N", 3), binding("F", 6), binding("N0", 2), binding("F0", 2)]),
                        uses([
                          proof(goal(gt(3, 0)), by(builtin(gt, 2))),
                          proof(goal(sub(3, 1, 2)), by(builtin(sub, 3))),
                          proof(
                            goal(factorial(2, 2)), by(rule("dense-hamiltonian-cycle.pl", clause(45))),
                            bindings([binding("N", 2), binding("F", 2), binding("N0", 1), binding("F0", 1)]),
                            uses([
                              proof(goal(gt(2, 0)), by(builtin(gt, 2))),
                              proof(goal(sub(2, 1, 1)), by(builtin(sub, 3))),
                              proof(
                                goal(factorial(1, 1)), by(rule("dense-hamiltonian-cycle.pl", clause(45))),
                                bindings([binding("N", 1), binding("F", 1), binding("N0", 0), binding("F0", 1)]),
                                uses([
                                  proof(goal(gt(1, 0)), by(builtin(gt, 2))),
                                  proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                                  proof(goal(factorial(0, 1)), by(fact("dense-hamiltonian-cycle.pl", clause(44)))),
                                  proof(goal(mul(1, 1, 1)), by(builtin(mul, 3)))
                                ])
                              ),
                              proof(goal(mul(2, 1, 2)), by(builtin(mul, 3)))
                            ])
                          ),
                          proof(goal(mul(3, 2, 6)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(mul(4, 6, 24)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(mul(5, 24, 120)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(mul(6, 120, 720)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(mul(7, 720, 5040)), by(builtin(mul, 3)))
        ])
      ),
      proof(goal(div(5040, 2, 2520)), by(builtin(div, 3)))
    ])
  )
).

status(dense_hamiltonian_cycle, symmetry_broken_complete_graph_searched).
why(
  status(dense_hamiltonian_cycle, symmetry_broken_complete_graph_searched),
  proof(
    goal(status(dense_hamiltonian_cycle, symmetry_broken_complete_graph_searched)), by(rule("dense-hamiltonian-cycle.pl", clause(48))),
    uses([
      proof(goal(eq(ok, ok)), by(builtin(eq, 2)))
    ])
  )
).

reason(dense_hamiltonian_cycle, "symmetry-broken permutation search scores Hamiltonian cycles and aggregate_min selects the cheapest candidate").
why(
  reason(dense_hamiltonian_cycle, "symmetry-broken permutation search scores Hamiltonian cycles and aggregate_min selects the cheapest candidate"),
  proof(
    goal(reason(dense_hamiltonian_cycle, "symmetry-broken permutation search scores Hamiltonian cycles and aggregate_min selects the cheapest candidate")), by(rule("dense-hamiltonian-cycle.pl", clause(49))),
    uses([
      proof(goal(eq(ok, ok)), by(builtin(eq, 2)))
    ])
  )
).

