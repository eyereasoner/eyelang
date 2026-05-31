status(sat_instance, satisfiable).
why(
  status(sat_instance, satisfiable),
  proof(
    goal(status(sat_instance, satisfiable)),
    by(rule("sat-dpll.pl", clause(19))),
    bindings([binding("_Assignment", [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)])]),
    uses([
      proof(
        goal(once(model(sat_instance, [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)]))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(model(sat_instance, [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)])),
            by(rule("sat-dpll.pl", clause(18))),
            bindings([binding("Name", sat_instance), binding("Assignment", [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)]), binding("Variables", [a, b, c, d, e, f, g, h]), binding("Clauses", [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])]),
            uses([
              proof(
                goal(problem(sat_instance, [a, b, c, d, e, f, g, h], [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])),
                by(fact("sat-dpll.pl", clause(7)))
              ),
              proof(
                goal(cnf_model([a, b, c, d, e, f, g, h], [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]], [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)])),
                by(builtin(cnf_model, 3))
              )
            ])
          )
        ])
      )
    ])
  )
).

witness(sat_instance, [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)]).
why(
  witness(sat_instance, [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)]),
  proof(
    goal(witness(sat_instance, [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)])),
    by(rule("sat-dpll.pl", clause(20))),
    bindings([binding("Assignment", [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)])]),
    uses([
      proof(
        goal(once(model(sat_instance, [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)]))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(model(sat_instance, [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)])),
            by(rule("sat-dpll.pl", clause(18))),
            bindings([binding("Name", sat_instance), binding("Assignment", [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)]), binding("Variables", [a, b, c, d, e, f, g, h]), binding("Clauses", [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])]),
            uses([
              proof(
                goal(problem(sat_instance, [a, b, c, d, e, f, g, h], [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])),
                by(fact("sat-dpll.pl", clause(7)))
              ),
              proof(
                goal(cnf_model([a, b, c, d, e, f, g, h], [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]], [value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)])),
                by(builtin(cnf_model, 3))
              )
            ])
          )
        ])
      )
    ])
  )
).

modelCount(sat_instance, 18).
why(
  modelCount(sat_instance, 18),
  proof(
    goal(modelCount(sat_instance, 18)),
    by(rule("sat-dpll.pl", clause(21))),
    bindings([binding("Count", 18), binding("Models", [[value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)], [value(a, true), value(b, false), value(c, true), value(d, false), value(e, true), value(f, false), value(g, true), value(h, false)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)]])]),
    uses([
      proof(
        goal(findall(Assignment, model(sat_instance, Assignment), [[value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)], [value(a, true), value(b, false), value(c, true), value(d, false), value(e, true), value(f, false), value(g, true), value(h, false)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)]])),
        by(builtin(findall, 3))
      ),
      proof(
        goal(length([[value(a, false), value(b, true), value(c, false), value(d, true), value(e, false), value(f, true), value(g, false), value(h, true)], [value(a, true), value(b, false), value(c, true), value(d, false), value(e, true), value(f, false), value(g, true), value(h, false)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)], [value(a, true), value(b, true), value(c, true), value(d, true), value(e, true), value(f, true), value(g, true), value(h, true)]], 18)),
        by(builtin(length, 2))
      )
    ])
  )
).

variableCount(sat_instance, 8).
why(
  variableCount(sat_instance, 8),
  proof(
    goal(variableCount(sat_instance, 8)),
    by(rule("sat-dpll.pl", clause(22))),
    bindings([binding("Count", 8), binding("Variables", [a, b, c, d, e, f, g, h]), binding("_Clauses", [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])]),
    uses([
      proof(
        goal(problem(sat_instance, [a, b, c, d, e, f, g, h], [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])),
        by(fact("sat-dpll.pl", clause(7)))
      ),
      proof(
        goal(length([a, b, c, d, e, f, g, h], 8)),
        by(builtin(length, 2))
      )
    ])
  )
).

clauseCount(sat_instance, 12).
why(
  clauseCount(sat_instance, 12),
  proof(
    goal(clauseCount(sat_instance, 12)),
    by(rule("sat-dpll.pl", clause(23))),
    bindings([binding("Count", 12), binding("_Variables", [a, b, c, d, e, f, g, h]), binding("Clauses", [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])]),
    uses([
      proof(
        goal(problem(sat_instance, [a, b, c, d, e, f, g, h], [[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]])),
        by(fact("sat-dpll.pl", clause(7)))
      ),
      proof(
        goal(length([[pos(a), pos(b)], [neg(a), pos(c)], [neg(b), pos(d)], [pos(c), pos(d)], [neg(c), pos(e)], [neg(d), pos(f)], [pos(e), pos(f)], [neg(e), pos(g)], [neg(f), pos(h)], [pos(g), pos(h)], [neg(g), pos(a)], [neg(h), pos(b)]], 12)),
        by(builtin(length, 2))
      )
    ])
  )
).

