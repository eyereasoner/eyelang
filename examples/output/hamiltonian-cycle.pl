status(hamiltonian_cycle, exists).
why(
  status(hamiltonian_cycle, exists),
  proof(
    goal(status(hamiltonian_cycle, exists)),
    by(rule("hamiltonian-cycle.pl", clause(26))),
    bindings([binding("_Cycle", [a, b, c, d, e, f, g, h, a])]),
    uses([
      proof(
        goal(once(hamiltonian_cycle([a, b, c, d, e, f, g, h, a]))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(hamiltonian_cycle([a, b, c, d, e, f, g, h, a])),
            by(rule("hamiltonian-cycle.pl", clause(25))),
            bindings([binding("Cycle", [a, b, c, d, e, f, g, h, a]), binding("Vertices", [a, b, c, d, e, f, g, h])]),
            uses([
              proof(
                goal(vertices([a, b, c, d, e, f, g, h])),
                by(fact("hamiltonian-cycle.pl", clause(24)))
              ),
              proof(
                goal(hamiltonian_cycle(edge, [a, b, c, d, e, f, g, h], [a, b, c, d, e, f, g, h, a])),
                by(builtin(hamiltonian_cycle, 3))
              )
            ])
          )
        ])
      )
    ])
  )
).

witness(hamiltonian_cycle, [a, b, c, d, e, f, g, h, a]).
why(
  witness(hamiltonian_cycle, [a, b, c, d, e, f, g, h, a]),
  proof(
    goal(witness(hamiltonian_cycle, [a, b, c, d, e, f, g, h, a])),
    by(rule("hamiltonian-cycle.pl", clause(27))),
    bindings([binding("Cycle", [a, b, c, d, e, f, g, h, a])]),
    uses([
      proof(
        goal(once(hamiltonian_cycle([a, b, c, d, e, f, g, h, a]))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(hamiltonian_cycle([a, b, c, d, e, f, g, h, a])),
            by(rule("hamiltonian-cycle.pl", clause(25))),
            bindings([binding("Cycle", [a, b, c, d, e, f, g, h, a]), binding("Vertices", [a, b, c, d, e, f, g, h])]),
            uses([
              proof(
                goal(vertices([a, b, c, d, e, f, g, h])),
                by(fact("hamiltonian-cycle.pl", clause(24)))
              ),
              proof(
                goal(hamiltonian_cycle(edge, [a, b, c, d, e, f, g, h], [a, b, c, d, e, f, g, h, a])),
                by(builtin(hamiltonian_cycle, 3))
              )
            ])
          )
        ])
      )
    ])
  )
).

vertexCount(hamiltonian_cycle, 8).
why(
  vertexCount(hamiltonian_cycle, 8),
  proof(
    goal(vertexCount(hamiltonian_cycle, 8)),
    by(rule("hamiltonian-cycle.pl", clause(28))),
    bindings([binding("Count", 8), binding("Vertices", [a, b, c, d, e, f, g, h])]),
    uses([
      proof(
        goal(vertices([a, b, c, d, e, f, g, h])),
        by(fact("hamiltonian-cycle.pl", clause(24)))
      ),
      proof(
        goal(length([a, b, c, d, e, f, g, h], 8)),
        by(builtin(length, 2))
      )
    ])
  )
).

