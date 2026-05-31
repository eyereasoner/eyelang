discriminant(eq1, 1.0).
why(
  discriminant(eq1, 1.0),
  proof(
    goal(discriminant(eq1, 1.0)),
    by(rule("quadratic-formula.pl", clause(5))),
    bindings([binding("Case", eq1), binding("D", 1.0), binding("A", 1.0), binding("B", -5.0), binding("C", 6.0), binding("B2", 25.0), binding("FourA", 4.0), binding("FourAC", 24.0)]),
    uses([
      proof(
        goal(equation(eq1, 1.0, -5.0, 6.0)),
        by(fact("quadratic-formula.pl", clause(3)))
      ),
      proof(
        goal(pow(-5.0, 2.0, 25.0)),
        by(builtin(pow, 3))
      ),
      proof(
        goal(mul(4.0, 1.0, 4.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(mul(4.0, 6.0, 24.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(sub(25.0, 24.0, 1.0)),
        by(builtin(sub, 3))
      )
    ])
  )
).

discriminant(eq2, 64.0).
why(
  discriminant(eq2, 64.0),
  proof(
    goal(discriminant(eq2, 64.0)),
    by(rule("quadratic-formula.pl", clause(5))),
    bindings([binding("Case", eq2), binding("D", 64.0), binding("A", 2.0), binding("B", -4.0), binding("C", -6.0), binding("B2", 16.0), binding("FourA", 8.0), binding("FourAC", -48.0)]),
    uses([
      proof(
        goal(equation(eq2, 2.0, -4.0, -6.0)),
        by(fact("quadratic-formula.pl", clause(4)))
      ),
      proof(
        goal(pow(-4.0, 2.0, 16.0)),
        by(builtin(pow, 3))
      ),
      proof(
        goal(mul(4.0, 2.0, 8.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(mul(8.0, -6.0, -48.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(sub(16.0, -48.0, 64.0)),
        by(builtin(sub, 3))
      )
    ])
  )
).

root(eq1, 3.0).
why(
  root(eq1, 3.0),
  proof(
    goal(root(eq1, 3.0)),
    by(rule("quadratic-formula.pl", clause(11))),
    bindings([binding("Case", eq1), binding("Root", 3.0)]),
    uses([
      proof(
        goal(root_plus(eq1, 3.0)),
        by(rule("quadratic-formula.pl", clause(9))),
        bindings([binding("Case", eq1), binding("Root", 3.0), binding("NB", 5.0), binding("S", 1.0), binding("Den", 2.0), binding("Numerator", 6.0)]),
        uses([
          proof(
            goal(negative_b(eq1, 5.0)),
            by(rule("quadratic-formula.pl", clause(7))),
            bindings([binding("Case", eq1), binding("NB", 5.0), binding("_A", 1.0), binding("B", -5.0), binding("_C", 6.0)]),
            uses([
              proof(
                goal(equation(eq1, 1.0, -5.0, 6.0)),
                by(fact("quadratic-formula.pl", clause(3)))
              ),
              proof(
                goal(neg(-5.0, 5.0)),
                by(builtin(neg, 2))
              )
            ])
          ),
          proof(
            goal(sqrt_discriminant(eq1, 1.0)),
            by(rule("quadratic-formula.pl", clause(6))),
            bindings([binding("Case", eq1), binding("S", 1.0), binding("D", 1.0)]),
            uses([
              proof(
                goal(discriminant(eq1, 1.0)),
                by(rule("quadratic-formula.pl", clause(5))),
                bindings([binding("Case", eq1), binding("D", 1.0), binding("A", 1.0), binding("B", -5.0), binding("C", 6.0), binding("B2", 25.0), binding("FourA", 4.0), binding("FourAC", 24.0)]),
                uses([
                  proof(
                    goal(equation(eq1, 1.0, -5.0, 6.0)),
                    by(fact("quadratic-formula.pl", clause(3)))
                  ),
                  proof(
                    goal(pow(-5.0, 2.0, 25.0)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(4.0, 1.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(4.0, 6.0, 24.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(sub(25.0, 24.0, 1.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(ge(1.0, 0.0)),
                by(builtin(ge, 2))
              ),
              proof(
                goal(pow(1.0, 0.5, 1.0)),
                by(builtin(pow, 3))
              )
            ])
          ),
          proof(
            goal(denominator(eq1, 2.0)),
            by(rule("quadratic-formula.pl", clause(8))),
            bindings([binding("Case", eq1), binding("Den", 2.0), binding("A", 1.0), binding("_B", -5.0), binding("_C", 6.0)]),
            uses([
              proof(
                goal(equation(eq1, 1.0, -5.0, 6.0)),
                by(fact("quadratic-formula.pl", clause(3)))
              ),
              proof(
                goal(mul(2.0, 1.0, 2.0)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(add(5.0, 1.0, 6.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(div(6.0, 2.0, 3.0)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

root(eq2, 3.0).
why(
  root(eq2, 3.0),
  proof(
    goal(root(eq2, 3.0)),
    by(rule("quadratic-formula.pl", clause(11))),
    bindings([binding("Case", eq2), binding("Root", 3.0)]),
    uses([
      proof(
        goal(root_plus(eq2, 3.0)),
        by(rule("quadratic-formula.pl", clause(9))),
        bindings([binding("Case", eq2), binding("Root", 3.0), binding("NB", 4.0), binding("S", 8.0), binding("Den", 4.0), binding("Numerator", 12.0)]),
        uses([
          proof(
            goal(negative_b(eq2, 4.0)),
            by(rule("quadratic-formula.pl", clause(7))),
            bindings([binding("Case", eq2), binding("NB", 4.0), binding("_A", 2.0), binding("B", -4.0), binding("_C", -6.0)]),
            uses([
              proof(
                goal(equation(eq2, 2.0, -4.0, -6.0)),
                by(fact("quadratic-formula.pl", clause(4)))
              ),
              proof(
                goal(neg(-4.0, 4.0)),
                by(builtin(neg, 2))
              )
            ])
          ),
          proof(
            goal(sqrt_discriminant(eq2, 8.0)),
            by(rule("quadratic-formula.pl", clause(6))),
            bindings([binding("Case", eq2), binding("S", 8.0), binding("D", 64.0)]),
            uses([
              proof(
                goal(discriminant(eq2, 64.0)),
                by(rule("quadratic-formula.pl", clause(5))),
                bindings([binding("Case", eq2), binding("D", 64.0), binding("A", 2.0), binding("B", -4.0), binding("C", -6.0), binding("B2", 16.0), binding("FourA", 8.0), binding("FourAC", -48.0)]),
                uses([
                  proof(
                    goal(equation(eq2, 2.0, -4.0, -6.0)),
                    by(fact("quadratic-formula.pl", clause(4)))
                  ),
                  proof(
                    goal(pow(-4.0, 2.0, 16.0)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(4.0, 2.0, 8.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(8.0, -6.0, -48.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(sub(16.0, -48.0, 64.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(ge(64.0, 0.0)),
                by(builtin(ge, 2))
              ),
              proof(
                goal(pow(64.0, 0.5, 8.0)),
                by(builtin(pow, 3))
              )
            ])
          ),
          proof(
            goal(denominator(eq2, 4.0)),
            by(rule("quadratic-formula.pl", clause(8))),
            bindings([binding("Case", eq2), binding("Den", 4.0), binding("A", 2.0), binding("_B", -4.0), binding("_C", -6.0)]),
            uses([
              proof(
                goal(equation(eq2, 2.0, -4.0, -6.0)),
                by(fact("quadratic-formula.pl", clause(4)))
              ),
              proof(
                goal(mul(2.0, 2.0, 4.0)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(add(4.0, 8.0, 12.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(div(12.0, 4.0, 3.0)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

root(eq1, 2.0).
why(
  root(eq1, 2.0),
  proof(
    goal(root(eq1, 2.0)),
    by(rule("quadratic-formula.pl", clause(12))),
    bindings([binding("Case", eq1), binding("Root", 2.0)]),
    uses([
      proof(
        goal(root_minus(eq1, 2.0)),
        by(rule("quadratic-formula.pl", clause(10))),
        bindings([binding("Case", eq1), binding("Root", 2.0), binding("NB", 5.0), binding("S", 1.0), binding("Den", 2.0), binding("Numerator", 4.0)]),
        uses([
          proof(
            goal(negative_b(eq1, 5.0)),
            by(rule("quadratic-formula.pl", clause(7))),
            bindings([binding("Case", eq1), binding("NB", 5.0), binding("_A", 1.0), binding("B", -5.0), binding("_C", 6.0)]),
            uses([
              proof(
                goal(equation(eq1, 1.0, -5.0, 6.0)),
                by(fact("quadratic-formula.pl", clause(3)))
              ),
              proof(
                goal(neg(-5.0, 5.0)),
                by(builtin(neg, 2))
              )
            ])
          ),
          proof(
            goal(sqrt_discriminant(eq1, 1.0)),
            by(rule("quadratic-formula.pl", clause(6))),
            bindings([binding("Case", eq1), binding("S", 1.0), binding("D", 1.0)]),
            uses([
              proof(
                goal(discriminant(eq1, 1.0)),
                by(rule("quadratic-formula.pl", clause(5))),
                bindings([binding("Case", eq1), binding("D", 1.0), binding("A", 1.0), binding("B", -5.0), binding("C", 6.0), binding("B2", 25.0), binding("FourA", 4.0), binding("FourAC", 24.0)]),
                uses([
                  proof(
                    goal(equation(eq1, 1.0, -5.0, 6.0)),
                    by(fact("quadratic-formula.pl", clause(3)))
                  ),
                  proof(
                    goal(pow(-5.0, 2.0, 25.0)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(4.0, 1.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(4.0, 6.0, 24.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(sub(25.0, 24.0, 1.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(ge(1.0, 0.0)),
                by(builtin(ge, 2))
              ),
              proof(
                goal(pow(1.0, 0.5, 1.0)),
                by(builtin(pow, 3))
              )
            ])
          ),
          proof(
            goal(denominator(eq1, 2.0)),
            by(rule("quadratic-formula.pl", clause(8))),
            bindings([binding("Case", eq1), binding("Den", 2.0), binding("A", 1.0), binding("_B", -5.0), binding("_C", 6.0)]),
            uses([
              proof(
                goal(equation(eq1, 1.0, -5.0, 6.0)),
                by(fact("quadratic-formula.pl", clause(3)))
              ),
              proof(
                goal(mul(2.0, 1.0, 2.0)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(sub(5.0, 1.0, 4.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(div(4.0, 2.0, 2.0)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

root(eq2, -1.0).
why(
  root(eq2, -1.0),
  proof(
    goal(root(eq2, -1.0)),
    by(rule("quadratic-formula.pl", clause(12))),
    bindings([binding("Case", eq2), binding("Root", -1.0)]),
    uses([
      proof(
        goal(root_minus(eq2, -1.0)),
        by(rule("quadratic-formula.pl", clause(10))),
        bindings([binding("Case", eq2), binding("Root", -1.0), binding("NB", 4.0), binding("S", 8.0), binding("Den", 4.0), binding("Numerator", -4.0)]),
        uses([
          proof(
            goal(negative_b(eq2, 4.0)),
            by(rule("quadratic-formula.pl", clause(7))),
            bindings([binding("Case", eq2), binding("NB", 4.0), binding("_A", 2.0), binding("B", -4.0), binding("_C", -6.0)]),
            uses([
              proof(
                goal(equation(eq2, 2.0, -4.0, -6.0)),
                by(fact("quadratic-formula.pl", clause(4)))
              ),
              proof(
                goal(neg(-4.0, 4.0)),
                by(builtin(neg, 2))
              )
            ])
          ),
          proof(
            goal(sqrt_discriminant(eq2, 8.0)),
            by(rule("quadratic-formula.pl", clause(6))),
            bindings([binding("Case", eq2), binding("S", 8.0), binding("D", 64.0)]),
            uses([
              proof(
                goal(discriminant(eq2, 64.0)),
                by(rule("quadratic-formula.pl", clause(5))),
                bindings([binding("Case", eq2), binding("D", 64.0), binding("A", 2.0), binding("B", -4.0), binding("C", -6.0), binding("B2", 16.0), binding("FourA", 8.0), binding("FourAC", -48.0)]),
                uses([
                  proof(
                    goal(equation(eq2, 2.0, -4.0, -6.0)),
                    by(fact("quadratic-formula.pl", clause(4)))
                  ),
                  proof(
                    goal(pow(-4.0, 2.0, 16.0)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(mul(4.0, 2.0, 8.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mul(8.0, -6.0, -48.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(sub(16.0, -48.0, 64.0)),
                    by(builtin(sub, 3))
                  )
                ])
              ),
              proof(
                goal(ge(64.0, 0.0)),
                by(builtin(ge, 2))
              ),
              proof(
                goal(pow(64.0, 0.5, 8.0)),
                by(builtin(pow, 3))
              )
            ])
          ),
          proof(
            goal(denominator(eq2, 4.0)),
            by(rule("quadratic-formula.pl", clause(8))),
            bindings([binding("Case", eq2), binding("Den", 4.0), binding("A", 2.0), binding("_B", -4.0), binding("_C", -6.0)]),
            uses([
              proof(
                goal(equation(eq2, 2.0, -4.0, -6.0)),
                by(fact("quadratic-formula.pl", clause(4)))
              ),
              proof(
                goal(mul(2.0, 2.0, 4.0)),
                by(builtin(mul, 3))
              )
            ])
          ),
          proof(
            goal(sub(4.0, 8.0, -4.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(div(-4.0, 4.0, -1.0)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

