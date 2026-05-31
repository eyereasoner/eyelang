trace(controller_loop, -1.2).
why(
  trace(controller_loop, -1.2),
  proof(
    goal(trace(controller_loop, -1.2)), by(rule("complex-matrix-stability.pl", clause(7))),
    bindings([binding("Matrix", controller_loop), binding("Trace", -1.2), binding("A", -0.7), binding("_B", 1.2), binding("_C", -0.4), binding("D", -0.5)]),
    uses([
      proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
      proof(goal(add(-0.7, -0.5, -1.2)), by(builtin(add, 3)))
    ])
  )
).

determinant(controller_loop, 0.82999999999999996).
why(
  determinant(controller_loop, 0.82999999999999996),
  proof(
    goal(determinant(controller_loop, 0.82999999999999996)), by(rule("complex-matrix-stability.pl", clause(8))),
    bindings([binding("Matrix", controller_loop), binding("Determinant", 0.82999999999999996), binding("A", -0.7), binding("B", 1.2), binding("C", -0.4), binding("D", -0.5), binding("AD", 0.34999999999999998), binding("BC", -0.47999999999999998)]),
    uses([
      proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
      proof(goal(mul(-0.7, -0.5, 0.34999999999999998)), by(builtin(mul, 3))),
      proof(goal(mul(1.2, -0.4, -0.47999999999999998)), by(builtin(mul, 3))),
      proof(goal(sub(0.34999999999999998, -0.47999999999999998, 0.82999999999999996)), by(builtin(sub, 3)))
    ])
  )
).

