hasHamiltonianPath(graph, true).
why(
  hasHamiltonianPath(graph, true),
  proof(
    goal(hasHamiltonianPath(graph, true)),
    by(rule("hamiltonian-path.pl", clause(24))),
    bindings([binding("_Path", [v1, v2, v3, v6, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v2, v3, v6, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v2), binding("C", v3), binding("D", v6), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v2, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1, v2, v3, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v2, v3, v6, v4, v5]).
why(
  hamiltonianPath(graph, [v1, v2, v3, v6, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v1, v2, v3, v6, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v2, v3, v6, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v2, v3, v6, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v2), binding("C", v3), binding("D", v6), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v2, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1, v2, v3, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v2, v6, v3, v4, v5]).
why(
  hamiltonianPath(graph, [v1, v2, v6, v3, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v1, v2, v6, v3, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v2, v6, v3, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v2, v6, v3, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v2), binding("C", v6), binding("D", v3), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v2, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1, v2, v6, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v3, v2, v6, v4, v5]).
why(
  hamiltonianPath(graph, [v1, v3, v2, v6, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v1, v3, v2, v6, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v3, v2, v6, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v3, v2, v6, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v3), binding("C", v2), binding("D", v6), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v3, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1, v3, v2, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v3, v6, v2, v4, v5]).
why(
  hamiltonianPath(graph, [v1, v3, v6, v2, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v1, v3, v6, v2, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v3, v6, v2, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v3, v6, v2, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v3), binding("C", v6), binding("D", v2), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v3, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1, v3, v6, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v5, v4, v2, v3, v6]).
why(
  hamiltonianPath(graph, [v1, v5, v4, v2, v3, v6]),
  proof(
    goal(hamiltonianPath(graph, [v1, v5, v4, v2, v3, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v5, v4, v2, v3, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v5, v4, v2, v3, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v5), binding("C", v4), binding("D", v2), binding("E", v3), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v5, v4, v2, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v5, v4, v2, v6, v3]).
why(
  hamiltonianPath(graph, [v1, v5, v4, v2, v6, v3]),
  proof(
    goal(hamiltonianPath(graph, [v1, v5, v4, v2, v6, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v5, v4, v2, v6, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v5, v4, v2, v6, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v5), binding("C", v4), binding("D", v2), binding("E", v6), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v5, v4, v2, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v5, v4, v3, v2, v6]).
why(
  hamiltonianPath(graph, [v1, v5, v4, v3, v2, v6]),
  proof(
    goal(hamiltonianPath(graph, [v1, v5, v4, v3, v2, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v5, v4, v3, v2, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v5, v4, v3, v2, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v5), binding("C", v4), binding("D", v3), binding("E", v2), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v5, v4, v3, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v5, v4, v3, v6, v2]).
why(
  hamiltonianPath(graph, [v1, v5, v4, v3, v6, v2]),
  proof(
    goal(hamiltonianPath(graph, [v1, v5, v4, v3, v6, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v5, v4, v3, v6, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v5, v4, v3, v6, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v5), binding("C", v4), binding("D", v3), binding("E", v6), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v5, v4, v3, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v5, v4, v6, v2, v3]).
why(
  hamiltonianPath(graph, [v1, v5, v4, v6, v2, v3]),
  proof(
    goal(hamiltonianPath(graph, [v1, v5, v4, v6, v2, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v5, v4, v6, v2, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v5, v4, v6, v2, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v5), binding("C", v4), binding("D", v6), binding("E", v2), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v5, v4, v6, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v5, v4, v6, v3, v2]).
why(
  hamiltonianPath(graph, [v1, v5, v4, v6, v3, v2]),
  proof(
    goal(hamiltonianPath(graph, [v1, v5, v4, v6, v3, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v5, v4, v6, v3, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v5, v4, v6, v3, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v5), binding("C", v4), binding("D", v6), binding("E", v3), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v5, v4, v6, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v6, v2, v3, v4, v5]).
why(
  hamiltonianPath(graph, [v1, v6, v2, v3, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v1, v6, v2, v3, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v6, v2, v3, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v6, v2, v3, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v6), binding("C", v2), binding("D", v3), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v6, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1, v6, v2, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v1, v6, v3, v2, v4, v5]).
why(
  hamiltonianPath(graph, [v1, v6, v3, v2, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v1, v6, v3, v2, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v1, v6, v3, v2, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v1, v6, v3, v2, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v1), binding("B", v6), binding("C", v3), binding("D", v2), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v1, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v1, v6, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v1, v6, v3, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v1, v3, v6, v4, v5]).
why(
  hamiltonianPath(graph, [v2, v1, v3, v6, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v1, v3, v6, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v1, v3, v6, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v1, v3, v6, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v1), binding("C", v3), binding("D", v6), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v1, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v1, v3, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v1, v5, v4, v3, v6]).
why(
  hamiltonianPath(graph, [v2, v1, v5, v4, v3, v6]),
  proof(
    goal(hamiltonianPath(graph, [v2, v1, v5, v4, v3, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v1, v5, v4, v3, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v1, v5, v4, v3, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v1), binding("C", v5), binding("D", v4), binding("E", v3), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v1, v5, v4, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v1, v5, v4, v6, v3]).
why(
  hamiltonianPath(graph, [v2, v1, v5, v4, v6, v3]),
  proof(
    goal(hamiltonianPath(graph, [v2, v1, v5, v4, v6, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v1, v5, v4, v6, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v1, v5, v4, v6, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v1), binding("C", v5), binding("D", v4), binding("E", v6), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v1, v5, v4, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v1, v6, v3, v4, v5]).
why(
  hamiltonianPath(graph, [v2, v1, v6, v3, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v1, v6, v3, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v1, v6, v3, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v1, v6, v3, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v1), binding("C", v6), binding("D", v3), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v1, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v1, v6, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v3, v1, v5, v4, v6]).
why(
  hamiltonianPath(graph, [v2, v3, v1, v5, v4, v6]),
  proof(
    goal(hamiltonianPath(graph, [v2, v3, v1, v5, v4, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v3, v1, v5, v4, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v3, v1, v5, v4, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v3), binding("C", v1), binding("D", v5), binding("E", v4), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v3, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v3, v1, v5, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v3, v1, v6, v4, v5]).
why(
  hamiltonianPath(graph, [v2, v3, v1, v6, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v3, v1, v6, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v3, v1, v6, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v3, v1, v6, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v3), binding("C", v1), binding("D", v6), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v3, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v3, v1, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v3, v4, v5, v1, v6]).
why(
  hamiltonianPath(graph, [v2, v3, v4, v5, v1, v6]),
  proof(
    goal(hamiltonianPath(graph, [v2, v3, v4, v5, v1, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v3, v4, v5, v1, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v3, v4, v5, v1, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v3), binding("C", v4), binding("D", v5), binding("E", v1), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v3, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v3, v4, v5, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v3, v4, v6, v1, v5]).
why(
  hamiltonianPath(graph, [v2, v3, v4, v6, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v3, v4, v6, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v3, v4, v6, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v3, v4, v6, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v3), binding("C", v4), binding("D", v6), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v3, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v3, v4, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v3, v6, v1, v5, v4]).
why(
  hamiltonianPath(graph, [v2, v3, v6, v1, v5, v4]),
  proof(
    goal(hamiltonianPath(graph, [v2, v3, v6, v1, v5, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v3, v6, v1, v5, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v3, v6, v1, v5, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v3), binding("C", v6), binding("D", v1), binding("E", v5), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v3, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v3, v6, v1, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v3, v6, v4, v5, v1]).
why(
  hamiltonianPath(graph, [v2, v3, v6, v4, v5, v1]),
  proof(
    goal(hamiltonianPath(graph, [v2, v3, v6, v4, v5, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v3, v6, v4, v5, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v3, v6, v4, v5, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v3), binding("C", v6), binding("D", v4), binding("E", v5), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v3, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v3, v6, v4, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v4, v3, v6, v1, v5]).
why(
  hamiltonianPath(graph, [v2, v4, v3, v6, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v4, v3, v6, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v4, v3, v6, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v4, v3, v6, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v4), binding("C", v3), binding("D", v6), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v4, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v4, v3, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v4, v5, v1, v3, v6]).
why(
  hamiltonianPath(graph, [v2, v4, v5, v1, v3, v6]),
  proof(
    goal(hamiltonianPath(graph, [v2, v4, v5, v1, v3, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v4, v5, v1, v3, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v4, v5, v1, v3, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v4), binding("C", v5), binding("D", v1), binding("E", v3), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v4, v5, v1, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v4, v5, v1, v6, v3]).
why(
  hamiltonianPath(graph, [v2, v4, v5, v1, v6, v3]),
  proof(
    goal(hamiltonianPath(graph, [v2, v4, v5, v1, v6, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v4, v5, v1, v6, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v4, v5, v1, v6, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v4), binding("C", v5), binding("D", v1), binding("E", v6), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v4, v5, v1, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v4, v6, v3, v1, v5]).
why(
  hamiltonianPath(graph, [v2, v4, v6, v3, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v4, v6, v3, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v4, v6, v3, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v4, v6, v3, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v4), binding("C", v6), binding("D", v3), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v4, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v4, v6, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v6, v1, v3, v4, v5]).
why(
  hamiltonianPath(graph, [v2, v6, v1, v3, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v6, v1, v3, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v6, v1, v3, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v6, v1, v3, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v6), binding("C", v1), binding("D", v3), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v6, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v6, v1, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v6, v1, v5, v4, v3]).
why(
  hamiltonianPath(graph, [v2, v6, v1, v5, v4, v3]),
  proof(
    goal(hamiltonianPath(graph, [v2, v6, v1, v5, v4, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v6, v1, v5, v4, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v6, v1, v5, v4, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v6), binding("C", v1), binding("D", v5), binding("E", v4), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v6, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v6, v1, v5, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v6, v3, v1, v5, v4]).
why(
  hamiltonianPath(graph, [v2, v6, v3, v1, v5, v4]),
  proof(
    goal(hamiltonianPath(graph, [v2, v6, v3, v1, v5, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v6, v3, v1, v5, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v6, v3, v1, v5, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v6), binding("C", v3), binding("D", v1), binding("E", v5), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v6, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v6, v3, v1, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v6, v3, v4, v5, v1]).
why(
  hamiltonianPath(graph, [v2, v6, v3, v4, v5, v1]),
  proof(
    goal(hamiltonianPath(graph, [v2, v6, v3, v4, v5, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v6, v3, v4, v5, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v6, v3, v4, v5, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v6), binding("C", v3), binding("D", v4), binding("E", v5), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v6, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v6, v3, v4, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v6, v4, v3, v1, v5]).
why(
  hamiltonianPath(graph, [v2, v6, v4, v3, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v2, v6, v4, v3, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v6, v4, v3, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v6, v4, v3, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v6), binding("C", v4), binding("D", v3), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v6, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v6, v4, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v2, v6, v4, v5, v1, v3]).
why(
  hamiltonianPath(graph, [v2, v6, v4, v5, v1, v3]),
  proof(
    goal(hamiltonianPath(graph, [v2, v6, v4, v5, v1, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v2, v6, v4, v5, v1, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v2, v6, v4, v5, v1, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v2), binding("B", v6), binding("C", v4), binding("D", v5), binding("E", v1), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v2, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v2, v6, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v2, v6, v4, v5, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v1, v2, v6, v4, v5]).
why(
  hamiltonianPath(graph, [v3, v1, v2, v6, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v1, v2, v6, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v1, v2, v6, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v1, v2, v6, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v1), binding("C", v2), binding("D", v6), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v1, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v1, v2, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v1, v5, v4, v2, v6]).
why(
  hamiltonianPath(graph, [v3, v1, v5, v4, v2, v6]),
  proof(
    goal(hamiltonianPath(graph, [v3, v1, v5, v4, v2, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v1, v5, v4, v2, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v1, v5, v4, v2, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v1), binding("C", v5), binding("D", v4), binding("E", v2), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v1, v5, v4, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v1, v5, v4, v6, v2]).
why(
  hamiltonianPath(graph, [v3, v1, v5, v4, v6, v2]),
  proof(
    goal(hamiltonianPath(graph, [v3, v1, v5, v4, v6, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v1, v5, v4, v6, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v1, v5, v4, v6, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v1), binding("C", v5), binding("D", v4), binding("E", v6), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v1, v5, v4, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v1, v6, v2, v4, v5]).
why(
  hamiltonianPath(graph, [v3, v1, v6, v2, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v1, v6, v2, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v1, v6, v2, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v1, v6, v2, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v1), binding("C", v6), binding("D", v2), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v1, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v1, v6, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v2, v1, v5, v4, v6]).
why(
  hamiltonianPath(graph, [v3, v2, v1, v5, v4, v6]),
  proof(
    goal(hamiltonianPath(graph, [v3, v2, v1, v5, v4, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v2, v1, v5, v4, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v2, v1, v5, v4, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v2), binding("C", v1), binding("D", v5), binding("E", v4), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v2, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v2, v1, v5, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v2, v1, v6, v4, v5]).
why(
  hamiltonianPath(graph, [v3, v2, v1, v6, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v2, v1, v6, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v2, v1, v6, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v2, v1, v6, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v2), binding("C", v1), binding("D", v6), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v2, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v2, v1, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v2, v4, v5, v1, v6]).
why(
  hamiltonianPath(graph, [v3, v2, v4, v5, v1, v6]),
  proof(
    goal(hamiltonianPath(graph, [v3, v2, v4, v5, v1, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v2, v4, v5, v1, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v2, v4, v5, v1, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v2), binding("C", v4), binding("D", v5), binding("E", v1), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v2, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v2, v4, v5, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v2, v4, v6, v1, v5]).
why(
  hamiltonianPath(graph, [v3, v2, v4, v6, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v2, v4, v6, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v2, v4, v6, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v2, v4, v6, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v2), binding("C", v4), binding("D", v6), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v2, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v2, v4, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v2, v6, v1, v5, v4]).
why(
  hamiltonianPath(graph, [v3, v2, v6, v1, v5, v4]),
  proof(
    goal(hamiltonianPath(graph, [v3, v2, v6, v1, v5, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v2, v6, v1, v5, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v2, v6, v1, v5, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v2), binding("C", v6), binding("D", v1), binding("E", v5), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v2, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v2, v6, v1, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v2, v6, v4, v5, v1]).
why(
  hamiltonianPath(graph, [v3, v2, v6, v4, v5, v1]),
  proof(
    goal(hamiltonianPath(graph, [v3, v2, v6, v4, v5, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v2, v6, v4, v5, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v2, v6, v4, v5, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v2), binding("C", v6), binding("D", v4), binding("E", v5), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v2, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v2, v6, v4, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v4, v2, v6, v1, v5]).
why(
  hamiltonianPath(graph, [v3, v4, v2, v6, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v4, v2, v6, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v4, v2, v6, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v4, v2, v6, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v4), binding("C", v2), binding("D", v6), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v4, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v4, v2, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v4, v5, v1, v2, v6]).
why(
  hamiltonianPath(graph, [v3, v4, v5, v1, v2, v6]),
  proof(
    goal(hamiltonianPath(graph, [v3, v4, v5, v1, v2, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v4, v5, v1, v2, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v4, v5, v1, v2, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v4), binding("C", v5), binding("D", v1), binding("E", v2), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v4, v5, v1, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v4, v5, v1, v6, v2]).
why(
  hamiltonianPath(graph, [v3, v4, v5, v1, v6, v2]),
  proof(
    goal(hamiltonianPath(graph, [v3, v4, v5, v1, v6, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v4, v5, v1, v6, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v4, v5, v1, v6, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v4), binding("C", v5), binding("D", v1), binding("E", v6), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v4, v5, v1, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v4, v6, v2, v1, v5]).
why(
  hamiltonianPath(graph, [v3, v4, v6, v2, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v4, v6, v2, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v4, v6, v2, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v4, v6, v2, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v4), binding("C", v6), binding("D", v2), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v4, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v4, v6, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v6, v1, v2, v4, v5]).
why(
  hamiltonianPath(graph, [v3, v6, v1, v2, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v6, v1, v2, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v6, v1, v2, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v6, v1, v2, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v6), binding("C", v1), binding("D", v2), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v6, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v6, v1, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v6, v1, v5, v4, v2]).
why(
  hamiltonianPath(graph, [v3, v6, v1, v5, v4, v2]),
  proof(
    goal(hamiltonianPath(graph, [v3, v6, v1, v5, v4, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v6, v1, v5, v4, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v6, v1, v5, v4, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v6), binding("C", v1), binding("D", v5), binding("E", v4), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v6, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v6, v1, v5, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v6, v2, v1, v5, v4]).
why(
  hamiltonianPath(graph, [v3, v6, v2, v1, v5, v4]),
  proof(
    goal(hamiltonianPath(graph, [v3, v6, v2, v1, v5, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v6, v2, v1, v5, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v6, v2, v1, v5, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v6), binding("C", v2), binding("D", v1), binding("E", v5), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v6, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v6, v2, v1, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v6, v2, v4, v5, v1]).
why(
  hamiltonianPath(graph, [v3, v6, v2, v4, v5, v1]),
  proof(
    goal(hamiltonianPath(graph, [v3, v6, v2, v4, v5, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v6, v2, v4, v5, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v6, v2, v4, v5, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v6), binding("C", v2), binding("D", v4), binding("E", v5), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v6, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v6, v2, v4, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v6, v4, v2, v1, v5]).
why(
  hamiltonianPath(graph, [v3, v6, v4, v2, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v3, v6, v4, v2, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v6, v4, v2, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v6, v4, v2, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v6), binding("C", v4), binding("D", v2), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v6, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v6, v4, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v3, v6, v4, v5, v1, v2]).
why(
  hamiltonianPath(graph, [v3, v6, v4, v5, v1, v2]),
  proof(
    goal(hamiltonianPath(graph, [v3, v6, v4, v5, v1, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v3, v6, v4, v5, v1, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v3, v6, v4, v5, v1, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v3), binding("B", v6), binding("C", v4), binding("D", v5), binding("E", v1), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v3, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v3, v6, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v3, v6, v4, v5, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v2, v3, v6, v1, v5]).
why(
  hamiltonianPath(graph, [v4, v2, v3, v6, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v4, v2, v3, v6, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v2, v3, v6, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v2, v3, v6, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v2), binding("C", v3), binding("D", v6), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v2, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4, v2, v3, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v2, v6, v3, v1, v5]).
why(
  hamiltonianPath(graph, [v4, v2, v6, v3, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v4, v2, v6, v3, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v2, v6, v3, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v2, v6, v3, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v2), binding("C", v6), binding("D", v3), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v2, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4, v2, v6, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v3, v2, v6, v1, v5]).
why(
  hamiltonianPath(graph, [v4, v3, v2, v6, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v4, v3, v2, v6, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v3, v2, v6, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v3, v2, v6, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v3), binding("C", v2), binding("D", v6), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v3, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4, v3, v2, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v3, v6, v2, v1, v5]).
why(
  hamiltonianPath(graph, [v4, v3, v6, v2, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v4, v3, v6, v2, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v3, v6, v2, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v3, v6, v2, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v3), binding("C", v6), binding("D", v2), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v3, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4, v3, v6, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v5, v1, v2, v3, v6]).
why(
  hamiltonianPath(graph, [v4, v5, v1, v2, v3, v6]),
  proof(
    goal(hamiltonianPath(graph, [v4, v5, v1, v2, v3, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v5, v1, v2, v3, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v5, v1, v2, v3, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v5), binding("C", v1), binding("D", v2), binding("E", v3), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v5, v1, v2, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v5, v1, v2, v6, v3]).
why(
  hamiltonianPath(graph, [v4, v5, v1, v2, v6, v3]),
  proof(
    goal(hamiltonianPath(graph, [v4, v5, v1, v2, v6, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v5, v1, v2, v6, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v5, v1, v2, v6, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v5), binding("C", v1), binding("D", v2), binding("E", v6), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v5, v1, v2, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v5, v1, v3, v2, v6]).
why(
  hamiltonianPath(graph, [v4, v5, v1, v3, v2, v6]),
  proof(
    goal(hamiltonianPath(graph, [v4, v5, v1, v3, v2, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v5, v1, v3, v2, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v5, v1, v3, v2, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v5), binding("C", v1), binding("D", v3), binding("E", v2), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v5, v1, v3, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v5, v1, v3, v6, v2]).
why(
  hamiltonianPath(graph, [v4, v5, v1, v3, v6, v2]),
  proof(
    goal(hamiltonianPath(graph, [v4, v5, v1, v3, v6, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v5, v1, v3, v6, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v5, v1, v3, v6, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v5), binding("C", v1), binding("D", v3), binding("E", v6), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v5, v1, v3, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v5, v1, v6, v2, v3]).
why(
  hamiltonianPath(graph, [v4, v5, v1, v6, v2, v3]),
  proof(
    goal(hamiltonianPath(graph, [v4, v5, v1, v6, v2, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v5, v1, v6, v2, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v5, v1, v6, v2, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v5), binding("C", v1), binding("D", v6), binding("E", v2), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v5, v1, v6, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v5, v1, v6, v3, v2]).
why(
  hamiltonianPath(graph, [v4, v5, v1, v6, v3, v2]),
  proof(
    goal(hamiltonianPath(graph, [v4, v5, v1, v6, v3, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v5, v1, v6, v3, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v5, v1, v6, v3, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v5), binding("C", v1), binding("D", v6), binding("E", v3), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v5, v1, v6, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v6, v2, v3, v1, v5]).
why(
  hamiltonianPath(graph, [v4, v6, v2, v3, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v4, v6, v2, v3, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v6, v2, v3, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v6, v2, v3, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v6), binding("C", v2), binding("D", v3), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v6, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4, v6, v2, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v4, v6, v3, v2, v1, v5]).
why(
  hamiltonianPath(graph, [v4, v6, v3, v2, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v4, v6, v3, v2, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v4, v6, v3, v2, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v4, v6, v3, v2, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v4), binding("B", v6), binding("C", v3), binding("D", v2), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v4, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v4, v6, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v4, v6, v3, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v2, v3, v4, v6]).
why(
  hamiltonianPath(graph, [v5, v1, v2, v3, v4, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v2, v3, v4, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v2, v3, v4, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v2, v3, v4, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v2), binding("D", v3), binding("E", v4), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v2, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v2, v3, v6, v4]).
why(
  hamiltonianPath(graph, [v5, v1, v2, v3, v6, v4]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v2, v3, v6, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v2, v3, v6, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v2, v3, v6, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v2), binding("D", v3), binding("E", v6), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v2, v3, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v2, v4, v3, v6]).
why(
  hamiltonianPath(graph, [v5, v1, v2, v4, v3, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v2, v4, v3, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v2, v4, v3, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v2, v4, v3, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v2), binding("D", v4), binding("E", v3), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v2, v4, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v2, v4, v6, v3]).
why(
  hamiltonianPath(graph, [v5, v1, v2, v4, v6, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v2, v4, v6, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v2, v4, v6, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v2, v4, v6, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v2), binding("D", v4), binding("E", v6), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v2, v4, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v2, v6, v3, v4]).
why(
  hamiltonianPath(graph, [v5, v1, v2, v6, v3, v4]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v2, v6, v3, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v2, v6, v3, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v2, v6, v3, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v2), binding("D", v6), binding("E", v3), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v2, v6, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v2, v6, v4, v3]).
why(
  hamiltonianPath(graph, [v5, v1, v2, v6, v4, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v2, v6, v4, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v2, v6, v4, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v2, v6, v4, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v2), binding("D", v6), binding("E", v4), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v2, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v3, v2, v4, v6]).
why(
  hamiltonianPath(graph, [v5, v1, v3, v2, v4, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v3, v2, v4, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v3, v2, v4, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v3, v2, v4, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v3), binding("D", v2), binding("E", v4), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v3, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v3, v2, v6, v4]).
why(
  hamiltonianPath(graph, [v5, v1, v3, v2, v6, v4]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v3, v2, v6, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v3, v2, v6, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v3, v2, v6, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v3), binding("D", v2), binding("E", v6), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v3, v2, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v3, v4, v2, v6]).
why(
  hamiltonianPath(graph, [v5, v1, v3, v4, v2, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v3, v4, v2, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v3, v4, v2, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v3, v4, v2, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v3), binding("D", v4), binding("E", v2), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v3, v4, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v3, v4, v6, v2]).
why(
  hamiltonianPath(graph, [v5, v1, v3, v4, v6, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v3, v4, v6, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v3, v4, v6, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v3, v4, v6, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v3), binding("D", v4), binding("E", v6), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v3, v4, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v3, v6, v2, v4]).
why(
  hamiltonianPath(graph, [v5, v1, v3, v6, v2, v4]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v3, v6, v2, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v3, v6, v2, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v3, v6, v2, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v3), binding("D", v6), binding("E", v2), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v3, v6, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v3, v6, v4, v2]).
why(
  hamiltonianPath(graph, [v5, v1, v3, v6, v4, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v3, v6, v4, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v3, v6, v4, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v3, v6, v4, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v3), binding("D", v6), binding("E", v4), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v3, v6, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v6, v2, v3, v4]).
why(
  hamiltonianPath(graph, [v5, v1, v6, v2, v3, v4]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v6, v2, v3, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v6, v2, v3, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v6, v2, v3, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v6), binding("D", v2), binding("E", v3), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v6, v2, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v6, v2, v4, v3]).
why(
  hamiltonianPath(graph, [v5, v1, v6, v2, v4, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v6, v2, v4, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v6, v2, v4, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v6, v2, v4, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v6), binding("D", v2), binding("E", v4), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v6, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v6, v3, v2, v4]).
why(
  hamiltonianPath(graph, [v5, v1, v6, v3, v2, v4]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v6, v3, v2, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v6, v3, v2, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v6, v3, v2, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v6), binding("D", v3), binding("E", v2), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v6, v3, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v6, v3, v4, v2]).
why(
  hamiltonianPath(graph, [v5, v1, v6, v3, v4, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v6, v3, v4, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v6, v3, v4, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v6, v3, v4, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v6), binding("D", v3), binding("E", v4), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v6, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v6, v4, v2, v3]).
why(
  hamiltonianPath(graph, [v5, v1, v6, v4, v2, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v6, v4, v2, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v6, v4, v2, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v6, v4, v2, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v6), binding("D", v4), binding("E", v2), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v6, v4, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v1, v6, v4, v3, v2]).
why(
  hamiltonianPath(graph, [v5, v1, v6, v4, v3, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v1, v6, v4, v3, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v1, v6, v4, v3, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v1, v6, v4, v3, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v1), binding("C", v6), binding("D", v4), binding("E", v3), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5, v1, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v1, v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v1, v6, v4, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v2, v1, v3, v6]).
why(
  hamiltonianPath(graph, [v5, v4, v2, v1, v3, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v2, v1, v3, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v2, v1, v3, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v2, v1, v3, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v2), binding("D", v1), binding("E", v3), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v2, v1, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v2, v1, v6, v3]).
why(
  hamiltonianPath(graph, [v5, v4, v2, v1, v6, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v2, v1, v6, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v2, v1, v6, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v2, v1, v6, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v2), binding("D", v1), binding("E", v6), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v2, v1, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v2, v3, v1, v6]).
why(
  hamiltonianPath(graph, [v5, v4, v2, v3, v1, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v2, v3, v1, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v2, v3, v1, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v2, v3, v1, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v2), binding("D", v3), binding("E", v1), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v2, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v2, v3, v6, v1]).
why(
  hamiltonianPath(graph, [v5, v4, v2, v3, v6, v1]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v2, v3, v6, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v2, v3, v6, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v2, v3, v6, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v2), binding("D", v3), binding("E", v6), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v2, v3, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v2, v6, v1, v3]).
why(
  hamiltonianPath(graph, [v5, v4, v2, v6, v1, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v2, v6, v1, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v2, v6, v1, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v2, v6, v1, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v2), binding("D", v6), binding("E", v1), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v2, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v2, v6, v3, v1]).
why(
  hamiltonianPath(graph, [v5, v4, v2, v6, v3, v1]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v2, v6, v3, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v2, v6, v3, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v2, v6, v3, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v2), binding("D", v6), binding("E", v3), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v2, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v2, v6, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v3, v1, v2, v6]).
why(
  hamiltonianPath(graph, [v5, v4, v3, v1, v2, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v3, v1, v2, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v3, v1, v2, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v3, v1, v2, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v3), binding("D", v1), binding("E", v2), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v3, v1, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v3, v1, v6, v2]).
why(
  hamiltonianPath(graph, [v5, v4, v3, v1, v6, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v3, v1, v6, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v3, v1, v6, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v3, v1, v6, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v3), binding("D", v1), binding("E", v6), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v3, v1, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v3, v2, v1, v6]).
why(
  hamiltonianPath(graph, [v5, v4, v3, v2, v1, v6]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v3, v2, v1, v6])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v3, v2, v1, v6])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v3, v2, v1, v6])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v3), binding("D", v2), binding("E", v1), binding("F", v6)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v1, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v3, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v3, v2, v6, v1]).
why(
  hamiltonianPath(graph, [v5, v4, v3, v2, v6, v1]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v3, v2, v6, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v3, v2, v6, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v3, v2, v6, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v3), binding("D", v2), binding("E", v6), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v2, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v3, v2, v6])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v3, v6, v1, v2]).
why(
  hamiltonianPath(graph, [v5, v4, v3, v6, v1, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v3, v6, v1, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v3, v6, v1, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v3, v6, v1, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v3), binding("D", v6), binding("E", v1), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v3, v6, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v3, v6, v2, v1]).
why(
  hamiltonianPath(graph, [v5, v4, v3, v6, v2, v1]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v3, v6, v2, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v3, v6, v2, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v3, v6, v2, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v3), binding("D", v6), binding("E", v2), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v3, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v3, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v3, v6, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v6, v1, v2, v3]).
why(
  hamiltonianPath(graph, [v5, v4, v6, v1, v2, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v6, v1, v2, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v6, v1, v2, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v6, v1, v2, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v6), binding("D", v1), binding("E", v2), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v6, v1, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v6, v1, v3, v2]).
why(
  hamiltonianPath(graph, [v5, v4, v6, v1, v3, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v6, v1, v3, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v6, v1, v3, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v6, v1, v3, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v6), binding("D", v1), binding("E", v3), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v6, v1, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v6, v2, v1, v3]).
why(
  hamiltonianPath(graph, [v5, v4, v6, v2, v1, v3]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v6, v2, v1, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v6, v2, v1, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v6, v2, v1, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v6), binding("D", v2), binding("E", v1), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v6, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v6, v2, v3, v1]).
why(
  hamiltonianPath(graph, [v5, v4, v6, v2, v3, v1]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v6, v2, v3, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v6, v2, v3, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v6, v2, v3, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v6), binding("D", v2), binding("E", v3), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v6, v2, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v6, v3, v1, v2]).
why(
  hamiltonianPath(graph, [v5, v4, v6, v3, v1, v2]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v6, v3, v1, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v6, v3, v1, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v6, v3, v1, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v6), binding("D", v3), binding("E", v1), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v6, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v5, v4, v6, v3, v2, v1]).
why(
  hamiltonianPath(graph, [v5, v4, v6, v3, v2, v1]),
  proof(
    goal(hamiltonianPath(graph, [v5, v4, v6, v3, v2, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v5, v4, v6, v3, v2, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v5, v4, v6, v3, v2, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v5), binding("B", v4), binding("C", v6), binding("D", v3), binding("E", v2), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(adjacent(v4, v6)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v6)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v6, [v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v5, v4, v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v5, v4, v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v5, v4, v6, v3, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v1, v2, v3, v4, v5]).
why(
  hamiltonianPath(graph, [v6, v1, v2, v3, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v1, v2, v3, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v1, v2, v3, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v1, v2, v3, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v1), binding("C", v2), binding("D", v3), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v1, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v1, v2, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v1, v3, v2, v4, v5]).
why(
  hamiltonianPath(graph, [v6, v1, v3, v2, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v1, v3, v2, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v1, v3, v2, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v1, v3, v2, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v1), binding("C", v3), binding("D", v2), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v1, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v1, v3, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v1, v5, v4, v2, v3]).
why(
  hamiltonianPath(graph, [v6, v1, v5, v4, v2, v3]),
  proof(
    goal(hamiltonianPath(graph, [v6, v1, v5, v4, v2, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v1, v5, v4, v2, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v1, v5, v4, v2, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v1), binding("C", v5), binding("D", v4), binding("E", v2), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v1, v5, v4, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v1, v5, v4, v3, v2]).
why(
  hamiltonianPath(graph, [v6, v1, v5, v4, v3, v2]),
  proof(
    goal(hamiltonianPath(graph, [v6, v1, v5, v4, v3, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v1, v5, v4, v3, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v1, v5, v4, v3, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v1), binding("C", v5), binding("D", v4), binding("E", v3), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v6, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v6)),
                by(fact("hamiltonian-path.pl", clause(7)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v1, v5, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v1, v5, v4, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v2, v1, v3, v4, v5]).
why(
  hamiltonianPath(graph, [v6, v2, v1, v3, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v2, v1, v3, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v2, v1, v3, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v2, v1, v3, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v2), binding("C", v1), binding("D", v3), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v2, v1, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v2, v1, v3, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v2, v1, v5, v4, v3]).
why(
  hamiltonianPath(graph, [v6, v2, v1, v5, v4, v3]),
  proof(
    goal(hamiltonianPath(graph, [v6, v2, v1, v5, v4, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v2, v1, v5, v4, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v2, v1, v5, v4, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v2), binding("C", v1), binding("D", v5), binding("E", v4), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v2, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v2, v1, v5, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v2, v3, v1, v5, v4]).
why(
  hamiltonianPath(graph, [v6, v2, v3, v1, v5, v4]),
  proof(
    goal(hamiltonianPath(graph, [v6, v2, v3, v1, v5, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v2, v3, v1, v5, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v2, v3, v1, v5, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v2), binding("C", v3), binding("D", v1), binding("E", v5), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v2, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v2, v3, v1, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v2, v3, v4, v5, v1]).
why(
  hamiltonianPath(graph, [v6, v2, v3, v4, v5, v1]),
  proof(
    goal(hamiltonianPath(graph, [v6, v2, v3, v4, v5, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v2, v3, v4, v5, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v2, v3, v4, v5, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v2), binding("C", v3), binding("D", v4), binding("E", v5), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v2, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v2, v3, v4, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v2, v4, v3, v1, v5]).
why(
  hamiltonianPath(graph, [v6, v2, v4, v3, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v2, v4, v3, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v2, v4, v3, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v2, v4, v3, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v2), binding("C", v4), binding("D", v3), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v2, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v2, v4, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v2, v4, v5, v1, v3]).
why(
  hamiltonianPath(graph, [v6, v2, v4, v5, v1, v3]),
  proof(
    goal(hamiltonianPath(graph, [v6, v2, v4, v5, v1, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v2, v4, v5, v1, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v2, v4, v5, v1, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v2), binding("C", v4), binding("D", v5), binding("E", v1), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v6, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v6)),
                by(fact("hamiltonian-path.pl", clause(10)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v2, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v2, v4, v5, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v3, v1, v2, v4, v5]).
why(
  hamiltonianPath(graph, [v6, v3, v1, v2, v4, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v3, v1, v2, v4, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v3, v1, v2, v4, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v3, v1, v2, v4, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v3), binding("C", v1), binding("D", v2), binding("E", v4), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v3, v1, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v3, v1, v2, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v3, v1, v5, v4, v2]).
why(
  hamiltonianPath(graph, [v6, v3, v1, v5, v4, v2]),
  proof(
    goal(hamiltonianPath(graph, [v6, v3, v1, v5, v4, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v3, v1, v5, v4, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v3, v1, v5, v4, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v3), binding("C", v1), binding("D", v5), binding("E", v4), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v3, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v3, v1, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v3, v1, v5, v4])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v3, v2, v1, v5, v4]).
why(
  hamiltonianPath(graph, [v6, v3, v2, v1, v5, v4]),
  proof(
    goal(hamiltonianPath(graph, [v6, v3, v2, v1, v5, v4])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v3, v2, v1, v5, v4])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v3, v2, v1, v5, v4])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v3), binding("C", v2), binding("D", v1), binding("E", v5), binding("F", v4)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v3, v2, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v5, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v3, v2, v1, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v3, v2, v4, v5, v1]).
why(
  hamiltonianPath(graph, [v6, v3, v2, v4, v5, v1]),
  proof(
    goal(hamiltonianPath(graph, [v6, v3, v2, v4, v5, v1])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v3, v2, v4, v5, v1])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v3, v2, v4, v5, v1])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v3), binding("C", v2), binding("D", v4), binding("E", v5), binding("F", v1)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v2, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v3, v2, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v3, v2, v4, v5])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v3, v4, v2, v1, v5]).
why(
  hamiltonianPath(graph, [v6, v3, v4, v2, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v3, v4, v2, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v3, v4, v2, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v3, v4, v2, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v3), binding("C", v4), binding("D", v2), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v3, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v3, v4, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v3, v4, v5, v1, v2]).
why(
  hamiltonianPath(graph, [v6, v3, v4, v5, v1, v2]),
  proof(
    goal(hamiltonianPath(graph, [v6, v3, v4, v5, v1, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v3, v4, v5, v1, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v3, v4, v5, v1, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v3), binding("C", v4), binding("D", v5), binding("E", v1), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v6, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v6)),
                by(fact("hamiltonian-path.pl", clause(12)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v3, v4)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v3), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v3, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v3, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v3, v4, v5, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v4, v2, v3, v1, v5]).
why(
  hamiltonianPath(graph, [v6, v4, v2, v3, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v4, v2, v3, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v4, v2, v3, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v4, v2, v3, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v4), binding("C", v2), binding("D", v3), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v4, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v4)),
                by(fact("hamiltonian-path.pl", clause(9)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v4, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v3, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v4, v2, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v4, v2, v3, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v4, v3, v2, v1, v5]).
why(
  hamiltonianPath(graph, [v6, v4, v3, v2, v1, v5]),
  proof(
    goal(hamiltonianPath(graph, [v6, v4, v3, v2, v1, v5])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v4, v3, v2, v1, v5])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v4, v3, v2, v1, v5])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v4), binding("C", v3), binding("D", v2), binding("E", v1), binding("F", v5)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v4, v3)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v4), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v3, v4)),
                by(fact("hamiltonian-path.pl", clause(11)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v4, v3])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v2, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v2), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v4, v3, v2])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v1, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v4, v3, v2, v1])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v4, v5, v1, v2, v3]).
why(
  hamiltonianPath(graph, [v6, v4, v5, v1, v2, v3]),
  proof(
    goal(hamiltonianPath(graph, [v6, v4, v5, v1, v2, v3])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v4, v5, v1, v2, v3])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v4, v5, v1, v2, v3])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v4), binding("C", v5), binding("D", v1), binding("E", v2), binding("F", v3)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v1, v2)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v1, v2)),
                by(fact("hamiltonian-path.pl", clause(4)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v2, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v2), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v4, v5, v1, v2])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

hamiltonianPath(graph, [v6, v4, v5, v1, v3, v2]).
why(
  hamiltonianPath(graph, [v6, v4, v5, v1, v3, v2]),
  proof(
    goal(hamiltonianPath(graph, [v6, v4, v5, v1, v3, v2])),
    by(rule("hamiltonian-path.pl", clause(25))),
    bindings([binding("Path", [v6, v4, v5, v1, v3, v2])]),
    uses([
      proof(
        goal(hamiltonian_path([v6, v4, v5, v1, v3, v2])),
        by(rule("hamiltonian-path.pl", clause(23))),
        bindings([binding("A", v6), binding("B", v4), binding("C", v5), binding("D", v1), binding("E", v3), binding("F", v2)]),
        uses([
          proof(
            goal(vertex(v6)),
            by(fact("hamiltonian-path.pl", clause(22)))
          ),
          proof(
            goal(vertex(v4)),
            by(fact("hamiltonian-path.pl", clause(20)))
          ),
          proof(
            goal(adjacent(v6, v4)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v6), binding("U", v4)]),
            uses([
              proof(
                goal(edge(v4, v6)),
                by(fact("hamiltonian-path.pl", clause(14)))
              )
            ])
          ),
          proof(
            goal(not_member(v4, [v6])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v5)),
            by(fact("hamiltonian-path.pl", clause(21)))
          ),
          proof(
            goal(adjacent(v4, v5)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v4), binding("U", v5)]),
            uses([
              proof(
                goal(edge(v4, v5)),
                by(fact("hamiltonian-path.pl", clause(13)))
              )
            ])
          ),
          proof(
            goal(not_member(v5, [v6, v4])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v1)),
            by(fact("hamiltonian-path.pl", clause(17)))
          ),
          proof(
            goal(adjacent(v5, v1)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v5), binding("U", v1)]),
            uses([
              proof(
                goal(edge(v1, v5)),
                by(fact("hamiltonian-path.pl", clause(6)))
              )
            ])
          ),
          proof(
            goal(not_member(v1, [v6, v4, v5])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v3)),
            by(fact("hamiltonian-path.pl", clause(19)))
          ),
          proof(
            goal(adjacent(v1, v3)),
            by(rule("hamiltonian-path.pl", clause(15))),
            bindings([binding("V", v1), binding("U", v3)]),
            uses([
              proof(
                goal(edge(v1, v3)),
                by(fact("hamiltonian-path.pl", clause(5)))
              )
            ])
          ),
          proof(
            goal(not_member(v3, [v6, v4, v5, v1])),
            by(builtin(not_member, 2))
          ),
          proof(
            goal(vertex(v2)),
            by(fact("hamiltonian-path.pl", clause(18)))
          ),
          proof(
            goal(adjacent(v3, v2)),
            by(rule("hamiltonian-path.pl", clause(16))),
            bindings([binding("V", v3), binding("U", v2)]),
            uses([
              proof(
                goal(edge(v2, v3)),
                by(fact("hamiltonian-path.pl", clause(8)))
              )
            ])
          ),
          proof(
            goal(not_member(v2, [v6, v4, v5, v1, v3])),
            by(builtin(not_member, 2))
          )
        ])
      )
    ])
  )
).

