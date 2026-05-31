semiperimeter(field_plot, 21).
why(
  semiperimeter(field_plot, 21),
  proof(
    goal(semiperimeter(field_plot, 21)), by(rule("heron-theorem.pl", clause(6))),
    bindings([binding("Triangle", field_plot), binding("S", 21), binding("A", 13), binding("B", 14), binding("C", 15), binding("AB", 27), binding("Sum", 42)]),
    uses([
      proof(goal(triangle(field_plot, 13, 14, 15)), by(fact("heron-theorem.pl", clause(5)))),
      proof(goal(add(13, 14, 27)), by(builtin(add, 3))),
      proof(goal(add(27, 15, 42)), by(builtin(add, 3))),
      proof(goal(div(42, 2, 21)), by(builtin(div, 3)))
    ])
  )
).

area(field_plot, 84.0).
why(
  area(field_plot, 84.0),
  proof(
    goal(area(field_plot, 84.0)), by(rule("heron-theorem.pl", clause(8))),
    bindings([binding("Triangle", field_plot), binding("Area", 84.0), binding("Product", 7056)]),
    uses([
      proof(
        goal(heron_product(field_plot, 7056)), by(rule("heron-theorem.pl", clause(7))),
        bindings([binding("Triangle", field_plot), binding("Product", 7056), binding("A", 13), binding("B", 14), binding("C", 15), binding("S", 21), binding("SA", 8), binding("SB", 7), binding("SC", 6), binding("T1", 168), binding("T2", 1176)]),
        uses([
          proof(goal(triangle(field_plot, 13, 14, 15)), by(fact("heron-theorem.pl", clause(5)))),
          proof(
            goal(semiperimeter(field_plot, 21)), by(rule("heron-theorem.pl", clause(6))),
            bindings([binding("Triangle", field_plot), binding("S", 21), binding("A", 13), binding("B", 14), binding("C", 15), binding("AB", 27), binding("Sum", 42)]),
            uses([
              proof(goal(triangle(field_plot, 13, 14, 15)), by(fact("heron-theorem.pl", clause(5)))),
              proof(goal(add(13, 14, 27)), by(builtin(add, 3))),
              proof(goal(add(27, 15, 42)), by(builtin(add, 3))),
              proof(goal(div(42, 2, 21)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(sub(21, 13, 8)), by(builtin(sub, 3))),
          proof(goal(sub(21, 14, 7)), by(builtin(sub, 3))),
          proof(goal(sub(21, 15, 6)), by(builtin(sub, 3))),
          proof(goal(mul(21, 8, 168)), by(builtin(mul, 3))),
          proof(goal(mul(168, 7, 1176)), by(builtin(mul, 3))),
          proof(goal(mul(1176, 6, 7056)), by(builtin(mul, 3)))
        ])
      ),
      proof(goal(pow(7056, 0.5, 84.0)), by(builtin(pow, 3)))
    ])
  )
).

heronProduct(field_plot, 7056).
why(
  heronProduct(field_plot, 7056),
  proof(
    goal(heronProduct(field_plot, 7056)), by(rule("heron-theorem.pl", clause(9))),
    bindings([binding("Triangle", field_plot), binding("P", 7056)]),
    uses([
      proof(
        goal(heron_product(field_plot, 7056)), by(rule("heron-theorem.pl", clause(7))),
        bindings([binding("Triangle", field_plot), binding("Product", 7056), binding("A", 13), binding("B", 14), binding("C", 15), binding("S", 21), binding("SA", 8), binding("SB", 7), binding("SC", 6), binding("T1", 168), binding("T2", 1176)]),
        uses([
          proof(goal(triangle(field_plot, 13, 14, 15)), by(fact("heron-theorem.pl", clause(5)))),
          proof(
            goal(semiperimeter(field_plot, 21)), by(rule("heron-theorem.pl", clause(6))),
            bindings([binding("Triangle", field_plot), binding("S", 21), binding("A", 13), binding("B", 14), binding("C", 15), binding("AB", 27), binding("Sum", 42)]),
            uses([
              proof(goal(triangle(field_plot, 13, 14, 15)), by(fact("heron-theorem.pl", clause(5)))),
              proof(goal(add(13, 14, 27)), by(builtin(add, 3))),
              proof(goal(add(27, 15, 42)), by(builtin(add, 3))),
              proof(goal(div(42, 2, 21)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(sub(21, 13, 8)), by(builtin(sub, 3))),
          proof(goal(sub(21, 14, 7)), by(builtin(sub, 3))),
          proof(goal(sub(21, 15, 6)), by(builtin(sub, 3))),
          proof(goal(mul(21, 8, 168)), by(builtin(mul, 3))),
          proof(goal(mul(168, 7, 1176)), by(builtin(mul, 3))),
          proof(goal(mul(1176, 6, 7056)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

status(field_plot, valid_survey_triangle).
why(
  status(field_plot, valid_survey_triangle),
  proof(
    goal(status(field_plot, valid_survey_triangle)), by(rule("heron-theorem.pl", clause(10))),
    bindings([binding("Triangle", field_plot), binding("A", 84.0)]),
    uses([
      proof(
        goal(area(field_plot, 84.0)), by(rule("heron-theorem.pl", clause(8))),
        bindings([binding("Triangle", field_plot), binding("Area", 84.0), binding("Product", 7056)]),
        uses([
          proof(
            goal(heron_product(field_plot, 7056)), by(rule("heron-theorem.pl", clause(7))),
            bindings([binding("Triangle", field_plot), binding("Product", 7056), binding("A", 13), binding("B", 14), binding("C", 15), binding("S", 21), binding("SA", 8), binding("SB", 7), binding("SC", 6), binding("T1", 168), binding("T2", 1176)]),
            uses([
              proof(goal(triangle(field_plot, 13, 14, 15)), by(fact("heron-theorem.pl", clause(5)))),
              proof(
                goal(semiperimeter(field_plot, 21)), by(rule("heron-theorem.pl", clause(6))),
                bindings([binding("Triangle", field_plot), binding("S", 21), binding("A", 13), binding("B", 14), binding("C", 15), binding("AB", 27), binding("Sum", 42)]),
                uses([
                  proof(goal(triangle(field_plot, 13, 14, 15)), by(fact("heron-theorem.pl", clause(5)))),
                  proof(goal(add(13, 14, 27)), by(builtin(add, 3))),
                  proof(goal(add(27, 15, 42)), by(builtin(add, 3))),
                  proof(goal(div(42, 2, 21)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(sub(21, 13, 8)), by(builtin(sub, 3))),
              proof(goal(sub(21, 14, 7)), by(builtin(sub, 3))),
              proof(goal(sub(21, 15, 6)), by(builtin(sub, 3))),
              proof(goal(mul(21, 8, 168)), by(builtin(mul, 3))),
              proof(goal(mul(168, 7, 1176)), by(builtin(mul, 3))),
              proof(goal(mul(1176, 6, 7056)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(pow(7056, 0.5, 84.0)), by(builtin(pow, 3)))
        ])
      ),
      proof(goal(gt(84.0, 0)), by(builtin(gt, 2)))
    ])
  )
).

