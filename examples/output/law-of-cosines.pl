sideCSquared(tri60, 67.0).
why(
  sideCSquared(tri60, 67.0),
  proof(
    goal(sideCSquared(tri60, 67.0)),
    by(rule("law-of-cosines.pl", clause(7))),
    bindings([binding("Triangle", tri60), binding("C2", 67.0)]),
    uses([
      proof(
        goal(side_c_squared(tri60, 67.0)),
        by(rule("law-of-cosines.pl", clause(5))),
        bindings([binding("Triangle", tri60), binding("C2", 67.0), binding("A", 7), binding("B", 9), binding("CosC", 0.5), binding("A2", 49), binding("B2", 81), binding("Sum", 130), binding("TwoA", 14), binding("TwoAB", 126), binding("Projection", 63.0)]),
        uses([
          proof(
            goal(triangle(tri60, 7, 9, 0.5)),
            by(fact("law-of-cosines.pl", clause(4)))
          ),
          proof(
            goal(mul(7, 7, 49)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(9, 9, 81)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(49, 81, 130)),
            by(builtin(add, 3))
          ),
          proof(
            goal(mul(2, 7, 14)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(14, 9, 126)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(126, 0.5, 63.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sub(130, 63.0, 67.0)),
            by(builtin(sub, 3))
          )
        ])
      )
    ])
  )
).

sideC(tri60, 8.1853527718724504).
why(
  sideC(tri60, 8.1853527718724504),
  proof(
    goal(sideC(tri60, 8.1853527718724504)),
    by(rule("law-of-cosines.pl", clause(8))),
    bindings([binding("Triangle", tri60), binding("C", 8.1853527718724504)]),
    uses([
      proof(
        goal(side_c(tri60, 8.1853527718724504)),
        by(rule("law-of-cosines.pl", clause(6))),
        bindings([binding("Triangle", tri60), binding("C", 8.1853527718724504), binding("C2", 67.0)]),
        uses([
          proof(
            goal(side_c_squared(tri60, 67.0)),
            by(rule("law-of-cosines.pl", clause(5))),
            bindings([binding("Triangle", tri60), binding("C2", 67.0), binding("A", 7), binding("B", 9), binding("CosC", 0.5), binding("A2", 49), binding("B2", 81), binding("Sum", 130), binding("TwoA", 14), binding("TwoAB", 126), binding("Projection", 63.0)]),
            uses([
              proof(
                goal(triangle(tri60, 7, 9, 0.5)),
                by(fact("law-of-cosines.pl", clause(4)))
              ),
              proof(
                goal(mul(7, 7, 49)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(9, 9, 81)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(49, 81, 130)),
                by(builtin(add, 3))
              ),
              proof(
                goal(mul(2, 7, 14)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(14, 9, 126)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(126, 0.5, 63.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(sub(130, 63.0, 67.0)),
                by(builtin(sub, 3))
              )
            ])
          ),
          proof(
            goal(pow(67.0, 0.5, 8.1853527718724504)),
            by(builtin(pow, 3))
          )
        ])
      )
    ])
  )
).

status(tri60, acute_triangle).
why(
  status(tri60, acute_triangle),
  proof(
    goal(status(tri60, acute_triangle)),
    by(rule("law-of-cosines.pl", clause(9))),
    bindings([binding("Triangle", tri60), binding("C2", 67.0)]),
    uses([
      proof(
        goal(side_c_squared(tri60, 67.0)),
        by(rule("law-of-cosines.pl", clause(5))),
        bindings([binding("Triangle", tri60), binding("C2", 67.0), binding("A", 7), binding("B", 9), binding("CosC", 0.5), binding("A2", 49), binding("B2", 81), binding("Sum", 130), binding("TwoA", 14), binding("TwoAB", 126), binding("Projection", 63.0)]),
        uses([
          proof(
            goal(triangle(tri60, 7, 9, 0.5)),
            by(fact("law-of-cosines.pl", clause(4)))
          ),
          proof(
            goal(mul(7, 7, 49)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(9, 9, 81)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(49, 81, 130)),
            by(builtin(add, 3))
          ),
          proof(
            goal(mul(2, 7, 14)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(14, 9, 126)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(126, 0.5, 63.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sub(130, 63.0, 67.0)),
            by(builtin(sub, 3))
          )
        ])
      ),
      proof(
        goal(gt(67.0, 0)),
        by(builtin(gt, 2))
      )
    ])
  )
).