cycleCountFromA(hamiltonian_cycle, 72).
why(
  cycleCountFromA(hamiltonian_cycle, 72),
  proof(
    goal(cycleCountFromA(hamiltonian_cycle, 72)),
    by(rule("hamiltonian-cycle.pl", clause(29))),
    bindings([binding("Count", 72), binding("Cycles", [[a, b, c, d, e, f, g, h, a], [a, b, c, e, d, h, g, f, a], [a, b, c, e, f, g, d, h, a], [a, b, c, g, f, e, d, h, a], [a, b, c, g, h, d, e, f, a], [a, b, d, c, e, f, g, h, a], [a, b, d, h, g, c, e, f, a], [a, b, g, f, e, c, d, h, a], [a, b, g, h, d, c, e, f, a], [a, b, h, d, c, e, f, g, a], [a, b, h, d, e, c, g, f, a], [a, b, h, d, g, c, e, f, a], [a, b, h, g, c, d, e, f, a], [a, b, h, g, d, c, e, f, a], [a, f, e, c, b, d, g, h, a], [a, f, e, c, b, d, h, g, a], [a, f, e, c, b, g, d, h, a], [a, f, e, c, b, h, d, g, a], [a, f, e, c, d, b, g, h, a], [a, f, e, c, d, b, h, g, a], [a, f, e, c, d, g, b, h, a], [a, f, e, c, d, g, h, b, a], [a, f, e, c, d, h, b, g, a], [a, f, e, c, d, h, g, b, a], [a, f, e, c, g, b, d, h, a], [a, f, e, c, g, d, b, h, a], [a, f, e, c, g, d, h, b, a], [a, f, e, c, g, h, d, b, a], [a, f, e, d, b, c, g, h, a], [a, f, e, d, c, b, g, h, a], [a, f, e, d, c, b, h, g, a], [a, f, e, d, c, g, b, h, a], [a, f, e, d, c, g, h, b, a], [a, f, e, d, g, c, b, h, a], [a, f, e, d, h, b, c, g, a], [a, f, e, d, h, g, c, b, a], [a, f, g, b, c, e, d, h, a], [a, f, g, c, e, d, b, h, a], [a, f, g, c, e, d, h, b, a], [a, f, g, d, e, c, b, h, a], [a, f, g, h, d, e, c, b, a], [a, g, b, h, d, c, e, f, a], [a, g, c, b, h, d, e, f, a], [a, g, d, h, b, c, e, f, a], [a, g, f, e, c, b, d, h, a], [a, g, f, e, c, d, b, h, a], [a, g, f, e, c, d, h, b, a], [a, g, f, e, d, c, b, h, a], [a, g, h, b, c, d, e, f, a], [a, g, h, b, d, c, e, f, a], [a, g, h, d, b, c, e, f, a], [a, h, b, c, d, e, f, g, a], [a, h, b, c, e, d, g, f, a], [a, h, b, c, g, d, e, f, a], [a, h, b, d, c, e, f, g, a], [a, h, b, d, e, c, g, f, a], [a, h, b, d, g, c, e, f, a], [a, h, b, g, c, d, e, f, a], [a, h, b, g, d, c, e, f, a], [a, h, d, b, c, e, f, g, a], [a, h, d, b, g, c, e, f, a], [a, h, d, c, e, f, g, b, a], [a, h, d, e, c, b, g, f, a], [a, h, d, e, f, g, c, b, a], [a, h, d, g, b, c, e, f, a], [a, h, d, g, f, e, c, b, a], [a, h, g, b, c, d, e, f, a], [a, h, g, b, d, c, e, f, a], [a, h, g, c, b, d, e, f, a], [a, h, g, d, b, c, e, f, a], [a, h, g, f, e, c, d, b, a], [a, h, g, f, e, d, c, b, a]])]),
    uses([
      proof(
        goal(findall(Cycle, hamiltonian_cycle(Cycle), [[a, b, c, d, e, f, g, h, a], [a, b, c, e, d, h, g, f, a], [a, b, c, e, f, g, d, h, a], [a, b, c, g, f, e, d, h, a], [a, b, c, g, h, d, e, f, a], [a, b, d, c, e, f, g, h, a], [a, b, d, h, g, c, e, f, a], [a, b, g, f, e, c, d, h, a], [a, b, g, h, d, c, e, f, a], [a, b, h, d, c, e, f, g, a], [a, b, h, d, e, c, g, f, a], [a, b, h, d, g, c, e, f, a], [a, b, h, g, c, d, e, f, a], [a, b, h, g, d, c, e, f, a], [a, f, e, c, b, d, g, h, a], [a, f, e, c, b, d, h, g, a], [a, f, e, c, b, g, d, h, a], [a, f, e, c, b, h, d, g, a], [a, f, e, c, d, b, g, h, a], [a, f, e, c, d, b, h, g, a], [a, f, e, c, d, g, b, h, a], [a, f, e, c, d, g, h, b, a], [a, f, e, c, d, h, b, g, a], [a, f, e, c, d, h, g, b, a], [a, f, e, c, g, b, d, h, a], [a, f, e, c, g, d, b, h, a], [a, f, e, c, g, d, h, b, a], [a, f, e, c, g, h, d, b, a], [a, f, e, d, b, c, g, h, a], [a, f, e, d, c, b, g, h, a], [a, f, e, d, c, b, h, g, a], [a, f, e, d, c, g, b, h, a], [a, f, e, d, c, g, h, b, a], [a, f, e, d, g, c, b, h, a], [a, f, e, d, h, b, c, g, a], [a, f, e, d, h, g, c, b, a], [a, f, g, b, c, e, d, h, a], [a, f, g, c, e, d, b, h, a], [a, f, g, c, e, d, h, b, a], [a, f, g, d, e, c, b, h, a], [a, f, g, h, d, e, c, b, a], [a, g, b, h, d, c, e, f, a], [a, g, c, b, h, d, e, f, a], [a, g, d, h, b, c, e, f, a], [a, g, f, e, c, b, d, h, a], [a, g, f, e, c, d, b, h, a], [a, g, f, e, c, d, h, b, a], [a, g, f, e, d, c, b, h, a], [a, g, h, b, c, d, e, f, a], [a, g, h, b, d, c, e, f, a], [a, g, h, d, b, c, e, f, a], [a, h, b, c, d, e, f, g, a], [a, h, b, c, e, d, g, f, a], [a, h, b, c, g, d, e, f, a], [a, h, b, d, c, e, f, g, a], [a, h, b, d, e, c, g, f, a], [a, h, b, d, g, c, e, f, a], [a, h, b, g, c, d, e, f, a], [a, h, b, g, d, c, e, f, a], [a, h, d, b, c, e, f, g, a], [a, h, d, b, g, c, e, f, a], [a, h, d, c, e, f, g, b, a], [a, h, d, e, c, b, g, f, a], [a, h, d, e, f, g, c, b, a], [a, h, d, g, b, c, e, f, a], [a, h, d, g, f, e, c, b, a], [a, h, g, b, c, d, e, f, a], [a, h, g, b, d, c, e, f, a], [a, h, g, c, b, d, e, f, a], [a, h, g, d, b, c, e, f, a], [a, h, g, f, e, c, d, b, a], [a, h, g, f, e, d, c, b, a]])),
        by(builtin(findall, 3))
      ),
      proof(
        goal(length([[a, b, c, d, e, f, g, h, a], [a, b, c, e, d, h, g, f, a], [a, b, c, e, f, g, d, h, a], [a, b, c, g, f, e, d, h, a], [a, b, c, g, h, d, e, f, a], [a, b, d, c, e, f, g, h, a], [a, b, d, h, g, c, e, f, a], [a, b, g, f, e, c, d, h, a], [a, b, g, h, d, c, e, f, a], [a, b, h, d, c, e, f, g, a], [a, b, h, d, e, c, g, f, a], [a, b, h, d, g, c, e, f, a], [a, b, h, g, c, d, e, f, a], [a, b, h, g, d, c, e, f, a], [a, f, e, c, b, d, g, h, a], [a, f, e, c, b, d, h, g, a], [a, f, e, c, b, g, d, h, a], [a, f, e, c, b, h, d, g, a], [a, f, e, c, d, b, g, h, a], [a, f, e, c, d, b, h, g, a], [a, f, e, c, d, g, b, h, a], [a, f, e, c, d, g, h, b, a], [a, f, e, c, d, h, b, g, a], [a, f, e, c, d, h, g, b, a], [a, f, e, c, g, b, d, h, a], [a, f, e, c, g, d, b, h, a], [a, f, e, c, g, d, h, b, a], [a, f, e, c, g, h, d, b, a], [a, f, e, d, b, c, g, h, a], [a, f, e, d, c, b, g, h, a], [a, f, e, d, c, b, h, g, a], [a, f, e, d, c, g, b, h, a], [a, f, e, d, c, g, h, b, a], [a, f, e, d, g, c, b, h, a], [a, f, e, d, h, b, c, g, a], [a, f, e, d, h, g, c, b, a], [a, f, g, b, c, e, d, h, a], [a, f, g, c, e, d, b, h, a], [a, f, g, c, e, d, h, b, a], [a, f, g, d, e, c, b, h, a], [a, f, g, h, d, e, c, b, a], [a, g, b, h, d, c, e, f, a], [a, g, c, b, h, d, e, f, a], [a, g, d, h, b, c, e, f, a], [a, g, f, e, c, b, d, h, a], [a, g, f, e, c, d, b, h, a], [a, g, f, e, c, d, h, b, a], [a, g, f, e, d, c, b, h, a], [a, g, h, b, c, d, e, f, a], [a, g, h, b, d, c, e, f, a], [a, g, h, d, b, c, e, f, a], [a, h, b, c, d, e, f, g, a], [a, h, b, c, e, d, g, f, a], [a, h, b, c, g, d, e, f, a], [a, h, b, d, c, e, f, g, a], [a, h, b, d, e, c, g, f, a], [a, h, b, d, g, c, e, f, a], [a, h, b, g, c, d, e, f, a], [a, h, b, g, d, c, e, f, a], [a, h, d, b, c, e, f, g, a], [a, h, d, b, g, c, e, f, a], [a, h, d, c, e, f, g, b, a], [a, h, d, e, c, b, g, f, a], [a, h, d, e, f, g, c, b, a], [a, h, d, g, b, c, e, f, a], [a, h, d, g, f, e, c, b, a], [a, h, g, b, c, d, e, f, a], [a, h, g, b, d, c, e, f, a], [a, h, g, c, b, d, e, f, a], [a, h, g, d, b, c, e, f, a], [a, h, g, f, e, c, d, b, a], [a, h, g, f, e, d, c, b, a]], 72)),
        by(builtin(length, 2))
      )
    ])
  )
).

