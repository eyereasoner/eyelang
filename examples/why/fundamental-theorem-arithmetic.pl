product(case, 202692987).
why(
  product(case, 202692987),
  proof(
    goal(product(case, 202692987)), by(rule("fundamental-theorem-arithmetic.pl", clause(29))),
    bindings([binding("Product", 202692987), binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881])]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10)))),
      proof(
        goal(factor_smallest(202692987, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
        bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881]), binding("D", 3), binding("Q", 67564329), binding("Left", [3]), binding("Right", [3, 7, 829, 3881])]),
        uses([
          proof(goal(ge(202692987, 2)), by(builtin(ge, 2))),
          proof(goal(smallest_divisor_from(202692987, 2, 3)), by(builtin(smallest_divisor_from, 3))),
          proof(goal(neq(3, 202692987)), by(builtin(neq, 2))),
          proof(goal(div(202692987, 3, 67564329)), by(builtin(div, 3))),
          proof(
            goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
            bindings([binding("N", 3)]),
            uses([
              proof(goal(ge(3, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
            ])
          ),
          proof(
            goal(factor_smallest(67564329, [3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
            bindings([binding("N", 67564329), binding("Factors", [3, 7, 829, 3881]), binding("D", 3), binding("Q", 22521443), binding("Left", [3]), binding("Right", [7, 829, 3881])]),
            uses([
              proof(goal(ge(67564329, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(67564329, 2, 3)), by(builtin(smallest_divisor_from, 3))),
              proof(goal(neq(3, 67564329)), by(builtin(neq, 2))),
              proof(goal(div(67564329, 3, 22521443)), by(builtin(div, 3))),
              proof(
                goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                bindings([binding("N", 3)]),
                uses([
                  proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                ])
              ),
              proof(
                goal(factor_smallest(22521443, [7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                bindings([binding("N", 22521443), binding("Factors", [7, 829, 3881]), binding("D", 7), binding("Q", 3217349), binding("Left", [7]), binding("Right", [829, 3881])]),
                uses([
                  proof(goal(ge(22521443, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(22521443, 2, 7)), by(builtin(smallest_divisor_from, 3))),
                  proof(goal(neq(7, 22521443)), by(builtin(neq, 2))),
                  proof(goal(div(22521443, 7, 3217349)), by(builtin(div, 3))),
                  proof(
                    goal(factor_smallest(7, [7])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                    bindings([binding("N", 7)]),
                    uses([
                      proof(goal(ge(7, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
                    ])
                  ),
                  proof(
                    goal(factor_smallest(3217349, [829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                    bindings([binding("N", 3217349), binding("Factors", [829, 3881]), binding("D", 829), binding("Q", 3881), binding("Left", [829]), binding("Right", [3881])]),
                    uses([
                      proof(goal(ge(3217349, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(3217349, 2, 829)), by(builtin(smallest_divisor_from, 3))),
                      proof(goal(neq(829, 3217349)), by(builtin(neq, 2))),
                      proof(goal(div(3217349, 829, 3881)), by(builtin(div, 3))),
                      proof(
                        goal(factor_smallest(829, [829])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 829)]),
                        uses([
                          proof(goal(ge(829, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(
                        goal(factor_smallest(3881, [3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 3881)]),
                        uses([
                          proof(goal(ge(3881, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(goal(append([829], [3881], [829, 3881])), by(builtin(append, 3)))
                    ])
                  ),
                  proof(goal(append([7], [829, 3881], [7, 829, 3881])), by(builtin(append, 3)))
                ])
              ),
              proof(goal(append([3], [7, 829, 3881], [3, 7, 829, 3881])), by(builtin(append, 3)))
            ])
          ),
          proof(goal(append([3], [3, 7, 829, 3881], [3, 3, 7, 829, 3881])), by(builtin(append, 3)))
        ])
      ),
      proof(
        goal(product([3, 3, 7, 829, 3881], 202692987)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
        bindings([binding("X", 3), binding("Rest", [3, 7, 829, 3881]), binding("P", 202692987), binding("P0", 67564329)]),
        uses([
          proof(
            goal(product([3, 7, 829, 3881], 67564329)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
            bindings([binding("X", 3), binding("Rest", [7, 829, 3881]), binding("P", 67564329), binding("P0", 22521443)]),
            uses([
              proof(
                goal(product([7, 829, 3881], 22521443)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
                bindings([binding("X", 7), binding("Rest", [829, 3881]), binding("P", 22521443), binding("P0", 3217349)]),
                uses([
                  proof(
                    goal(product([829, 3881], 3217349)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
                    bindings([binding("X", 829), binding("Rest", [3881]), binding("P", 3217349), binding("P0", 3881)]),
                    uses([
                      proof(
                        goal(product([3881], 3881)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
                        bindings([binding("X", 3881), binding("Rest", []), binding("P", 3881), binding("P0", 1)]),
                        uses([
                          proof(goal(product([], 1)), by(fact("fundamental-theorem-arithmetic.pl", clause(23)))),
                          proof(goal(mul(3881, 1, 3881)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(mul(829, 3881, 3217349)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(mul(7, 3217349, 22521443)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(mul(3, 22521443, 67564329)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(mul(3, 67564329, 202692987)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

n(case, 202692987).
why(
  n(case, 202692987),
  proof(
    goal(n(case, 202692987)), by(rule("fundamental-theorem-arithmetic.pl", clause(26))),
    bindings([binding("N", 202692987)]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10))))
    ])
  )
).

factorsSmallest(case, [3, 3, 7, 829, 3881]).
why(
  factorsSmallest(case, [3, 3, 7, 829, 3881]),
  proof(
    goal(factorsSmallest(case, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(27))),
    bindings([binding("Factors", [3, 3, 7, 829, 3881]), binding("N", 202692987)]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10)))),
      proof(
        goal(factor_smallest(202692987, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
        bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881]), binding("D", 3), binding("Q", 67564329), binding("Left", [3]), binding("Right", [3, 7, 829, 3881])]),
        uses([
          proof(goal(ge(202692987, 2)), by(builtin(ge, 2))),
          proof(goal(smallest_divisor_from(202692987, 2, 3)), by(builtin(smallest_divisor_from, 3))),
          proof(goal(neq(3, 202692987)), by(builtin(neq, 2))),
          proof(goal(div(202692987, 3, 67564329)), by(builtin(div, 3))),
          proof(
            goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
            bindings([binding("N", 3)]),
            uses([
              proof(goal(ge(3, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
            ])
          ),
          proof(
            goal(factor_smallest(67564329, [3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
            bindings([binding("N", 67564329), binding("Factors", [3, 7, 829, 3881]), binding("D", 3), binding("Q", 22521443), binding("Left", [3]), binding("Right", [7, 829, 3881])]),
            uses([
              proof(goal(ge(67564329, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(67564329, 2, 3)), by(builtin(smallest_divisor_from, 3))),
              proof(goal(neq(3, 67564329)), by(builtin(neq, 2))),
              proof(goal(div(67564329, 3, 22521443)), by(builtin(div, 3))),
              proof(
                goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                bindings([binding("N", 3)]),
                uses([
                  proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                ])
              ),
              proof(
                goal(factor_smallest(22521443, [7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                bindings([binding("N", 22521443), binding("Factors", [7, 829, 3881]), binding("D", 7), binding("Q", 3217349), binding("Left", [7]), binding("Right", [829, 3881])]),
                uses([
                  proof(goal(ge(22521443, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(22521443, 2, 7)), by(builtin(smallest_divisor_from, 3))),
                  proof(goal(neq(7, 22521443)), by(builtin(neq, 2))),
                  proof(goal(div(22521443, 7, 3217349)), by(builtin(div, 3))),
                  proof(
                    goal(factor_smallest(7, [7])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                    bindings([binding("N", 7)]),
                    uses([
                      proof(goal(ge(7, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
                    ])
                  ),
                  proof(
                    goal(factor_smallest(3217349, [829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                    bindings([binding("N", 3217349), binding("Factors", [829, 3881]), binding("D", 829), binding("Q", 3881), binding("Left", [829]), binding("Right", [3881])]),
                    uses([
                      proof(goal(ge(3217349, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(3217349, 2, 829)), by(builtin(smallest_divisor_from, 3))),
                      proof(goal(neq(829, 3217349)), by(builtin(neq, 2))),
                      proof(goal(div(3217349, 829, 3881)), by(builtin(div, 3))),
                      proof(
                        goal(factor_smallest(829, [829])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 829)]),
                        uses([
                          proof(goal(ge(829, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(
                        goal(factor_smallest(3881, [3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 3881)]),
                        uses([
                          proof(goal(ge(3881, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(goal(append([829], [3881], [829, 3881])), by(builtin(append, 3)))
                    ])
                  ),
                  proof(goal(append([7], [829, 3881], [7, 829, 3881])), by(builtin(append, 3)))
                ])
              ),
              proof(goal(append([3], [7, 829, 3881], [3, 7, 829, 3881])), by(builtin(append, 3)))
            ])
          ),
          proof(goal(append([3], [3, 7, 829, 3881], [3, 3, 7, 829, 3881])), by(builtin(append, 3)))
        ])
      )
    ])
  )
).

factorsLargest(case, [3881, 829, 7, 3, 3]).
why(
  factorsLargest(case, [3881, 829, 7, 3, 3]),
  proof(
    goal(factorsLargest(case, [3881, 829, 7, 3, 3])), by(rule("fundamental-theorem-arithmetic.pl", clause(28))),
    bindings([binding("Factors", [3881, 829, 7, 3, 3]), binding("N", 202692987)]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10)))),
      proof(
        goal(factor_largest(202692987, [3881, 829, 7, 3, 3])), by(rule("fundamental-theorem-arithmetic.pl", clause(22))),
        bindings([binding("N", 202692987), binding("Factors", [3881, 829, 7, 3, 3]), binding("Smallest", [3, 3, 7, 829, 3881])]),
        uses([
          proof(
            goal(factor_smallest(202692987, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
            bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881]), binding("D", 3), binding("Q", 67564329), binding("Left", [3]), binding("Right", [3, 7, 829, 3881])]),
            uses([
              proof(goal(ge(202692987, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(202692987, 2, 3)), by(builtin(smallest_divisor_from, 3))),
              proof(goal(neq(3, 202692987)), by(builtin(neq, 2))),
              proof(goal(div(202692987, 3, 67564329)), by(builtin(div, 3))),
              proof(
                goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                bindings([binding("N", 3)]),
                uses([
                  proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                ])
              ),
              proof(
                goal(factor_smallest(67564329, [3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                bindings([binding("N", 67564329), binding("Factors", [3, 7, 829, 3881]), binding("D", 3), binding("Q", 22521443), binding("Left", [3]), binding("Right", [7, 829, 3881])]),
                uses([
                  proof(goal(ge(67564329, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(67564329, 2, 3)), by(builtin(smallest_divisor_from, 3))),
                  proof(goal(neq(3, 67564329)), by(builtin(neq, 2))),
                  proof(goal(div(67564329, 3, 22521443)), by(builtin(div, 3))),
                  proof(
                    goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                    bindings([binding("N", 3)]),
                    uses([
                      proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                    ])
                  ),
                  proof(
                    goal(factor_smallest(22521443, [7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                    bindings([binding("N", 22521443), binding("Factors", [7, 829, 3881]), binding("D", 7), binding("Q", 3217349), binding("Left", [7]), binding("Right", [829, 3881])]),
                    uses([
                      proof(goal(ge(22521443, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(22521443, 2, 7)), by(builtin(smallest_divisor_from, 3))),
                      proof(goal(neq(7, 22521443)), by(builtin(neq, 2))),
                      proof(goal(div(22521443, 7, 3217349)), by(builtin(div, 3))),
                      proof(
                        goal(factor_smallest(7, [7])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 7)]),
                        uses([
                          proof(goal(ge(7, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(
                        goal(factor_smallest(3217349, [829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                        bindings([binding("N", 3217349), binding("Factors", [829, 3881]), binding("D", 829), binding("Q", 3881), binding("Left", [829]), binding("Right", [3881])]),
                        uses([
                          proof(goal(ge(3217349, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(3217349, 2, 829)), by(builtin(smallest_divisor_from, 3))),
                          proof(goal(neq(829, 3217349)), by(builtin(neq, 2))),
                          proof(goal(div(3217349, 829, 3881)), by(builtin(div, 3))),
                          proof(
                            goal(factor_smallest(829, [829])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                            bindings([binding("N", 829)]),
                            uses([
                              proof(goal(ge(829, 2)), by(builtin(ge, 2))),
                              proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
                            ])
                          ),
                          proof(
                            goal(factor_smallest(3881, [3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                            bindings([binding("N", 3881)]),
                            uses([
                              proof(goal(ge(3881, 2)), by(builtin(ge, 2))),
                              proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
                            ])
                          ),
                          proof(goal(append([829], [3881], [829, 3881])), by(builtin(append, 3)))
                        ])
                      ),
                      proof(goal(append([7], [829, 3881], [7, 829, 3881])), by(builtin(append, 3)))
                    ])
                  ),
                  proof(goal(append([3], [7, 829, 3881], [3, 7, 829, 3881])), by(builtin(append, 3)))
                ])
              ),
              proof(goal(append([3], [3, 7, 829, 3881], [3, 3, 7, 829, 3881])), by(builtin(append, 3)))
            ])
          ),
          proof(goal(reverse([3, 3, 7, 829, 3881], [3881, 829, 7, 3, 3])), by(builtin(reverse, 2)))
        ])
      )
    ])
  )
).

expectedFactorsMatched(case, true).
why(
  expectedFactorsMatched(case, true),
  proof(
    goal(expectedFactorsMatched(case, true)), by(rule("fundamental-theorem-arithmetic.pl", clause(30))),
    bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881])]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10)))),
      proof(goal(expected_factors(fta, [3, 3, 7, 829, 3881])), by(fact("fundamental-theorem-arithmetic.pl", clause(11)))),
      proof(
        goal(factor_smallest(202692987, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
        bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881]), binding("D", 3), binding("Q", 67564329), binding("Left", [3]), binding("Right", [3, 7, 829, 3881])]),
        uses([
          proof(goal(ge(202692987, 2)), by(builtin(ge, 2))),
          proof(goal(smallest_divisor_from(202692987, 2, 3)), by(builtin(smallest_divisor_from, 3))),
          proof(goal(neq(3, 202692987)), by(builtin(neq, 2))),
          proof(goal(div(202692987, 3, 67564329)), by(builtin(div, 3))),
          proof(
            goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
            bindings([binding("N", 3)]),
            uses([
              proof(goal(ge(3, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
            ])
          ),
          proof(
            goal(factor_smallest(67564329, [3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
            bindings([binding("N", 67564329), binding("Factors", [3, 7, 829, 3881]), binding("D", 3), binding("Q", 22521443), binding("Left", [3]), binding("Right", [7, 829, 3881])]),
            uses([
              proof(goal(ge(67564329, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(67564329, 2, 3)), by(builtin(smallest_divisor_from, 3))),
              proof(goal(neq(3, 67564329)), by(builtin(neq, 2))),
              proof(goal(div(67564329, 3, 22521443)), by(builtin(div, 3))),
              proof(
                goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                bindings([binding("N", 3)]),
                uses([
                  proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                ])
              ),
              proof(
                goal(factor_smallest(22521443, [7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                bindings([binding("N", 22521443), binding("Factors", [7, 829, 3881]), binding("D", 7), binding("Q", 3217349), binding("Left", [7]), binding("Right", [829, 3881])]),
                uses([
                  proof(goal(ge(22521443, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(22521443, 2, 7)), by(builtin(smallest_divisor_from, 3))),
                  proof(goal(neq(7, 22521443)), by(builtin(neq, 2))),
                  proof(goal(div(22521443, 7, 3217349)), by(builtin(div, 3))),
                  proof(
                    goal(factor_smallest(7, [7])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                    bindings([binding("N", 7)]),
                    uses([
                      proof(goal(ge(7, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
                    ])
                  ),
                  proof(
                    goal(factor_smallest(3217349, [829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                    bindings([binding("N", 3217349), binding("Factors", [829, 3881]), binding("D", 829), binding("Q", 3881), binding("Left", [829]), binding("Right", [3881])]),
                    uses([
                      proof(goal(ge(3217349, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(3217349, 2, 829)), by(builtin(smallest_divisor_from, 3))),
                      proof(goal(neq(829, 3217349)), by(builtin(neq, 2))),
                      proof(goal(div(3217349, 829, 3881)), by(builtin(div, 3))),
                      proof(
                        goal(factor_smallest(829, [829])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 829)]),
                        uses([
                          proof(goal(ge(829, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(
                        goal(factor_smallest(3881, [3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 3881)]),
                        uses([
                          proof(goal(ge(3881, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(goal(append([829], [3881], [829, 3881])), by(builtin(append, 3)))
                    ])
                  ),
                  proof(goal(append([7], [829, 3881], [7, 829, 3881])), by(builtin(append, 3)))
                ])
              ),
              proof(goal(append([3], [7, 829, 3881], [3, 7, 829, 3881])), by(builtin(append, 3)))
            ])
          ),
          proof(goal(append([3], [3, 7, 829, 3881], [3, 3, 7, 829, 3881])), by(builtin(append, 3)))
        ])
      )
    ])
  )
).

productReconstructsInput(case, true).
why(
  productReconstructsInput(case, true),
  proof(
    goal(productReconstructsInput(case, true)), by(rule("fundamental-theorem-arithmetic.pl", clause(31))),
    bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881])]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10)))),
      proof(
        goal(factor_smallest(202692987, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
        bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881]), binding("D", 3), binding("Q", 67564329), binding("Left", [3]), binding("Right", [3, 7, 829, 3881])]),
        uses([
          proof(goal(ge(202692987, 2)), by(builtin(ge, 2))),
          proof(goal(smallest_divisor_from(202692987, 2, 3)), by(builtin(smallest_divisor_from, 3))),
          proof(goal(neq(3, 202692987)), by(builtin(neq, 2))),
          proof(goal(div(202692987, 3, 67564329)), by(builtin(div, 3))),
          proof(
            goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
            bindings([binding("N", 3)]),
            uses([
              proof(goal(ge(3, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
            ])
          ),
          proof(
            goal(factor_smallest(67564329, [3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
            bindings([binding("N", 67564329), binding("Factors", [3, 7, 829, 3881]), binding("D", 3), binding("Q", 22521443), binding("Left", [3]), binding("Right", [7, 829, 3881])]),
            uses([
              proof(goal(ge(67564329, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(67564329, 2, 3)), by(builtin(smallest_divisor_from, 3))),
              proof(goal(neq(3, 67564329)), by(builtin(neq, 2))),
              proof(goal(div(67564329, 3, 22521443)), by(builtin(div, 3))),
              proof(
                goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                bindings([binding("N", 3)]),
                uses([
                  proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                ])
              ),
              proof(
                goal(factor_smallest(22521443, [7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                bindings([binding("N", 22521443), binding("Factors", [7, 829, 3881]), binding("D", 7), binding("Q", 3217349), binding("Left", [7]), binding("Right", [829, 3881])]),
                uses([
                  proof(goal(ge(22521443, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(22521443, 2, 7)), by(builtin(smallest_divisor_from, 3))),
                  proof(goal(neq(7, 22521443)), by(builtin(neq, 2))),
                  proof(goal(div(22521443, 7, 3217349)), by(builtin(div, 3))),
                  proof(
                    goal(factor_smallest(7, [7])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                    bindings([binding("N", 7)]),
                    uses([
                      proof(goal(ge(7, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
                    ])
                  ),
                  proof(
                    goal(factor_smallest(3217349, [829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                    bindings([binding("N", 3217349), binding("Factors", [829, 3881]), binding("D", 829), binding("Q", 3881), binding("Left", [829]), binding("Right", [3881])]),
                    uses([
                      proof(goal(ge(3217349, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(3217349, 2, 829)), by(builtin(smallest_divisor_from, 3))),
                      proof(goal(neq(829, 3217349)), by(builtin(neq, 2))),
                      proof(goal(div(3217349, 829, 3881)), by(builtin(div, 3))),
                      proof(
                        goal(factor_smallest(829, [829])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 829)]),
                        uses([
                          proof(goal(ge(829, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(
                        goal(factor_smallest(3881, [3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 3881)]),
                        uses([
                          proof(goal(ge(3881, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(goal(append([829], [3881], [829, 3881])), by(builtin(append, 3)))
                    ])
                  ),
                  proof(goal(append([7], [829, 3881], [7, 829, 3881])), by(builtin(append, 3)))
                ])
              ),
              proof(goal(append([3], [7, 829, 3881], [3, 7, 829, 3881])), by(builtin(append, 3)))
            ])
          ),
          proof(goal(append([3], [3, 7, 829, 3881], [3, 3, 7, 829, 3881])), by(builtin(append, 3)))
        ])
      ),
      proof(
        goal(product([3, 3, 7, 829, 3881], 202692987)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
        bindings([binding("X", 3), binding("Rest", [3, 7, 829, 3881]), binding("P", 202692987), binding("P0", 67564329)]),
        uses([
          proof(
            goal(product([3, 7, 829, 3881], 67564329)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
            bindings([binding("X", 3), binding("Rest", [7, 829, 3881]), binding("P", 67564329), binding("P0", 22521443)]),
            uses([
              proof(
                goal(product([7, 829, 3881], 22521443)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
                bindings([binding("X", 7), binding("Rest", [829, 3881]), binding("P", 22521443), binding("P0", 3217349)]),
                uses([
                  proof(
                    goal(product([829, 3881], 3217349)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
                    bindings([binding("X", 829), binding("Rest", [3881]), binding("P", 3217349), binding("P0", 3881)]),
                    uses([
                      proof(
                        goal(product([3881], 3881)), by(rule("fundamental-theorem-arithmetic.pl", clause(24))),
                        bindings([binding("X", 3881), binding("Rest", []), binding("P", 3881), binding("P0", 1)]),
                        uses([
                          proof(goal(product([], 1)), by(fact("fundamental-theorem-arithmetic.pl", clause(23)))),
                          proof(goal(mul(3881, 1, 3881)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(mul(829, 3881, 3217349)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(mul(7, 3217349, 22521443)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(mul(3, 22521443, 67564329)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(mul(3, 67564329, 202692987)), by(builtin(mul, 3)))
        ])
      )
    ])
  )
).

distinctPrimeCount(case, 4).
why(
  distinctPrimeCount(case, 4),
  proof(
    goal(distinctPrimeCount(case, 4)), by(rule("fundamental-theorem-arithmetic.pl", clause(32))),
    uses([
      proof(
        goal(all_expected_primes(true)), by(rule("fundamental-theorem-arithmetic.pl", clause(25))),
        uses([
          proof(goal(trial_prime(3)), by(fact("fundamental-theorem-arithmetic.pl", clause(17)))),
          proof(
            goal(trial_prime(7)), by(rule("fundamental-theorem-arithmetic.pl", clause(18))),
            bindings([binding("P", 7)]),
            uses([
              proof(goal(gt(7, 3)), by(builtin(gt, 2))),
              proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
            ])
          ),
          proof(
            goal(trial_prime(829)), by(rule("fundamental-theorem-arithmetic.pl", clause(18))),
            bindings([binding("P", 829)]),
            uses([
              proof(goal(gt(829, 3)), by(builtin(gt, 2))),
              proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
            ])
          ),
          proof(
            goal(trial_prime(3881)), by(rule("fundamental-theorem-arithmetic.pl", clause(18))),
            bindings([binding("P", 3881)]),
            uses([
              proof(goal(gt(3881, 3)), by(builtin(gt, 2))),
              proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
            ])
          )
        ])
      )
    ])
  )
).

smallestPrimeFactor(case, 3).
why(
  smallestPrimeFactor(case, 3),
  proof(
    goal(smallestPrimeFactor(case, 3)), by(rule("fundamental-theorem-arithmetic.pl", clause(33))),
    bindings([binding("N", 202692987), binding("__anon0", [3, 7, 829, 3881])]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10)))),
      proof(
        goal(factor_smallest(202692987, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
        bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881]), binding("D", 3), binding("Q", 67564329), binding("Left", [3]), binding("Right", [3, 7, 829, 3881])]),
        uses([
          proof(goal(ge(202692987, 2)), by(builtin(ge, 2))),
          proof(goal(smallest_divisor_from(202692987, 2, 3)), by(builtin(smallest_divisor_from, 3))),
          proof(goal(neq(3, 202692987)), by(builtin(neq, 2))),
          proof(goal(div(202692987, 3, 67564329)), by(builtin(div, 3))),
          proof(
            goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
            bindings([binding("N", 3)]),
            uses([
              proof(goal(ge(3, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
            ])
          ),
          proof(
            goal(factor_smallest(67564329, [3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
            bindings([binding("N", 67564329), binding("Factors", [3, 7, 829, 3881]), binding("D", 3), binding("Q", 22521443), binding("Left", [3]), binding("Right", [7, 829, 3881])]),
            uses([
              proof(goal(ge(67564329, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(67564329, 2, 3)), by(builtin(smallest_divisor_from, 3))),
              proof(goal(neq(3, 67564329)), by(builtin(neq, 2))),
              proof(goal(div(67564329, 3, 22521443)), by(builtin(div, 3))),
              proof(
                goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                bindings([binding("N", 3)]),
                uses([
                  proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                ])
              ),
              proof(
                goal(factor_smallest(22521443, [7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                bindings([binding("N", 22521443), binding("Factors", [7, 829, 3881]), binding("D", 7), binding("Q", 3217349), binding("Left", [7]), binding("Right", [829, 3881])]),
                uses([
                  proof(goal(ge(22521443, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(22521443, 2, 7)), by(builtin(smallest_divisor_from, 3))),
                  proof(goal(neq(7, 22521443)), by(builtin(neq, 2))),
                  proof(goal(div(22521443, 7, 3217349)), by(builtin(div, 3))),
                  proof(
                    goal(factor_smallest(7, [7])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                    bindings([binding("N", 7)]),
                    uses([
                      proof(goal(ge(7, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
                    ])
                  ),
                  proof(
                    goal(factor_smallest(3217349, [829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                    bindings([binding("N", 3217349), binding("Factors", [829, 3881]), binding("D", 829), binding("Q", 3881), binding("Left", [829]), binding("Right", [3881])]),
                    uses([
                      proof(goal(ge(3217349, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(3217349, 2, 829)), by(builtin(smallest_divisor_from, 3))),
                      proof(goal(neq(829, 3217349)), by(builtin(neq, 2))),
                      proof(goal(div(3217349, 829, 3881)), by(builtin(div, 3))),
                      proof(
                        goal(factor_smallest(829, [829])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 829)]),
                        uses([
                          proof(goal(ge(829, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(
                        goal(factor_smallest(3881, [3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 3881)]),
                        uses([
                          proof(goal(ge(3881, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(goal(append([829], [3881], [829, 3881])), by(builtin(append, 3)))
                    ])
                  ),
                  proof(goal(append([7], [829, 3881], [7, 829, 3881])), by(builtin(append, 3)))
                ])
              ),
              proof(goal(append([3], [7, 829, 3881], [3, 7, 829, 3881])), by(builtin(append, 3)))
            ])
          ),
          proof(goal(append([3], [3, 7, 829, 3881], [3, 3, 7, 829, 3881])), by(builtin(append, 3)))
        ])
      )
    ])
  )
).

largestPrimeFactor(case, 3881).
why(
  largestPrimeFactor(case, 3881),
  proof(
    goal(largestPrimeFactor(case, 3881)), by(rule("fundamental-theorem-arithmetic.pl", clause(34))),
    bindings([binding("N", 202692987), binding("__anon1", [829, 7, 3, 3])]),
    uses([
      proof(goal(case(fta, 202692987)), by(fact("fundamental-theorem-arithmetic.pl", clause(10)))),
      proof(
        goal(factor_largest(202692987, [3881, 829, 7, 3, 3])), by(rule("fundamental-theorem-arithmetic.pl", clause(22))),
        bindings([binding("N", 202692987), binding("Factors", [3881, 829, 7, 3, 3]), binding("Smallest", [3, 3, 7, 829, 3881])]),
        uses([
          proof(
            goal(factor_smallest(202692987, [3, 3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
            bindings([binding("N", 202692987), binding("Factors", [3, 3, 7, 829, 3881]), binding("D", 3), binding("Q", 67564329), binding("Left", [3]), binding("Right", [3, 7, 829, 3881])]),
            uses([
              proof(goal(ge(202692987, 2)), by(builtin(ge, 2))),
              proof(goal(smallest_divisor_from(202692987, 2, 3)), by(builtin(smallest_divisor_from, 3))),
              proof(goal(neq(3, 202692987)), by(builtin(neq, 2))),
              proof(goal(div(202692987, 3, 67564329)), by(builtin(div, 3))),
              proof(
                goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                bindings([binding("N", 3)]),
                uses([
                  proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                ])
              ),
              proof(
                goal(factor_smallest(67564329, [3, 7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                bindings([binding("N", 67564329), binding("Factors", [3, 7, 829, 3881]), binding("D", 3), binding("Q", 22521443), binding("Left", [3]), binding("Right", [7, 829, 3881])]),
                uses([
                  proof(goal(ge(67564329, 2)), by(builtin(ge, 2))),
                  proof(goal(smallest_divisor_from(67564329, 2, 3)), by(builtin(smallest_divisor_from, 3))),
                  proof(goal(neq(3, 67564329)), by(builtin(neq, 2))),
                  proof(goal(div(67564329, 3, 22521443)), by(builtin(div, 3))),
                  proof(
                    goal(factor_smallest(3, [3])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                    bindings([binding("N", 3)]),
                    uses([
                      proof(goal(ge(3, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(3, 2, 3)), by(builtin(smallest_divisor_from, 3)))
                    ])
                  ),
                  proof(
                    goal(factor_smallest(22521443, [7, 829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                    bindings([binding("N", 22521443), binding("Factors", [7, 829, 3881]), binding("D", 7), binding("Q", 3217349), binding("Left", [7]), binding("Right", [829, 3881])]),
                    uses([
                      proof(goal(ge(22521443, 2)), by(builtin(ge, 2))),
                      proof(goal(smallest_divisor_from(22521443, 2, 7)), by(builtin(smallest_divisor_from, 3))),
                      proof(goal(neq(7, 22521443)), by(builtin(neq, 2))),
                      proof(goal(div(22521443, 7, 3217349)), by(builtin(div, 3))),
                      proof(
                        goal(factor_smallest(7, [7])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                        bindings([binding("N", 7)]),
                        uses([
                          proof(goal(ge(7, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(7, 2, 7)), by(builtin(smallest_divisor_from, 3)))
                        ])
                      ),
                      proof(
                        goal(factor_smallest(3217349, [829, 3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(21))),
                        bindings([binding("N", 3217349), binding("Factors", [829, 3881]), binding("D", 829), binding("Q", 3881), binding("Left", [829]), binding("Right", [3881])]),
                        uses([
                          proof(goal(ge(3217349, 2)), by(builtin(ge, 2))),
                          proof(goal(smallest_divisor_from(3217349, 2, 829)), by(builtin(smallest_divisor_from, 3))),
                          proof(goal(neq(829, 3217349)), by(builtin(neq, 2))),
                          proof(goal(div(3217349, 829, 3881)), by(builtin(div, 3))),
                          proof(
                            goal(factor_smallest(829, [829])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                            bindings([binding("N", 829)]),
                            uses([
                              proof(goal(ge(829, 2)), by(builtin(ge, 2))),
                              proof(goal(smallest_divisor_from(829, 2, 829)), by(builtin(smallest_divisor_from, 3)))
                            ])
                          ),
                          proof(
                            goal(factor_smallest(3881, [3881])), by(rule("fundamental-theorem-arithmetic.pl", clause(20))),
                            bindings([binding("N", 3881)]),
                            uses([
                              proof(goal(ge(3881, 2)), by(builtin(ge, 2))),
                              proof(goal(smallest_divisor_from(3881, 2, 3881)), by(builtin(smallest_divisor_from, 3)))
                            ])
                          ),
                          proof(goal(append([829], [3881], [829, 3881])), by(builtin(append, 3)))
                        ])
                      ),
                      proof(goal(append([7], [829, 3881], [7, 829, 3881])), by(builtin(append, 3)))
                    ])
                  ),
                  proof(goal(append([3], [7, 829, 3881], [3, 7, 829, 3881])), by(builtin(append, 3)))
                ])
              ),
              proof(goal(append([3], [3, 7, 829, 3881], [3, 3, 7, 829, 3881])), by(builtin(append, 3)))
            ])
          ),
          proof(goal(reverse([3, 3, 7, 829, 3881], [3881, 829, 7, 3, 3])), by(builtin(reverse, 2)))
        ])
      )
    ])
  )
).