discriminant(controller_loop, -1.8799999999999999).
why(
  discriminant(controller_loop, -1.8799999999999999),
  proof(
    goal(discriminant(controller_loop, -1.8799999999999999)), by(rule("complex-matrix-stability.pl", clause(9))),
    bindings([binding("Matrix", controller_loop), binding("Disc", -1.8799999999999999), binding("T", -1.2), binding("Det", 0.82999999999999996), binding("T2", 1.4399999999999999), binding("FourDet", 3.3199999999999998)]),
    uses([
      proof(
        goal(trace(controller_loop, -1.2)), by(rule("complex-matrix-stability.pl", clause(7))),
        bindings([binding("Matrix", controller_loop), binding("Trace", -1.2), binding("A", -0.7), binding("_B", 1.2), binding("_C", -0.4), binding("D", -0.5)]),
        uses([
          proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
          proof(goal(add(-0.7, -0.5, -1.2)), by(builtin(add, 3)))
        ])
      ),
      proof(
        goal(determinant(controller_loop, 0.82999999999999996)), by(rule("complex-matrix-stability.pl", clause(8))),
        bindings([binding("Matrix", controller_loop), binding("Determinant", 0.82999999999999996), binding("A", -0.7), binding("B", 1.2), binding("C", -0.4), binding("D", -0.5), binding("AD", 0.34999999999999998), binding("BC", -0.47999999999999998)]),
        uses([
          proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
          proof(goal(mul(-0.7, -0.5, 0.34999999999999998)), by(builtin(mul, 3))),
          proof(goal(mul(1.2, -0.4, -0.47999999999999998)), by(builtin(mul, 3))),
          proof(goal(sub(0.34999999999999998, -0.47999999999999998, 0.82999999999999996)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(mul(-1.2, -1.2, 1.4399999999999999)), by(builtin(mul, 3))),
      proof(goal(mul(4, 0.82999999999999996, 3.3199999999999998)), by(builtin(mul, 3))),
      proof(goal(sub(1.4399999999999999, 3.3199999999999998, -1.8799999999999999)), by(builtin(sub, 3)))
    ])
  )
).

eigenShape(controller_loop, complex_conjugate_pair).
why(
  eigenShape(controller_loop, complex_conjugate_pair),
  proof(
    goal(eigenShape(controller_loop, complex_conjugate_pair)), by(rule("complex-matrix-stability.pl", clause(12))),
    bindings([binding("Matrix", controller_loop)]),
    uses([
      proof(
        goal(complex_pair(controller_loop)), by(rule("complex-matrix-stability.pl", clause(11))),
        bindings([binding("Matrix", controller_loop), binding("Disc", -1.8799999999999999)]),
        uses([
          proof(
            goal(discriminant(controller_loop, -1.8799999999999999)), by(rule("complex-matrix-stability.pl", clause(9))),
            bindings([binding("Matrix", controller_loop), binding("Disc", -1.8799999999999999), binding("T", -1.2), binding("Det", 0.82999999999999996), binding("T2", 1.4399999999999999), binding("FourDet", 3.3199999999999998)]),
            uses([
              proof(
                goal(trace(controller_loop, -1.2)), by(rule("complex-matrix-stability.pl", clause(7))),
                bindings([binding("Matrix", controller_loop), binding("Trace", -1.2), binding("A", -0.7), binding("_B", 1.2), binding("_C", -0.4), binding("D", -0.5)]),
                uses([
                  proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
                  proof(goal(add(-0.7, -0.5, -1.2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(determinant(controller_loop, 0.82999999999999996)), by(rule("complex-matrix-stability.pl", clause(8))),
                bindings([binding("Matrix", controller_loop), binding("Determinant", 0.82999999999999996), binding("A", -0.7), binding("B", 1.2), binding("C", -0.4), binding("D", -0.5), binding("AD", 0.34999999999999998), binding("BC", -0.47999999999999998)]),
                uses([
                  proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
                  proof(goal(mul(-0.7, -0.5, 0.34999999999999998)), by(builtin(mul, 3))),
                  proof(goal(mul(1.2, -0.4, -0.47999999999999998)), by(builtin(mul, 3))),
                  proof(goal(sub(0.34999999999999998, -0.47999999999999998, 0.82999999999999996)), by(builtin(sub, 3)))
                ])
              ),
              proof(goal(mul(-1.2, -1.2, 1.4399999999999999)), by(builtin(mul, 3))),
              proof(goal(mul(4, 0.82999999999999996, 3.3199999999999998)), by(builtin(mul, 3))),
              proof(goal(sub(1.4399999999999999, 3.3199999999999998, -1.8799999999999999)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(lt(-1.8799999999999999, 0)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

status(controller_loop, asymptotically_stable).
why(
  status(controller_loop, asymptotically_stable),
  proof(
    goal(status(controller_loop, asymptotically_stable)), by(rule("complex-matrix-stability.pl", clause(13))),
    bindings([binding("Matrix", controller_loop)]),
    uses([
      proof(
        goal(stable(controller_loop)), by(rule("complex-matrix-stability.pl", clause(10))),
        bindings([binding("Matrix", controller_loop), binding("T", -1.2), binding("Det", 0.82999999999999996)]),
        uses([
          proof(
            goal(trace(controller_loop, -1.2)), by(rule("complex-matrix-stability.pl", clause(7))),
            bindings([binding("Matrix", controller_loop), binding("Trace", -1.2), binding("A", -0.7), binding("_B", 1.2), binding("_C", -0.4), binding("D", -0.5)]),
            uses([
              proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
              proof(goal(add(-0.7, -0.5, -1.2)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(determinant(controller_loop, 0.82999999999999996)), by(rule("complex-matrix-stability.pl", clause(8))),
            bindings([binding("Matrix", controller_loop), binding("Determinant", 0.82999999999999996), binding("A", -0.7), binding("B", 1.2), binding("C", -0.4), binding("D", -0.5), binding("AD", 0.34999999999999998), binding("BC", -0.47999999999999998)]),
            uses([
              proof(goal(matrix(controller_loop, -0.7, 1.2, -0.4, -0.5)), by(fact("complex-matrix-stability.pl", clause(6)))),
              proof(goal(mul(-0.7, -0.5, 0.34999999999999998)), by(builtin(mul, 3))),
              proof(goal(mul(1.2, -0.4, -0.47999999999999998)), by(builtin(mul, 3))),
              proof(goal(sub(0.34999999999999998, -0.47999999999999998, 0.82999999999999996)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(lt(-1.2, 0)), by(builtin(lt, 2))),
          proof(goal(gt(0.82999999999999996, 0)), by(builtin(gt, 2)))
        ])
      )
    ])
  )
).

