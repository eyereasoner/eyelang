fft(ramp8, [c(28, 0.0), c(-4.0, 9.6568542494923797), c(-4.0, 4.0), c(-4.0, 1.6568542494923806), c(-4, 0.0), c(-4.0, -1.6568542494923806), c(-4.0, -4.0), c(-4.0, -9.6568542494923797)]).
why(
  fft(ramp8, [c(28, 0.0), c(-4.0, 9.6568542494923797), c(-4.0, 4.0), c(-4.0, 1.6568542494923806), c(-4, 0.0), c(-4.0, -1.6568542494923806), c(-4.0, -4.0), c(-4.0, -9.6568542494923797)]),
  proof(
    goal(fft(ramp8, [c(28, 0.0), c(-4.0, 9.6568542494923797), c(-4.0, 4.0), c(-4.0, 1.6568542494923806), c(-4, 0.0), c(-4.0, -1.6568542494923806), c(-4.0, -4.0), c(-4.0, -9.6568542494923797)])), by(rule("fft8-numeric.pl", clause(20))),
    bindings([binding("Wave", ramp8), binding("Spectrum", [c(28, 0.0), c(-4.0, 9.6568542494923797), c(-4.0, 4.0), c(-4.0, 1.6568542494923806), c(-4, 0.0), c(-4.0, -1.6568542494923806), c(-4.0, -4.0), c(-4.0, -9.6568542494923797)]), binding("Samples", [0, 1, 2, 3, 4, 5, 6, 7])]),
    uses([
      proof(goal(wave(ramp8, [0, 1, 2, 3, 4, 5, 6, 7])), by(fact("fft8-numeric.pl", clause(18)))),
      proof(
        goal(fft8([0, 1, 2, 3, 4, 5, 6, 7], [c(28, 0.0), c(-4.0, 9.6568542494923797), c(-4.0, 4.0), c(-4.0, 1.6568542494923806), c(-4, 0.0), c(-4.0, -1.6568542494923806), c(-4.0, -4.0), c(-4.0, -9.6568542494923797)])), by(rule("fft8-numeric.pl", clause(17))),
        bindings([binding("X0", 0), binding("X1", 1), binding("X2", 2), binding("X3", 3), binding("X4", 4), binding("X5", 5), binding("X6", 6), binding("X7", 7), binding("Y0", c(28, 0.0)), binding("Y1", c(-4.0, 9.6568542494923797)), binding("Y2", c(-4.0, 4.0)), binding("Y3", c(-4.0, 1.6568542494923806)), binding("Y4", c(-4, 0.0)), binding("Y5", c(-4.0, -1.6568542494923806)), binding("Y6", c(-4.0, -4.0)), binding("Y7", c(-4.0, -9.6568542494923797)), binding("E0", c(12, 0.0)), binding("E1", c(-4.0, 4.0)), binding("E2", c(-4, 0.0)), binding("E3", c(-4.0, -4.0)), binding("O0", c(16, 0.0)), binding("O1", c(-4.0, 4.0)), binding("O2", c(-4, 0.0)), binding("O3", c(-4.0, -4.0)), binding("W1", c(0.7071067811865476, -0.7071067811865476)), binding("W2", c(0.0, -1.0)), binding("W3", c(-0.7071067811865476, -0.7071067811865476)), binding("T1", c(0.0, 5.6568542494923806)), binding("T2", c(0.0, 4.0)), binding("T3", c(0.0, 5.6568542494923806))]),
        uses([
          proof(
            goal(fft4([0, 2, 4, 6], [c(12, 0.0), c(-4.0, 4.0), c(-4, 0.0), c(-4.0, -4.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", 0), binding("X1", 2), binding("X2", 4), binding("X3", 6), binding("Y0", c(12, 0.0)), binding("Y1", c(-4.0, 4.0)), binding("Y2", c(-4, 0.0)), binding("Y3", c(-4.0, -4.0)), binding("E0", c(4, 0.0)), binding("E1", c(-4, 0.0)), binding("O0", c(8, 0.0)), binding("O1", c(-4, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 4.0))]),
            uses([
              proof(
                goal(fft2([0, 4], [c(4, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 0), binding("X1", 4), binding("Y0", c(4, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(0, 0.0)), binding("O0", c(4, 0.0))]),
                uses([
                  proof(
                    goal(fft1([0], [c(0, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 0)])
                  ),
                  proof(
                    goal(fft1([4], [c(4, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 4)])
                  ),
                  proof(
                    goal(c_add(c(0, 0.0), c(4, 0.0), c(4, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 4), binding("BI", 0.0), binding("CR", 4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(0, 4, 4)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(0, 0.0), c(4, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 4), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(0, 4, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([2, 6], [c(8, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 2), binding("X1", 6), binding("Y0", c(8, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(2, 0.0)), binding("O0", c(6, 0.0))]),
                uses([
                  proof(
                    goal(fft1([2], [c(2, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 2)])
                  ),
                  proof(
                    goal(fft1([6], [c(6, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 6)])
                  ),
                  proof(
                    goal(c_add(c(2, 0.0), c(6, 0.0), c(8, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 6), binding("BI", 0.0), binding("CR", 8), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(2, 6, 8)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(2, 0.0), c(6, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 6), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(2, 6, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(-4, 0.0), c(0.0, 4.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 4.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 4.0)]),
                uses([
                  proof(goal(mul(0.0, -4, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, -4, 4.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(4, 0.0), c(8, 0.0), c(12, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", 8), binding("BI", 0.0), binding("CR", 12), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(4, 8, 12)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(-4, 0.0), c(0.0, 4.0), c(-4.0, 4.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", 4.0)]),
                uses([
                  proof(goal(add(-4, 0.0, -4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(4, 0.0), c(8, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", 8), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(4, 8, -4)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(-4, 0.0), c(0.0, 4.0), c(-4.0, -4.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", -4.0)]),
                uses([
                  proof(goal(sub(-4, 0.0, -4.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 4.0, -4.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(fft4([1, 3, 5, 7], [c(16, 0.0), c(-4.0, 4.0), c(-4, 0.0), c(-4.0, -4.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", 1), binding("X1", 3), binding("X2", 5), binding("X3", 7), binding("Y0", c(16, 0.0)), binding("Y1", c(-4.0, 4.0)), binding("Y2", c(-4, 0.0)), binding("Y3", c(-4.0, -4.0)), binding("E0", c(6, 0.0)), binding("E1", c(-4, 0.0)), binding("O0", c(10, 0.0)), binding("O1", c(-4, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 4.0))]),
            uses([
              proof(
                goal(fft2([1, 5], [c(6, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 1), binding("X1", 5), binding("Y0", c(6, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(1, 0.0)), binding("O0", c(5, 0.0))]),
                uses([
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(fft1([5], [c(5, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 5)])
                  ),
                  proof(
                    goal(c_add(c(1, 0.0), c(5, 0.0), c(6, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 5), binding("BI", 0.0), binding("CR", 6), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(1, 5, 6)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(1, 0.0), c(5, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 5), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(1, 5, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([3, 7], [c(10, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 3), binding("X1", 7), binding("Y0", c(10, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(3, 0.0)), binding("O0", c(7, 0.0))]),
                uses([
                  proof(
                    goal(fft1([3], [c(3, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 3)])
                  ),
                  proof(
                    goal(fft1([7], [c(7, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 7)])
                  ),
                  proof(
                    goal(c_add(c(3, 0.0), c(7, 0.0), c(10, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 3), binding("AI", 0.0), binding("BR", 7), binding("BI", 0.0), binding("CR", 10), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(3, 7, 10)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(3, 0.0), c(7, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 3), binding("AI", 0.0), binding("BR", 7), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(3, 7, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(-4, 0.0), c(0.0, 4.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 4.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 4.0)]),
                uses([
                  proof(goal(mul(0.0, -4, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, -4, 4.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(6, 0.0), c(10, 0.0), c(16, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 6), binding("AI", 0.0), binding("BR", 10), binding("BI", 0.0), binding("CR", 16), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(6, 10, 16)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(-4, 0.0), c(0.0, 4.0), c(-4.0, 4.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", 4.0)]),
                uses([
                  proof(goal(add(-4, 0.0, -4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(6, 0.0), c(10, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 6), binding("AI", 0.0), binding("BR", 10), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(6, 10, -4)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(-4, 0.0), c(0.0, 4.0), c(-4.0, -4.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", -4.0)]),
                uses([
                  proof(goal(sub(-4, 0.0, -4.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 4.0, -4.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(goal(w8(1, c(0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(4)))),
          proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
          proof(goal(w8(3, c(-0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(6)))),
          proof(
            goal(c_mul(c(0.7071067811865476, -0.7071067811865476), c(-4.0, 4.0), c(0.0, 5.6568542494923806))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", -4.0), binding("BI", 4.0), binding("CR", 0.0), binding("CI", 5.6568542494923806), binding("AC", -2.8284271247461903), binding("BD", -2.8284271247461903), binding("AD", 2.8284271247461903), binding("BC", 2.8284271247461903)]),
            uses([
              proof(goal(mul(0.7071067811865476, -4.0, -2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 4.0, -2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(sub(-2.8284271247461903, -2.8284271247461903, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.7071067811865476, 4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(add(2.8284271247461903, 2.8284271247461903, 5.6568542494923806)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(0.0, -1.0), c(-4, 0.0), c(0.0, 4.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 4.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 4.0)]),
            uses([
              proof(goal(mul(0.0, -4, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, -4, 4.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(-0.7071067811865476, -0.7071067811865476), c(-4.0, -4.0), c(0.0, 5.6568542494923806))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", -0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", -4.0), binding("BI", -4.0), binding("CR", 0.0), binding("CI", 5.6568542494923806), binding("AC", 2.8284271247461903), binding("BD", 2.8284271247461903), binding("AD", 2.8284271247461903), binding("BC", 2.8284271247461903)]),
            uses([
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(sub(2.8284271247461903, 2.8284271247461903, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(add(2.8284271247461903, 2.8284271247461903, 5.6568542494923806)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(12, 0.0), c(16, 0.0), c(28, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 12), binding("AI", 0.0), binding("BR", 16), binding("BI", 0.0), binding("CR", 28), binding("CI", 0.0)]),
            uses([
              proof(goal(add(12, 16, 28)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(-4.0, 4.0), c(0.0, 5.6568542494923806), c(-4.0, 9.6568542494923797))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", -4.0), binding("AI", 4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", 9.6568542494923797)]),
            uses([
              proof(goal(add(-4.0, 0.0, -4.0)), by(builtin(add, 3))),
              proof(goal(add(4.0, 5.6568542494923806, 9.6568542494923797)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(-4, 0.0), c(0.0, 4.0), c(-4.0, 4.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", 4.0)]),
            uses([
              proof(goal(add(-4, 0.0, -4.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(-4.0, -4.0), c(0.0, 5.6568542494923806), c(-4.0, 1.6568542494923806))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", -4.0), binding("AI", -4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", 1.6568542494923806)]),
            uses([
              proof(goal(add(-4.0, 0.0, -4.0)), by(builtin(add, 3))),
              proof(goal(add(-4.0, 5.6568542494923806, 1.6568542494923806)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(12, 0.0), c(16, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 12), binding("AI", 0.0), binding("BR", 16), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(12, 16, -4)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(-4.0, 4.0), c(0.0, 5.6568542494923806), c(-4.0, -1.6568542494923806))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", -4.0), binding("AI", 4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", -1.6568542494923806)]),
            uses([
              proof(goal(sub(-4.0, 0.0, -4.0)), by(builtin(sub, 3))),
              proof(goal(sub(4.0, 5.6568542494923806, -1.6568542494923806)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(-4, 0.0), c(0.0, 4.0), c(-4.0, -4.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", -4.0)]),
            uses([
              proof(goal(sub(-4, 0.0, -4.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 4.0, -4.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(-4.0, -4.0), c(0.0, 5.6568542494923806), c(-4.0, -9.6568542494923797))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", -4.0), binding("AI", -4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", -9.6568542494923797)]),
            uses([
              proof(goal(sub(-4.0, 0.0, -4.0)), by(builtin(sub, 3))),
              proof(goal(sub(-4.0, 5.6568542494923806, -9.6568542494923797)), by(builtin(sub, 3)))
            ])
          )
        ])
      )
    ])
  )
).

fft(alternating8, [c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)]).
why(
  fft(alternating8, [c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)]),
  proof(
    goal(fft(alternating8, [c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)])), by(rule("fft8-numeric.pl", clause(20))),
    bindings([binding("Wave", alternating8), binding("Spectrum", [c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)]), binding("Samples", [1, -1, 1, -1, 1, -1, 1, -1])]),
    uses([
      proof(goal(wave(alternating8, [1, -1, 1, -1, 1, -1, 1, -1])), by(fact("fft8-numeric.pl", clause(19)))),
      proof(
        goal(fft8([1, -1, 1, -1, 1, -1, 1, -1], [c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)])), by(rule("fft8-numeric.pl", clause(17))),
        bindings([binding("X0", 1), binding("X1", -1), binding("X2", 1), binding("X3", -1), binding("X4", 1), binding("X5", -1), binding("X6", 1), binding("X7", -1), binding("Y0", c(0, 0.0)), binding("Y1", c(0.0, 0.0)), binding("Y2", c(0.0, 0.0)), binding("Y3", c(0.0, 0.0)), binding("Y4", c(8, 0.0)), binding("Y5", c(0.0, 0.0)), binding("Y6", c(0.0, 0.0)), binding("Y7", c(0.0, 0.0)), binding("E0", c(4, 0.0)), binding("E1", c(0.0, 0.0)), binding("E2", c(0, 0.0)), binding("E3", c(0.0, 0.0)), binding("O0", c(-4, 0.0)), binding("O1", c(0.0, 0.0)), binding("O2", c(0, 0.0)), binding("O3", c(0.0, 0.0)), binding("W1", c(0.7071067811865476, -0.7071067811865476)), binding("W2", c(0.0, -1.0)), binding("W3", c(-0.7071067811865476, -0.7071067811865476)), binding("T1", c(0.0, 0.0)), binding("T2", c(0.0, 0.0)), binding("T3", c(0.0, 0.0))]),
        uses([
          proof(
            goal(fft4([1, 1, 1, 1], [c(4, 0.0), c(0.0, 0.0), c(0, 0.0), c(0.0, 0.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", 1), binding("X1", 1), binding("X2", 1), binding("X3", 1), binding("Y0", c(4, 0.0)), binding("Y1", c(0.0, 0.0)), binding("Y2", c(0, 0.0)), binding("Y3", c(0.0, 0.0)), binding("E0", c(2, 0.0)), binding("E1", c(0, 0.0)), binding("O0", c(2, 0.0)), binding("O1", c(0, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 0.0))]),
            uses([
              proof(
                goal(fft2([1, 1], [c(2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 1), binding("X1", 1), binding("Y0", c(2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(1, 0.0)), binding("O0", c(1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(c_add(c(1, 0.0), c(1, 0.0), c(2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(1, 0.0), c(1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([1, 1], [c(2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 1), binding("X1", 1), binding("Y0", c(2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(1, 0.0)), binding("O0", c(1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(c_add(c(1, 0.0), c(1, 0.0), c(2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(1, 0.0), c(1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", 0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
                uses([
                  proof(goal(mul(0.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(2, 0.0), c(2, 0.0), c(4, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 2), binding("BI", 0.0), binding("CR", 4), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(2, 2, 4)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(0, 0.0, 0.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(2, 0.0), c(2, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 2), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(2, 2, 0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(fft4([-1, -1, -1, -1], [c(-4, 0.0), c(0.0, 0.0), c(0, 0.0), c(0.0, 0.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", -1), binding("X1", -1), binding("X2", -1), binding("X3", -1), binding("Y0", c(-4, 0.0)), binding("Y1", c(0.0, 0.0)), binding("Y2", c(0, 0.0)), binding("Y3", c(0.0, 0.0)), binding("E0", c(-2, 0.0)), binding("E1", c(0, 0.0)), binding("O0", c(-2, 0.0)), binding("O1", c(0, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 0.0))]),
            uses([
              proof(
                goal(fft2([-1, -1], [c(-2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", -1), binding("X1", -1), binding("Y0", c(-2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(-1, 0.0)), binding("O0", c(-1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(c_add(c(-1, 0.0), c(-1, 0.0), c(-2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", -2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(-1, -1, -2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(-1, 0.0), c(-1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(-1, -1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([-1, -1], [c(-2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", -1), binding("X1", -1), binding("Y0", c(-2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(-1, 0.0)), binding("O0", c(-1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(c_add(c(-1, 0.0), c(-1, 0.0), c(-2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", -2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(-1, -1, -2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(-1, 0.0), c(-1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(-1, -1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", 0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
                uses([
                  proof(goal(mul(0.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(-2, 0.0), c(-2, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", -2), binding("AI", 0.0), binding("BR", -2), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(-2, -2, -4)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(0, 0.0, 0.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(-2, 0.0), c(-2, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", -2), binding("AI", 0.0), binding("BR", -2), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(-2, -2, 0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(goal(w8(1, c(0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(4)))),
          proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
          proof(goal(w8(3, c(-0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(6)))),
          proof(
            goal(c_mul(c(0.7071067811865476, -0.7071067811865476), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
            uses([
              proof(goal(mul(0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(0.0, -1.0), c(0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", 0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
            uses([
              proof(goal(mul(0.0, 0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, 0, 0.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(-0.7071067811865476, -0.7071067811865476), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", -0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
            uses([
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(4, 0.0), c(-4, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(4, -4, 0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(0, 0.0, 0.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(4, 0.0), c(-4, 0.0), c(8, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 8), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(4, -4, 8)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          )
        ])
      )
    ])
  )
).

dcComponent(ramp8, c(28, 0.0)).
why(
  dcComponent(ramp8, c(28, 0.0)),
  proof(
    goal(dcComponent(ramp8, c(28, 0.0))), by(rule("fft8-numeric.pl", clause(21))),
    bindings([binding("Wave", ramp8), binding("DC", c(28, 0.0)), binding("Samples", [0, 1, 2, 3, 4, 5, 6, 7]), binding("__anon0", [c(-4.0, 9.6568542494923797), c(-4.0, 4.0), c(-4.0, 1.6568542494923806), c(-4, 0.0), c(-4.0, -1.6568542494923806), c(-4.0, -4.0), c(-4.0, -9.6568542494923797)])]),
    uses([
      proof(goal(wave(ramp8, [0, 1, 2, 3, 4, 5, 6, 7])), by(fact("fft8-numeric.pl", clause(18)))),
      proof(
        goal(fft8([0, 1, 2, 3, 4, 5, 6, 7], [c(28, 0.0), c(-4.0, 9.6568542494923797), c(-4.0, 4.0), c(-4.0, 1.6568542494923806), c(-4, 0.0), c(-4.0, -1.6568542494923806), c(-4.0, -4.0), c(-4.0, -9.6568542494923797)])), by(rule("fft8-numeric.pl", clause(17))),
        bindings([binding("X0", 0), binding("X1", 1), binding("X2", 2), binding("X3", 3), binding("X4", 4), binding("X5", 5), binding("X6", 6), binding("X7", 7), binding("Y0", c(28, 0.0)), binding("Y1", c(-4.0, 9.6568542494923797)), binding("Y2", c(-4.0, 4.0)), binding("Y3", c(-4.0, 1.6568542494923806)), binding("Y4", c(-4, 0.0)), binding("Y5", c(-4.0, -1.6568542494923806)), binding("Y6", c(-4.0, -4.0)), binding("Y7", c(-4.0, -9.6568542494923797)), binding("E0", c(12, 0.0)), binding("E1", c(-4.0, 4.0)), binding("E2", c(-4, 0.0)), binding("E3", c(-4.0, -4.0)), binding("O0", c(16, 0.0)), binding("O1", c(-4.0, 4.0)), binding("O2", c(-4, 0.0)), binding("O3", c(-4.0, -4.0)), binding("W1", c(0.7071067811865476, -0.7071067811865476)), binding("W2", c(0.0, -1.0)), binding("W3", c(-0.7071067811865476, -0.7071067811865476)), binding("T1", c(0.0, 5.6568542494923806)), binding("T2", c(0.0, 4.0)), binding("T3", c(0.0, 5.6568542494923806))]),
        uses([
          proof(
            goal(fft4([0, 2, 4, 6], [c(12, 0.0), c(-4.0, 4.0), c(-4, 0.0), c(-4.0, -4.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", 0), binding("X1", 2), binding("X2", 4), binding("X3", 6), binding("Y0", c(12, 0.0)), binding("Y1", c(-4.0, 4.0)), binding("Y2", c(-4, 0.0)), binding("Y3", c(-4.0, -4.0)), binding("E0", c(4, 0.0)), binding("E1", c(-4, 0.0)), binding("O0", c(8, 0.0)), binding("O1", c(-4, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 4.0))]),
            uses([
              proof(
                goal(fft2([0, 4], [c(4, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 0), binding("X1", 4), binding("Y0", c(4, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(0, 0.0)), binding("O0", c(4, 0.0))]),
                uses([
                  proof(
                    goal(fft1([0], [c(0, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 0)])
                  ),
                  proof(
                    goal(fft1([4], [c(4, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 4)])
                  ),
                  proof(
                    goal(c_add(c(0, 0.0), c(4, 0.0), c(4, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 4), binding("BI", 0.0), binding("CR", 4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(0, 4, 4)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(0, 0.0), c(4, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 4), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(0, 4, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([2, 6], [c(8, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 2), binding("X1", 6), binding("Y0", c(8, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(2, 0.0)), binding("O0", c(6, 0.0))]),
                uses([
                  proof(
                    goal(fft1([2], [c(2, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 2)])
                  ),
                  proof(
                    goal(fft1([6], [c(6, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 6)])
                  ),
                  proof(
                    goal(c_add(c(2, 0.0), c(6, 0.0), c(8, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 6), binding("BI", 0.0), binding("CR", 8), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(2, 6, 8)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(2, 0.0), c(6, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 6), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(2, 6, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(-4, 0.0), c(0.0, 4.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 4.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 4.0)]),
                uses([
                  proof(goal(mul(0.0, -4, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, -4, 4.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(4, 0.0), c(8, 0.0), c(12, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", 8), binding("BI", 0.0), binding("CR", 12), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(4, 8, 12)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(-4, 0.0), c(0.0, 4.0), c(-4.0, 4.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", 4.0)]),
                uses([
                  proof(goal(add(-4, 0.0, -4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(4, 0.0), c(8, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", 8), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(4, 8, -4)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(-4, 0.0), c(0.0, 4.0), c(-4.0, -4.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", -4.0)]),
                uses([
                  proof(goal(sub(-4, 0.0, -4.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 4.0, -4.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(fft4([1, 3, 5, 7], [c(16, 0.0), c(-4.0, 4.0), c(-4, 0.0), c(-4.0, -4.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", 1), binding("X1", 3), binding("X2", 5), binding("X3", 7), binding("Y0", c(16, 0.0)), binding("Y1", c(-4.0, 4.0)), binding("Y2", c(-4, 0.0)), binding("Y3", c(-4.0, -4.0)), binding("E0", c(6, 0.0)), binding("E1", c(-4, 0.0)), binding("O0", c(10, 0.0)), binding("O1", c(-4, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 4.0))]),
            uses([
              proof(
                goal(fft2([1, 5], [c(6, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 1), binding("X1", 5), binding("Y0", c(6, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(1, 0.0)), binding("O0", c(5, 0.0))]),
                uses([
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(fft1([5], [c(5, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 5)])
                  ),
                  proof(
                    goal(c_add(c(1, 0.0), c(5, 0.0), c(6, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 5), binding("BI", 0.0), binding("CR", 6), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(1, 5, 6)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(1, 0.0), c(5, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 5), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(1, 5, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([3, 7], [c(10, 0.0), c(-4, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 3), binding("X1", 7), binding("Y0", c(10, 0.0)), binding("Y1", c(-4, 0.0)), binding("E0", c(3, 0.0)), binding("O0", c(7, 0.0))]),
                uses([
                  proof(
                    goal(fft1([3], [c(3, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 3)])
                  ),
                  proof(
                    goal(fft1([7], [c(7, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 7)])
                  ),
                  proof(
                    goal(c_add(c(3, 0.0), c(7, 0.0), c(10, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 3), binding("AI", 0.0), binding("BR", 7), binding("BI", 0.0), binding("CR", 10), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(3, 7, 10)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(3, 0.0), c(7, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 3), binding("AI", 0.0), binding("BR", 7), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(3, 7, -4)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(-4, 0.0), c(0.0, 4.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 4.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 4.0)]),
                uses([
                  proof(goal(mul(0.0, -4, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, -4, 4.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(6, 0.0), c(10, 0.0), c(16, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 6), binding("AI", 0.0), binding("BR", 10), binding("BI", 0.0), binding("CR", 16), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(6, 10, 16)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(-4, 0.0), c(0.0, 4.0), c(-4.0, 4.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", 4.0)]),
                uses([
                  proof(goal(add(-4, 0.0, -4.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(6, 0.0), c(10, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 6), binding("AI", 0.0), binding("BR", 10), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(6, 10, -4)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(-4, 0.0), c(0.0, 4.0), c(-4.0, -4.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", -4.0)]),
                uses([
                  proof(goal(sub(-4, 0.0, -4.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 4.0, -4.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(goal(w8(1, c(0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(4)))),
          proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
          proof(goal(w8(3, c(-0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(6)))),
          proof(
            goal(c_mul(c(0.7071067811865476, -0.7071067811865476), c(-4.0, 4.0), c(0.0, 5.6568542494923806))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", -4.0), binding("BI", 4.0), binding("CR", 0.0), binding("CI", 5.6568542494923806), binding("AC", -2.8284271247461903), binding("BD", -2.8284271247461903), binding("AD", 2.8284271247461903), binding("BC", 2.8284271247461903)]),
            uses([
              proof(goal(mul(0.7071067811865476, -4.0, -2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 4.0, -2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(sub(-2.8284271247461903, -2.8284271247461903, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.7071067811865476, 4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(add(2.8284271247461903, 2.8284271247461903, 5.6568542494923806)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(0.0, -1.0), c(-4, 0.0), c(0.0, 4.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 4.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 4.0)]),
            uses([
              proof(goal(mul(0.0, -4, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, -4, 4.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(-0.7071067811865476, -0.7071067811865476), c(-4.0, -4.0), c(0.0, 5.6568542494923806))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", -0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", -4.0), binding("BI", -4.0), binding("CR", 0.0), binding("CI", 5.6568542494923806), binding("AC", 2.8284271247461903), binding("BD", 2.8284271247461903), binding("AD", 2.8284271247461903), binding("BC", 2.8284271247461903)]),
            uses([
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(sub(2.8284271247461903, 2.8284271247461903, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, -4.0, 2.8284271247461903)), by(builtin(mul, 3))),
              proof(goal(add(2.8284271247461903, 2.8284271247461903, 5.6568542494923806)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(12, 0.0), c(16, 0.0), c(28, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 12), binding("AI", 0.0), binding("BR", 16), binding("BI", 0.0), binding("CR", 28), binding("CI", 0.0)]),
            uses([
              proof(goal(add(12, 16, 28)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(-4.0, 4.0), c(0.0, 5.6568542494923806), c(-4.0, 9.6568542494923797))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", -4.0), binding("AI", 4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", 9.6568542494923797)]),
            uses([
              proof(goal(add(-4.0, 0.0, -4.0)), by(builtin(add, 3))),
              proof(goal(add(4.0, 5.6568542494923806, 9.6568542494923797)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(-4, 0.0), c(0.0, 4.0), c(-4.0, 4.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", 4.0)]),
            uses([
              proof(goal(add(-4, 0.0, -4.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 4.0, 4.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(-4.0, -4.0), c(0.0, 5.6568542494923806), c(-4.0, 1.6568542494923806))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", -4.0), binding("AI", -4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", 1.6568542494923806)]),
            uses([
              proof(goal(add(-4.0, 0.0, -4.0)), by(builtin(add, 3))),
              proof(goal(add(-4.0, 5.6568542494923806, 1.6568542494923806)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(12, 0.0), c(16, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 12), binding("AI", 0.0), binding("BR", 16), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(12, 16, -4)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(-4.0, 4.0), c(0.0, 5.6568542494923806), c(-4.0, -1.6568542494923806))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", -4.0), binding("AI", 4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", -1.6568542494923806)]),
            uses([
              proof(goal(sub(-4.0, 0.0, -4.0)), by(builtin(sub, 3))),
              proof(goal(sub(4.0, 5.6568542494923806, -1.6568542494923806)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(-4, 0.0), c(0.0, 4.0), c(-4.0, -4.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", -4), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 4.0), binding("CR", -4.0), binding("CI", -4.0)]),
            uses([
              proof(goal(sub(-4, 0.0, -4.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 4.0, -4.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(-4.0, -4.0), c(0.0, 5.6568542494923806), c(-4.0, -9.6568542494923797))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", -4.0), binding("AI", -4.0), binding("BR", 0.0), binding("BI", 5.6568542494923806), binding("CR", -4.0), binding("CI", -9.6568542494923797)]),
            uses([
              proof(goal(sub(-4.0, 0.0, -4.0)), by(builtin(sub, 3))),
              proof(goal(sub(-4.0, 5.6568542494923806, -9.6568542494923797)), by(builtin(sub, 3)))
            ])
          )
        ])
      )
    ])
  )
).

dcComponent(alternating8, c(0, 0.0)).
why(
  dcComponent(alternating8, c(0, 0.0)),
  proof(
    goal(dcComponent(alternating8, c(0, 0.0))), by(rule("fft8-numeric.pl", clause(21))),
    bindings([binding("Wave", alternating8), binding("DC", c(0, 0.0)), binding("Samples", [1, -1, 1, -1, 1, -1, 1, -1]), binding("__anon0", [c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)])]),
    uses([
      proof(goal(wave(alternating8, [1, -1, 1, -1, 1, -1, 1, -1])), by(fact("fft8-numeric.pl", clause(19)))),
      proof(
        goal(fft8([1, -1, 1, -1, 1, -1, 1, -1], [c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)])), by(rule("fft8-numeric.pl", clause(17))),
        bindings([binding("X0", 1), binding("X1", -1), binding("X2", 1), binding("X3", -1), binding("X4", 1), binding("X5", -1), binding("X6", 1), binding("X7", -1), binding("Y0", c(0, 0.0)), binding("Y1", c(0.0, 0.0)), binding("Y2", c(0.0, 0.0)), binding("Y3", c(0.0, 0.0)), binding("Y4", c(8, 0.0)), binding("Y5", c(0.0, 0.0)), binding("Y6", c(0.0, 0.0)), binding("Y7", c(0.0, 0.0)), binding("E0", c(4, 0.0)), binding("E1", c(0.0, 0.0)), binding("E2", c(0, 0.0)), binding("E3", c(0.0, 0.0)), binding("O0", c(-4, 0.0)), binding("O1", c(0.0, 0.0)), binding("O2", c(0, 0.0)), binding("O3", c(0.0, 0.0)), binding("W1", c(0.7071067811865476, -0.7071067811865476)), binding("W2", c(0.0, -1.0)), binding("W3", c(-0.7071067811865476, -0.7071067811865476)), binding("T1", c(0.0, 0.0)), binding("T2", c(0.0, 0.0)), binding("T3", c(0.0, 0.0))]),
        uses([
          proof(
            goal(fft4([1, 1, 1, 1], [c(4, 0.0), c(0.0, 0.0), c(0, 0.0), c(0.0, 0.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", 1), binding("X1", 1), binding("X2", 1), binding("X3", 1), binding("Y0", c(4, 0.0)), binding("Y1", c(0.0, 0.0)), binding("Y2", c(0, 0.0)), binding("Y3", c(0.0, 0.0)), binding("E0", c(2, 0.0)), binding("E1", c(0, 0.0)), binding("O0", c(2, 0.0)), binding("O1", c(0, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 0.0))]),
            uses([
              proof(
                goal(fft2([1, 1], [c(2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 1), binding("X1", 1), binding("Y0", c(2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(1, 0.0)), binding("O0", c(1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(c_add(c(1, 0.0), c(1, 0.0), c(2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(1, 0.0), c(1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([1, 1], [c(2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", 1), binding("X1", 1), binding("Y0", c(2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(1, 0.0)), binding("O0", c(1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(fft1([1], [c(1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", 1)])
                  ),
                  proof(
                    goal(c_add(c(1, 0.0), c(1, 0.0), c(2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(1, 0.0), c(1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", 1), binding("AI", 0.0), binding("BR", 1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", 0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
                uses([
                  proof(goal(mul(0.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(2, 0.0), c(2, 0.0), c(4, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 2), binding("BI", 0.0), binding("CR", 4), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(2, 2, 4)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(0, 0.0, 0.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(2, 0.0), c(2, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 2), binding("AI", 0.0), binding("BR", 2), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(2, 2, 0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(fft4([-1, -1, -1, -1], [c(-4, 0.0), c(0.0, 0.0), c(0, 0.0), c(0.0, 0.0)])), by(rule("fft8-numeric.pl", clause(16))),
            bindings([binding("X0", -1), binding("X1", -1), binding("X2", -1), binding("X3", -1), binding("Y0", c(-4, 0.0)), binding("Y1", c(0.0, 0.0)), binding("Y2", c(0, 0.0)), binding("Y3", c(0.0, 0.0)), binding("E0", c(-2, 0.0)), binding("E1", c(0, 0.0)), binding("O0", c(-2, 0.0)), binding("O1", c(0, 0.0)), binding("W1", c(0.0, -1.0)), binding("T1", c(0.0, 0.0))]),
            uses([
              proof(
                goal(fft2([-1, -1], [c(-2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", -1), binding("X1", -1), binding("Y0", c(-2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(-1, 0.0)), binding("O0", c(-1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(c_add(c(-1, 0.0), c(-1, 0.0), c(-2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", -2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(-1, -1, -2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(-1, 0.0), c(-1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(-1, -1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(
                goal(fft2([-1, -1], [c(-2, 0.0), c(0, 0.0)])), by(rule("fft8-numeric.pl", clause(15))),
                bindings([binding("X0", -1), binding("X1", -1), binding("Y0", c(-2, 0.0)), binding("Y1", c(0, 0.0)), binding("E0", c(-1, 0.0)), binding("O0", c(-1, 0.0))]),
                uses([
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(fft1([-1], [c(-1, 0.0)])), by(fact("fft8-numeric.pl", clause(14))),
                    bindings([binding("X", -1)])
                  ),
                  proof(
                    goal(c_add(c(-1, 0.0), c(-1, 0.0), c(-2, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", -2), binding("CI", 0.0)]),
                    uses([
                      proof(goal(add(-1, -1, -2)), by(builtin(add, 3))),
                      proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(
                    goal(c_sub(c(-1, 0.0), c(-1, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                    bindings([binding("AR", -1), binding("AI", 0.0), binding("BR", -1), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                    uses([
                      proof(goal(sub(-1, -1, 0)), by(builtin(sub, 3))),
                      proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                    ])
                  )
                ])
              ),
              proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
              proof(
                goal(c_mul(c(0.0, -1.0), c(0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
                bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", 0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
                uses([
                  proof(goal(mul(0.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(mul(-1.0, 0, 0.0)), by(builtin(mul, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(-2, 0.0), c(-2, 0.0), c(-4, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", -2), binding("AI", 0.0), binding("BR", -2), binding("BI", 0.0), binding("CR", -4), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(-2, -2, -4)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_add(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(add(0, 0.0, 0.0)), by(builtin(add, 3))),
                  proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(-2, 0.0), c(-2, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", -2), binding("AI", 0.0), binding("BR", -2), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(-2, -2, 0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              ),
              proof(
                goal(c_sub(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
                bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
                uses([
                  proof(goal(sub(0, 0.0, 0.0)), by(builtin(sub, 3))),
                  proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
                ])
              )
            ])
          ),
          proof(goal(w8(1, c(0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(4)))),
          proof(goal(w8(2, c(0.0, -1.0))), by(fact("fft8-numeric.pl", clause(5)))),
          proof(goal(w8(3, c(-0.7071067811865476, -0.7071067811865476))), by(fact("fft8-numeric.pl", clause(6)))),
          proof(
            goal(c_mul(c(0.7071067811865476, -0.7071067811865476), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
            uses([
              proof(goal(mul(0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(0.0, -1.0), c(0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", 0.0), binding("AI", -1.0), binding("BR", 0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
            uses([
              proof(goal(mul(0.0, 0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(0.0, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-1.0, 0, 0.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_mul(c(-0.7071067811865476, -0.7071067811865476), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(13))),
            bindings([binding("AR", -0.7071067811865476), binding("AI", -0.7071067811865476), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0), binding("AC", 0.0), binding("BD", 0.0), binding("AD", 0.0), binding("BC", 0.0)]),
            uses([
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(mul(-0.7071067811865476, 0.0, 0.0)), by(builtin(mul, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(4, 0.0), c(-4, 0.0), c(0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(4, -4, 0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(0, 0.0, 0.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_add(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(11))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3))),
              proof(goal(add(0.0, 0.0, 0.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(4, 0.0), c(-4, 0.0), c(8, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 4), binding("AI", 0.0), binding("BR", -4), binding("BI", 0.0), binding("CR", 8), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(4, -4, 8)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(
            goal(c_sub(c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0))), by(rule("fft8-numeric.pl", clause(12))),
            bindings([binding("AR", 0.0), binding("AI", 0.0), binding("BR", 0.0), binding("BI", 0.0), binding("CR", 0.0), binding("CI", 0.0)]),
            uses([
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3))),
              proof(goal(sub(0.0, 0.0, 0.0)), by(builtin(sub, 3)))
            ])
          )
        ])
      )
    ])
  )
).

