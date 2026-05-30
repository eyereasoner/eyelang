root(real_quartic, [1, 0]).
why(
  root(real_quartic, [1, 0]),
  proof(
    goal(root(real_quartic, [1, 0])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", real_quartic), binding("Root", [1, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
      proof(
        goal(candidate(real_quartic, [1, 0])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", real_quartic), binding("R", 1), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
        uses([
          proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
          proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
          proof(goal(between(0, 5, 1)), by(builtin(between, 3))),
          proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [1, 0]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [1, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [1, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [1, 0]), binding("Next", [-9, 0])]),
            uses([
              proof(
                goal(c_mul([1, 0], [1, 0], [1, 0])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", 1), binding("F", 0), binding("AC", 1), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(1, 0, 1)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([1, 0], [-10, 0], [-9, 0])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 1), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -9), binding("F", 0)]),
                uses([
                  proof(goal(add(1, -10, -9)), by(builtin(add, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [1, 0], [-9, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [1, 0]), binding("Acc", [-9, 0]), binding("Value", [0, 0]), binding("Product", [-9, 0]), binding("Next", [26, 0])]),
                uses([
                  proof(
                    goal(c_mul([-9, 0], [1, 0], [-9, 0])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -9), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -9), binding("F", 0), binding("AC", -9), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                    uses([
                      proof(goal(mul(-9, 1, -9)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(sub(-9, 0, -9)), by(builtin(sub, 3))),
                      proof(goal(mul(-9, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([-9, 0], [35, 0], [26, 0])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", -9), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 26), binding("F", 0)]),
                    uses([
                      proof(goal(add(-9, 35, 26)), by(builtin(add, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[-50, 0], [24, 0]], [1, 0], [26, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [1, 0]), binding("Acc", [26, 0]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [-24, 0])]),
                    uses([
                      proof(
                        goal(c_mul([26, 0], [1, 0], [26, 0])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 26), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", 26), binding("F", 0), binding("AC", 26), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                        uses([
                          proof(goal(mul(26, 1, 26)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
                          proof(goal(mul(26, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([26, 0], [-50, 0], [-24, 0])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", 26), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -24), binding("F", 0)]),
                        uses([
                          proof(goal(add(26, -50, -24)), by(builtin(add, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[24, 0]], [1, 0], [-24, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [1, 0]), binding("Acc", [-24, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([-24, 0], [1, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -24), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-24, 1, -24)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                              proof(goal(mul(-24, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [1, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [1, 0]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

root(real_quartic, [2, 0]).
why(
  root(real_quartic, [2, 0]),
  proof(
    goal(root(real_quartic, [2, 0])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", real_quartic), binding("Root", [2, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
      proof(
        goal(candidate(real_quartic, [2, 0])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", real_quartic), binding("R", 2), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
        uses([
          proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
          proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
          proof(goal(between(0, 5, 2)), by(builtin(between, 3))),
          proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [2, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [2, 0]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [2, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [2, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [2, 0]), binding("Next", [-8, 0])]),
            uses([
              proof(
                goal(c_mul([1, 0], [2, 0], [2, 0])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", 2), binding("F", 0), binding("AC", 2), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 2, 2)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(2, 0, 2)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([2, 0], [-10, 0], [-8, 0])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 2), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -8), binding("F", 0)]),
                uses([
                  proof(goal(add(2, -10, -8)), by(builtin(add, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [2, 0], [-8, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [2, 0]), binding("Acc", [-8, 0]), binding("Value", [0, 0]), binding("Product", [-16, 0]), binding("Next", [19, 0])]),
                uses([
                  proof(
                    goal(c_mul([-8, 0], [2, 0], [-16, 0])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -8), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", -16), binding("F", 0), binding("AC", -16), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                    uses([
                      proof(goal(mul(-8, 2, -16)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(sub(-16, 0, -16)), by(builtin(sub, 3))),
                      proof(goal(mul(-8, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([-16, 0], [35, 0], [19, 0])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", -16), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 19), binding("F", 0)]),
                    uses([
                      proof(goal(add(-16, 35, 19)), by(builtin(add, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[-50, 0], [24, 0]], [2, 0], [19, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [2, 0]), binding("Acc", [19, 0]), binding("Value", [0, 0]), binding("Product", [38, 0]), binding("Next", [-12, 0])]),
                    uses([
                      proof(
                        goal(c_mul([19, 0], [2, 0], [38, 0])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 19), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", 38), binding("F", 0), binding("AC", 38), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                        uses([
                          proof(goal(mul(19, 2, 38)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(sub(38, 0, 38)), by(builtin(sub, 3))),
                          proof(goal(mul(19, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([38, 0], [-50, 0], [-12, 0])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", 38), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -12), binding("F", 0)]),
                        uses([
                          proof(goal(add(38, -50, -12)), by(builtin(add, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[24, 0]], [2, 0], [-12, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [2, 0]), binding("Acc", [-12, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([-12, 0], [2, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -12), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-12, 2, -24)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                              proof(goal(mul(-12, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [2, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [2, 0]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

root(real_quartic, [3, 0]).
why(
  root(real_quartic, [3, 0]),
  proof(
    goal(root(real_quartic, [3, 0])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", real_quartic), binding("Root", [3, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
      proof(
        goal(candidate(real_quartic, [3, 0])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", real_quartic), binding("R", 3), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
        uses([
          proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
          proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
          proof(goal(between(0, 5, 3)), by(builtin(between, 3))),
          proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [3, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [3, 0]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [3, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [3, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [3, 0]), binding("Next", [-7, 0])]),
            uses([
              proof(
                goal(c_mul([1, 0], [3, 0], [3, 0])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", 3), binding("F", 0), binding("AC", 3), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 3, 3)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(3, 0, 3)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([3, 0], [-10, 0], [-7, 0])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 3), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -7), binding("F", 0)]),
                uses([
                  proof(goal(add(3, -10, -7)), by(builtin(add, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [3, 0], [-7, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [3, 0]), binding("Acc", [-7, 0]), binding("Value", [0, 0]), binding("Product", [-21, 0]), binding("Next", [14, 0])]),
                uses([
                  proof(
                    goal(c_mul([-7, 0], [3, 0], [-21, 0])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -7), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", -21), binding("F", 0), binding("AC", -21), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                    uses([
                      proof(goal(mul(-7, 3, -21)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(sub(-21, 0, -21)), by(builtin(sub, 3))),
                      proof(goal(mul(-7, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([-21, 0], [35, 0], [14, 0])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", -21), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 14), binding("F", 0)]),
                    uses([
                      proof(goal(add(-21, 35, 14)), by(builtin(add, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[-50, 0], [24, 0]], [3, 0], [14, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [3, 0]), binding("Acc", [14, 0]), binding("Value", [0, 0]), binding("Product", [42, 0]), binding("Next", [-8, 0])]),
                    uses([
                      proof(
                        goal(c_mul([14, 0], [3, 0], [42, 0])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 14), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", 42), binding("F", 0), binding("AC", 42), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                        uses([
                          proof(goal(mul(14, 3, 42)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(sub(42, 0, 42)), by(builtin(sub, 3))),
                          proof(goal(mul(14, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([42, 0], [-50, 0], [-8, 0])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", 42), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -8), binding("F", 0)]),
                        uses([
                          proof(goal(add(42, -50, -8)), by(builtin(add, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[24, 0]], [3, 0], [-8, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [3, 0]), binding("Acc", [-8, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([-8, 0], [3, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -8), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-8, 3, -24)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                              proof(goal(mul(-8, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [3, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [3, 0]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

root(real_quartic, [4, 0]).
why(
  root(real_quartic, [4, 0]),
  proof(
    goal(root(real_quartic, [4, 0])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", real_quartic), binding("Root", [4, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
      proof(
        goal(candidate(real_quartic, [4, 0])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", real_quartic), binding("R", 4), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
        uses([
          proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
          proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
          proof(goal(between(0, 5, 4)), by(builtin(between, 3))),
          proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [4, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [4, 0]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [4, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [4, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [4, 0]), binding("Next", [-6, 0])]),
            uses([
              proof(
                goal(c_mul([1, 0], [4, 0], [4, 0])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", 4), binding("F", 0), binding("AC", 4), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(4, 0, 4)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([4, 0], [-10, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 4), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -6), binding("F", 0)]),
                uses([
                  proof(goal(add(4, -10, -6)), by(builtin(add, 3))),
                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [4, 0], [-6, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [4, 0]), binding("Acc", [-6, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [11, 0])]),
                uses([
                  proof(
                    goal(c_mul([-6, 0], [4, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -6), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                    uses([
                      proof(goal(mul(-6, 4, -24)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                      proof(goal(mul(-6, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([-24, 0], [35, 0], [11, 0])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", -24), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 11), binding("F", 0)]),
                    uses([
                      proof(goal(add(-24, 35, 11)), by(builtin(add, 3))),
                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[-50, 0], [24, 0]], [4, 0], [11, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [4, 0]), binding("Acc", [11, 0]), binding("Value", [0, 0]), binding("Product", [44, 0]), binding("Next", [-6, 0])]),
                    uses([
                      proof(
                        goal(c_mul([11, 0], [4, 0], [44, 0])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 11), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", 44), binding("F", 0), binding("AC", 44), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                        uses([
                          proof(goal(mul(11, 4, 44)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(sub(44, 0, 44)), by(builtin(sub, 3))),
                          proof(goal(mul(11, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([44, 0], [-50, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", 44), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -6), binding("F", 0)]),
                        uses([
                          proof(goal(add(44, -50, -6)), by(builtin(add, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[24, 0]], [4, 0], [-6, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [4, 0]), binding("Acc", [-6, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([-6, 0], [4, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -6), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-6, 4, -24)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                              proof(goal(mul(-6, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [4, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [4, 0]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

root(complex_quartic, [0, 1]).
why(
  root(complex_quartic, [0, 1]),
  proof(
    goal(root(complex_quartic, [0, 1])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", complex_quartic), binding("Root", [0, 1]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
      proof(
        goal(candidate(complex_quartic, [0, 1])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", complex_quartic), binding("R", 0), binding("I", 1), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
        uses([
          proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
          proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
          proof(goal(between(0, 5, 0)), by(builtin(between, 3))),
          proof(goal(between(0, 2, 1)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [0, 1], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [0, 1]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [0, 1], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [0, 1]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [0, 1]), binding("Next", [-9, -4])]),
            uses([
              proof(
                goal(c_mul([1, 0], [0, 1], [0, 1])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 1), binding("E", 0), binding("F", 1), binding("AC", 0), binding("BD", 0), binding("AD", 1), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(0, 0, 0)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([0, 1], [-9, -5], [-9, -4])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 0), binding("B", 1), binding("C", -9), binding("D", -5), binding("E", -9), binding("F", -4)]),
                uses([
                  proof(goal(add(0, -9, -9)), by(builtin(add, 3))),
                  proof(goal(add(1, -5, -4)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [0, 1], [-9, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [0, 1]), binding("Acc", [-9, -4]), binding("Value", [0, 0]), binding("Product", [4, -9]), binding("Next", [18, 24])]),
                uses([
                  proof(
                    goal(c_mul([-9, -4], [0, 1], [4, -9])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -9), binding("B", -4), binding("C", 0), binding("D", 1), binding("E", 4), binding("F", -9), binding("AC", 0), binding("BD", -4), binding("AD", -9), binding("BC", 0)]),
                    uses([
                      proof(goal(mul(-9, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                      proof(goal(sub(0, -4, 4)), by(builtin(sub, 3))),
                      proof(goal(mul(-9, 1, -9)), by(builtin(mul, 3))),
                      proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                      proof(goal(add(-9, 0, -9)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([4, -9], [14, 33], [18, 24])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", 4), binding("B", -9), binding("C", 14), binding("D", 33), binding("E", 18), binding("F", 24)]),
                    uses([
                      proof(goal(add(4, 14, 18)), by(builtin(add, 3))),
                      proof(goal(add(-9, 33, 24)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[24, -44], [-26, 0]], [0, 1], [18, 24], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [0, 1]), binding("Acc", [18, 24]), binding("Value", [0, 0]), binding("Product", [-24, 18]), binding("Next", [0, -26])]),
                    uses([
                      proof(
                        goal(c_mul([18, 24], [0, 1], [-24, 18])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 18), binding("B", 24), binding("C", 0), binding("D", 1), binding("E", -24), binding("F", 18), binding("AC", 0), binding("BD", 24), binding("AD", 18), binding("BC", 0)]),
                        uses([
                          proof(goal(mul(18, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(mul(24, 1, 24)), by(builtin(mul, 3))),
                          proof(goal(sub(0, 24, -24)), by(builtin(sub, 3))),
                          proof(goal(mul(18, 1, 18)), by(builtin(mul, 3))),
                          proof(goal(mul(24, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(add(18, 0, 18)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([-24, 18], [24, -44], [0, -26])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", -24), binding("B", 18), binding("C", 24), binding("D", -44), binding("E", 0), binding("F", -26)]),
                        uses([
                          proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                          proof(goal(add(18, -44, -26)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[-26, 0]], [0, 1], [0, -26], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [0, 1]), binding("Acc", [0, -26]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([0, -26], [0, 1], [26, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 0), binding("B", -26), binding("C", 0), binding("D", 1), binding("E", 26), binding("F", 0), binding("AC", 0), binding("BD", -26), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(-26, 1, -26)), by(builtin(mul, 3))),
                              proof(goal(sub(0, -26, 26)), by(builtin(sub, 3))),
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(-26, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [0, 1], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [0, 1]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

root(complex_quartic, [1, 1]).
why(
  root(complex_quartic, [1, 1]),
  proof(
    goal(root(complex_quartic, [1, 1])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", complex_quartic), binding("Root", [1, 1]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
      proof(
        goal(candidate(complex_quartic, [1, 1])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", complex_quartic), binding("R", 1), binding("I", 1), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
        uses([
          proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
          proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
          proof(goal(between(0, 5, 1)), by(builtin(between, 3))),
          proof(goal(between(0, 2, 1)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [1, 1], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [1, 1]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [1, 1], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [1, 1]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [1, 1]), binding("Next", [-8, -4])]),
            uses([
              proof(
                goal(c_mul([1, 0], [1, 1], [1, 1])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 1), binding("D", 1), binding("E", 1), binding("F", 1), binding("AC", 1), binding("BD", 0), binding("AD", 1), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(1, 0, 1)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([1, 1], [-9, -5], [-8, -4])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 1), binding("B", 1), binding("C", -9), binding("D", -5), binding("E", -8), binding("F", -4)]),
                uses([
                  proof(goal(add(1, -9, -8)), by(builtin(add, 3))),
                  proof(goal(add(1, -5, -4)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [1, 1], [-8, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [1, 1]), binding("Acc", [-8, -4]), binding("Value", [0, 0]), binding("Product", [-4, -12]), binding("Next", [10, 21])]),
                uses([
                  proof(
                    goal(c_mul([-8, -4], [1, 1], [-4, -12])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -8), binding("B", -4), binding("C", 1), binding("D", 1), binding("E", -4), binding("F", -12), binding("AC", -8), binding("BD", -4), binding("AD", -8), binding("BC", -4)]),
                    uses([
                      proof(goal(mul(-8, 1, -8)), by(builtin(mul, 3))),
                      proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                      proof(goal(sub(-8, -4, -4)), by(builtin(sub, 3))),
                      proof(goal(mul(-8, 1, -8)), by(builtin(mul, 3))),
                      proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                      proof(goal(add(-8, -4, -12)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([-4, -12], [14, 33], [10, 21])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", -4), binding("B", -12), binding("C", 14), binding("D", 33), binding("E", 10), binding("F", 21)]),
                    uses([
                      proof(goal(add(-4, 14, 10)), by(builtin(add, 3))),
                      proof(goal(add(-12, 33, 21)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[24, -44], [-26, 0]], [1, 1], [10, 21], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [1, 1]), binding("Acc", [10, 21]), binding("Value", [0, 0]), binding("Product", [-11, 31]), binding("Next", [13, -13])]),
                    uses([
                      proof(
                        goal(c_mul([10, 21], [1, 1], [-11, 31])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 10), binding("B", 21), binding("C", 1), binding("D", 1), binding("E", -11), binding("F", 31), binding("AC", 10), binding("BD", 21), binding("AD", 10), binding("BC", 21)]),
                        uses([
                          proof(goal(mul(10, 1, 10)), by(builtin(mul, 3))),
                          proof(goal(mul(21, 1, 21)), by(builtin(mul, 3))),
                          proof(goal(sub(10, 21, -11)), by(builtin(sub, 3))),
                          proof(goal(mul(10, 1, 10)), by(builtin(mul, 3))),
                          proof(goal(mul(21, 1, 21)), by(builtin(mul, 3))),
                          proof(goal(add(10, 21, 31)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([-11, 31], [24, -44], [13, -13])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", -11), binding("B", 31), binding("C", 24), binding("D", -44), binding("E", 13), binding("F", -13)]),
                        uses([
                          proof(goal(add(-11, 24, 13)), by(builtin(add, 3))),
                          proof(goal(add(31, -44, -13)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[-26, 0]], [1, 1], [13, -13], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [1, 1]), binding("Acc", [13, -13]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([13, -13], [1, 1], [26, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 13), binding("B", -13), binding("C", 1), binding("D", 1), binding("E", 26), binding("F", 0), binding("AC", 13), binding("BD", -13), binding("AD", 13), binding("BC", -13)]),
                            uses([
                              proof(goal(mul(13, 1, 13)), by(builtin(mul, 3))),
                              proof(goal(mul(-13, 1, -13)), by(builtin(mul, 3))),
                              proof(goal(sub(13, -13, 26)), by(builtin(sub, 3))),
                              proof(goal(mul(13, 1, 13)), by(builtin(mul, 3))),
                              proof(goal(mul(-13, 1, -13)), by(builtin(mul, 3))),
                              proof(goal(add(13, -13, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [1, 1], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [1, 1]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

root(complex_quartic, [3, 2]).
why(
  root(complex_quartic, [3, 2]),
  proof(
    goal(root(complex_quartic, [3, 2])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", complex_quartic), binding("Root", [3, 2]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
      proof(
        goal(candidate(complex_quartic, [3, 2])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", complex_quartic), binding("R", 3), binding("I", 2), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
        uses([
          proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
          proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
          proof(goal(between(0, 5, 3)), by(builtin(between, 3))),
          proof(goal(between(0, 2, 2)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [3, 2], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [3, 2]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [3, 2], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [3, 2]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [3, 2]), binding("Next", [-6, -3])]),
            uses([
              proof(
                goal(c_mul([1, 0], [3, 2], [3, 2])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 3), binding("D", 2), binding("E", 3), binding("F", 2), binding("AC", 3), binding("BD", 0), binding("AD", 2), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 3, 3)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(3, 0, 3)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 2, 2)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                  proof(goal(add(2, 0, 2)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([3, 2], [-9, -5], [-6, -3])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 3), binding("B", 2), binding("C", -9), binding("D", -5), binding("E", -6), binding("F", -3)]),
                uses([
                  proof(goal(add(3, -9, -6)), by(builtin(add, 3))),
                  proof(goal(add(2, -5, -3)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [3, 2], [-6, -3], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [3, 2]), binding("Acc", [-6, -3]), binding("Value", [0, 0]), binding("Product", [-12, -21]), binding("Next", [2, 12])]),
                uses([
                  proof(
                    goal(c_mul([-6, -3], [3, 2], [-12, -21])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -6), binding("B", -3), binding("C", 3), binding("D", 2), binding("E", -12), binding("F", -21), binding("AC", -18), binding("BD", -6), binding("AD", -12), binding("BC", -9)]),
                    uses([
                      proof(goal(mul(-6, 3, -18)), by(builtin(mul, 3))),
                      proof(goal(mul(-3, 2, -6)), by(builtin(mul, 3))),
                      proof(goal(sub(-18, -6, -12)), by(builtin(sub, 3))),
                      proof(goal(mul(-6, 2, -12)), by(builtin(mul, 3))),
                      proof(goal(mul(-3, 3, -9)), by(builtin(mul, 3))),
                      proof(goal(add(-12, -9, -21)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([-12, -21], [14, 33], [2, 12])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", -12), binding("B", -21), binding("C", 14), binding("D", 33), binding("E", 2), binding("F", 12)]),
                    uses([
                      proof(goal(add(-12, 14, 2)), by(builtin(add, 3))),
                      proof(goal(add(-21, 33, 12)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[24, -44], [-26, 0]], [3, 2], [2, 12], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [3, 2]), binding("Acc", [2, 12]), binding("Value", [0, 0]), binding("Product", [-18, 40]), binding("Next", [6, -4])]),
                    uses([
                      proof(
                        goal(c_mul([2, 12], [3, 2], [-18, 40])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 2), binding("B", 12), binding("C", 3), binding("D", 2), binding("E", -18), binding("F", 40), binding("AC", 6), binding("BD", 24), binding("AD", 4), binding("BC", 36)]),
                        uses([
                          proof(goal(mul(2, 3, 6)), by(builtin(mul, 3))),
                          proof(goal(mul(12, 2, 24)), by(builtin(mul, 3))),
                          proof(goal(sub(6, 24, -18)), by(builtin(sub, 3))),
                          proof(goal(mul(2, 2, 4)), by(builtin(mul, 3))),
                          proof(goal(mul(12, 3, 36)), by(builtin(mul, 3))),
                          proof(goal(add(4, 36, 40)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([-18, 40], [24, -44], [6, -4])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", -18), binding("B", 40), binding("C", 24), binding("D", -44), binding("E", 6), binding("F", -4)]),
                        uses([
                          proof(goal(add(-18, 24, 6)), by(builtin(add, 3))),
                          proof(goal(add(40, -44, -4)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[-26, 0]], [3, 2], [6, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [3, 2]), binding("Acc", [6, -4]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([6, -4], [3, 2], [26, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 6), binding("B", -4), binding("C", 3), binding("D", 2), binding("E", 26), binding("F", 0), binding("AC", 18), binding("BD", -8), binding("AD", 12), binding("BC", -12)]),
                            uses([
                              proof(goal(mul(6, 3, 18)), by(builtin(mul, 3))),
                              proof(goal(mul(-4, 2, -8)), by(builtin(mul, 3))),
                              proof(goal(sub(18, -8, 26)), by(builtin(sub, 3))),
                              proof(goal(mul(6, 2, 12)), by(builtin(mul, 3))),
                              proof(goal(mul(-4, 3, -12)), by(builtin(mul, 3))),
                              proof(goal(add(12, -12, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [3, 2], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [3, 2]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

root(complex_quartic, [5, 1]).
why(
  root(complex_quartic, [5, 1]),
  proof(
    goal(root(complex_quartic, [5, 1])), by(rule("polynomial.pl", clause(25))),
    bindings([binding("Case", complex_quartic), binding("Root", [5, 1]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
    uses([
      proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
      proof(
        goal(candidate(complex_quartic, [5, 1])), by(rule("polynomial.pl", clause(24))),
        bindings([binding("Case", complex_quartic), binding("R", 5), binding("I", 1), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
        uses([
          proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
          proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
          proof(goal(between(0, 5, 5)), by(builtin(between, 3))),
          proof(goal(between(0, 2, 1)), by(builtin(between, 3)))
        ])
      ),
      proof(
        goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [5, 1], [0, 0])), by(rule("polynomial.pl", clause(21))),
        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [5, 1]), binding("Value", [0, 0])]),
        uses([
          proof(
            goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [5, 1], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
            bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [5, 1]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [5, 1]), binding("Next", [-4, -4])]),
            uses([
              proof(
                goal(c_mul([1, 0], [5, 1], [5, 1])), by(rule("polynomial.pl", clause(20))),
                bindings([binding("A", 1), binding("B", 0), binding("C", 5), binding("D", 1), binding("E", 5), binding("F", 1), binding("AC", 5), binding("BD", 0), binding("AD", 1), binding("BC", 0)]),
                uses([
                  proof(goal(mul(1, 5, 5)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                  proof(goal(sub(5, 0, 5)), by(builtin(sub, 3))),
                  proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                  proof(goal(mul(0, 5, 0)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add([5, 1], [-9, -5], [-4, -4])), by(rule("polynomial.pl", clause(17))),
                bindings([binding("A", 5), binding("B", 1), binding("C", -9), binding("D", -5), binding("E", -4), binding("F", -4)]),
                uses([
                  proof(goal(add(5, -9, -4)), by(builtin(add, 3))),
                  proof(goal(add(1, -5, -4)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [5, 1], [-4, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [5, 1]), binding("Acc", [-4, -4]), binding("Value", [0, 0]), binding("Product", [-16, -24]), binding("Next", [-2, 9])]),
                uses([
                  proof(
                    goal(c_mul([-4, -4], [5, 1], [-16, -24])), by(rule("polynomial.pl", clause(20))),
                    bindings([binding("A", -4), binding("B", -4), binding("C", 5), binding("D", 1), binding("E", -16), binding("F", -24), binding("AC", -20), binding("BD", -4), binding("AD", -4), binding("BC", -20)]),
                    uses([
                      proof(goal(mul(-4, 5, -20)), by(builtin(mul, 3))),
                      proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                      proof(goal(sub(-20, -4, -16)), by(builtin(sub, 3))),
                      proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                      proof(goal(mul(-4, 5, -20)), by(builtin(mul, 3))),
                      proof(goal(add(-4, -20, -24)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_add([-16, -24], [14, 33], [-2, 9])), by(rule("polynomial.pl", clause(17))),
                    bindings([binding("A", -16), binding("B", -24), binding("C", 14), binding("D", 33), binding("E", -2), binding("F", 9)]),
                    uses([
                      proof(goal(add(-16, 14, -2)), by(builtin(add, 3))),
                      proof(goal(add(-24, 33, 9)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval_acc([[24, -44], [-26, 0]], [5, 1], [-2, 9], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [5, 1]), binding("Acc", [-2, 9]), binding("Value", [0, 0]), binding("Product", [-19, 43]), binding("Next", [5, -1])]),
                    uses([
                      proof(
                        goal(c_mul([-2, 9], [5, 1], [-19, 43])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", -2), binding("B", 9), binding("C", 5), binding("D", 1), binding("E", -19), binding("F", 43), binding("AC", -10), binding("BD", 9), binding("AD", -2), binding("BC", 45)]),
                        uses([
                          proof(goal(mul(-2, 5, -10)), by(builtin(mul, 3))),
                          proof(goal(mul(9, 1, 9)), by(builtin(mul, 3))),
                          proof(goal(sub(-10, 9, -19)), by(builtin(sub, 3))),
                          proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                          proof(goal(mul(9, 5, 45)), by(builtin(mul, 3))),
                          proof(goal(add(-2, 45, 43)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([-19, 43], [24, -44], [5, -1])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", -19), binding("B", 43), binding("C", 24), binding("D", -44), binding("E", 5), binding("F", -1)]),
                        uses([
                          proof(goal(add(-19, 24, 5)), by(builtin(add, 3))),
                          proof(goal(add(43, -44, -1)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[-26, 0]], [5, 1], [5, -1], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [5, 1]), binding("Acc", [5, -1]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                        uses([
                          proof(
                            goal(c_mul([5, -1], [5, 1], [26, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 5), binding("B", -1), binding("C", 5), binding("D", 1), binding("E", 26), binding("F", 0), binding("AC", 25), binding("BD", -1), binding("AD", 5), binding("BC", -5)]),
                            uses([
                              proof(goal(mul(5, 5, 25)), by(builtin(mul, 3))),
                              proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                              proof(goal(sub(25, -1, 26)), by(builtin(sub, 3))),
                              proof(goal(mul(5, 1, 5)), by(builtin(mul, 3))),
                              proof(goal(mul(-1, 5, -5)), by(builtin(mul, 3))),
                              proof(goal(add(5, -5, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                            uses([
                              proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([], [5, 1], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                            bindings([binding("_X", [5, 1]), binding("Acc", [0, 0])])
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
      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
    ])
  )
).

reconstructedPolynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]).
why(
  reconstructedPolynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]),
  proof(
    goal(reconstructedPolynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(35))),
    bindings([binding("Case", real_quartic), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])]),
    uses([
      proof(
        goal(reconstructed(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(34))),
        bindings([binding("Case", real_quartic), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Roots", [[1, 0], [2, 0], [3, 0], [4, 0]])]),
        uses([
          proof(goal(known_roots(real_quartic, [[1, 0], [2, 0], [3, 0], [4, 0]])), by(fact("polynomial.pl", clause(14)))),
          proof(
            goal(poly_from_roots([[1, 0], [2, 0], [3, 0], [4, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(26))),
            bindings([binding("Roots", [[1, 0], [2, 0], [3, 0], [4, 0]]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])]),
            uses([
              proof(
                goal(poly_from_roots_acc([[1, 0], [2, 0], [3, 0], [4, 0]], [[1, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                bindings([binding("Root", [1, 0]), binding("Rest", [[2, 0], [3, 0], [4, 0]]), binding("Coeffs", [[1, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-1, 0]])]),
                uses([
                  proof(
                    goal(poly_mul_linear([[1, 0]], [1, 0], [[1, 0], [-1, 0]])), by(rule("polynomial.pl", clause(29))),
                    bindings([binding("Coeffs", [[1, 0]]), binding("Root", [1, 0]), binding("Product", [[1, 0], [-1, 0]]), binding("Shifted", [[1, 0], [0, 0]]), binding("MinusRoot", [-1, 0]), binding("Scaled", [[-1, 0]]), binding("Lower", [[0, 0], [-1, 0]])]),
                    uses([
                      proof(goal(append([[1, 0]], [[0, 0]], [[1, 0], [0, 0]])), by(builtin(append, 3))),
                      proof(
                        goal(c_neg([1, 0], [-1, 0])), by(rule("polynomial.pl", clause(19))),
                        bindings([binding("A", 1), binding("B", 0), binding("C", -1), binding("D", 0)]),
                        uses([
                          proof(goal(neg(1, -1)), by(builtin(neg, 2))),
                          proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                        ])
                      ),
                      proof(
                        goal(poly_scale([-1, 0], [[1, 0]], [[-1, 0]])), by(rule("polynomial.pl", clause(31))),
                        bindings([binding("Factor", [-1, 0]), binding("Coeff", [1, 0]), binding("Rest", []), binding("Product", [-1, 0]), binding("Scaled", [])]),
                        uses([
                          proof(
                            goal(c_mul([-1, 0], [1, 0], [-1, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -1), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -1), binding("F", 0), binding("AC", -1), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(-1, 0, -1)), by(builtin(sub, 3))),
                              proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([-1, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                            bindings([binding("_Factor", [-1, 0])])
                          )
                        ])
                      ),
                      proof(goal(append([[0, 0]], [[-1, 0]], [[0, 0], [-1, 0]])), by(builtin(append, 3))),
                      proof(
                        goal(poly_add([[1, 0], [0, 0]], [[0, 0], [-1, 0]], [[1, 0], [-1, 0]])), by(rule("polynomial.pl", clause(33))),
                        bindings([binding("A", [1, 0]), binding("As", [[0, 0]]), binding("B", [0, 0]), binding("Bs", [[-1, 0]]), binding("C", [1, 0]), binding("Cs", [[-1, 0]])]),
                        uses([
                          proof(
                            goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                            uses([
                              proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_add([[0, 0]], [[-1, 0]], [[-1, 0]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-1, 0]), binding("Bs", []), binding("C", [-1, 0]), binding("Cs", [])]),
                            uses([
                              proof(
                                goal(c_add([0, 0], [-1, 0], [-1, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 0), binding("B", 0), binding("C", -1), binding("D", 0), binding("E", -1), binding("F", 0)]),
                                uses([
                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                            ])
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(poly_from_roots_acc([[2, 0], [3, 0], [4, 0]], [[1, 0], [-1, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                    bindings([binding("Root", [2, 0]), binding("Rest", [[3, 0], [4, 0]]), binding("Coeffs", [[1, 0], [-1, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-3, 0], [2, 0]])]),
                    uses([
                      proof(
                        goal(poly_mul_linear([[1, 0], [-1, 0]], [2, 0], [[1, 0], [-3, 0], [2, 0]])), by(rule("polynomial.pl", clause(29))),
                        bindings([binding("Coeffs", [[1, 0], [-1, 0]]), binding("Root", [2, 0]), binding("Product", [[1, 0], [-3, 0], [2, 0]]), binding("Shifted", [[1, 0], [-1, 0], [0, 0]]), binding("MinusRoot", [-2, 0]), binding("Scaled", [[-2, 0], [2, 0]]), binding("Lower", [[0, 0], [-2, 0], [2, 0]])]),
                        uses([
                          proof(goal(append([[1, 0], [-1, 0]], [[0, 0]], [[1, 0], [-1, 0], [0, 0]])), by(builtin(append, 3))),
                          proof(
                            goal(c_neg([2, 0], [-2, 0])), by(rule("polynomial.pl", clause(19))),
                            bindings([binding("A", 2), binding("B", 0), binding("C", -2), binding("D", 0)]),
                            uses([
                              proof(goal(neg(2, -2)), by(builtin(neg, 2))),
                              proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([-2, 0], [[1, 0], [-1, 0]], [[-2, 0], [2, 0]])), by(rule("polynomial.pl", clause(31))),
                            bindings([binding("Factor", [-2, 0]), binding("Coeff", [1, 0]), binding("Rest", [[-1, 0]]), binding("Product", [-2, 0]), binding("Scaled", [[2, 0]])]),
                            uses([
                              proof(
                                goal(c_mul([-2, 0], [1, 0], [-2, 0])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", -2), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -2), binding("F", 0), binding("AC", -2), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                uses([
                                  proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(-2, 0, -2)), by(builtin(sub, 3))),
                                  proof(goal(mul(-2, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-2, 0], [[-1, 0]], [[2, 0]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-2, 0]), binding("Coeff", [-1, 0]), binding("Rest", []), binding("Product", [2, 0]), binding("Scaled", [])]),
                                uses([
                                  proof(
                                    goal(c_mul([-2, 0], [-1, 0], [2, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -2), binding("B", 0), binding("C", -1), binding("D", 0), binding("E", 2), binding("F", 0), binding("AC", 2), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-2, -1, 2)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(2, 0, 2)), by(builtin(sub, 3))),
                                      proof(goal(mul(-2, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, -1, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-2, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                                    bindings([binding("_Factor", [-2, 0])])
                                  )
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([[0, 0]], [[-2, 0], [2, 0]], [[0, 0], [-2, 0], [2, 0]])), by(builtin(append, 3))),
                          proof(
                            goal(poly_add([[1, 0], [-1, 0], [0, 0]], [[0, 0], [-2, 0], [2, 0]], [[1, 0], [-3, 0], [2, 0]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [1, 0]), binding("As", [[-1, 0], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-2, 0], [2, 0]]), binding("C", [1, 0]), binding("Cs", [[-3, 0], [2, 0]])]),
                            uses([
                              proof(
                                goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                uses([
                                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_add([[-1, 0], [0, 0]], [[-2, 0], [2, 0]], [[-3, 0], [2, 0]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [-1, 0]), binding("As", [[0, 0]]), binding("B", [-2, 0]), binding("Bs", [[2, 0]]), binding("C", [-3, 0]), binding("Cs", [[2, 0]])]),
                                uses([
                                  proof(
                                    goal(c_add([-1, 0], [-2, 0], [-3, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", -1), binding("B", 0), binding("C", -2), binding("D", 0), binding("E", -3), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(-1, -2, -3)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[0, 0]], [[2, 0]], [[2, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [2, 0]), binding("Bs", []), binding("C", [2, 0]), binding("Cs", [])]),
                                    uses([
                                      proof(
                                        goal(c_add([0, 0], [2, 0], [2, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 0), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", 2), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(0, 2, 2)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(poly_from_roots_acc([[3, 0], [4, 0]], [[1, 0], [-3, 0], [2, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                        bindings([binding("Root", [3, 0]), binding("Rest", [[4, 0]]), binding("Coeffs", [[1, 0], [-3, 0], [2, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-6, 0], [11, 0], [-6, 0]])]),
                        uses([
                          proof(
                            goal(poly_mul_linear([[1, 0], [-3, 0], [2, 0]], [3, 0], [[1, 0], [-6, 0], [11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(29))),
                            bindings([binding("Coeffs", [[1, 0], [-3, 0], [2, 0]]), binding("Root", [3, 0]), binding("Product", [[1, 0], [-6, 0], [11, 0], [-6, 0]]), binding("Shifted", [[1, 0], [-3, 0], [2, 0], [0, 0]]), binding("MinusRoot", [-3, 0]), binding("Scaled", [[-3, 0], [9, 0], [-6, 0]]), binding("Lower", [[0, 0], [-3, 0], [9, 0], [-6, 0]])]),
                            uses([
                              proof(goal(append([[1, 0], [-3, 0], [2, 0]], [[0, 0]], [[1, 0], [-3, 0], [2, 0], [0, 0]])), by(builtin(append, 3))),
                              proof(
                                goal(c_neg([3, 0], [-3, 0])), by(rule("polynomial.pl", clause(19))),
                                bindings([binding("A", 3), binding("B", 0), binding("C", -3), binding("D", 0)]),
                                uses([
                                  proof(goal(neg(3, -3)), by(builtin(neg, 2))),
                                  proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-3, 0], [[1, 0], [-3, 0], [2, 0]], [[-3, 0], [9, 0], [-6, 0]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-3, 0]), binding("Coeff", [1, 0]), binding("Rest", [[-3, 0], [2, 0]]), binding("Product", [-3, 0]), binding("Scaled", [[9, 0], [-6, 0]])]),
                                uses([
                                  proof(
                                    goal(c_mul([-3, 0], [1, 0], [-3, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -3), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -3), binding("F", 0), binding("AC", -3), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-3, 1, -3)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(-3, 0, -3)), by(builtin(sub, 3))),
                                      proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-3, 0], [[-3, 0], [2, 0]], [[9, 0], [-6, 0]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-3, 0]), binding("Coeff", [-3, 0]), binding("Rest", [[2, 0]]), binding("Product", [9, 0]), binding("Scaled", [[-6, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-3, 0], [-3, 0], [9, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -3), binding("B", 0), binding("C", -3), binding("D", 0), binding("E", 9), binding("F", 0), binding("AC", 9), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                        uses([
                                          proof(goal(mul(-3, -3, 9)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(9, 0, 9)), by(builtin(sub, 3))),
                                          proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, -3, 0)), by(builtin(mul, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-3, 0], [[2, 0]], [[-6, 0]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-3, 0]), binding("Coeff", [2, 0]), binding("Rest", []), binding("Product", [-6, 0]), binding("Scaled", [])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-3, 0], [2, 0], [-6, 0])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -3), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", -6), binding("F", 0), binding("AC", -6), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                            uses([
                                              proof(goal(mul(-3, 2, -6)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(sub(-6, 0, -6)), by(builtin(sub, 3))),
                                              proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-3, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                                            bindings([binding("_Factor", [-3, 0])])
                                          )
                                        ])
                                      )
                                    ])
                                  )
                                ])
                              ),
                              proof(goal(append([[0, 0]], [[-3, 0], [9, 0], [-6, 0]], [[0, 0], [-3, 0], [9, 0], [-6, 0]])), by(builtin(append, 3))),
                              proof(
                                goal(poly_add([[1, 0], [-3, 0], [2, 0], [0, 0]], [[0, 0], [-3, 0], [9, 0], [-6, 0]], [[1, 0], [-6, 0], [11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [1, 0]), binding("As", [[-3, 0], [2, 0], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-3, 0], [9, 0], [-6, 0]]), binding("C", [1, 0]), binding("Cs", [[-6, 0], [11, 0], [-6, 0]])]),
                                uses([
                                  proof(
                                    goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[-3, 0], [2, 0], [0, 0]], [[-3, 0], [9, 0], [-6, 0]], [[-6, 0], [11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [-3, 0]), binding("As", [[2, 0], [0, 0]]), binding("B", [-3, 0]), binding("Bs", [[9, 0], [-6, 0]]), binding("C", [-6, 0]), binding("Cs", [[11, 0], [-6, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_add([-3, 0], [-3, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -3), binding("B", 0), binding("C", -3), binding("D", 0), binding("E", -6), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(-3, -3, -6)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[2, 0], [0, 0]], [[9, 0], [-6, 0]], [[11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [2, 0]), binding("As", [[0, 0]]), binding("B", [9, 0]), binding("Bs", [[-6, 0]]), binding("C", [11, 0]), binding("Cs", [[-6, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_add([2, 0], [9, 0], [11, 0])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", 2), binding("B", 0), binding("C", 9), binding("D", 0), binding("E", 11), binding("F", 0)]),
                                            uses([
                                              proof(goal(add(2, 9, 11)), by(builtin(add, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[0, 0]], [[-6, 0]], [[-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-6, 0]), binding("Bs", []), binding("C", [-6, 0]), binding("Cs", [])]),
                                            uses([
                                              proof(
                                                goal(c_add([0, 0], [-6, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", 0), binding("B", 0), binding("C", -6), binding("D", 0), binding("E", -6), binding("F", 0)]),
                                                uses([
                                                  proof(goal(add(0, -6, -6)), by(builtin(add, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                          proof(
                            goal(poly_from_roots_acc([[4, 0]], [[1, 0], [-6, 0], [11, 0], [-6, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                            bindings([binding("Root", [4, 0]), binding("Rest", []), binding("Coeffs", [[1, 0], [-6, 0], [11, 0], [-6, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])]),
                            uses([
                              proof(
                                goal(poly_mul_linear([[1, 0], [-6, 0], [11, 0], [-6, 0]], [4, 0], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(29))),
                                bindings([binding("Coeffs", [[1, 0], [-6, 0], [11, 0], [-6, 0]]), binding("Root", [4, 0]), binding("Product", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Shifted", [[1, 0], [-6, 0], [11, 0], [-6, 0], [0, 0]]), binding("MinusRoot", [-4, 0]), binding("Scaled", [[-4, 0], [24, 0], [-44, 0], [24, 0]]), binding("Lower", [[0, 0], [-4, 0], [24, 0], [-44, 0], [24, 0]])]),
                                uses([
                                  proof(goal(append([[1, 0], [-6, 0], [11, 0], [-6, 0]], [[0, 0]], [[1, 0], [-6, 0], [11, 0], [-6, 0], [0, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(c_neg([4, 0], [-4, 0])), by(rule("polynomial.pl", clause(19))),
                                    bindings([binding("A", 4), binding("B", 0), binding("C", -4), binding("D", 0)]),
                                    uses([
                                      proof(goal(neg(4, -4)), by(builtin(neg, 2))),
                                      proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-4, 0], [[1, 0], [-6, 0], [11, 0], [-6, 0]], [[-4, 0], [24, 0], [-44, 0], [24, 0]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-4, 0]), binding("Coeff", [1, 0]), binding("Rest", [[-6, 0], [11, 0], [-6, 0]]), binding("Product", [-4, 0]), binding("Scaled", [[24, 0], [-44, 0], [24, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-4, 0], [1, 0], [-4, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -4), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -4), binding("F", 0), binding("AC", -4), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                        uses([
                                          proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(-4, 0, -4)), by(builtin(sub, 3))),
                                          proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-4, 0], [[-6, 0], [11, 0], [-6, 0]], [[24, 0], [-44, 0], [24, 0]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-4, 0]), binding("Coeff", [-6, 0]), binding("Rest", [[11, 0], [-6, 0]]), binding("Product", [24, 0]), binding("Scaled", [[-44, 0], [24, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-4, 0], [-6, 0], [24, 0])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -4), binding("B", 0), binding("C", -6), binding("D", 0), binding("E", 24), binding("F", 0), binding("AC", 24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                            uses([
                                              proof(goal(mul(-4, -6, 24)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(sub(24, 0, 24)), by(builtin(sub, 3))),
                                              proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, -6, 0)), by(builtin(mul, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-4, 0], [[11, 0], [-6, 0]], [[-44, 0], [24, 0]])), by(rule("polynomial.pl", clause(31))),
                                            bindings([binding("Factor", [-4, 0]), binding("Coeff", [11, 0]), binding("Rest", [[-6, 0]]), binding("Product", [-44, 0]), binding("Scaled", [[24, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_mul([-4, 0], [11, 0], [-44, 0])), by(rule("polynomial.pl", clause(20))),
                                                bindings([binding("A", -4), binding("B", 0), binding("C", 11), binding("D", 0), binding("E", -44), binding("F", 0), binding("AC", -44), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                                uses([
                                                  proof(goal(mul(-4, 11, -44)), by(builtin(mul, 3))),
                                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                                  proof(goal(sub(-44, 0, -44)), by(builtin(sub, 3))),
                                                  proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                                  proof(goal(mul(0, 11, 0)), by(builtin(mul, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_scale([-4, 0], [[-6, 0]], [[24, 0]])), by(rule("polynomial.pl", clause(31))),
                                                bindings([binding("Factor", [-4, 0]), binding("Coeff", [-6, 0]), binding("Rest", []), binding("Product", [24, 0]), binding("Scaled", [])]),
                                                uses([
                                                  proof(
                                                    goal(c_mul([-4, 0], [-6, 0], [24, 0])), by(rule("polynomial.pl", clause(20))),
                                                    bindings([binding("A", -4), binding("B", 0), binding("C", -6), binding("D", 0), binding("E", 24), binding("F", 0), binding("AC", 24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                                    uses([
                                                      proof(goal(mul(-4, -6, 24)), by(builtin(mul, 3))),
                                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                                      proof(goal(sub(24, 0, 24)), by(builtin(sub, 3))),
                                                      proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                                      proof(goal(mul(0, -6, 0)), by(builtin(mul, 3))),
                                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_scale([-4, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                                                    bindings([binding("_Factor", [-4, 0])])
                                                  )
                                                ])
                                              )
                                            ])
                                          )
                                        ])
                                      )
                                    ])
                                  ),
                                  proof(goal(append([[0, 0]], [[-4, 0], [24, 0], [-44, 0], [24, 0]], [[0, 0], [-4, 0], [24, 0], [-44, 0], [24, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(poly_add([[1, 0], [-6, 0], [11, 0], [-6, 0], [0, 0]], [[0, 0], [-4, 0], [24, 0], [-44, 0], [24, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [1, 0]), binding("As", [[-6, 0], [11, 0], [-6, 0], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-4, 0], [24, 0], [-44, 0], [24, 0]]), binding("C", [1, 0]), binding("Cs", [[-10, 0], [35, 0], [-50, 0], [24, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[-6, 0], [11, 0], [-6, 0], [0, 0]], [[-4, 0], [24, 0], [-44, 0], [24, 0]], [[-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [-6, 0]), binding("As", [[11, 0], [-6, 0], [0, 0]]), binding("B", [-4, 0]), binding("Bs", [[24, 0], [-44, 0], [24, 0]]), binding("C", [-10, 0]), binding("Cs", [[35, 0], [-50, 0], [24, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_add([-6, 0], [-4, 0], [-10, 0])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -6), binding("B", 0), binding("C", -4), binding("D", 0), binding("E", -10), binding("F", 0)]),
                                            uses([
                                              proof(goal(add(-6, -4, -10)), by(builtin(add, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[11, 0], [-6, 0], [0, 0]], [[24, 0], [-44, 0], [24, 0]], [[35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [11, 0]), binding("As", [[-6, 0], [0, 0]]), binding("B", [24, 0]), binding("Bs", [[-44, 0], [24, 0]]), binding("C", [35, 0]), binding("Cs", [[-50, 0], [24, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_add([11, 0], [24, 0], [35, 0])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", 11), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 35), binding("F", 0)]),
                                                uses([
                                                  proof(goal(add(11, 24, 35)), by(builtin(add, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_add([[-6, 0], [0, 0]], [[-44, 0], [24, 0]], [[-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                                bindings([binding("A", [-6, 0]), binding("As", [[0, 0]]), binding("B", [-44, 0]), binding("Bs", [[24, 0]]), binding("C", [-50, 0]), binding("Cs", [[24, 0]])]),
                                                uses([
                                                  proof(
                                                    goal(c_add([-6, 0], [-44, 0], [-50, 0])), by(rule("polynomial.pl", clause(17))),
                                                    bindings([binding("A", -6), binding("B", 0), binding("C", -44), binding("D", 0), binding("E", -50), binding("F", 0)]),
                                                    uses([
                                                      proof(goal(add(-6, -44, -50)), by(builtin(add, 3))),
                                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_add([[0, 0]], [[24, 0]], [[24, 0]])), by(rule("polynomial.pl", clause(33))),
                                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [24, 0]), binding("Bs", []), binding("C", [24, 0]), binding("Cs", [])]),
                                                    uses([
                                                      proof(
                                                        goal(c_add([0, 0], [24, 0], [24, 0])), by(rule("polynomial.pl", clause(17))),
                                                        bindings([binding("A", 0), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 24), binding("F", 0)]),
                                                        uses([
                                                          proof(goal(add(0, 24, 24)), by(builtin(add, 3))),
                                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                              proof(
                                goal(poly_from_roots_acc([], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(27))),
                                bindings([binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])])
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
).

reconstructedPolynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]).
why(
  reconstructedPolynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]),
  proof(
    goal(reconstructedPolynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(35))),
    bindings([binding("Case", complex_quartic), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])]),
    uses([
      proof(
        goal(reconstructed(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(34))),
        bindings([binding("Case", complex_quartic), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Roots", [[0, 1], [1, 1], [3, 2], [5, 1]])]),
        uses([
          proof(goal(known_roots(complex_quartic, [[0, 1], [1, 1], [3, 2], [5, 1]])), by(fact("polynomial.pl", clause(15)))),
          proof(
            goal(poly_from_roots([[0, 1], [1, 1], [3, 2], [5, 1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(26))),
            bindings([binding("Roots", [[0, 1], [1, 1], [3, 2], [5, 1]]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])]),
            uses([
              proof(
                goal(poly_from_roots_acc([[0, 1], [1, 1], [3, 2], [5, 1]], [[1, 0]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                bindings([binding("Root", [0, 1]), binding("Rest", [[1, 1], [3, 2], [5, 1]]), binding("Coeffs", [[1, 0]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [0, -1]])]),
                uses([
                  proof(
                    goal(poly_mul_linear([[1, 0]], [0, 1], [[1, 0], [0, -1]])), by(rule("polynomial.pl", clause(29))),
                    bindings([binding("Coeffs", [[1, 0]]), binding("Root", [0, 1]), binding("Product", [[1, 0], [0, -1]]), binding("Shifted", [[1, 0], [0, 0]]), binding("MinusRoot", [0, -1]), binding("Scaled", [[0, -1]]), binding("Lower", [[0, 0], [0, -1]])]),
                    uses([
                      proof(goal(append([[1, 0]], [[0, 0]], [[1, 0], [0, 0]])), by(builtin(append, 3))),
                      proof(
                        goal(c_neg([0, 1], [0, -1])), by(rule("polynomial.pl", clause(19))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 0), binding("D", -1)]),
                        uses([
                          proof(goal(neg(0, 0)), by(builtin(neg, 2))),
                          proof(goal(neg(1, -1)), by(builtin(neg, 2)))
                        ])
                      ),
                      proof(
                        goal(poly_scale([0, -1], [[1, 0]], [[0, -1]])), by(rule("polynomial.pl", clause(31))),
                        bindings([binding("Factor", [0, -1]), binding("Coeff", [1, 0]), binding("Rest", []), binding("Product", [0, -1]), binding("Scaled", [])]),
                        uses([
                          proof(
                            goal(c_mul([0, -1], [1, 0], [0, -1])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 0), binding("B", -1), binding("C", 1), binding("D", 0), binding("E", 0), binding("F", -1), binding("AC", 0), binding("BD", 0), binding("AD", 0), binding("BC", -1)]),
                            uses([
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(0, 0, 0)), by(builtin(sub, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                              proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([0, -1], [], [])), by(fact("polynomial.pl", clause(30))),
                            bindings([binding("_Factor", [0, -1])])
                          )
                        ])
                      ),
                      proof(goal(append([[0, 0]], [[0, -1]], [[0, 0], [0, -1]])), by(builtin(append, 3))),
                      proof(
                        goal(poly_add([[1, 0], [0, 0]], [[0, 0], [0, -1]], [[1, 0], [0, -1]])), by(rule("polynomial.pl", clause(33))),
                        bindings([binding("A", [1, 0]), binding("As", [[0, 0]]), binding("B", [0, 0]), binding("Bs", [[0, -1]]), binding("C", [1, 0]), binding("Cs", [[0, -1]])]),
                        uses([
                          proof(
                            goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                            uses([
                              proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_add([[0, 0]], [[0, -1]], [[0, -1]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [0, -1]), binding("Bs", []), binding("C", [0, -1]), binding("Cs", [])]),
                            uses([
                              proof(
                                goal(c_add([0, 0], [0, -1], [0, -1])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 0), binding("B", 0), binding("C", 0), binding("D", -1), binding("E", 0), binding("F", -1)]),
                                uses([
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3))),
                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                            ])
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(poly_from_roots_acc([[1, 1], [3, 2], [5, 1]], [[1, 0], [0, -1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                    bindings([binding("Root", [1, 1]), binding("Rest", [[3, 2], [5, 1]]), binding("Coeffs", [[1, 0], [0, -1]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [-1, -2], [-1, 1]])]),
                    uses([
                      proof(
                        goal(poly_mul_linear([[1, 0], [0, -1]], [1, 1], [[1, 0], [-1, -2], [-1, 1]])), by(rule("polynomial.pl", clause(29))),
                        bindings([binding("Coeffs", [[1, 0], [0, -1]]), binding("Root", [1, 1]), binding("Product", [[1, 0], [-1, -2], [-1, 1]]), binding("Shifted", [[1, 0], [0, -1], [0, 0]]), binding("MinusRoot", [-1, -1]), binding("Scaled", [[-1, -1], [-1, 1]]), binding("Lower", [[0, 0], [-1, -1], [-1, 1]])]),
                        uses([
                          proof(goal(append([[1, 0], [0, -1]], [[0, 0]], [[1, 0], [0, -1], [0, 0]])), by(builtin(append, 3))),
                          proof(
                            goal(c_neg([1, 1], [-1, -1])), by(rule("polynomial.pl", clause(19))),
                            bindings([binding("A", 1), binding("B", 1), binding("C", -1), binding("D", -1)]),
                            uses([
                              proof(goal(neg(1, -1)), by(builtin(neg, 2))),
                              proof(goal(neg(1, -1)), by(builtin(neg, 2)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([-1, -1], [[1, 0], [0, -1]], [[-1, -1], [-1, 1]])), by(rule("polynomial.pl", clause(31))),
                            bindings([binding("Factor", [-1, -1]), binding("Coeff", [1, 0]), binding("Rest", [[0, -1]]), binding("Product", [-1, -1]), binding("Scaled", [[-1, 1]])]),
                            uses([
                              proof(
                                goal(c_mul([-1, -1], [1, 0], [-1, -1])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", -1), binding("B", -1), binding("C", 1), binding("D", 0), binding("E", -1), binding("F", -1), binding("AC", -1), binding("BD", 0), binding("AD", 0), binding("BC", -1)]),
                                uses([
                                  proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                                  proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(-1, 0, -1)), by(builtin(sub, 3))),
                                  proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-1, -1], [[0, -1]], [[-1, 1]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-1, -1]), binding("Coeff", [0, -1]), binding("Rest", []), binding("Product", [-1, 1]), binding("Scaled", [])]),
                                uses([
                                  proof(
                                    goal(c_mul([-1, -1], [0, -1], [-1, 1])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -1), binding("B", -1), binding("C", 0), binding("D", -1), binding("E", -1), binding("F", 1), binding("AC", 0), binding("BD", 1), binding("AD", 1), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(-1, -1, 1)), by(builtin(mul, 3))),
                                      proof(goal(sub(0, 1, -1)), by(builtin(sub, 3))),
                                      proof(goal(mul(-1, -1, 1)), by(builtin(mul, 3))),
                                      proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-1, -1], [], [])), by(fact("polynomial.pl", clause(30))),
                                    bindings([binding("_Factor", [-1, -1])])
                                  )
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([[0, 0]], [[-1, -1], [-1, 1]], [[0, 0], [-1, -1], [-1, 1]])), by(builtin(append, 3))),
                          proof(
                            goal(poly_add([[1, 0], [0, -1], [0, 0]], [[0, 0], [-1, -1], [-1, 1]], [[1, 0], [-1, -2], [-1, 1]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [1, 0]), binding("As", [[0, -1], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-1, -1], [-1, 1]]), binding("C", [1, 0]), binding("Cs", [[-1, -2], [-1, 1]])]),
                            uses([
                              proof(
                                goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                uses([
                                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_add([[0, -1], [0, 0]], [[-1, -1], [-1, 1]], [[-1, -2], [-1, 1]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [0, -1]), binding("As", [[0, 0]]), binding("B", [-1, -1]), binding("Bs", [[-1, 1]]), binding("C", [-1, -2]), binding("Cs", [[-1, 1]])]),
                                uses([
                                  proof(
                                    goal(c_add([0, -1], [-1, -1], [-1, -2])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 0), binding("B", -1), binding("C", -1), binding("D", -1), binding("E", -1), binding("F", -2)]),
                                    uses([
                                      proof(goal(add(0, -1, -1)), by(builtin(add, 3))),
                                      proof(goal(add(-1, -1, -2)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[0, 0]], [[-1, 1]], [[-1, 1]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-1, 1]), binding("Bs", []), binding("C", [-1, 1]), binding("Cs", [])]),
                                    uses([
                                      proof(
                                        goal(c_add([0, 0], [-1, 1], [-1, 1])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 0), binding("B", 0), binding("C", -1), binding("D", 1), binding("E", -1), binding("F", 1)]),
                                        uses([
                                          proof(goal(add(0, -1, -1)), by(builtin(add, 3))),
                                          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(poly_from_roots_acc([[3, 2], [5, 1]], [[1, 0], [-1, -2], [-1, 1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                        bindings([binding("Root", [3, 2]), binding("Rest", [[5, 1]]), binding("Coeffs", [[1, 0], [-1, -2], [-1, 1]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [-4, -4], [-2, 9], [5, -1]])]),
                        uses([
                          proof(
                            goal(poly_mul_linear([[1, 0], [-1, -2], [-1, 1]], [3, 2], [[1, 0], [-4, -4], [-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(29))),
                            bindings([binding("Coeffs", [[1, 0], [-1, -2], [-1, 1]]), binding("Root", [3, 2]), binding("Product", [[1, 0], [-4, -4], [-2, 9], [5, -1]]), binding("Shifted", [[1, 0], [-1, -2], [-1, 1], [0, 0]]), binding("MinusRoot", [-3, -2]), binding("Scaled", [[-3, -2], [-1, 8], [5, -1]]), binding("Lower", [[0, 0], [-3, -2], [-1, 8], [5, -1]])]),
                            uses([
                              proof(goal(append([[1, 0], [-1, -2], [-1, 1]], [[0, 0]], [[1, 0], [-1, -2], [-1, 1], [0, 0]])), by(builtin(append, 3))),
                              proof(
                                goal(c_neg([3, 2], [-3, -2])), by(rule("polynomial.pl", clause(19))),
                                bindings([binding("A", 3), binding("B", 2), binding("C", -3), binding("D", -2)]),
                                uses([
                                  proof(goal(neg(3, -3)), by(builtin(neg, 2))),
                                  proof(goal(neg(2, -2)), by(builtin(neg, 2)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-3, -2], [[1, 0], [-1, -2], [-1, 1]], [[-3, -2], [-1, 8], [5, -1]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-3, -2]), binding("Coeff", [1, 0]), binding("Rest", [[-1, -2], [-1, 1]]), binding("Product", [-3, -2]), binding("Scaled", [[-1, 8], [5, -1]])]),
                                uses([
                                  proof(
                                    goal(c_mul([-3, -2], [1, 0], [-3, -2])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -3), binding("B", -2), binding("C", 1), binding("D", 0), binding("E", -3), binding("F", -2), binding("AC", -3), binding("BD", 0), binding("AD", 0), binding("BC", -2)]),
                                    uses([
                                      proof(goal(mul(-3, 1, -3)), by(builtin(mul, 3))),
                                      proof(goal(mul(-2, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(-3, 0, -3)), by(builtin(sub, 3))),
                                      proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                                      proof(goal(add(0, -2, -2)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-3, -2], [[-1, -2], [-1, 1]], [[-1, 8], [5, -1]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-3, -2]), binding("Coeff", [-1, -2]), binding("Rest", [[-1, 1]]), binding("Product", [-1, 8]), binding("Scaled", [[5, -1]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-3, -2], [-1, -2], [-1, 8])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -3), binding("B", -2), binding("C", -1), binding("D", -2), binding("E", -1), binding("F", 8), binding("AC", 3), binding("BD", 4), binding("AD", 6), binding("BC", 2)]),
                                        uses([
                                          proof(goal(mul(-3, -1, 3)), by(builtin(mul, 3))),
                                          proof(goal(mul(-2, -2, 4)), by(builtin(mul, 3))),
                                          proof(goal(sub(3, 4, -1)), by(builtin(sub, 3))),
                                          proof(goal(mul(-3, -2, 6)), by(builtin(mul, 3))),
                                          proof(goal(mul(-2, -1, 2)), by(builtin(mul, 3))),
                                          proof(goal(add(6, 2, 8)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-3, -2], [[-1, 1]], [[5, -1]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-3, -2]), binding("Coeff", [-1, 1]), binding("Rest", []), binding("Product", [5, -1]), binding("Scaled", [])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-3, -2], [-1, 1], [5, -1])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -3), binding("B", -2), binding("C", -1), binding("D", 1), binding("E", 5), binding("F", -1), binding("AC", 3), binding("BD", -2), binding("AD", -3), binding("BC", 2)]),
                                            uses([
                                              proof(goal(mul(-3, -1, 3)), by(builtin(mul, 3))),
                                              proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                                              proof(goal(sub(3, -2, 5)), by(builtin(sub, 3))),
                                              proof(goal(mul(-3, 1, -3)), by(builtin(mul, 3))),
                                              proof(goal(mul(-2, -1, 2)), by(builtin(mul, 3))),
                                              proof(goal(add(-3, 2, -1)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-3, -2], [], [])), by(fact("polynomial.pl", clause(30))),
                                            bindings([binding("_Factor", [-3, -2])])
                                          )
                                        ])
                                      )
                                    ])
                                  )
                                ])
                              ),
                              proof(goal(append([[0, 0]], [[-3, -2], [-1, 8], [5, -1]], [[0, 0], [-3, -2], [-1, 8], [5, -1]])), by(builtin(append, 3))),
                              proof(
                                goal(poly_add([[1, 0], [-1, -2], [-1, 1], [0, 0]], [[0, 0], [-3, -2], [-1, 8], [5, -1]], [[1, 0], [-4, -4], [-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [1, 0]), binding("As", [[-1, -2], [-1, 1], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-3, -2], [-1, 8], [5, -1]]), binding("C", [1, 0]), binding("Cs", [[-4, -4], [-2, 9], [5, -1]])]),
                                uses([
                                  proof(
                                    goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[-1, -2], [-1, 1], [0, 0]], [[-3, -2], [-1, 8], [5, -1]], [[-4, -4], [-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [-1, -2]), binding("As", [[-1, 1], [0, 0]]), binding("B", [-3, -2]), binding("Bs", [[-1, 8], [5, -1]]), binding("C", [-4, -4]), binding("Cs", [[-2, 9], [5, -1]])]),
                                    uses([
                                      proof(
                                        goal(c_add([-1, -2], [-3, -2], [-4, -4])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -1), binding("B", -2), binding("C", -3), binding("D", -2), binding("E", -4), binding("F", -4)]),
                                        uses([
                                          proof(goal(add(-1, -3, -4)), by(builtin(add, 3))),
                                          proof(goal(add(-2, -2, -4)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[-1, 1], [0, 0]], [[-1, 8], [5, -1]], [[-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [-1, 1]), binding("As", [[0, 0]]), binding("B", [-1, 8]), binding("Bs", [[5, -1]]), binding("C", [-2, 9]), binding("Cs", [[5, -1]])]),
                                        uses([
                                          proof(
                                            goal(c_add([-1, 1], [-1, 8], [-2, 9])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -1), binding("B", 1), binding("C", -1), binding("D", 8), binding("E", -2), binding("F", 9)]),
                                            uses([
                                              proof(goal(add(-1, -1, -2)), by(builtin(add, 3))),
                                              proof(goal(add(1, 8, 9)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[0, 0]], [[5, -1]], [[5, -1]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [5, -1]), binding("Bs", []), binding("C", [5, -1]), binding("Cs", [])]),
                                            uses([
                                              proof(
                                                goal(c_add([0, 0], [5, -1], [5, -1])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", 0), binding("B", 0), binding("C", 5), binding("D", -1), binding("E", 5), binding("F", -1)]),
                                                uses([
                                                  proof(goal(add(0, 5, 5)), by(builtin(add, 3))),
                                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                          proof(
                            goal(poly_from_roots_acc([[5, 1]], [[1, 0], [-4, -4], [-2, 9], [5, -1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                            bindings([binding("Root", [5, 1]), binding("Rest", []), binding("Coeffs", [[1, 0], [-4, -4], [-2, 9], [5, -1]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])]),
                            uses([
                              proof(
                                goal(poly_mul_linear([[1, 0], [-4, -4], [-2, 9], [5, -1]], [5, 1], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(29))),
                                bindings([binding("Coeffs", [[1, 0], [-4, -4], [-2, 9], [5, -1]]), binding("Root", [5, 1]), binding("Product", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Shifted", [[1, 0], [-4, -4], [-2, 9], [5, -1], [0, 0]]), binding("MinusRoot", [-5, -1]), binding("Scaled", [[-5, -1], [16, 24], [19, -43], [-26, 0]]), binding("Lower", [[0, 0], [-5, -1], [16, 24], [19, -43], [-26, 0]])]),
                                uses([
                                  proof(goal(append([[1, 0], [-4, -4], [-2, 9], [5, -1]], [[0, 0]], [[1, 0], [-4, -4], [-2, 9], [5, -1], [0, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(c_neg([5, 1], [-5, -1])), by(rule("polynomial.pl", clause(19))),
                                    bindings([binding("A", 5), binding("B", 1), binding("C", -5), binding("D", -1)]),
                                    uses([
                                      proof(goal(neg(5, -5)), by(builtin(neg, 2))),
                                      proof(goal(neg(1, -1)), by(builtin(neg, 2)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-5, -1], [[1, 0], [-4, -4], [-2, 9], [5, -1]], [[-5, -1], [16, 24], [19, -43], [-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-5, -1]), binding("Coeff", [1, 0]), binding("Rest", [[-4, -4], [-2, 9], [5, -1]]), binding("Product", [-5, -1]), binding("Scaled", [[16, 24], [19, -43], [-26, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-5, -1], [1, 0], [-5, -1])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -5), binding("B", -1), binding("C", 1), binding("D", 0), binding("E", -5), binding("F", -1), binding("AC", -5), binding("BD", 0), binding("AD", 0), binding("BC", -1)]),
                                        uses([
                                          proof(goal(mul(-5, 1, -5)), by(builtin(mul, 3))),
                                          proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(-5, 0, -5)), by(builtin(sub, 3))),
                                          proof(goal(mul(-5, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                                          proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-5, -1], [[-4, -4], [-2, 9], [5, -1]], [[16, 24], [19, -43], [-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-5, -1]), binding("Coeff", [-4, -4]), binding("Rest", [[-2, 9], [5, -1]]), binding("Product", [16, 24]), binding("Scaled", [[19, -43], [-26, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-5, -1], [-4, -4], [16, 24])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -5), binding("B", -1), binding("C", -4), binding("D", -4), binding("E", 16), binding("F", 24), binding("AC", 20), binding("BD", 4), binding("AD", 20), binding("BC", 4)]),
                                            uses([
                                              proof(goal(mul(-5, -4, 20)), by(builtin(mul, 3))),
                                              proof(goal(mul(-1, -4, 4)), by(builtin(mul, 3))),
                                              proof(goal(sub(20, 4, 16)), by(builtin(sub, 3))),
                                              proof(goal(mul(-5, -4, 20)), by(builtin(mul, 3))),
                                              proof(goal(mul(-1, -4, 4)), by(builtin(mul, 3))),
                                              proof(goal(add(20, 4, 24)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-5, -1], [[-2, 9], [5, -1]], [[19, -43], [-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                            bindings([binding("Factor", [-5, -1]), binding("Coeff", [-2, 9]), binding("Rest", [[5, -1]]), binding("Product", [19, -43]), binding("Scaled", [[-26, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_mul([-5, -1], [-2, 9], [19, -43])), by(rule("polynomial.pl", clause(20))),
                                                bindings([binding("A", -5), binding("B", -1), binding("C", -2), binding("D", 9), binding("E", 19), binding("F", -43), binding("AC", 10), binding("BD", -9), binding("AD", -45), binding("BC", 2)]),
                                                uses([
                                                  proof(goal(mul(-5, -2, 10)), by(builtin(mul, 3))),
                                                  proof(goal(mul(-1, 9, -9)), by(builtin(mul, 3))),
                                                  proof(goal(sub(10, -9, 19)), by(builtin(sub, 3))),
                                                  proof(goal(mul(-5, 9, -45)), by(builtin(mul, 3))),
                                                  proof(goal(mul(-1, -2, 2)), by(builtin(mul, 3))),
                                                  proof(goal(add(-45, 2, -43)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_scale([-5, -1], [[5, -1]], [[-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                                bindings([binding("Factor", [-5, -1]), binding("Coeff", [5, -1]), binding("Rest", []), binding("Product", [-26, 0]), binding("Scaled", [])]),
                                                uses([
                                                  proof(
                                                    goal(c_mul([-5, -1], [5, -1], [-26, 0])), by(rule("polynomial.pl", clause(20))),
                                                    bindings([binding("A", -5), binding("B", -1), binding("C", 5), binding("D", -1), binding("E", -26), binding("F", 0), binding("AC", -25), binding("BD", 1), binding("AD", 5), binding("BC", -5)]),
                                                    uses([
                                                      proof(goal(mul(-5, 5, -25)), by(builtin(mul, 3))),
                                                      proof(goal(mul(-1, -1, 1)), by(builtin(mul, 3))),
                                                      proof(goal(sub(-25, 1, -26)), by(builtin(sub, 3))),
                                                      proof(goal(mul(-5, -1, 5)), by(builtin(mul, 3))),
                                                      proof(goal(mul(-1, 5, -5)), by(builtin(mul, 3))),
                                                      proof(goal(add(5, -5, 0)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_scale([-5, -1], [], [])), by(fact("polynomial.pl", clause(30))),
                                                    bindings([binding("_Factor", [-5, -1])])
                                                  )
                                                ])
                                              )
                                            ])
                                          )
                                        ])
                                      )
                                    ])
                                  ),
                                  proof(goal(append([[0, 0]], [[-5, -1], [16, 24], [19, -43], [-26, 0]], [[0, 0], [-5, -1], [16, 24], [19, -43], [-26, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(poly_add([[1, 0], [-4, -4], [-2, 9], [5, -1], [0, 0]], [[0, 0], [-5, -1], [16, 24], [19, -43], [-26, 0]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [1, 0]), binding("As", [[-4, -4], [-2, 9], [5, -1], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-5, -1], [16, 24], [19, -43], [-26, 0]]), binding("C", [1, 0]), binding("Cs", [[-9, -5], [14, 33], [24, -44], [-26, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[-4, -4], [-2, 9], [5, -1], [0, 0]], [[-5, -1], [16, 24], [19, -43], [-26, 0]], [[-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [-4, -4]), binding("As", [[-2, 9], [5, -1], [0, 0]]), binding("B", [-5, -1]), binding("Bs", [[16, 24], [19, -43], [-26, 0]]), binding("C", [-9, -5]), binding("Cs", [[14, 33], [24, -44], [-26, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_add([-4, -4], [-5, -1], [-9, -5])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -4), binding("B", -4), binding("C", -5), binding("D", -1), binding("E", -9), binding("F", -5)]),
                                            uses([
                                              proof(goal(add(-4, -5, -9)), by(builtin(add, 3))),
                                              proof(goal(add(-4, -1, -5)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[-2, 9], [5, -1], [0, 0]], [[16, 24], [19, -43], [-26, 0]], [[14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [-2, 9]), binding("As", [[5, -1], [0, 0]]), binding("B", [16, 24]), binding("Bs", [[19, -43], [-26, 0]]), binding("C", [14, 33]), binding("Cs", [[24, -44], [-26, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_add([-2, 9], [16, 24], [14, 33])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", -2), binding("B", 9), binding("C", 16), binding("D", 24), binding("E", 14), binding("F", 33)]),
                                                uses([
                                                  proof(goal(add(-2, 16, 14)), by(builtin(add, 3))),
                                                  proof(goal(add(9, 24, 33)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_add([[5, -1], [0, 0]], [[19, -43], [-26, 0]], [[24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                                bindings([binding("A", [5, -1]), binding("As", [[0, 0]]), binding("B", [19, -43]), binding("Bs", [[-26, 0]]), binding("C", [24, -44]), binding("Cs", [[-26, 0]])]),
                                                uses([
                                                  proof(
                                                    goal(c_add([5, -1], [19, -43], [24, -44])), by(rule("polynomial.pl", clause(17))),
                                                    bindings([binding("A", 5), binding("B", -1), binding("C", 19), binding("D", -43), binding("E", 24), binding("F", -44)]),
                                                    uses([
                                                      proof(goal(add(5, 19, 24)), by(builtin(add, 3))),
                                                      proof(goal(add(-1, -43, -44)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_add([[0, 0]], [[-26, 0]], [[-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-26, 0]), binding("Bs", []), binding("C", [-26, 0]), binding("Cs", [])]),
                                                    uses([
                                                      proof(
                                                        goal(c_add([0, 0], [-26, 0], [-26, 0])), by(rule("polynomial.pl", clause(17))),
                                                        bindings([binding("A", 0), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", -26), binding("F", 0)]),
                                                        uses([
                                                          proof(goal(add(0, -26, -26)), by(builtin(add, 3))),
                                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                              proof(
                                goal(poly_from_roots_acc([], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(27))),
                                bindings([binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])])
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
).

reconstructionMatches(real_quartic, true).
why(
  reconstructionMatches(real_quartic, true),
  proof(
    goal(reconstructionMatches(real_quartic, true)), by(rule("polynomial.pl", clause(36))),
    bindings([binding("Case", real_quartic), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])]),
    uses([
      proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
      proof(
        goal(reconstructed(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(34))),
        bindings([binding("Case", real_quartic), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Roots", [[1, 0], [2, 0], [3, 0], [4, 0]])]),
        uses([
          proof(goal(known_roots(real_quartic, [[1, 0], [2, 0], [3, 0], [4, 0]])), by(fact("polynomial.pl", clause(14)))),
          proof(
            goal(poly_from_roots([[1, 0], [2, 0], [3, 0], [4, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(26))),
            bindings([binding("Roots", [[1, 0], [2, 0], [3, 0], [4, 0]]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])]),
            uses([
              proof(
                goal(poly_from_roots_acc([[1, 0], [2, 0], [3, 0], [4, 0]], [[1, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                bindings([binding("Root", [1, 0]), binding("Rest", [[2, 0], [3, 0], [4, 0]]), binding("Coeffs", [[1, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-1, 0]])]),
                uses([
                  proof(
                    goal(poly_mul_linear([[1, 0]], [1, 0], [[1, 0], [-1, 0]])), by(rule("polynomial.pl", clause(29))),
                    bindings([binding("Coeffs", [[1, 0]]), binding("Root", [1, 0]), binding("Product", [[1, 0], [-1, 0]]), binding("Shifted", [[1, 0], [0, 0]]), binding("MinusRoot", [-1, 0]), binding("Scaled", [[-1, 0]]), binding("Lower", [[0, 0], [-1, 0]])]),
                    uses([
                      proof(goal(append([[1, 0]], [[0, 0]], [[1, 0], [0, 0]])), by(builtin(append, 3))),
                      proof(
                        goal(c_neg([1, 0], [-1, 0])), by(rule("polynomial.pl", clause(19))),
                        bindings([binding("A", 1), binding("B", 0), binding("C", -1), binding("D", 0)]),
                        uses([
                          proof(goal(neg(1, -1)), by(builtin(neg, 2))),
                          proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                        ])
                      ),
                      proof(
                        goal(poly_scale([-1, 0], [[1, 0]], [[-1, 0]])), by(rule("polynomial.pl", clause(31))),
                        bindings([binding("Factor", [-1, 0]), binding("Coeff", [1, 0]), binding("Rest", []), binding("Product", [-1, 0]), binding("Scaled", [])]),
                        uses([
                          proof(
                            goal(c_mul([-1, 0], [1, 0], [-1, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -1), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -1), binding("F", 0), binding("AC", -1), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(-1, 0, -1)), by(builtin(sub, 3))),
                              proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([-1, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                            bindings([binding("_Factor", [-1, 0])])
                          )
                        ])
                      ),
                      proof(goal(append([[0, 0]], [[-1, 0]], [[0, 0], [-1, 0]])), by(builtin(append, 3))),
                      proof(
                        goal(poly_add([[1, 0], [0, 0]], [[0, 0], [-1, 0]], [[1, 0], [-1, 0]])), by(rule("polynomial.pl", clause(33))),
                        bindings([binding("A", [1, 0]), binding("As", [[0, 0]]), binding("B", [0, 0]), binding("Bs", [[-1, 0]]), binding("C", [1, 0]), binding("Cs", [[-1, 0]])]),
                        uses([
                          proof(
                            goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                            uses([
                              proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_add([[0, 0]], [[-1, 0]], [[-1, 0]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-1, 0]), binding("Bs", []), binding("C", [-1, 0]), binding("Cs", [])]),
                            uses([
                              proof(
                                goal(c_add([0, 0], [-1, 0], [-1, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 0), binding("B", 0), binding("C", -1), binding("D", 0), binding("E", -1), binding("F", 0)]),
                                uses([
                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                            ])
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(poly_from_roots_acc([[2, 0], [3, 0], [4, 0]], [[1, 0], [-1, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                    bindings([binding("Root", [2, 0]), binding("Rest", [[3, 0], [4, 0]]), binding("Coeffs", [[1, 0], [-1, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-3, 0], [2, 0]])]),
                    uses([
                      proof(
                        goal(poly_mul_linear([[1, 0], [-1, 0]], [2, 0], [[1, 0], [-3, 0], [2, 0]])), by(rule("polynomial.pl", clause(29))),
                        bindings([binding("Coeffs", [[1, 0], [-1, 0]]), binding("Root", [2, 0]), binding("Product", [[1, 0], [-3, 0], [2, 0]]), binding("Shifted", [[1, 0], [-1, 0], [0, 0]]), binding("MinusRoot", [-2, 0]), binding("Scaled", [[-2, 0], [2, 0]]), binding("Lower", [[0, 0], [-2, 0], [2, 0]])]),
                        uses([
                          proof(goal(append([[1, 0], [-1, 0]], [[0, 0]], [[1, 0], [-1, 0], [0, 0]])), by(builtin(append, 3))),
                          proof(
                            goal(c_neg([2, 0], [-2, 0])), by(rule("polynomial.pl", clause(19))),
                            bindings([binding("A", 2), binding("B", 0), binding("C", -2), binding("D", 0)]),
                            uses([
                              proof(goal(neg(2, -2)), by(builtin(neg, 2))),
                              proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([-2, 0], [[1, 0], [-1, 0]], [[-2, 0], [2, 0]])), by(rule("polynomial.pl", clause(31))),
                            bindings([binding("Factor", [-2, 0]), binding("Coeff", [1, 0]), binding("Rest", [[-1, 0]]), binding("Product", [-2, 0]), binding("Scaled", [[2, 0]])]),
                            uses([
                              proof(
                                goal(c_mul([-2, 0], [1, 0], [-2, 0])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", -2), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -2), binding("F", 0), binding("AC", -2), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                uses([
                                  proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(-2, 0, -2)), by(builtin(sub, 3))),
                                  proof(goal(mul(-2, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-2, 0], [[-1, 0]], [[2, 0]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-2, 0]), binding("Coeff", [-1, 0]), binding("Rest", []), binding("Product", [2, 0]), binding("Scaled", [])]),
                                uses([
                                  proof(
                                    goal(c_mul([-2, 0], [-1, 0], [2, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -2), binding("B", 0), binding("C", -1), binding("D", 0), binding("E", 2), binding("F", 0), binding("AC", 2), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-2, -1, 2)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(2, 0, 2)), by(builtin(sub, 3))),
                                      proof(goal(mul(-2, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, -1, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-2, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                                    bindings([binding("_Factor", [-2, 0])])
                                  )
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([[0, 0]], [[-2, 0], [2, 0]], [[0, 0], [-2, 0], [2, 0]])), by(builtin(append, 3))),
                          proof(
                            goal(poly_add([[1, 0], [-1, 0], [0, 0]], [[0, 0], [-2, 0], [2, 0]], [[1, 0], [-3, 0], [2, 0]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [1, 0]), binding("As", [[-1, 0], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-2, 0], [2, 0]]), binding("C", [1, 0]), binding("Cs", [[-3, 0], [2, 0]])]),
                            uses([
                              proof(
                                goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                uses([
                                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_add([[-1, 0], [0, 0]], [[-2, 0], [2, 0]], [[-3, 0], [2, 0]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [-1, 0]), binding("As", [[0, 0]]), binding("B", [-2, 0]), binding("Bs", [[2, 0]]), binding("C", [-3, 0]), binding("Cs", [[2, 0]])]),
                                uses([
                                  proof(
                                    goal(c_add([-1, 0], [-2, 0], [-3, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", -1), binding("B", 0), binding("C", -2), binding("D", 0), binding("E", -3), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(-1, -2, -3)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[0, 0]], [[2, 0]], [[2, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [2, 0]), binding("Bs", []), binding("C", [2, 0]), binding("Cs", [])]),
                                    uses([
                                      proof(
                                        goal(c_add([0, 0], [2, 0], [2, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 0), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", 2), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(0, 2, 2)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(poly_from_roots_acc([[3, 0], [4, 0]], [[1, 0], [-3, 0], [2, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                        bindings([binding("Root", [3, 0]), binding("Rest", [[4, 0]]), binding("Coeffs", [[1, 0], [-3, 0], [2, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-6, 0], [11, 0], [-6, 0]])]),
                        uses([
                          proof(
                            goal(poly_mul_linear([[1, 0], [-3, 0], [2, 0]], [3, 0], [[1, 0], [-6, 0], [11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(29))),
                            bindings([binding("Coeffs", [[1, 0], [-3, 0], [2, 0]]), binding("Root", [3, 0]), binding("Product", [[1, 0], [-6, 0], [11, 0], [-6, 0]]), binding("Shifted", [[1, 0], [-3, 0], [2, 0], [0, 0]]), binding("MinusRoot", [-3, 0]), binding("Scaled", [[-3, 0], [9, 0], [-6, 0]]), binding("Lower", [[0, 0], [-3, 0], [9, 0], [-6, 0]])]),
                            uses([
                              proof(goal(append([[1, 0], [-3, 0], [2, 0]], [[0, 0]], [[1, 0], [-3, 0], [2, 0], [0, 0]])), by(builtin(append, 3))),
                              proof(
                                goal(c_neg([3, 0], [-3, 0])), by(rule("polynomial.pl", clause(19))),
                                bindings([binding("A", 3), binding("B", 0), binding("C", -3), binding("D", 0)]),
                                uses([
                                  proof(goal(neg(3, -3)), by(builtin(neg, 2))),
                                  proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-3, 0], [[1, 0], [-3, 0], [2, 0]], [[-3, 0], [9, 0], [-6, 0]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-3, 0]), binding("Coeff", [1, 0]), binding("Rest", [[-3, 0], [2, 0]]), binding("Product", [-3, 0]), binding("Scaled", [[9, 0], [-6, 0]])]),
                                uses([
                                  proof(
                                    goal(c_mul([-3, 0], [1, 0], [-3, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -3), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -3), binding("F", 0), binding("AC", -3), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-3, 1, -3)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(-3, 0, -3)), by(builtin(sub, 3))),
                                      proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-3, 0], [[-3, 0], [2, 0]], [[9, 0], [-6, 0]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-3, 0]), binding("Coeff", [-3, 0]), binding("Rest", [[2, 0]]), binding("Product", [9, 0]), binding("Scaled", [[-6, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-3, 0], [-3, 0], [9, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -3), binding("B", 0), binding("C", -3), binding("D", 0), binding("E", 9), binding("F", 0), binding("AC", 9), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                        uses([
                                          proof(goal(mul(-3, -3, 9)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(9, 0, 9)), by(builtin(sub, 3))),
                                          proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, -3, 0)), by(builtin(mul, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-3, 0], [[2, 0]], [[-6, 0]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-3, 0]), binding("Coeff", [2, 0]), binding("Rest", []), binding("Product", [-6, 0]), binding("Scaled", [])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-3, 0], [2, 0], [-6, 0])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -3), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", -6), binding("F", 0), binding("AC", -6), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                            uses([
                                              proof(goal(mul(-3, 2, -6)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(sub(-6, 0, -6)), by(builtin(sub, 3))),
                                              proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-3, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                                            bindings([binding("_Factor", [-3, 0])])
                                          )
                                        ])
                                      )
                                    ])
                                  )
                                ])
                              ),
                              proof(goal(append([[0, 0]], [[-3, 0], [9, 0], [-6, 0]], [[0, 0], [-3, 0], [9, 0], [-6, 0]])), by(builtin(append, 3))),
                              proof(
                                goal(poly_add([[1, 0], [-3, 0], [2, 0], [0, 0]], [[0, 0], [-3, 0], [9, 0], [-6, 0]], [[1, 0], [-6, 0], [11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [1, 0]), binding("As", [[-3, 0], [2, 0], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-3, 0], [9, 0], [-6, 0]]), binding("C", [1, 0]), binding("Cs", [[-6, 0], [11, 0], [-6, 0]])]),
                                uses([
                                  proof(
                                    goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[-3, 0], [2, 0], [0, 0]], [[-3, 0], [9, 0], [-6, 0]], [[-6, 0], [11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [-3, 0]), binding("As", [[2, 0], [0, 0]]), binding("B", [-3, 0]), binding("Bs", [[9, 0], [-6, 0]]), binding("C", [-6, 0]), binding("Cs", [[11, 0], [-6, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_add([-3, 0], [-3, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -3), binding("B", 0), binding("C", -3), binding("D", 0), binding("E", -6), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(-3, -3, -6)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[2, 0], [0, 0]], [[9, 0], [-6, 0]], [[11, 0], [-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [2, 0]), binding("As", [[0, 0]]), binding("B", [9, 0]), binding("Bs", [[-6, 0]]), binding("C", [11, 0]), binding("Cs", [[-6, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_add([2, 0], [9, 0], [11, 0])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", 2), binding("B", 0), binding("C", 9), binding("D", 0), binding("E", 11), binding("F", 0)]),
                                            uses([
                                              proof(goal(add(2, 9, 11)), by(builtin(add, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[0, 0]], [[-6, 0]], [[-6, 0]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-6, 0]), binding("Bs", []), binding("C", [-6, 0]), binding("Cs", [])]),
                                            uses([
                                              proof(
                                                goal(c_add([0, 0], [-6, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", 0), binding("B", 0), binding("C", -6), binding("D", 0), binding("E", -6), binding("F", 0)]),
                                                uses([
                                                  proof(goal(add(0, -6, -6)), by(builtin(add, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                          proof(
                            goal(poly_from_roots_acc([[4, 0]], [[1, 0], [-6, 0], [11, 0], [-6, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(28))),
                            bindings([binding("Root", [4, 0]), binding("Rest", []), binding("Coeffs", [[1, 0], [-6, 0], [11, 0], [-6, 0]]), binding("Result", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Next", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])]),
                            uses([
                              proof(
                                goal(poly_mul_linear([[1, 0], [-6, 0], [11, 0], [-6, 0]], [4, 0], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(29))),
                                bindings([binding("Coeffs", [[1, 0], [-6, 0], [11, 0], [-6, 0]]), binding("Root", [4, 0]), binding("Product", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Shifted", [[1, 0], [-6, 0], [11, 0], [-6, 0], [0, 0]]), binding("MinusRoot", [-4, 0]), binding("Scaled", [[-4, 0], [24, 0], [-44, 0], [24, 0]]), binding("Lower", [[0, 0], [-4, 0], [24, 0], [-44, 0], [24, 0]])]),
                                uses([
                                  proof(goal(append([[1, 0], [-6, 0], [11, 0], [-6, 0]], [[0, 0]], [[1, 0], [-6, 0], [11, 0], [-6, 0], [0, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(c_neg([4, 0], [-4, 0])), by(rule("polynomial.pl", clause(19))),
                                    bindings([binding("A", 4), binding("B", 0), binding("C", -4), binding("D", 0)]),
                                    uses([
                                      proof(goal(neg(4, -4)), by(builtin(neg, 2))),
                                      proof(goal(neg(0, 0)), by(builtin(neg, 2)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-4, 0], [[1, 0], [-6, 0], [11, 0], [-6, 0]], [[-4, 0], [24, 0], [-44, 0], [24, 0]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-4, 0]), binding("Coeff", [1, 0]), binding("Rest", [[-6, 0], [11, 0], [-6, 0]]), binding("Product", [-4, 0]), binding("Scaled", [[24, 0], [-44, 0], [24, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-4, 0], [1, 0], [-4, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -4), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -4), binding("F", 0), binding("AC", -4), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                        uses([
                                          proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(-4, 0, -4)), by(builtin(sub, 3))),
                                          proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-4, 0], [[-6, 0], [11, 0], [-6, 0]], [[24, 0], [-44, 0], [24, 0]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-4, 0]), binding("Coeff", [-6, 0]), binding("Rest", [[11, 0], [-6, 0]]), binding("Product", [24, 0]), binding("Scaled", [[-44, 0], [24, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-4, 0], [-6, 0], [24, 0])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -4), binding("B", 0), binding("C", -6), binding("D", 0), binding("E", 24), binding("F", 0), binding("AC", 24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                            uses([
                                              proof(goal(mul(-4, -6, 24)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(sub(24, 0, 24)), by(builtin(sub, 3))),
                                              proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, -6, 0)), by(builtin(mul, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-4, 0], [[11, 0], [-6, 0]], [[-44, 0], [24, 0]])), by(rule("polynomial.pl", clause(31))),
                                            bindings([binding("Factor", [-4, 0]), binding("Coeff", [11, 0]), binding("Rest", [[-6, 0]]), binding("Product", [-44, 0]), binding("Scaled", [[24, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_mul([-4, 0], [11, 0], [-44, 0])), by(rule("polynomial.pl", clause(20))),
                                                bindings([binding("A", -4), binding("B", 0), binding("C", 11), binding("D", 0), binding("E", -44), binding("F", 0), binding("AC", -44), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                                uses([
                                                  proof(goal(mul(-4, 11, -44)), by(builtin(mul, 3))),
                                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                                  proof(goal(sub(-44, 0, -44)), by(builtin(sub, 3))),
                                                  proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                                  proof(goal(mul(0, 11, 0)), by(builtin(mul, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_scale([-4, 0], [[-6, 0]], [[24, 0]])), by(rule("polynomial.pl", clause(31))),
                                                bindings([binding("Factor", [-4, 0]), binding("Coeff", [-6, 0]), binding("Rest", []), binding("Product", [24, 0]), binding("Scaled", [])]),
                                                uses([
                                                  proof(
                                                    goal(c_mul([-4, 0], [-6, 0], [24, 0])), by(rule("polynomial.pl", clause(20))),
                                                    bindings([binding("A", -4), binding("B", 0), binding("C", -6), binding("D", 0), binding("E", 24), binding("F", 0), binding("AC", 24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                                    uses([
                                                      proof(goal(mul(-4, -6, 24)), by(builtin(mul, 3))),
                                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                                      proof(goal(sub(24, 0, 24)), by(builtin(sub, 3))),
                                                      proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                                                      proof(goal(mul(0, -6, 0)), by(builtin(mul, 3))),
                                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_scale([-4, 0], [], [])), by(fact("polynomial.pl", clause(30))),
                                                    bindings([binding("_Factor", [-4, 0])])
                                                  )
                                                ])
                                              )
                                            ])
                                          )
                                        ])
                                      )
                                    ])
                                  ),
                                  proof(goal(append([[0, 0]], [[-4, 0], [24, 0], [-44, 0], [24, 0]], [[0, 0], [-4, 0], [24, 0], [-44, 0], [24, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(poly_add([[1, 0], [-6, 0], [11, 0], [-6, 0], [0, 0]], [[0, 0], [-4, 0], [24, 0], [-44, 0], [24, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [1, 0]), binding("As", [[-6, 0], [11, 0], [-6, 0], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-4, 0], [24, 0], [-44, 0], [24, 0]]), binding("C", [1, 0]), binding("Cs", [[-10, 0], [35, 0], [-50, 0], [24, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[-6, 0], [11, 0], [-6, 0], [0, 0]], [[-4, 0], [24, 0], [-44, 0], [24, 0]], [[-10, 0], [35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [-6, 0]), binding("As", [[11, 0], [-6, 0], [0, 0]]), binding("B", [-4, 0]), binding("Bs", [[24, 0], [-44, 0], [24, 0]]), binding("C", [-10, 0]), binding("Cs", [[35, 0], [-50, 0], [24, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_add([-6, 0], [-4, 0], [-10, 0])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -6), binding("B", 0), binding("C", -4), binding("D", 0), binding("E", -10), binding("F", 0)]),
                                            uses([
                                              proof(goal(add(-6, -4, -10)), by(builtin(add, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[11, 0], [-6, 0], [0, 0]], [[24, 0], [-44, 0], [24, 0]], [[35, 0], [-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [11, 0]), binding("As", [[-6, 0], [0, 0]]), binding("B", [24, 0]), binding("Bs", [[-44, 0], [24, 0]]), binding("C", [35, 0]), binding("Cs", [[-50, 0], [24, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_add([11, 0], [24, 0], [35, 0])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", 11), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 35), binding("F", 0)]),
                                                uses([
                                                  proof(goal(add(11, 24, 35)), by(builtin(add, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_add([[-6, 0], [0, 0]], [[-44, 0], [24, 0]], [[-50, 0], [24, 0]])), by(rule("polynomial.pl", clause(33))),
                                                bindings([binding("A", [-6, 0]), binding("As", [[0, 0]]), binding("B", [-44, 0]), binding("Bs", [[24, 0]]), binding("C", [-50, 0]), binding("Cs", [[24, 0]])]),
                                                uses([
                                                  proof(
                                                    goal(c_add([-6, 0], [-44, 0], [-50, 0])), by(rule("polynomial.pl", clause(17))),
                                                    bindings([binding("A", -6), binding("B", 0), binding("C", -44), binding("D", 0), binding("E", -50), binding("F", 0)]),
                                                    uses([
                                                      proof(goal(add(-6, -44, -50)), by(builtin(add, 3))),
                                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_add([[0, 0]], [[24, 0]], [[24, 0]])), by(rule("polynomial.pl", clause(33))),
                                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [24, 0]), binding("Bs", []), binding("C", [24, 0]), binding("Cs", [])]),
                                                    uses([
                                                      proof(
                                                        goal(c_add([0, 0], [24, 0], [24, 0])), by(rule("polynomial.pl", clause(17))),
                                                        bindings([binding("A", 0), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 24), binding("F", 0)]),
                                                        uses([
                                                          proof(goal(add(0, 24, 24)), by(builtin(add, 3))),
                                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                              proof(
                                goal(poly_from_roots_acc([], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(27))),
                                bindings([binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])])
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
).

reconstructionMatches(complex_quartic, true).
why(
  reconstructionMatches(complex_quartic, true),
  proof(
    goal(reconstructionMatches(complex_quartic, true)), by(rule("polynomial.pl", clause(36))),
    bindings([binding("Case", complex_quartic), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])]),
    uses([
      proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
      proof(
        goal(reconstructed(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(34))),
        bindings([binding("Case", complex_quartic), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Roots", [[0, 1], [1, 1], [3, 2], [5, 1]])]),
        uses([
          proof(goal(known_roots(complex_quartic, [[0, 1], [1, 1], [3, 2], [5, 1]])), by(fact("polynomial.pl", clause(15)))),
          proof(
            goal(poly_from_roots([[0, 1], [1, 1], [3, 2], [5, 1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(26))),
            bindings([binding("Roots", [[0, 1], [1, 1], [3, 2], [5, 1]]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])]),
            uses([
              proof(
                goal(poly_from_roots_acc([[0, 1], [1, 1], [3, 2], [5, 1]], [[1, 0]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                bindings([binding("Root", [0, 1]), binding("Rest", [[1, 1], [3, 2], [5, 1]]), binding("Coeffs", [[1, 0]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [0, -1]])]),
                uses([
                  proof(
                    goal(poly_mul_linear([[1, 0]], [0, 1], [[1, 0], [0, -1]])), by(rule("polynomial.pl", clause(29))),
                    bindings([binding("Coeffs", [[1, 0]]), binding("Root", [0, 1]), binding("Product", [[1, 0], [0, -1]]), binding("Shifted", [[1, 0], [0, 0]]), binding("MinusRoot", [0, -1]), binding("Scaled", [[0, -1]]), binding("Lower", [[0, 0], [0, -1]])]),
                    uses([
                      proof(goal(append([[1, 0]], [[0, 0]], [[1, 0], [0, 0]])), by(builtin(append, 3))),
                      proof(
                        goal(c_neg([0, 1], [0, -1])), by(rule("polynomial.pl", clause(19))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 0), binding("D", -1)]),
                        uses([
                          proof(goal(neg(0, 0)), by(builtin(neg, 2))),
                          proof(goal(neg(1, -1)), by(builtin(neg, 2)))
                        ])
                      ),
                      proof(
                        goal(poly_scale([0, -1], [[1, 0]], [[0, -1]])), by(rule("polynomial.pl", clause(31))),
                        bindings([binding("Factor", [0, -1]), binding("Coeff", [1, 0]), binding("Rest", []), binding("Product", [0, -1]), binding("Scaled", [])]),
                        uses([
                          proof(
                            goal(c_mul([0, -1], [1, 0], [0, -1])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 0), binding("B", -1), binding("C", 1), binding("D", 0), binding("E", 0), binding("F", -1), binding("AC", 0), binding("BD", 0), binding("AD", 0), binding("BC", -1)]),
                            uses([
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(0, 0, 0)), by(builtin(sub, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                              proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([0, -1], [], [])), by(fact("polynomial.pl", clause(30))),
                            bindings([binding("_Factor", [0, -1])])
                          )
                        ])
                      ),
                      proof(goal(append([[0, 0]], [[0, -1]], [[0, 0], [0, -1]])), by(builtin(append, 3))),
                      proof(
                        goal(poly_add([[1, 0], [0, 0]], [[0, 0], [0, -1]], [[1, 0], [0, -1]])), by(rule("polynomial.pl", clause(33))),
                        bindings([binding("A", [1, 0]), binding("As", [[0, 0]]), binding("B", [0, 0]), binding("Bs", [[0, -1]]), binding("C", [1, 0]), binding("Cs", [[0, -1]])]),
                        uses([
                          proof(
                            goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                            uses([
                              proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_add([[0, 0]], [[0, -1]], [[0, -1]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [0, -1]), binding("Bs", []), binding("C", [0, -1]), binding("Cs", [])]),
                            uses([
                              proof(
                                goal(c_add([0, 0], [0, -1], [0, -1])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 0), binding("B", 0), binding("C", 0), binding("D", -1), binding("E", 0), binding("F", -1)]),
                                uses([
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3))),
                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                            ])
                          )
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(poly_from_roots_acc([[1, 1], [3, 2], [5, 1]], [[1, 0], [0, -1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                    bindings([binding("Root", [1, 1]), binding("Rest", [[3, 2], [5, 1]]), binding("Coeffs", [[1, 0], [0, -1]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [-1, -2], [-1, 1]])]),
                    uses([
                      proof(
                        goal(poly_mul_linear([[1, 0], [0, -1]], [1, 1], [[1, 0], [-1, -2], [-1, 1]])), by(rule("polynomial.pl", clause(29))),
                        bindings([binding("Coeffs", [[1, 0], [0, -1]]), binding("Root", [1, 1]), binding("Product", [[1, 0], [-1, -2], [-1, 1]]), binding("Shifted", [[1, 0], [0, -1], [0, 0]]), binding("MinusRoot", [-1, -1]), binding("Scaled", [[-1, -1], [-1, 1]]), binding("Lower", [[0, 0], [-1, -1], [-1, 1]])]),
                        uses([
                          proof(goal(append([[1, 0], [0, -1]], [[0, 0]], [[1, 0], [0, -1], [0, 0]])), by(builtin(append, 3))),
                          proof(
                            goal(c_neg([1, 1], [-1, -1])), by(rule("polynomial.pl", clause(19))),
                            bindings([binding("A", 1), binding("B", 1), binding("C", -1), binding("D", -1)]),
                            uses([
                              proof(goal(neg(1, -1)), by(builtin(neg, 2))),
                              proof(goal(neg(1, -1)), by(builtin(neg, 2)))
                            ])
                          ),
                          proof(
                            goal(poly_scale([-1, -1], [[1, 0], [0, -1]], [[-1, -1], [-1, 1]])), by(rule("polynomial.pl", clause(31))),
                            bindings([binding("Factor", [-1, -1]), binding("Coeff", [1, 0]), binding("Rest", [[0, -1]]), binding("Product", [-1, -1]), binding("Scaled", [[-1, 1]])]),
                            uses([
                              proof(
                                goal(c_mul([-1, -1], [1, 0], [-1, -1])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", -1), binding("B", -1), binding("C", 1), binding("D", 0), binding("E", -1), binding("F", -1), binding("AC", -1), binding("BD", 0), binding("AD", 0), binding("BC", -1)]),
                                uses([
                                  proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                                  proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(-1, 0, -1)), by(builtin(sub, 3))),
                                  proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-1, -1], [[0, -1]], [[-1, 1]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-1, -1]), binding("Coeff", [0, -1]), binding("Rest", []), binding("Product", [-1, 1]), binding("Scaled", [])]),
                                uses([
                                  proof(
                                    goal(c_mul([-1, -1], [0, -1], [-1, 1])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -1), binding("B", -1), binding("C", 0), binding("D", -1), binding("E", -1), binding("F", 1), binding("AC", 0), binding("BD", 1), binding("AD", 1), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(-1, -1, 1)), by(builtin(mul, 3))),
                                      proof(goal(sub(0, 1, -1)), by(builtin(sub, 3))),
                                      proof(goal(mul(-1, -1, 1)), by(builtin(mul, 3))),
                                      proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-1, -1], [], [])), by(fact("polynomial.pl", clause(30))),
                                    bindings([binding("_Factor", [-1, -1])])
                                  )
                                ])
                              )
                            ])
                          ),
                          proof(goal(append([[0, 0]], [[-1, -1], [-1, 1]], [[0, 0], [-1, -1], [-1, 1]])), by(builtin(append, 3))),
                          proof(
                            goal(poly_add([[1, 0], [0, -1], [0, 0]], [[0, 0], [-1, -1], [-1, 1]], [[1, 0], [-1, -2], [-1, 1]])), by(rule("polynomial.pl", clause(33))),
                            bindings([binding("A", [1, 0]), binding("As", [[0, -1], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-1, -1], [-1, 1]]), binding("C", [1, 0]), binding("Cs", [[-1, -2], [-1, 1]])]),
                            uses([
                              proof(
                                goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                uses([
                                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_add([[0, -1], [0, 0]], [[-1, -1], [-1, 1]], [[-1, -2], [-1, 1]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [0, -1]), binding("As", [[0, 0]]), binding("B", [-1, -1]), binding("Bs", [[-1, 1]]), binding("C", [-1, -2]), binding("Cs", [[-1, 1]])]),
                                uses([
                                  proof(
                                    goal(c_add([0, -1], [-1, -1], [-1, -2])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 0), binding("B", -1), binding("C", -1), binding("D", -1), binding("E", -1), binding("F", -2)]),
                                    uses([
                                      proof(goal(add(0, -1, -1)), by(builtin(add, 3))),
                                      proof(goal(add(-1, -1, -2)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[0, 0]], [[-1, 1]], [[-1, 1]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-1, 1]), binding("Bs", []), binding("C", [-1, 1]), binding("Cs", [])]),
                                    uses([
                                      proof(
                                        goal(c_add([0, 0], [-1, 1], [-1, 1])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 0), binding("B", 0), binding("C", -1), binding("D", 1), binding("E", -1), binding("F", 1)]),
                                        uses([
                                          proof(goal(add(0, -1, -1)), by(builtin(add, 3))),
                                          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      ),
                      proof(
                        goal(poly_from_roots_acc([[3, 2], [5, 1]], [[1, 0], [-1, -2], [-1, 1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                        bindings([binding("Root", [3, 2]), binding("Rest", [[5, 1]]), binding("Coeffs", [[1, 0], [-1, -2], [-1, 1]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [-4, -4], [-2, 9], [5, -1]])]),
                        uses([
                          proof(
                            goal(poly_mul_linear([[1, 0], [-1, -2], [-1, 1]], [3, 2], [[1, 0], [-4, -4], [-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(29))),
                            bindings([binding("Coeffs", [[1, 0], [-1, -2], [-1, 1]]), binding("Root", [3, 2]), binding("Product", [[1, 0], [-4, -4], [-2, 9], [5, -1]]), binding("Shifted", [[1, 0], [-1, -2], [-1, 1], [0, 0]]), binding("MinusRoot", [-3, -2]), binding("Scaled", [[-3, -2], [-1, 8], [5, -1]]), binding("Lower", [[0, 0], [-3, -2], [-1, 8], [5, -1]])]),
                            uses([
                              proof(goal(append([[1, 0], [-1, -2], [-1, 1]], [[0, 0]], [[1, 0], [-1, -2], [-1, 1], [0, 0]])), by(builtin(append, 3))),
                              proof(
                                goal(c_neg([3, 2], [-3, -2])), by(rule("polynomial.pl", clause(19))),
                                bindings([binding("A", 3), binding("B", 2), binding("C", -3), binding("D", -2)]),
                                uses([
                                  proof(goal(neg(3, -3)), by(builtin(neg, 2))),
                                  proof(goal(neg(2, -2)), by(builtin(neg, 2)))
                                ])
                              ),
                              proof(
                                goal(poly_scale([-3, -2], [[1, 0], [-1, -2], [-1, 1]], [[-3, -2], [-1, 8], [5, -1]])), by(rule("polynomial.pl", clause(31))),
                                bindings([binding("Factor", [-3, -2]), binding("Coeff", [1, 0]), binding("Rest", [[-1, -2], [-1, 1]]), binding("Product", [-3, -2]), binding("Scaled", [[-1, 8], [5, -1]])]),
                                uses([
                                  proof(
                                    goal(c_mul([-3, -2], [1, 0], [-3, -2])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -3), binding("B", -2), binding("C", 1), binding("D", 0), binding("E", -3), binding("F", -2), binding("AC", -3), binding("BD", 0), binding("AD", 0), binding("BC", -2)]),
                                    uses([
                                      proof(goal(mul(-3, 1, -3)), by(builtin(mul, 3))),
                                      proof(goal(mul(-2, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(-3, 0, -3)), by(builtin(sub, 3))),
                                      proof(goal(mul(-3, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                                      proof(goal(add(0, -2, -2)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-3, -2], [[-1, -2], [-1, 1]], [[-1, 8], [5, -1]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-3, -2]), binding("Coeff", [-1, -2]), binding("Rest", [[-1, 1]]), binding("Product", [-1, 8]), binding("Scaled", [[5, -1]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-3, -2], [-1, -2], [-1, 8])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -3), binding("B", -2), binding("C", -1), binding("D", -2), binding("E", -1), binding("F", 8), binding("AC", 3), binding("BD", 4), binding("AD", 6), binding("BC", 2)]),
                                        uses([
                                          proof(goal(mul(-3, -1, 3)), by(builtin(mul, 3))),
                                          proof(goal(mul(-2, -2, 4)), by(builtin(mul, 3))),
                                          proof(goal(sub(3, 4, -1)), by(builtin(sub, 3))),
                                          proof(goal(mul(-3, -2, 6)), by(builtin(mul, 3))),
                                          proof(goal(mul(-2, -1, 2)), by(builtin(mul, 3))),
                                          proof(goal(add(6, 2, 8)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-3, -2], [[-1, 1]], [[5, -1]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-3, -2]), binding("Coeff", [-1, 1]), binding("Rest", []), binding("Product", [5, -1]), binding("Scaled", [])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-3, -2], [-1, 1], [5, -1])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -3), binding("B", -2), binding("C", -1), binding("D", 1), binding("E", 5), binding("F", -1), binding("AC", 3), binding("BD", -2), binding("AD", -3), binding("BC", 2)]),
                                            uses([
                                              proof(goal(mul(-3, -1, 3)), by(builtin(mul, 3))),
                                              proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                                              proof(goal(sub(3, -2, 5)), by(builtin(sub, 3))),
                                              proof(goal(mul(-3, 1, -3)), by(builtin(mul, 3))),
                                              proof(goal(mul(-2, -1, 2)), by(builtin(mul, 3))),
                                              proof(goal(add(-3, 2, -1)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-3, -2], [], [])), by(fact("polynomial.pl", clause(30))),
                                            bindings([binding("_Factor", [-3, -2])])
                                          )
                                        ])
                                      )
                                    ])
                                  )
                                ])
                              ),
                              proof(goal(append([[0, 0]], [[-3, -2], [-1, 8], [5, -1]], [[0, 0], [-3, -2], [-1, 8], [5, -1]])), by(builtin(append, 3))),
                              proof(
                                goal(poly_add([[1, 0], [-1, -2], [-1, 1], [0, 0]], [[0, 0], [-3, -2], [-1, 8], [5, -1]], [[1, 0], [-4, -4], [-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(33))),
                                bindings([binding("A", [1, 0]), binding("As", [[-1, -2], [-1, 1], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-3, -2], [-1, 8], [5, -1]]), binding("C", [1, 0]), binding("Cs", [[-4, -4], [-2, 9], [5, -1]])]),
                                uses([
                                  proof(
                                    goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_add([[-1, -2], [-1, 1], [0, 0]], [[-3, -2], [-1, 8], [5, -1]], [[-4, -4], [-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [-1, -2]), binding("As", [[-1, 1], [0, 0]]), binding("B", [-3, -2]), binding("Bs", [[-1, 8], [5, -1]]), binding("C", [-4, -4]), binding("Cs", [[-2, 9], [5, -1]])]),
                                    uses([
                                      proof(
                                        goal(c_add([-1, -2], [-3, -2], [-4, -4])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -1), binding("B", -2), binding("C", -3), binding("D", -2), binding("E", -4), binding("F", -4)]),
                                        uses([
                                          proof(goal(add(-1, -3, -4)), by(builtin(add, 3))),
                                          proof(goal(add(-2, -2, -4)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[-1, 1], [0, 0]], [[-1, 8], [5, -1]], [[-2, 9], [5, -1]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [-1, 1]), binding("As", [[0, 0]]), binding("B", [-1, 8]), binding("Bs", [[5, -1]]), binding("C", [-2, 9]), binding("Cs", [[5, -1]])]),
                                        uses([
                                          proof(
                                            goal(c_add([-1, 1], [-1, 8], [-2, 9])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -1), binding("B", 1), binding("C", -1), binding("D", 8), binding("E", -2), binding("F", 9)]),
                                            uses([
                                              proof(goal(add(-1, -1, -2)), by(builtin(add, 3))),
                                              proof(goal(add(1, 8, 9)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[0, 0]], [[5, -1]], [[5, -1]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [0, 0]), binding("As", []), binding("B", [5, -1]), binding("Bs", []), binding("C", [5, -1]), binding("Cs", [])]),
                                            uses([
                                              proof(
                                                goal(c_add([0, 0], [5, -1], [5, -1])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", 0), binding("B", 0), binding("C", 5), binding("D", -1), binding("E", 5), binding("F", -1)]),
                                                uses([
                                                  proof(goal(add(0, 5, 5)), by(builtin(add, 3))),
                                                  proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                          proof(
                            goal(poly_from_roots_acc([[5, 1]], [[1, 0], [-4, -4], [-2, 9], [5, -1]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(28))),
                            bindings([binding("Root", [5, 1]), binding("Rest", []), binding("Coeffs", [[1, 0], [-4, -4], [-2, 9], [5, -1]]), binding("Result", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Next", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])]),
                            uses([
                              proof(
                                goal(poly_mul_linear([[1, 0], [-4, -4], [-2, 9], [5, -1]], [5, 1], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(29))),
                                bindings([binding("Coeffs", [[1, 0], [-4, -4], [-2, 9], [5, -1]]), binding("Root", [5, 1]), binding("Product", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Shifted", [[1, 0], [-4, -4], [-2, 9], [5, -1], [0, 0]]), binding("MinusRoot", [-5, -1]), binding("Scaled", [[-5, -1], [16, 24], [19, -43], [-26, 0]]), binding("Lower", [[0, 0], [-5, -1], [16, 24], [19, -43], [-26, 0]])]),
                                uses([
                                  proof(goal(append([[1, 0], [-4, -4], [-2, 9], [5, -1]], [[0, 0]], [[1, 0], [-4, -4], [-2, 9], [5, -1], [0, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(c_neg([5, 1], [-5, -1])), by(rule("polynomial.pl", clause(19))),
                                    bindings([binding("A", 5), binding("B", 1), binding("C", -5), binding("D", -1)]),
                                    uses([
                                      proof(goal(neg(5, -5)), by(builtin(neg, 2))),
                                      proof(goal(neg(1, -1)), by(builtin(neg, 2)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_scale([-5, -1], [[1, 0], [-4, -4], [-2, 9], [5, -1]], [[-5, -1], [16, 24], [19, -43], [-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                    bindings([binding("Factor", [-5, -1]), binding("Coeff", [1, 0]), binding("Rest", [[-4, -4], [-2, 9], [5, -1]]), binding("Product", [-5, -1]), binding("Scaled", [[16, 24], [19, -43], [-26, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-5, -1], [1, 0], [-5, -1])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -5), binding("B", -1), binding("C", 1), binding("D", 0), binding("E", -5), binding("F", -1), binding("AC", -5), binding("BD", 0), binding("AD", 0), binding("BC", -1)]),
                                        uses([
                                          proof(goal(mul(-5, 1, -5)), by(builtin(mul, 3))),
                                          proof(goal(mul(-1, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(-5, 0, -5)), by(builtin(sub, 3))),
                                          proof(goal(mul(-5, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                                          proof(goal(add(0, -1, -1)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_scale([-5, -1], [[-4, -4], [-2, 9], [5, -1]], [[16, 24], [19, -43], [-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                        bindings([binding("Factor", [-5, -1]), binding("Coeff", [-4, -4]), binding("Rest", [[-2, 9], [5, -1]]), binding("Product", [16, 24]), binding("Scaled", [[19, -43], [-26, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-5, -1], [-4, -4], [16, 24])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -5), binding("B", -1), binding("C", -4), binding("D", -4), binding("E", 16), binding("F", 24), binding("AC", 20), binding("BD", 4), binding("AD", 20), binding("BC", 4)]),
                                            uses([
                                              proof(goal(mul(-5, -4, 20)), by(builtin(mul, 3))),
                                              proof(goal(mul(-1, -4, 4)), by(builtin(mul, 3))),
                                              proof(goal(sub(20, 4, 16)), by(builtin(sub, 3))),
                                              proof(goal(mul(-5, -4, 20)), by(builtin(mul, 3))),
                                              proof(goal(mul(-1, -4, 4)), by(builtin(mul, 3))),
                                              proof(goal(add(20, 4, 24)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_scale([-5, -1], [[-2, 9], [5, -1]], [[19, -43], [-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                            bindings([binding("Factor", [-5, -1]), binding("Coeff", [-2, 9]), binding("Rest", [[5, -1]]), binding("Product", [19, -43]), binding("Scaled", [[-26, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_mul([-5, -1], [-2, 9], [19, -43])), by(rule("polynomial.pl", clause(20))),
                                                bindings([binding("A", -5), binding("B", -1), binding("C", -2), binding("D", 9), binding("E", 19), binding("F", -43), binding("AC", 10), binding("BD", -9), binding("AD", -45), binding("BC", 2)]),
                                                uses([
                                                  proof(goal(mul(-5, -2, 10)), by(builtin(mul, 3))),
                                                  proof(goal(mul(-1, 9, -9)), by(builtin(mul, 3))),
                                                  proof(goal(sub(10, -9, 19)), by(builtin(sub, 3))),
                                                  proof(goal(mul(-5, 9, -45)), by(builtin(mul, 3))),
                                                  proof(goal(mul(-1, -2, 2)), by(builtin(mul, 3))),
                                                  proof(goal(add(-45, 2, -43)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_scale([-5, -1], [[5, -1]], [[-26, 0]])), by(rule("polynomial.pl", clause(31))),
                                                bindings([binding("Factor", [-5, -1]), binding("Coeff", [5, -1]), binding("Rest", []), binding("Product", [-26, 0]), binding("Scaled", [])]),
                                                uses([
                                                  proof(
                                                    goal(c_mul([-5, -1], [5, -1], [-26, 0])), by(rule("polynomial.pl", clause(20))),
                                                    bindings([binding("A", -5), binding("B", -1), binding("C", 5), binding("D", -1), binding("E", -26), binding("F", 0), binding("AC", -25), binding("BD", 1), binding("AD", 5), binding("BC", -5)]),
                                                    uses([
                                                      proof(goal(mul(-5, 5, -25)), by(builtin(mul, 3))),
                                                      proof(goal(mul(-1, -1, 1)), by(builtin(mul, 3))),
                                                      proof(goal(sub(-25, 1, -26)), by(builtin(sub, 3))),
                                                      proof(goal(mul(-5, -1, 5)), by(builtin(mul, 3))),
                                                      proof(goal(mul(-1, 5, -5)), by(builtin(mul, 3))),
                                                      proof(goal(add(5, -5, 0)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_scale([-5, -1], [], [])), by(fact("polynomial.pl", clause(30))),
                                                    bindings([binding("_Factor", [-5, -1])])
                                                  )
                                                ])
                                              )
                                            ])
                                          )
                                        ])
                                      )
                                    ])
                                  ),
                                  proof(goal(append([[0, 0]], [[-5, -1], [16, 24], [19, -43], [-26, 0]], [[0, 0], [-5, -1], [16, 24], [19, -43], [-26, 0]])), by(builtin(append, 3))),
                                  proof(
                                    goal(poly_add([[1, 0], [-4, -4], [-2, 9], [5, -1], [0, 0]], [[0, 0], [-5, -1], [16, 24], [19, -43], [-26, 0]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                    bindings([binding("A", [1, 0]), binding("As", [[-4, -4], [-2, 9], [5, -1], [0, 0]]), binding("B", [0, 0]), binding("Bs", [[-5, -1], [16, 24], [19, -43], [-26, 0]]), binding("C", [1, 0]), binding("Cs", [[-9, -5], [14, 33], [24, -44], [-26, 0]])]),
                                    uses([
                                      proof(
                                        goal(c_add([1, 0], [0, 0], [1, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 0), binding("E", 1), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_add([[-4, -4], [-2, 9], [5, -1], [0, 0]], [[-5, -1], [16, 24], [19, -43], [-26, 0]], [[-9, -5], [14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                        bindings([binding("A", [-4, -4]), binding("As", [[-2, 9], [5, -1], [0, 0]]), binding("B", [-5, -1]), binding("Bs", [[16, 24], [19, -43], [-26, 0]]), binding("C", [-9, -5]), binding("Cs", [[14, 33], [24, -44], [-26, 0]])]),
                                        uses([
                                          proof(
                                            goal(c_add([-4, -4], [-5, -1], [-9, -5])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -4), binding("B", -4), binding("C", -5), binding("D", -1), binding("E", -9), binding("F", -5)]),
                                            uses([
                                              proof(goal(add(-4, -5, -9)), by(builtin(add, 3))),
                                              proof(goal(add(-4, -1, -5)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_add([[-2, 9], [5, -1], [0, 0]], [[16, 24], [19, -43], [-26, 0]], [[14, 33], [24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                            bindings([binding("A", [-2, 9]), binding("As", [[5, -1], [0, 0]]), binding("B", [16, 24]), binding("Bs", [[19, -43], [-26, 0]]), binding("C", [14, 33]), binding("Cs", [[24, -44], [-26, 0]])]),
                                            uses([
                                              proof(
                                                goal(c_add([-2, 9], [16, 24], [14, 33])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", -2), binding("B", 9), binding("C", 16), binding("D", 24), binding("E", 14), binding("F", 33)]),
                                                uses([
                                                  proof(goal(add(-2, 16, 14)), by(builtin(add, 3))),
                                                  proof(goal(add(9, 24, 33)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_add([[5, -1], [0, 0]], [[19, -43], [-26, 0]], [[24, -44], [-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                                bindings([binding("A", [5, -1]), binding("As", [[0, 0]]), binding("B", [19, -43]), binding("Bs", [[-26, 0]]), binding("C", [24, -44]), binding("Cs", [[-26, 0]])]),
                                                uses([
                                                  proof(
                                                    goal(c_add([5, -1], [19, -43], [24, -44])), by(rule("polynomial.pl", clause(17))),
                                                    bindings([binding("A", 5), binding("B", -1), binding("C", 19), binding("D", -43), binding("E", 24), binding("F", -44)]),
                                                    uses([
                                                      proof(goal(add(5, 19, 24)), by(builtin(add, 3))),
                                                      proof(goal(add(-1, -43, -44)), by(builtin(add, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(poly_add([[0, 0]], [[-26, 0]], [[-26, 0]])), by(rule("polynomial.pl", clause(33))),
                                                    bindings([binding("A", [0, 0]), binding("As", []), binding("B", [-26, 0]), binding("Bs", []), binding("C", [-26, 0]), binding("Cs", [])]),
                                                    uses([
                                                      proof(
                                                        goal(c_add([0, 0], [-26, 0], [-26, 0])), by(rule("polynomial.pl", clause(17))),
                                                        bindings([binding("A", 0), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", -26), binding("F", 0)]),
                                                        uses([
                                                          proof(goal(add(0, -26, -26)), by(builtin(add, 3))),
                                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(poly_add([], [], [])), by(fact("polynomial.pl", clause(32))))
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
                              proof(
                                goal(poly_from_roots_acc([], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(27))),
                                bindings([binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])])
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
).

allRootsVerified(real_quartic, true).
why(
  allRootsVerified(real_quartic, true),
  proof(
    goal(allRootsVerified(real_quartic, true)), by(rule("polynomial.pl", clause(37))),
    bindings([binding("Case", real_quartic), binding("Roots", [[1, 0], [2, 0], [3, 0], [4, 0]])]),
    uses([
      proof(goal(known_roots(real_quartic, [[1, 0], [2, 0], [3, 0], [4, 0]])), by(fact("polynomial.pl", clause(14)))),
      proof(
        goal(all_roots_verify(real_quartic, [[1, 0], [2, 0], [3, 0], [4, 0]])), by(rule("polynomial.pl", clause(39))),
        bindings([binding("Case", real_quartic), binding("Root", [1, 0]), binding("Rest", [[2, 0], [3, 0], [4, 0]])]),
        uses([
          proof(
            goal(root(real_quartic, [1, 0])), by(rule("polynomial.pl", clause(25))),
            bindings([binding("Case", real_quartic), binding("Root", [1, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
            uses([
              proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
              proof(
                goal(candidate(real_quartic, [1, 0])), by(rule("polynomial.pl", clause(24))),
                bindings([binding("Case", real_quartic), binding("R", 1), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
                uses([
                  proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
                  proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
                  proof(goal(between(0, 5, 1)), by(builtin(between, 3))),
                  proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
                ])
              ),
              proof(
                goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
                bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [1, 0]), binding("Value", [0, 0])]),
                uses([
                  proof(
                    goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [1, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [1, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [1, 0]), binding("Next", [-9, 0])]),
                    uses([
                      proof(
                        goal(c_mul([1, 0], [1, 0], [1, 0])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 1), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", 1), binding("F", 0), binding("AC", 1), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                        uses([
                          proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(sub(1, 0, 1)), by(builtin(sub, 3))),
                          proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([1, 0], [-10, 0], [-9, 0])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", 1), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -9), binding("F", 0)]),
                        uses([
                          proof(goal(add(1, -10, -9)), by(builtin(add, 3))),
                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [1, 0], [-9, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [1, 0]), binding("Acc", [-9, 0]), binding("Value", [0, 0]), binding("Product", [-9, 0]), binding("Next", [26, 0])]),
                        uses([
                          proof(
                            goal(c_mul([-9, 0], [1, 0], [-9, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -9), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -9), binding("F", 0), binding("AC", -9), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-9, 1, -9)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(-9, 0, -9)), by(builtin(sub, 3))),
                              proof(goal(mul(-9, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([-9, 0], [35, 0], [26, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", -9), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 26), binding("F", 0)]),
                            uses([
                              proof(goal(add(-9, 35, 26)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([[-50, 0], [24, 0]], [1, 0], [26, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                            bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [1, 0]), binding("Acc", [26, 0]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [-24, 0])]),
                            uses([
                              proof(
                                goal(c_mul([26, 0], [1, 0], [26, 0])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", 26), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", 26), binding("F", 0), binding("AC", 26), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                uses([
                                  proof(goal(mul(26, 1, 26)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
                                  proof(goal(mul(26, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(c_add([26, 0], [-50, 0], [-24, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 26), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -24), binding("F", 0)]),
                                uses([
                                  proof(goal(add(26, -50, -24)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_eval_acc([[24, 0]], [1, 0], [-24, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [1, 0]), binding("Acc", [-24, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                                uses([
                                  proof(
                                    goal(c_mul([-24, 0], [1, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -24), binding("B", 0), binding("C", 1), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-24, 1, -24)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                                      proof(goal(mul(-24, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([], [1, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                    bindings([binding("_X", [1, 0]), binding("Acc", [0, 0])])
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
              proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
            ])
          ),
          proof(
            goal(all_roots_verify(real_quartic, [[2, 0], [3, 0], [4, 0]])), by(rule("polynomial.pl", clause(39))),
            bindings([binding("Case", real_quartic), binding("Root", [2, 0]), binding("Rest", [[3, 0], [4, 0]])]),
            uses([
              proof(
                goal(root(real_quartic, [2, 0])), by(rule("polynomial.pl", clause(25))),
                bindings([binding("Case", real_quartic), binding("Root", [2, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
                uses([
                  proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
                  proof(
                    goal(candidate(real_quartic, [2, 0])), by(rule("polynomial.pl", clause(24))),
                    bindings([binding("Case", real_quartic), binding("R", 2), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
                    uses([
                      proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
                      proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
                      proof(goal(between(0, 5, 2)), by(builtin(between, 3))),
                      proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [2, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
                    bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [2, 0]), binding("Value", [0, 0])]),
                    uses([
                      proof(
                        goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [2, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [2, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [2, 0]), binding("Next", [-8, 0])]),
                        uses([
                          proof(
                            goal(c_mul([1, 0], [2, 0], [2, 0])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 1), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", 2), binding("F", 0), binding("AC", 2), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(1, 2, 2)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(2, 0, 2)), by(builtin(sub, 3))),
                              proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([2, 0], [-10, 0], [-8, 0])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 2), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -8), binding("F", 0)]),
                            uses([
                              proof(goal(add(2, -10, -8)), by(builtin(add, 3))),
                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [2, 0], [-8, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                            bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [2, 0]), binding("Acc", [-8, 0]), binding("Value", [0, 0]), binding("Product", [-16, 0]), binding("Next", [19, 0])]),
                            uses([
                              proof(
                                goal(c_mul([-8, 0], [2, 0], [-16, 0])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", -8), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", -16), binding("F", 0), binding("AC", -16), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                uses([
                                  proof(goal(mul(-8, 2, -16)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(-16, 0, -16)), by(builtin(sub, 3))),
                                  proof(goal(mul(-8, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(c_add([-16, 0], [35, 0], [19, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", -16), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 19), binding("F", 0)]),
                                uses([
                                  proof(goal(add(-16, 35, 19)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_eval_acc([[-50, 0], [24, 0]], [2, 0], [19, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [2, 0]), binding("Acc", [19, 0]), binding("Value", [0, 0]), binding("Product", [38, 0]), binding("Next", [-12, 0])]),
                                uses([
                                  proof(
                                    goal(c_mul([19, 0], [2, 0], [38, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", 19), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", 38), binding("F", 0), binding("AC", 38), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(19, 2, 38)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(38, 0, 38)), by(builtin(sub, 3))),
                                      proof(goal(mul(19, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([38, 0], [-50, 0], [-12, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 38), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -12), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(38, -50, -12)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([[24, 0]], [2, 0], [-12, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                    bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [2, 0]), binding("Acc", [-12, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-12, 0], [2, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -12), binding("B", 0), binding("C", 2), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                        uses([
                                          proof(goal(mul(-12, 2, -24)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                                          proof(goal(mul(-12, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_eval_acc([], [2, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                        bindings([binding("_X", [2, 0]), binding("Acc", [0, 0])])
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
                  proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
                ])
              ),
              proof(
                goal(all_roots_verify(real_quartic, [[3, 0], [4, 0]])), by(rule("polynomial.pl", clause(39))),
                bindings([binding("Case", real_quartic), binding("Root", [3, 0]), binding("Rest", [[4, 0]])]),
                uses([
                  proof(
                    goal(root(real_quartic, [3, 0])), by(rule("polynomial.pl", clause(25))),
                    bindings([binding("Case", real_quartic), binding("Root", [3, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
                    uses([
                      proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
                      proof(
                        goal(candidate(real_quartic, [3, 0])), by(rule("polynomial.pl", clause(24))),
                        bindings([binding("Case", real_quartic), binding("R", 3), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
                        uses([
                          proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
                          proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
                          proof(goal(between(0, 5, 3)), by(builtin(between, 3))),
                          proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [3, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
                        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [3, 0]), binding("Value", [0, 0])]),
                        uses([
                          proof(
                            goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [3, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                            bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [3, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [3, 0]), binding("Next", [-7, 0])]),
                            uses([
                              proof(
                                goal(c_mul([1, 0], [3, 0], [3, 0])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", 1), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", 3), binding("F", 0), binding("AC", 3), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                uses([
                                  proof(goal(mul(1, 3, 3)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(3, 0, 3)), by(builtin(sub, 3))),
                                  proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(c_add([3, 0], [-10, 0], [-7, 0])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 3), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -7), binding("F", 0)]),
                                uses([
                                  proof(goal(add(3, -10, -7)), by(builtin(add, 3))),
                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [3, 0], [-7, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [3, 0]), binding("Acc", [-7, 0]), binding("Value", [0, 0]), binding("Product", [-21, 0]), binding("Next", [14, 0])]),
                                uses([
                                  proof(
                                    goal(c_mul([-7, 0], [3, 0], [-21, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -7), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", -21), binding("F", 0), binding("AC", -21), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(-7, 3, -21)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(-21, 0, -21)), by(builtin(sub, 3))),
                                      proof(goal(mul(-7, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([-21, 0], [35, 0], [14, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", -21), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 14), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(-21, 35, 14)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([[-50, 0], [24, 0]], [3, 0], [14, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                    bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [3, 0]), binding("Acc", [14, 0]), binding("Value", [0, 0]), binding("Product", [42, 0]), binding("Next", [-8, 0])]),
                                    uses([
                                      proof(
                                        goal(c_mul([14, 0], [3, 0], [42, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", 14), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", 42), binding("F", 0), binding("AC", 42), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                        uses([
                                          proof(goal(mul(14, 3, 42)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(42, 0, 42)), by(builtin(sub, 3))),
                                          proof(goal(mul(14, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(c_add([42, 0], [-50, 0], [-8, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 42), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -8), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(42, -50, -8)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_eval_acc([[24, 0]], [3, 0], [-8, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                        bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [3, 0]), binding("Acc", [-8, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-8, 0], [3, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -8), binding("B", 0), binding("C", 3), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                            uses([
                                              proof(goal(mul(-8, 3, -24)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                                              proof(goal(mul(-8, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                            uses([
                                              proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_eval_acc([], [3, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                            bindings([binding("_X", [3, 0]), binding("Acc", [0, 0])])
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
                      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
                    ])
                  ),
                  proof(
                    goal(all_roots_verify(real_quartic, [[4, 0]])), by(rule("polynomial.pl", clause(39))),
                    bindings([binding("Case", real_quartic), binding("Root", [4, 0]), binding("Rest", [])]),
                    uses([
                      proof(
                        goal(root(real_quartic, [4, 0])), by(rule("polynomial.pl", clause(25))),
                        bindings([binding("Case", real_quartic), binding("Root", [4, 0]), binding("Coeffs", [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("Value", [0, 0])]),
                        uses([
                          proof(goal(polynomial(real_quartic, [[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]])), by(fact("polynomial.pl", clause(8)))),
                          proof(
                            goal(candidate(real_quartic, [4, 0])), by(rule("polynomial.pl", clause(24))),
                            bindings([binding("Case", real_quartic), binding("R", 4), binding("I", 0), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 0)]),
                            uses([
                              proof(goal(real_domain(real_quartic, 0, 5)), by(fact("polynomial.pl", clause(10)))),
                              proof(goal(imag_domain(real_quartic, 0, 0)), by(fact("polynomial.pl", clause(11)))),
                              proof(goal(between(0, 5, 4)), by(builtin(between, 3))),
                              proof(goal(between(0, 0, 0)), by(builtin(between, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval([[1, 0], [-10, 0], [35, 0], [-50, 0], [24, 0]], [4, 0], [0, 0])), by(rule("polynomial.pl", clause(21))),
                            bindings([binding("Coeff", [1, 0]), binding("Rest", [[-10, 0], [35, 0], [-50, 0], [24, 0]]), binding("X", [4, 0]), binding("Value", [0, 0])]),
                            uses([
                              proof(
                                goal(poly_eval_acc([[-10, 0], [35, 0], [-50, 0], [24, 0]], [4, 0], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [-10, 0]), binding("Rest", [[35, 0], [-50, 0], [24, 0]]), binding("X", [4, 0]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [4, 0]), binding("Next", [-6, 0])]),
                                uses([
                                  proof(
                                    goal(c_mul([1, 0], [4, 0], [4, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", 1), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", 4), binding("F", 0), binding("AC", 4), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(4, 0, 4)), by(builtin(sub, 3))),
                                      proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([4, 0], [-10, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 4), binding("B", 0), binding("C", -10), binding("D", 0), binding("E", -6), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(4, -10, -6)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([[35, 0], [-50, 0], [24, 0]], [4, 0], [-6, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                    bindings([binding("Coeff", [35, 0]), binding("Rest", [[-50, 0], [24, 0]]), binding("X", [4, 0]), binding("Acc", [-6, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [11, 0])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-6, 0], [4, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -6), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                        uses([
                                          proof(goal(mul(-6, 4, -24)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                                          proof(goal(mul(-6, 0, 0)), by(builtin(mul, 3))),
                                          proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(c_add([-24, 0], [35, 0], [11, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -24), binding("B", 0), binding("C", 35), binding("D", 0), binding("E", 11), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(-24, 35, 11)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_eval_acc([[-50, 0], [24, 0]], [4, 0], [11, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                        bindings([binding("Coeff", [-50, 0]), binding("Rest", [[24, 0]]), binding("X", [4, 0]), binding("Acc", [11, 0]), binding("Value", [0, 0]), binding("Product", [44, 0]), binding("Next", [-6, 0])]),
                                        uses([
                                          proof(
                                            goal(c_mul([11, 0], [4, 0], [44, 0])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", 11), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", 44), binding("F", 0), binding("AC", 44), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                            uses([
                                              proof(goal(mul(11, 4, 44)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(sub(44, 0, 44)), by(builtin(sub, 3))),
                                              proof(goal(mul(11, 0, 0)), by(builtin(mul, 3))),
                                              proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(c_add([44, 0], [-50, 0], [-6, 0])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", 44), binding("B", 0), binding("C", -50), binding("D", 0), binding("E", -6), binding("F", 0)]),
                                            uses([
                                              proof(goal(add(44, -50, -6)), by(builtin(add, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_eval_acc([[24, 0]], [4, 0], [-6, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                            bindings([binding("Coeff", [24, 0]), binding("Rest", []), binding("X", [4, 0]), binding("Acc", [-6, 0]), binding("Value", [0, 0]), binding("Product", [-24, 0]), binding("Next", [0, 0])]),
                                            uses([
                                              proof(
                                                goal(c_mul([-6, 0], [4, 0], [-24, 0])), by(rule("polynomial.pl", clause(20))),
                                                bindings([binding("A", -6), binding("B", 0), binding("C", 4), binding("D", 0), binding("E", -24), binding("F", 0), binding("AC", -24), binding("BD", 0), binding("AD", 0), binding("BC", 0)]),
                                                uses([
                                                  proof(goal(mul(-6, 4, -24)), by(builtin(mul, 3))),
                                                  proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                                  proof(goal(sub(-24, 0, -24)), by(builtin(sub, 3))),
                                                  proof(goal(mul(-6, 0, 0)), by(builtin(mul, 3))),
                                                  proof(goal(mul(0, 4, 0)), by(builtin(mul, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(c_add([-24, 0], [24, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", -24), binding("B", 0), binding("C", 24), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                                uses([
                                                  proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_eval_acc([], [4, 0], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                                bindings([binding("_X", [4, 0]), binding("Acc", [0, 0])])
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
                          proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
                        ])
                      ),
                      proof(
                        goal(all_roots_verify(real_quartic, [])), by(fact("polynomial.pl", clause(38))),
                        bindings([binding("_Case", real_quartic)])
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
).

allRootsVerified(complex_quartic, true).
why(
  allRootsVerified(complex_quartic, true),
  proof(
    goal(allRootsVerified(complex_quartic, true)), by(rule("polynomial.pl", clause(37))),
    bindings([binding("Case", complex_quartic), binding("Roots", [[0, 1], [1, 1], [3, 2], [5, 1]])]),
    uses([
      proof(goal(known_roots(complex_quartic, [[0, 1], [1, 1], [3, 2], [5, 1]])), by(fact("polynomial.pl", clause(15)))),
      proof(
        goal(all_roots_verify(complex_quartic, [[0, 1], [1, 1], [3, 2], [5, 1]])), by(rule("polynomial.pl", clause(39))),
        bindings([binding("Case", complex_quartic), binding("Root", [0, 1]), binding("Rest", [[1, 1], [3, 2], [5, 1]])]),
        uses([
          proof(
            goal(root(complex_quartic, [0, 1])), by(rule("polynomial.pl", clause(25))),
            bindings([binding("Case", complex_quartic), binding("Root", [0, 1]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
            uses([
              proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
              proof(
                goal(candidate(complex_quartic, [0, 1])), by(rule("polynomial.pl", clause(24))),
                bindings([binding("Case", complex_quartic), binding("R", 0), binding("I", 1), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
                uses([
                  proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
                  proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
                  proof(goal(between(0, 5, 0)), by(builtin(between, 3))),
                  proof(goal(between(0, 2, 1)), by(builtin(between, 3)))
                ])
              ),
              proof(
                goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [0, 1], [0, 0])), by(rule("polynomial.pl", clause(21))),
                bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [0, 1]), binding("Value", [0, 0])]),
                uses([
                  proof(
                    goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [0, 1], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                    bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [0, 1]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [0, 1]), binding("Next", [-9, -4])]),
                    uses([
                      proof(
                        goal(c_mul([1, 0], [0, 1], [0, 1])), by(rule("polynomial.pl", clause(20))),
                        bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("D", 1), binding("E", 0), binding("F", 1), binding("AC", 0), binding("BD", 0), binding("AD", 1), binding("BC", 0)]),
                        uses([
                          proof(goal(mul(1, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                          proof(goal(sub(0, 0, 0)), by(builtin(sub, 3))),
                          proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                          proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                          proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(c_add([0, 1], [-9, -5], [-9, -4])), by(rule("polynomial.pl", clause(17))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", -9), binding("D", -5), binding("E", -9), binding("F", -4)]),
                        uses([
                          proof(goal(add(0, -9, -9)), by(builtin(add, 3))),
                          proof(goal(add(1, -5, -4)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [0, 1], [-9, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [0, 1]), binding("Acc", [-9, -4]), binding("Value", [0, 0]), binding("Product", [4, -9]), binding("Next", [18, 24])]),
                        uses([
                          proof(
                            goal(c_mul([-9, -4], [0, 1], [4, -9])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", -9), binding("B", -4), binding("C", 0), binding("D", 1), binding("E", 4), binding("F", -9), binding("AC", 0), binding("BD", -4), binding("AD", -9), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(-9, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                              proof(goal(sub(0, -4, 4)), by(builtin(sub, 3))),
                              proof(goal(mul(-9, 1, -9)), by(builtin(mul, 3))),
                              proof(goal(mul(-4, 0, 0)), by(builtin(mul, 3))),
                              proof(goal(add(-9, 0, -9)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([4, -9], [14, 33], [18, 24])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 4), binding("B", -9), binding("C", 14), binding("D", 33), binding("E", 18), binding("F", 24)]),
                            uses([
                              proof(goal(add(4, 14, 18)), by(builtin(add, 3))),
                              proof(goal(add(-9, 33, 24)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([[24, -44], [-26, 0]], [0, 1], [18, 24], [0, 0])), by(rule("polynomial.pl", clause(23))),
                            bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [0, 1]), binding("Acc", [18, 24]), binding("Value", [0, 0]), binding("Product", [-24, 18]), binding("Next", [0, -26])]),
                            uses([
                              proof(
                                goal(c_mul([18, 24], [0, 1], [-24, 18])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", 18), binding("B", 24), binding("C", 0), binding("D", 1), binding("E", -24), binding("F", 18), binding("AC", 0), binding("BD", 24), binding("AD", 18), binding("BC", 0)]),
                                uses([
                                  proof(goal(mul(18, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(mul(24, 1, 24)), by(builtin(mul, 3))),
                                  proof(goal(sub(0, 24, -24)), by(builtin(sub, 3))),
                                  proof(goal(mul(18, 1, 18)), by(builtin(mul, 3))),
                                  proof(goal(mul(24, 0, 0)), by(builtin(mul, 3))),
                                  proof(goal(add(18, 0, 18)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(c_add([-24, 18], [24, -44], [0, -26])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", -24), binding("B", 18), binding("C", 24), binding("D", -44), binding("E", 0), binding("F", -26)]),
                                uses([
                                  proof(goal(add(-24, 24, 0)), by(builtin(add, 3))),
                                  proof(goal(add(18, -44, -26)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_eval_acc([[-26, 0]], [0, 1], [0, -26], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [0, 1]), binding("Acc", [0, -26]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                                uses([
                                  proof(
                                    goal(c_mul([0, -26], [0, 1], [26, 0])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", 0), binding("B", -26), binding("C", 0), binding("D", 1), binding("E", 26), binding("F", 0), binding("AC", 0), binding("BD", -26), binding("AD", 0), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(0, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(-26, 1, -26)), by(builtin(mul, 3))),
                                      proof(goal(sub(0, -26, 26)), by(builtin(sub, 3))),
                                      proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                      proof(goal(mul(-26, 0, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                    uses([
                                      proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                                      proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([], [0, 1], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                    bindings([binding("_X", [0, 1]), binding("Acc", [0, 0])])
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
              proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
            ])
          ),
          proof(
            goal(all_roots_verify(complex_quartic, [[1, 1], [3, 2], [5, 1]])), by(rule("polynomial.pl", clause(39))),
            bindings([binding("Case", complex_quartic), binding("Root", [1, 1]), binding("Rest", [[3, 2], [5, 1]])]),
            uses([
              proof(
                goal(root(complex_quartic, [1, 1])), by(rule("polynomial.pl", clause(25))),
                bindings([binding("Case", complex_quartic), binding("Root", [1, 1]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
                uses([
                  proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
                  proof(
                    goal(candidate(complex_quartic, [1, 1])), by(rule("polynomial.pl", clause(24))),
                    bindings([binding("Case", complex_quartic), binding("R", 1), binding("I", 1), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
                    uses([
                      proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
                      proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
                      proof(goal(between(0, 5, 1)), by(builtin(between, 3))),
                      proof(goal(between(0, 2, 1)), by(builtin(between, 3)))
                    ])
                  ),
                  proof(
                    goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [1, 1], [0, 0])), by(rule("polynomial.pl", clause(21))),
                    bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [1, 1]), binding("Value", [0, 0])]),
                    uses([
                      proof(
                        goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [1, 1], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                        bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [1, 1]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [1, 1]), binding("Next", [-8, -4])]),
                        uses([
                          proof(
                            goal(c_mul([1, 0], [1, 1], [1, 1])), by(rule("polynomial.pl", clause(20))),
                            bindings([binding("A", 1), binding("B", 0), binding("C", 1), binding("D", 1), binding("E", 1), binding("F", 1), binding("AC", 1), binding("BD", 0), binding("AD", 1), binding("BC", 0)]),
                            uses([
                              proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(sub(1, 0, 1)), by(builtin(sub, 3))),
                              proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                              proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                              proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(c_add([1, 1], [-9, -5], [-8, -4])), by(rule("polynomial.pl", clause(17))),
                            bindings([binding("A", 1), binding("B", 1), binding("C", -9), binding("D", -5), binding("E", -8), binding("F", -4)]),
                            uses([
                              proof(goal(add(1, -9, -8)), by(builtin(add, 3))),
                              proof(goal(add(1, -5, -4)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [1, 1], [-8, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                            bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [1, 1]), binding("Acc", [-8, -4]), binding("Value", [0, 0]), binding("Product", [-4, -12]), binding("Next", [10, 21])]),
                            uses([
                              proof(
                                goal(c_mul([-8, -4], [1, 1], [-4, -12])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", -8), binding("B", -4), binding("C", 1), binding("D", 1), binding("E", -4), binding("F", -12), binding("AC", -8), binding("BD", -4), binding("AD", -8), binding("BC", -4)]),
                                uses([
                                  proof(goal(mul(-8, 1, -8)), by(builtin(mul, 3))),
                                  proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                                  proof(goal(sub(-8, -4, -4)), by(builtin(sub, 3))),
                                  proof(goal(mul(-8, 1, -8)), by(builtin(mul, 3))),
                                  proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                                  proof(goal(add(-8, -4, -12)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(c_add([-4, -12], [14, 33], [10, 21])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", -4), binding("B", -12), binding("C", 14), binding("D", 33), binding("E", 10), binding("F", 21)]),
                                uses([
                                  proof(goal(add(-4, 14, 10)), by(builtin(add, 3))),
                                  proof(goal(add(-12, 33, 21)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_eval_acc([[24, -44], [-26, 0]], [1, 1], [10, 21], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [1, 1]), binding("Acc", [10, 21]), binding("Value", [0, 0]), binding("Product", [-11, 31]), binding("Next", [13, -13])]),
                                uses([
                                  proof(
                                    goal(c_mul([10, 21], [1, 1], [-11, 31])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", 10), binding("B", 21), binding("C", 1), binding("D", 1), binding("E", -11), binding("F", 31), binding("AC", 10), binding("BD", 21), binding("AD", 10), binding("BC", 21)]),
                                    uses([
                                      proof(goal(mul(10, 1, 10)), by(builtin(mul, 3))),
                                      proof(goal(mul(21, 1, 21)), by(builtin(mul, 3))),
                                      proof(goal(sub(10, 21, -11)), by(builtin(sub, 3))),
                                      proof(goal(mul(10, 1, 10)), by(builtin(mul, 3))),
                                      proof(goal(mul(21, 1, 21)), by(builtin(mul, 3))),
                                      proof(goal(add(10, 21, 31)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([-11, 31], [24, -44], [13, -13])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", -11), binding("B", 31), binding("C", 24), binding("D", -44), binding("E", 13), binding("F", -13)]),
                                    uses([
                                      proof(goal(add(-11, 24, 13)), by(builtin(add, 3))),
                                      proof(goal(add(31, -44, -13)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([[-26, 0]], [1, 1], [13, -13], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                    bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [1, 1]), binding("Acc", [13, -13]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                                    uses([
                                      proof(
                                        goal(c_mul([13, -13], [1, 1], [26, 0])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", 13), binding("B", -13), binding("C", 1), binding("D", 1), binding("E", 26), binding("F", 0), binding("AC", 13), binding("BD", -13), binding("AD", 13), binding("BC", -13)]),
                                        uses([
                                          proof(goal(mul(13, 1, 13)), by(builtin(mul, 3))),
                                          proof(goal(mul(-13, 1, -13)), by(builtin(mul, 3))),
                                          proof(goal(sub(13, -13, 26)), by(builtin(sub, 3))),
                                          proof(goal(mul(13, 1, 13)), by(builtin(mul, 3))),
                                          proof(goal(mul(-13, 1, -13)), by(builtin(mul, 3))),
                                          proof(goal(add(13, -13, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                        uses([
                                          proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                                          proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_eval_acc([], [1, 1], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                        bindings([binding("_X", [1, 1]), binding("Acc", [0, 0])])
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
                  proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
                ])
              ),
              proof(
                goal(all_roots_verify(complex_quartic, [[3, 2], [5, 1]])), by(rule("polynomial.pl", clause(39))),
                bindings([binding("Case", complex_quartic), binding("Root", [3, 2]), binding("Rest", [[5, 1]])]),
                uses([
                  proof(
                    goal(root(complex_quartic, [3, 2])), by(rule("polynomial.pl", clause(25))),
                    bindings([binding("Case", complex_quartic), binding("Root", [3, 2]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
                    uses([
                      proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
                      proof(
                        goal(candidate(complex_quartic, [3, 2])), by(rule("polynomial.pl", clause(24))),
                        bindings([binding("Case", complex_quartic), binding("R", 3), binding("I", 2), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
                        uses([
                          proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
                          proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
                          proof(goal(between(0, 5, 3)), by(builtin(between, 3))),
                          proof(goal(between(0, 2, 2)), by(builtin(between, 3)))
                        ])
                      ),
                      proof(
                        goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [3, 2], [0, 0])), by(rule("polynomial.pl", clause(21))),
                        bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [3, 2]), binding("Value", [0, 0])]),
                        uses([
                          proof(
                            goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [3, 2], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                            bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [3, 2]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [3, 2]), binding("Next", [-6, -3])]),
                            uses([
                              proof(
                                goal(c_mul([1, 0], [3, 2], [3, 2])), by(rule("polynomial.pl", clause(20))),
                                bindings([binding("A", 1), binding("B", 0), binding("C", 3), binding("D", 2), binding("E", 3), binding("F", 2), binding("AC", 3), binding("BD", 0), binding("AD", 2), binding("BC", 0)]),
                                uses([
                                  proof(goal(mul(1, 3, 3)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                                  proof(goal(sub(3, 0, 3)), by(builtin(sub, 3))),
                                  proof(goal(mul(1, 2, 2)), by(builtin(mul, 3))),
                                  proof(goal(mul(0, 3, 0)), by(builtin(mul, 3))),
                                  proof(goal(add(2, 0, 2)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(c_add([3, 2], [-9, -5], [-6, -3])), by(rule("polynomial.pl", clause(17))),
                                bindings([binding("A", 3), binding("B", 2), binding("C", -9), binding("D", -5), binding("E", -6), binding("F", -3)]),
                                uses([
                                  proof(goal(add(3, -9, -6)), by(builtin(add, 3))),
                                  proof(goal(add(2, -5, -3)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(
                                goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [3, 2], [-6, -3], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [3, 2]), binding("Acc", [-6, -3]), binding("Value", [0, 0]), binding("Product", [-12, -21]), binding("Next", [2, 12])]),
                                uses([
                                  proof(
                                    goal(c_mul([-6, -3], [3, 2], [-12, -21])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", -6), binding("B", -3), binding("C", 3), binding("D", 2), binding("E", -12), binding("F", -21), binding("AC", -18), binding("BD", -6), binding("AD", -12), binding("BC", -9)]),
                                    uses([
                                      proof(goal(mul(-6, 3, -18)), by(builtin(mul, 3))),
                                      proof(goal(mul(-3, 2, -6)), by(builtin(mul, 3))),
                                      proof(goal(sub(-18, -6, -12)), by(builtin(sub, 3))),
                                      proof(goal(mul(-6, 2, -12)), by(builtin(mul, 3))),
                                      proof(goal(mul(-3, 3, -9)), by(builtin(mul, 3))),
                                      proof(goal(add(-12, -9, -21)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([-12, -21], [14, 33], [2, 12])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", -12), binding("B", -21), binding("C", 14), binding("D", 33), binding("E", 2), binding("F", 12)]),
                                    uses([
                                      proof(goal(add(-12, 14, 2)), by(builtin(add, 3))),
                                      proof(goal(add(-21, 33, 12)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([[24, -44], [-26, 0]], [3, 2], [2, 12], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                    bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [3, 2]), binding("Acc", [2, 12]), binding("Value", [0, 0]), binding("Product", [-18, 40]), binding("Next", [6, -4])]),
                                    uses([
                                      proof(
                                        goal(c_mul([2, 12], [3, 2], [-18, 40])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", 2), binding("B", 12), binding("C", 3), binding("D", 2), binding("E", -18), binding("F", 40), binding("AC", 6), binding("BD", 24), binding("AD", 4), binding("BC", 36)]),
                                        uses([
                                          proof(goal(mul(2, 3, 6)), by(builtin(mul, 3))),
                                          proof(goal(mul(12, 2, 24)), by(builtin(mul, 3))),
                                          proof(goal(sub(6, 24, -18)), by(builtin(sub, 3))),
                                          proof(goal(mul(2, 2, 4)), by(builtin(mul, 3))),
                                          proof(goal(mul(12, 3, 36)), by(builtin(mul, 3))),
                                          proof(goal(add(4, 36, 40)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(c_add([-18, 40], [24, -44], [6, -4])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -18), binding("B", 40), binding("C", 24), binding("D", -44), binding("E", 6), binding("F", -4)]),
                                        uses([
                                          proof(goal(add(-18, 24, 6)), by(builtin(add, 3))),
                                          proof(goal(add(40, -44, -4)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_eval_acc([[-26, 0]], [3, 2], [6, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                        bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [3, 2]), binding("Acc", [6, -4]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                                        uses([
                                          proof(
                                            goal(c_mul([6, -4], [3, 2], [26, 0])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", 6), binding("B", -4), binding("C", 3), binding("D", 2), binding("E", 26), binding("F", 0), binding("AC", 18), binding("BD", -8), binding("AD", 12), binding("BC", -12)]),
                                            uses([
                                              proof(goal(mul(6, 3, 18)), by(builtin(mul, 3))),
                                              proof(goal(mul(-4, 2, -8)), by(builtin(mul, 3))),
                                              proof(goal(sub(18, -8, 26)), by(builtin(sub, 3))),
                                              proof(goal(mul(6, 2, 12)), by(builtin(mul, 3))),
                                              proof(goal(mul(-4, 3, -12)), by(builtin(mul, 3))),
                                              proof(goal(add(12, -12, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                            uses([
                                              proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                                              proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_eval_acc([], [3, 2], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                            bindings([binding("_X", [3, 2]), binding("Acc", [0, 0])])
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
                      proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
                    ])
                  ),
                  proof(
                    goal(all_roots_verify(complex_quartic, [[5, 1]])), by(rule("polynomial.pl", clause(39))),
                    bindings([binding("Case", complex_quartic), binding("Root", [5, 1]), binding("Rest", [])]),
                    uses([
                      proof(
                        goal(root(complex_quartic, [5, 1])), by(rule("polynomial.pl", clause(25))),
                        bindings([binding("Case", complex_quartic), binding("Root", [5, 1]), binding("Coeffs", [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("Value", [0, 0])]),
                        uses([
                          proof(goal(polynomial(complex_quartic, [[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]])), by(fact("polynomial.pl", clause(9)))),
                          proof(
                            goal(candidate(complex_quartic, [5, 1])), by(rule("polynomial.pl", clause(24))),
                            bindings([binding("Case", complex_quartic), binding("R", 5), binding("I", 1), binding("R0", 0), binding("R1", 5), binding("I0", 0), binding("I1", 2)]),
                            uses([
                              proof(goal(real_domain(complex_quartic, 0, 5)), by(fact("polynomial.pl", clause(12)))),
                              proof(goal(imag_domain(complex_quartic, 0, 2)), by(fact("polynomial.pl", clause(13)))),
                              proof(goal(between(0, 5, 5)), by(builtin(between, 3))),
                              proof(goal(between(0, 2, 1)), by(builtin(between, 3)))
                            ])
                          ),
                          proof(
                            goal(poly_eval([[1, 0], [-9, -5], [14, 33], [24, -44], [-26, 0]], [5, 1], [0, 0])), by(rule("polynomial.pl", clause(21))),
                            bindings([binding("Coeff", [1, 0]), binding("Rest", [[-9, -5], [14, 33], [24, -44], [-26, 0]]), binding("X", [5, 1]), binding("Value", [0, 0])]),
                            uses([
                              proof(
                                goal(poly_eval_acc([[-9, -5], [14, 33], [24, -44], [-26, 0]], [5, 1], [1, 0], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                bindings([binding("Coeff", [-9, -5]), binding("Rest", [[14, 33], [24, -44], [-26, 0]]), binding("X", [5, 1]), binding("Acc", [1, 0]), binding("Value", [0, 0]), binding("Product", [5, 1]), binding("Next", [-4, -4])]),
                                uses([
                                  proof(
                                    goal(c_mul([1, 0], [5, 1], [5, 1])), by(rule("polynomial.pl", clause(20))),
                                    bindings([binding("A", 1), binding("B", 0), binding("C", 5), binding("D", 1), binding("E", 5), binding("F", 1), binding("AC", 5), binding("BD", 0), binding("AD", 1), binding("BC", 0)]),
                                    uses([
                                      proof(goal(mul(1, 5, 5)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 1, 0)), by(builtin(mul, 3))),
                                      proof(goal(sub(5, 0, 5)), by(builtin(sub, 3))),
                                      proof(goal(mul(1, 1, 1)), by(builtin(mul, 3))),
                                      proof(goal(mul(0, 5, 0)), by(builtin(mul, 3))),
                                      proof(goal(add(1, 0, 1)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(c_add([5, 1], [-9, -5], [-4, -4])), by(rule("polynomial.pl", clause(17))),
                                    bindings([binding("A", 5), binding("B", 1), binding("C", -9), binding("D", -5), binding("E", -4), binding("F", -4)]),
                                    uses([
                                      proof(goal(add(5, -9, -4)), by(builtin(add, 3))),
                                      proof(goal(add(1, -5, -4)), by(builtin(add, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(poly_eval_acc([[14, 33], [24, -44], [-26, 0]], [5, 1], [-4, -4], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                    bindings([binding("Coeff", [14, 33]), binding("Rest", [[24, -44], [-26, 0]]), binding("X", [5, 1]), binding("Acc", [-4, -4]), binding("Value", [0, 0]), binding("Product", [-16, -24]), binding("Next", [-2, 9])]),
                                    uses([
                                      proof(
                                        goal(c_mul([-4, -4], [5, 1], [-16, -24])), by(rule("polynomial.pl", clause(20))),
                                        bindings([binding("A", -4), binding("B", -4), binding("C", 5), binding("D", 1), binding("E", -16), binding("F", -24), binding("AC", -20), binding("BD", -4), binding("AD", -4), binding("BC", -20)]),
                                        uses([
                                          proof(goal(mul(-4, 5, -20)), by(builtin(mul, 3))),
                                          proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                                          proof(goal(sub(-20, -4, -16)), by(builtin(sub, 3))),
                                          proof(goal(mul(-4, 1, -4)), by(builtin(mul, 3))),
                                          proof(goal(mul(-4, 5, -20)), by(builtin(mul, 3))),
                                          proof(goal(add(-4, -20, -24)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(c_add([-16, -24], [14, 33], [-2, 9])), by(rule("polynomial.pl", clause(17))),
                                        bindings([binding("A", -16), binding("B", -24), binding("C", 14), binding("D", 33), binding("E", -2), binding("F", 9)]),
                                        uses([
                                          proof(goal(add(-16, 14, -2)), by(builtin(add, 3))),
                                          proof(goal(add(-24, 33, 9)), by(builtin(add, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(poly_eval_acc([[24, -44], [-26, 0]], [5, 1], [-2, 9], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                        bindings([binding("Coeff", [24, -44]), binding("Rest", [[-26, 0]]), binding("X", [5, 1]), binding("Acc", [-2, 9]), binding("Value", [0, 0]), binding("Product", [-19, 43]), binding("Next", [5, -1])]),
                                        uses([
                                          proof(
                                            goal(c_mul([-2, 9], [5, 1], [-19, 43])), by(rule("polynomial.pl", clause(20))),
                                            bindings([binding("A", -2), binding("B", 9), binding("C", 5), binding("D", 1), binding("E", -19), binding("F", 43), binding("AC", -10), binding("BD", 9), binding("AD", -2), binding("BC", 45)]),
                                            uses([
                                              proof(goal(mul(-2, 5, -10)), by(builtin(mul, 3))),
                                              proof(goal(mul(9, 1, 9)), by(builtin(mul, 3))),
                                              proof(goal(sub(-10, 9, -19)), by(builtin(sub, 3))),
                                              proof(goal(mul(-2, 1, -2)), by(builtin(mul, 3))),
                                              proof(goal(mul(9, 5, 45)), by(builtin(mul, 3))),
                                              proof(goal(add(-2, 45, 43)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(c_add([-19, 43], [24, -44], [5, -1])), by(rule("polynomial.pl", clause(17))),
                                            bindings([binding("A", -19), binding("B", 43), binding("C", 24), binding("D", -44), binding("E", 5), binding("F", -1)]),
                                            uses([
                                              proof(goal(add(-19, 24, 5)), by(builtin(add, 3))),
                                              proof(goal(add(43, -44, -1)), by(builtin(add, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(poly_eval_acc([[-26, 0]], [5, 1], [5, -1], [0, 0])), by(rule("polynomial.pl", clause(23))),
                                            bindings([binding("Coeff", [-26, 0]), binding("Rest", []), binding("X", [5, 1]), binding("Acc", [5, -1]), binding("Value", [0, 0]), binding("Product", [26, 0]), binding("Next", [0, 0])]),
                                            uses([
                                              proof(
                                                goal(c_mul([5, -1], [5, 1], [26, 0])), by(rule("polynomial.pl", clause(20))),
                                                bindings([binding("A", 5), binding("B", -1), binding("C", 5), binding("D", 1), binding("E", 26), binding("F", 0), binding("AC", 25), binding("BD", -1), binding("AD", 5), binding("BC", -5)]),
                                                uses([
                                                  proof(goal(mul(5, 5, 25)), by(builtin(mul, 3))),
                                                  proof(goal(mul(-1, 1, -1)), by(builtin(mul, 3))),
                                                  proof(goal(sub(25, -1, 26)), by(builtin(sub, 3))),
                                                  proof(goal(mul(5, 1, 5)), by(builtin(mul, 3))),
                                                  proof(goal(mul(-1, 5, -5)), by(builtin(mul, 3))),
                                                  proof(goal(add(5, -5, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(c_add([26, 0], [-26, 0], [0, 0])), by(rule("polynomial.pl", clause(17))),
                                                bindings([binding("A", 26), binding("B", 0), binding("C", -26), binding("D", 0), binding("E", 0), binding("F", 0)]),
                                                uses([
                                                  proof(goal(add(26, -26, 0)), by(builtin(add, 3))),
                                                  proof(goal(add(0, 0, 0)), by(builtin(add, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(poly_eval_acc([], [5, 1], [0, 0], [0, 0])), by(fact("polynomial.pl", clause(22))),
                                                bindings([binding("_X", [5, 1]), binding("Acc", [0, 0])])
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
                          proof(goal(c_zero([0, 0])), by(fact("polynomial.pl", clause(16))))
                        ])
                      ),
                      proof(
                        goal(all_roots_verify(complex_quartic, [])), by(fact("polynomial.pl", clause(38))),
                        bindings([binding("_Case", complex_quartic)])
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
).

