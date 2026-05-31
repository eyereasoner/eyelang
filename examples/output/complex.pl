is(test, (complex_exponentiation(input(exponentiation, [-1, 0], [0.5, 0]), [6.123233995736766e-17, 1.0]), complex_exponentiation(input(exponentiation, [2.718281828459045, 0], [0, 3.141592653589793]), [-1.0, 1.2246467991473532e-16]), complex_exponentiation(input(exponentiation, [0, 1], [0, 1]), [0.20787957635076193, 0.0]), complex_exponentiation(input(exponentiation, [2.718281828459045, 0], [-1.57079632679, 0]), [0.20787957635177984, 0.0]), complex_asin(input(asin, [2, 0]), [1.5707963267948966, 1.3169578969248166]), complex_acos(input(acos, [2, 0]), [0.0, -1.3169578969248166]))).
why(
  is(test, (complex_exponentiation(input(exponentiation, [-1, 0], [0.5, 0]), [6.123233995736766e-17, 1.0]), complex_exponentiation(input(exponentiation, [2.718281828459045, 0], [0, 3.141592653589793]), [-1.0, 1.2246467991473532e-16]), complex_exponentiation(input(exponentiation, [0, 1], [0, 1]), [0.20787957635076193, 0.0]), complex_exponentiation(input(exponentiation, [2.718281828459045, 0], [-1.57079632679, 0]), [0.20787957635177984, 0.0]), complex_asin(input(asin, [2, 0]), [1.5707963267948966, 1.3169578969248166]), complex_acos(input(acos, [2, 0]), [0.0, -1.3169578969248166]))),
  proof(
    goal(is(test, (complex_exponentiation(input(exponentiation, [-1, 0], [0.5, 0]), [6.123233995736766e-17, 1.0]), complex_exponentiation(input(exponentiation, [2.718281828459045, 0], [0, 3.141592653589793]), [-1.0, 1.2246467991473532e-16]), complex_exponentiation(input(exponentiation, [0, 1], [0, 1]), [0.20787957635076193, 0.0]), complex_exponentiation(input(exponentiation, [2.718281828459045, 0], [-1.57079632679, 0]), [0.20787957635177984, 0.0]), complex_asin(input(asin, [2, 0]), [1.5707963267948966, 1.3169578969248166]), complex_acos(input(acos, [2, 0]), [0.0, -1.3169578969248166])))),
    by(rule("complex.pl", clause(12))),
    bindings([binding("C1", [6.123233995736766e-17, 1.0]), binding("C2", [-1.0, 1.2246467991473532e-16]), binding("C3", [0.20787957635076193, 0.0]), binding("C4", [0.20787957635177984, 0.0]), binding("C5", [1.5707963267948966, 1.3169578969248166]), binding("C6", [0.0, -1.3169578969248166])]),
    uses([
      proof(
        goal(complex_exponentiation([-1, 0], [0.5, 0], [6.123233995736766e-17, 1.0])),
        by(rule("complex.pl", clause(4))),
        bindings([binding("A", -1), binding("B", 0), binding("C", 0.5), binding("D", 0), binding("E", 6.123233995736766e-17), binding("F", 1.0), binding("R", 1.0), binding("T", 3.1415926535897931), binding("Z1", 1.0), binding("Z2", 0), binding("Z3", 0.0), binding("Euler", 2.718281828459045), binding("Z4", 1.0), binding("Z5", 0.0), binding("Z6", 0.0), binding("Z7", 1.5707963267948966), binding("Z8", 1.5707963267948966), binding("Z9", 6.123233995736766e-17), binding("Z1Z4", 1.0), binding("Z10", 1.0)]),
        uses([
          proof(
            goal(complex_polar([-1, 0], [1.0, 3.1415926535897931])),
            by(rule("complex.pl", clause(7))),
            bindings([binding("X", -1), binding("Y", 0), binding("R", 1.0), binding("Tp", 3.1415926535897931), binding("Z1", 1), binding("Z2", 0), binding("Z3", 1), binding("Z4", 1), binding("Z5", 1.0), binding("T", 0.0)]),
            uses([
              proof(
                goal(pow(-1, 2, 1)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(pow(0, 2, 0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(add(1, 0, 1)),
                by(builtin(add, 3))
              ),
              proof(
                goal(pow(1, 0.5, 1.0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(abs(-1, 1)),
                by(builtin(abs, 2))
              ),
              proof(
                goal(div(1, 1.0, 1.0)),
                by(builtin(div, 3))
              ),
              proof(
                goal(acos(1.0, 0.0)),
                by(builtin(acos, 2))
              ),
              proof(
                goal(complex_dial(-1, 0, 0.0, 3.1415926535897931)),
                by(rule("complex.pl", clause(9))),
                bindings([binding("X", -1), binding("Y", 0), binding("T", 0.0), binding("Tp", 3.1415926535897931), binding("Pi", 3.141592653589793)]),
                uses([
                  proof(
                    goal(lt(-1, 0)),
                    by(builtin(lt, 2))
                  ),
                  proof(
                    goal(ge(0, 0)),
                    by(builtin(ge, 2))
                  ),
                  proof(
                    goal(pi(3.141592653589793)),
                    by(fact("complex.pl", clause(2)))
                  ),
                  proof(
                    goal(sub(3.141592653589793, 0.0, 3.1415926535897931)),
                    by(builtin(sub, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(pow(1.0, 0.5, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(neg(0, 0)),
            by(builtin(neg, 2))
          ),
          proof(
            goal(mul(0, 3.1415926535897931, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(e(2.718281828459045)),
            by(fact("complex.pl", clause(3)))
          ),
          proof(
            goal(pow(2.718281828459045, 0.0, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(log(1.0, 0.0)),
            by(builtin(log, 2))
          ),
          proof(
            goal(mul(0, 0.0, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(0.5, 3.1415926535897931, 1.5707963267948966)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(0.0, 1.5707963267948966, 1.5707963267948966)),
            by(builtin(add, 3))
          ),
          proof(
            goal(cos(1.5707963267948966, 6.123233995736766e-17)),
            by(builtin(cos, 2))
          ),
          proof(
            goal(mul(1.0, 1.0, 1.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(1.0, 6.123233995736766e-17, 6.123233995736766e-17)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sin(1.5707963267948966, 1.0)),
            by(builtin(sin, 2))
          ),
          proof(
            goal(mul(1.0, 1.0, 1.0)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(complex_exponentiation([2.718281828459045, 0], [0, 3.141592653589793], [-1.0, 1.2246467991473532e-16])),
        by(rule("complex.pl", clause(4))),
        bindings([binding("A", 2.718281828459045), binding("B", 0), binding("C", 0), binding("D", 3.141592653589793), binding("E", -1.0), binding("F", 1.2246467991473532e-16), binding("R", 2.7182818284590451), binding("T", 0.0), binding("Z1", 1.0), binding("Z2", -3.1415926535897931), binding("Z3", 0.0), binding("Euler", 2.718281828459045), binding("Z4", 1.0), binding("Z5", 1.0), binding("Z6", 3.1415926535897931), binding("Z7", 0.0), binding("Z8", 3.1415926535897931), binding("Z9", -1.0), binding("Z1Z4", 1.0), binding("Z10", 1.2246467991473532e-16)]),
        uses([
          proof(
            goal(complex_polar([2.718281828459045, 0], [2.7182818284590451, 0.0])),
            by(rule("complex.pl", clause(7))),
            bindings([binding("X", 2.718281828459045), binding("Y", 0), binding("R", 2.7182818284590451), binding("Tp", 0.0), binding("Z1", 7.3890560989306495), binding("Z2", 0), binding("Z3", 7.3890560989306495), binding("Z4", 2.7182818284590451), binding("Z5", 1.0), binding("T", 0.0)]),
            uses([
              proof(
                goal(pow(2.718281828459045, 2, 7.3890560989306495)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(pow(0, 2, 0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(add(7.3890560989306495, 0, 7.3890560989306495)),
                by(builtin(add, 3))
              ),
              proof(
                goal(pow(7.3890560989306495, 0.5, 2.7182818284590451)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(abs(2.718281828459045, 2.7182818284590451)),
                by(builtin(abs, 2))
              ),
              proof(
                goal(div(2.7182818284590451, 2.7182818284590451, 1.0)),
                by(builtin(div, 3))
              ),
              proof(
                goal(acos(1.0, 0.0)),
                by(builtin(acos, 2))
              ),
              proof(
                goal(complex_dial(2.718281828459045, 0, 0.0, 0.0)),
                by(rule("complex.pl", clause(8))),
                bindings([binding("X", 2.718281828459045), binding("Y", 0), binding("T", 0.0), binding("Tp", 0.0)]),
                uses([
                  proof(
                    goal(ge(2.718281828459045, 0)),
                    by(builtin(ge, 2))
                  ),
                  proof(
                    goal(ge(0, 0)),
                    by(builtin(ge, 2))
                  ),
                  proof(
                    goal(add(0, 0.0, 0.0)),
                    by(builtin(add, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(pow(2.7182818284590451, 0, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(neg(3.141592653589793, -3.1415926535897931)),
            by(builtin(neg, 2))
          ),
          proof(
            goal(mul(-3.1415926535897931, 0.0, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(e(2.718281828459045)),
            by(fact("complex.pl", clause(3)))
          ),
          proof(
            goal(pow(2.718281828459045, 0.0, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(log(2.7182818284590451, 1.0)),
            by(builtin(log, 2))
          ),
          proof(
            goal(mul(3.141592653589793, 1.0, 3.1415926535897931)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(0, 0.0, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(3.1415926535897931, 0.0, 3.1415926535897931)),
            by(builtin(add, 3))
          ),
          proof(
            goal(cos(3.1415926535897931, -1.0)),
            by(builtin(cos, 2))
          ),
          proof(
            goal(mul(1.0, 1.0, 1.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(1.0, -1.0, -1.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sin(3.1415926535897931, 1.2246467991473532e-16)),
            by(builtin(sin, 2))
          ),
          proof(
            goal(mul(1.0, 1.2246467991473532e-16, 1.2246467991473532e-16)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(complex_exponentiation([0, 1], [0, 1], [0.20787957635076193, 0.0])),
        by(rule("complex.pl", clause(4))),
        bindings([binding("A", 0), binding("B", 1), binding("C", 0), binding("D", 1), binding("E", 0.20787957635076193), binding("F", 0.0), binding("R", 1.0), binding("T", 1.5707963267948966), binding("Z1", 1.0), binding("Z2", -1), binding("Z3", -1.5707963267948966), binding("Euler", 2.718281828459045), binding("Z4", 0.20787957635076193), binding("Z5", 0.0), binding("Z6", 0.0), binding("Z7", 0.0), binding("Z8", 0.0), binding("Z9", 1.0), binding("Z1Z4", 0.20787957635076193), binding("Z10", 0.0)]),
        uses([
          proof(
            goal(complex_polar([0, 1], [1.0, 1.5707963267948966])),
            by(rule("complex.pl", clause(7))),
            bindings([binding("X", 0), binding("Y", 1), binding("R", 1.0), binding("Tp", 1.5707963267948966), binding("Z1", 0), binding("Z2", 1), binding("Z3", 1), binding("Z4", 0), binding("Z5", 0.0), binding("T", 1.5707963267948966)]),
            uses([
              proof(
                goal(pow(0, 2, 0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(pow(1, 2, 1)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(add(0, 1, 1)),
                by(builtin(add, 3))
              ),
              proof(
                goal(pow(1, 0.5, 1.0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(abs(0, 0)),
                by(builtin(abs, 2))
              ),
              proof(
                goal(div(0, 1.0, 0.0)),
                by(builtin(div, 3))
              ),
              proof(
                goal(acos(0.0, 1.5707963267948966)),
                by(builtin(acos, 2))
              ),
              proof(
                goal(complex_dial(0, 1, 1.5707963267948966, 1.5707963267948966)),
                by(rule("complex.pl", clause(8))),
                bindings([binding("X", 0), binding("Y", 1), binding("T", 1.5707963267948966), binding("Tp", 1.5707963267948966)]),
                uses([
                  proof(
                    goal(ge(0, 0)),
                    by(builtin(ge, 2))
                  ),
                  proof(
                    goal(ge(1, 0)),
                    by(builtin(ge, 2))
                  ),
                  proof(
                    goal(add(0, 1.5707963267948966, 1.5707963267948966)),
                    by(builtin(add, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(pow(1.0, 0, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(neg(1, -1)),
            by(builtin(neg, 2))
          ),
          proof(
            goal(mul(-1, 1.5707963267948966, -1.5707963267948966)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(e(2.718281828459045)),
            by(fact("complex.pl", clause(3)))
          ),
          proof(
            goal(pow(2.718281828459045, -1.5707963267948966, 0.20787957635076193)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(log(1.0, 0.0)),
            by(builtin(log, 2))
          ),
          proof(
            goal(mul(1, 0.0, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(0, 1.5707963267948966, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(0.0, 0.0, 0.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(cos(0.0, 1.0)),
            by(builtin(cos, 2))
          ),
          proof(
            goal(mul(1.0, 0.20787957635076193, 0.20787957635076193)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(0.20787957635076193, 1.0, 0.20787957635076193)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sin(0.0, 0.0)),
            by(builtin(sin, 2))
          ),
          proof(
            goal(mul(0.20787957635076193, 0.0, 0.0)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(complex_exponentiation([2.718281828459045, 0], [-1.57079632679, 0], [0.20787957635177984, 0.0])),
        by(rule("complex.pl", clause(4))),
        bindings([binding("A", 2.718281828459045), binding("B", 0), binding("C", -1.57079632679), binding("D", 0), binding("E", 0.20787957635177984), binding("F", 0.0), binding("R", 2.7182818284590451), binding("T", 0.0), binding("Z1", 0.20787957635177984), binding("Z2", 0), binding("Z3", 0.0), binding("Euler", 2.718281828459045), binding("Z4", 1.0), binding("Z5", 1.0), binding("Z6", 0.0), binding("Z7", 0.0), binding("Z8", 0.0), binding("Z9", 1.0), binding("Z1Z4", 0.20787957635177984), binding("Z10", 0.0)]),
        uses([
          proof(
            goal(complex_polar([2.718281828459045, 0], [2.7182818284590451, 0.0])),
            by(rule("complex.pl", clause(7))),
            bindings([binding("X", 2.718281828459045), binding("Y", 0), binding("R", 2.7182818284590451), binding("Tp", 0.0), binding("Z1", 7.3890560989306495), binding("Z2", 0), binding("Z3", 7.3890560989306495), binding("Z4", 2.7182818284590451), binding("Z5", 1.0), binding("T", 0.0)]),
            uses([
              proof(
                goal(pow(2.718281828459045, 2, 7.3890560989306495)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(pow(0, 2, 0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(add(7.3890560989306495, 0, 7.3890560989306495)),
                by(builtin(add, 3))
              ),
              proof(
                goal(pow(7.3890560989306495, 0.5, 2.7182818284590451)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(abs(2.718281828459045, 2.7182818284590451)),
                by(builtin(abs, 2))
              ),
              proof(
                goal(div(2.7182818284590451, 2.7182818284590451, 1.0)),
                by(builtin(div, 3))
              ),
              proof(
                goal(acos(1.0, 0.0)),
                by(builtin(acos, 2))
              ),
              proof(
                goal(complex_dial(2.718281828459045, 0, 0.0, 0.0)),
                by(rule("complex.pl", clause(8))),
                bindings([binding("X", 2.718281828459045), binding("Y", 0), binding("T", 0.0), binding("Tp", 0.0)]),
                uses([
                  proof(
                    goal(ge(2.718281828459045, 0)),
                    by(builtin(ge, 2))
                  ),
                  proof(
                    goal(ge(0, 0)),
                    by(builtin(ge, 2))
                  ),
                  proof(
                    goal(add(0, 0.0, 0.0)),
                    by(builtin(add, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(pow(2.7182818284590451, -1.57079632679, 0.20787957635177984)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(neg(0, 0)),
            by(builtin(neg, 2))
          ),
          proof(
            goal(mul(0, 0.0, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(e(2.718281828459045)),
            by(fact("complex.pl", clause(3)))
          ),
          proof(
            goal(pow(2.718281828459045, 0.0, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(log(2.7182818284590451, 1.0)),
            by(builtin(log, 2))
          ),
          proof(
            goal(mul(0, 1.0, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(-1.57079632679, 0.0, 0.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(0.0, 0.0, 0.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(cos(0.0, 1.0)),
            by(builtin(cos, 2))
          ),
          proof(
            goal(mul(0.20787957635177984, 1.0, 0.20787957635177984)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(0.20787957635177984, 1.0, 0.20787957635177984)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sin(0.0, 0.0)),
            by(builtin(sin, 2))
          ),
          proof(
            goal(mul(0.20787957635177984, 0.0, 0.0)),
            by(builtin(mul, 3))
          )
        ])
      ),
      proof(
        goal(complex_asin([2, 0], [1.5707963267948966, 1.3169578969248166])),
        by(rule("complex.pl", clause(5))),
        bindings([binding("A", 2), binding("B", 0), binding("C", 1.5707963267948966), binding("D", 1.3169578969248166), binding("Z1", 3), binding("Z2", 9), binding("Z3", 0), binding("Z4", 9), binding("Z5", 3.0), binding("Z6", -1), binding("Z7", 1), binding("Z8", 1), binding("Z9", 1.0), binding("Z10", 2.0), binding("E", 1.0), binding("Z11", 4.0), binding("F", 2.0), binding("Z12", 4.0), binding("Z13", 3.0), binding("Z14", 1.7320508075688772), binding("Z15", 3.7320508075688772)]),
        uses([
          proof(
            goal(add(1, 2, 3)),
            by(builtin(add, 3))
          ),
          proof(
            goal(pow(3, 2, 9)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(pow(0, 2, 0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(add(9, 0, 9)),
            by(builtin(add, 3))
          ),
          proof(
            goal(pow(9, 0.5, 3.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(sub(1, 2, -1)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(pow(-1, 2, 1)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(add(1, 0, 1)),
            by(builtin(add, 3))
          ),
          proof(
            goal(pow(1, 0.5, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(sub(3.0, 1.0, 2.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(div(2.0, 2, 1.0)),
            by(builtin(div, 3))
          ),
          proof(
            goal(add(3.0, 1.0, 4.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(div(4.0, 2, 2.0)),
            by(builtin(div, 3))
          ),
          proof(
            goal(asin(1.0, 1.5707963267948966)),
            by(builtin(asin, 2))
          ),
          proof(
            goal(pow(2.0, 2, 4.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(sub(4.0, 1, 3.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(pow(3.0, 0.5, 1.7320508075688772)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(add(2.0, 1.7320508075688772, 3.7320508075688772)),
            by(builtin(add, 3))
          ),
          proof(
            goal(log(3.7320508075688772, 1.3169578969248166)),
            by(builtin(log, 2))
          )
        ])
      ),
      proof(
        goal(complex_acos([2, 0], [0.0, -1.3169578969248166])),
        by(rule("complex.pl", clause(6))),
        bindings([binding("A", 2), binding("B", 0), binding("C", 0.0), binding("D", -1.3169578969248166), binding("Z1", 3), binding("Z2", 9), binding("Z3", 0), binding("Z4", 9), binding("Z5", 3.0), binding("Z6", -1), binding("Z7", 1), binding("Z8", 1), binding("Z9", 1.0), binding("Z10", 2.0), binding("E", 1.0), binding("Z11", 4.0), binding("F", 2.0), binding("Z12", 4.0), binding("Z13", 3.0), binding("Z14", 1.7320508075688772), binding("Z15", 3.7320508075688772), binding("U", 1.3169578969248166)]),
        uses([
          proof(
            goal(add(1, 2, 3)),
            by(builtin(add, 3))
          ),
          proof(
            goal(pow(3, 2, 9)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(pow(0, 2, 0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(add(9, 0, 9)),
            by(builtin(add, 3))
          ),
          proof(
            goal(pow(9, 0.5, 3.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(sub(1, 2, -1)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(pow(-1, 2, 1)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(add(1, 0, 1)),
            by(builtin(add, 3))
          ),
          proof(
            goal(pow(1, 0.5, 1.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(sub(3.0, 1.0, 2.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(div(2.0, 2, 1.0)),
            by(builtin(div, 3))
          ),
          proof(
            goal(add(3.0, 1.0, 4.0)),
            by(builtin(add, 3))
          ),
          proof(
            goal(div(4.0, 2, 2.0)),
            by(builtin(div, 3))
          ),
          proof(
            goal(acos(1.0, 0.0)),
            by(builtin(acos, 2))
          ),
          proof(
            goal(pow(2.0, 2, 4.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(sub(4.0, 1, 3.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(pow(3.0, 0.5, 1.7320508075688772)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(add(2.0, 1.7320508075688772, 3.7320508075688772)),
            by(builtin(add, 3))
          ),
          proof(
            goal(log(3.7320508075688772, 1.3169578969248166)),
            by(builtin(log, 2))
          ),
          proof(
            goal(neg(1.3169578969248166, -1.3169578969248166)),
            by(builtin(neg, 2))
          )
        ])
      )
    ])
  )
).

