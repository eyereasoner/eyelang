gcd(c1, 6).
why(
  gcd(c1, 6),
  proof(
    goal(gcd(c1, 6)),
    by(rule("gcd-bezout-identity.pl", clause(15))),
    bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3)]),
    uses([
      proof(
        goal(answer(c1, 6, -1, 3)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
        uses([
          proof(
            goal(case(c1, 48, 18)),
            by(fact("gcd-bezout-identity.pl", clause(5)))
          ),
          proof(
            goal(extended_gcd(48, 18, 6, -1, 3)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

gcd(c2, 1).
why(
  gcd(c2, 1),
  proof(
    goal(gcd(c2, 1)),
    by(rule("gcd-bezout-identity.pl", clause(15))),
    bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47)]),
    uses([
      proof(
        goal(answer(c2, 1, 215, -47)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
        uses([
          proof(
            goal(case(c2, 101, 462)),
            by(fact("gcd-bezout-identity.pl", clause(6)))
          ),
          proof(
            goal(extended_gcd(101, 462, 1, 215, -47)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

gcd(c3, 5).
why(
  gcd(c3, 5),
  proof(
    goal(gcd(c3, 5)),
    by(rule("gcd-bezout-identity.pl", clause(15))),
    bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1)]),
    uses([
      proof(
        goal(answer(c3, 5, 0, 1)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
        uses([
          proof(
            goal(case(c3, 0, 5)),
            by(fact("gcd-bezout-identity.pl", clause(7)))
          ),
          proof(
            goal(extended_gcd(0, 5, 5, 0, 1)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

gcd(c4, 6).
why(
  gcd(c4, 6),
  proof(
    goal(gcd(c4, 6)),
    by(rule("gcd-bezout-identity.pl", clause(15))),
    bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7)]),
    uses([
      proof(
        goal(answer(c4, 6, 5, -7)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
        uses([
          proof(
            goal(case(c4, 270, 192)),
            by(fact("gcd-bezout-identity.pl", clause(8)))
          ),
          proof(
            goal(extended_gcd(270, 192, 6, 5, -7)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

gcd(c5, 9).
why(
  gcd(c5, 9),
  proof(
    goal(gcd(c5, 9)),
    by(rule("gcd-bezout-identity.pl", clause(15))),
    bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1)]),
    uses([
      proof(
        goal(answer(c5, 9, 1, 1)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
        uses([
          proof(
            goal(case(c5, -27, 36)),
            by(fact("gcd-bezout-identity.pl", clause(9)))
          ),
          proof(
            goal(extended_gcd(-27, 36, 9, 1, 1)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

gcd(c6, 6).
why(
  gcd(c6, 6),
  proof(
    goal(gcd(c6, 6)),
    by(rule("gcd-bezout-identity.pl", clause(15))),
    bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155)]),
    uses([
      proof(
        goal(answer(c6, 6, -649, 10155)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
        uses([
          proof(
            goal(case(c6, 123456, 7890)),
            by(fact("gcd-bezout-identity.pl", clause(10)))
          ),
          proof(
            goal(extended_gcd(123456, 7890, 6, -649, 10155)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

bezoutCoefficients(c1, [-1, 3]).
why(
  bezoutCoefficients(c1, [-1, 3]),
  proof(
    goal(bezoutCoefficients(c1, [-1, 3])),
    by(rule("gcd-bezout-identity.pl", clause(16))),
    bindings([binding("Case", c1), binding("S", -1), binding("T", 3), binding("Gcd", 6)]),
    uses([
      proof(
        goal(answer(c1, 6, -1, 3)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
        uses([
          proof(
            goal(case(c1, 48, 18)),
            by(fact("gcd-bezout-identity.pl", clause(5)))
          ),
          proof(
            goal(extended_gcd(48, 18, 6, -1, 3)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

bezoutCoefficients(c2, [215, -47]).
why(
  bezoutCoefficients(c2, [215, -47]),
  proof(
    goal(bezoutCoefficients(c2, [215, -47])),
    by(rule("gcd-bezout-identity.pl", clause(16))),
    bindings([binding("Case", c2), binding("S", 215), binding("T", -47), binding("Gcd", 1)]),
    uses([
      proof(
        goal(answer(c2, 1, 215, -47)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
        uses([
          proof(
            goal(case(c2, 101, 462)),
            by(fact("gcd-bezout-identity.pl", clause(6)))
          ),
          proof(
            goal(extended_gcd(101, 462, 1, 215, -47)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

bezoutCoefficients(c3, [0, 1]).
why(
  bezoutCoefficients(c3, [0, 1]),
  proof(
    goal(bezoutCoefficients(c3, [0, 1])),
    by(rule("gcd-bezout-identity.pl", clause(16))),
    bindings([binding("Case", c3), binding("S", 0), binding("T", 1), binding("Gcd", 5)]),
    uses([
      proof(
        goal(answer(c3, 5, 0, 1)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
        uses([
          proof(
            goal(case(c3, 0, 5)),
            by(fact("gcd-bezout-identity.pl", clause(7)))
          ),
          proof(
            goal(extended_gcd(0, 5, 5, 0, 1)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

bezoutCoefficients(c4, [5, -7]).
why(
  bezoutCoefficients(c4, [5, -7]),
  proof(
    goal(bezoutCoefficients(c4, [5, -7])),
    by(rule("gcd-bezout-identity.pl", clause(16))),
    bindings([binding("Case", c4), binding("S", 5), binding("T", -7), binding("Gcd", 6)]),
    uses([
      proof(
        goal(answer(c4, 6, 5, -7)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
        uses([
          proof(
            goal(case(c4, 270, 192)),
            by(fact("gcd-bezout-identity.pl", clause(8)))
          ),
          proof(
            goal(extended_gcd(270, 192, 6, 5, -7)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

bezoutCoefficients(c5, [1, 1]).
why(
  bezoutCoefficients(c5, [1, 1]),
  proof(
    goal(bezoutCoefficients(c5, [1, 1])),
    by(rule("gcd-bezout-identity.pl", clause(16))),
    bindings([binding("Case", c5), binding("S", 1), binding("T", 1), binding("Gcd", 9)]),
    uses([
      proof(
        goal(answer(c5, 9, 1, 1)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
        uses([
          proof(
            goal(case(c5, -27, 36)),
            by(fact("gcd-bezout-identity.pl", clause(9)))
          ),
          proof(
            goal(extended_gcd(-27, 36, 9, 1, 1)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

bezoutCoefficients(c6, [-649, 10155]).
why(
  bezoutCoefficients(c6, [-649, 10155]),
  proof(
    goal(bezoutCoefficients(c6, [-649, 10155])),
    by(rule("gcd-bezout-identity.pl", clause(16))),
    bindings([binding("Case", c6), binding("S", -649), binding("T", 10155), binding("Gcd", 6)]),
    uses([
      proof(
        goal(answer(c6, 6, -649, 10155)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
        uses([
          proof(
            goal(case(c6, 123456, 7890)),
            by(fact("gcd-bezout-identity.pl", clause(10)))
          ),
          proof(
            goal(extended_gcd(123456, 7890, 6, -649, 10155)),
            by(builtin(extended_gcd, 5))
          )
        ])
      )
    ])
  )
).

check(c1, bezout_identity).
why(
  check(c1, bezout_identity),
  proof(
    goal(check(c1, bezout_identity)),
    by(rule("gcd-bezout-identity.pl", clause(17))),
    bindings([binding("Case", c1)]),
    uses([
      proof(
        goal(bezout_ok(c1)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c1), binding("A", 48), binding("B", 18), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("AS", -48), binding("BT", 54)]),
        uses([
          proof(
            goal(case(c1, 48, 18)),
            by(fact("gcd-bezout-identity.pl", clause(5)))
          ),
          proof(
            goal(answer(c1, 6, -1, 3)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
            uses([
              proof(
                goal(case(c1, 48, 18)),
                by(fact("gcd-bezout-identity.pl", clause(5)))
              ),
              proof(
                goal(extended_gcd(48, 18, 6, -1, 3)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(48, -1, -48)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(18, 3, 54)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(-48, 54, 6)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

check(c2, bezout_identity).
why(
  check(c2, bezout_identity),
  proof(
    goal(check(c2, bezout_identity)),
    by(rule("gcd-bezout-identity.pl", clause(17))),
    bindings([binding("Case", c2)]),
    uses([
      proof(
        goal(bezout_ok(c2)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c2), binding("A", 101), binding("B", 462), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("AS", 21715), binding("BT", -21714)]),
        uses([
          proof(
            goal(case(c2, 101, 462)),
            by(fact("gcd-bezout-identity.pl", clause(6)))
          ),
          proof(
            goal(answer(c2, 1, 215, -47)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
            uses([
              proof(
                goal(case(c2, 101, 462)),
                by(fact("gcd-bezout-identity.pl", clause(6)))
              ),
              proof(
                goal(extended_gcd(101, 462, 1, 215, -47)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(101, 215, 21715)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(462, -47, -21714)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(21715, -21714, 1)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

check(c3, bezout_identity).
why(
  check(c3, bezout_identity),
  proof(
    goal(check(c3, bezout_identity)),
    by(rule("gcd-bezout-identity.pl", clause(17))),
    bindings([binding("Case", c3)]),
    uses([
      proof(
        goal(bezout_ok(c3)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c3), binding("A", 0), binding("B", 5), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("AS", 0), binding("BT", 5)]),
        uses([
          proof(
            goal(case(c3, 0, 5)),
            by(fact("gcd-bezout-identity.pl", clause(7)))
          ),
          proof(
            goal(answer(c3, 5, 0, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
            uses([
              proof(
                goal(case(c3, 0, 5)),
                by(fact("gcd-bezout-identity.pl", clause(7)))
              ),
              proof(
                goal(extended_gcd(0, 5, 5, 0, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(0, 0, 0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(5, 1, 5)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(0, 5, 5)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

check(c4, bezout_identity).
why(
  check(c4, bezout_identity),
  proof(
    goal(check(c4, bezout_identity)),
    by(rule("gcd-bezout-identity.pl", clause(17))),
    bindings([binding("Case", c4)]),
    uses([
      proof(
        goal(bezout_ok(c4)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c4), binding("A", 270), binding("B", 192), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("AS", 1350), binding("BT", -1344)]),
        uses([
          proof(
            goal(case(c4, 270, 192)),
            by(fact("gcd-bezout-identity.pl", clause(8)))
          ),
          proof(
            goal(answer(c4, 6, 5, -7)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
            uses([
              proof(
                goal(case(c4, 270, 192)),
                by(fact("gcd-bezout-identity.pl", clause(8)))
              ),
              proof(
                goal(extended_gcd(270, 192, 6, 5, -7)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(270, 5, 1350)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(192, -7, -1344)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(1350, -1344, 6)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

check(c5, bezout_identity).
why(
  check(c5, bezout_identity),
  proof(
    goal(check(c5, bezout_identity)),
    by(rule("gcd-bezout-identity.pl", clause(17))),
    bindings([binding("Case", c5)]),
    uses([
      proof(
        goal(bezout_ok(c5)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c5), binding("A", -27), binding("B", 36), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("AS", -27), binding("BT", 36)]),
        uses([
          proof(
            goal(case(c5, -27, 36)),
            by(fact("gcd-bezout-identity.pl", clause(9)))
          ),
          proof(
            goal(answer(c5, 9, 1, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
            uses([
              proof(
                goal(case(c5, -27, 36)),
                by(fact("gcd-bezout-identity.pl", clause(9)))
              ),
              proof(
                goal(extended_gcd(-27, 36, 9, 1, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(-27, 1, -27)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(36, 1, 36)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(-27, 36, 9)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

check(c6, bezout_identity).
why(
  check(c6, bezout_identity),
  proof(
    goal(check(c6, bezout_identity)),
    by(rule("gcd-bezout-identity.pl", clause(17))),
    bindings([binding("Case", c6)]),
    uses([
      proof(
        goal(bezout_ok(c6)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c6), binding("A", 123456), binding("B", 7890), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("AS", -80122944), binding("BT", 80122950)]),
        uses([
          proof(
            goal(case(c6, 123456, 7890)),
            by(fact("gcd-bezout-identity.pl", clause(10)))
          ),
          proof(
            goal(answer(c6, 6, -649, 10155)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
            uses([
              proof(
                goal(case(c6, 123456, 7890)),
                by(fact("gcd-bezout-identity.pl", clause(10)))
              ),
              proof(
                goal(extended_gcd(123456, 7890, 6, -649, 10155)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(123456, -649, -80122944)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(7890, 10155, 80122950)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(-80122944, 80122950, 6)),
            by(builtin(add, 3))
          )
        ])
      )
    ])
  )
).

check(c1, divides_inputs).
why(
  check(c1, divides_inputs),
  proof(
    goal(check(c1, divides_inputs)),
    by(rule("gcd-bezout-identity.pl", clause(18))),
    bindings([binding("Case", c1)]),
    uses([
      proof(
        goal(divides_ok(c1)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c1), binding("A", 48), binding("B", 18), binding("Gcd", 6), binding("S", -1), binding("T", 3)]),
        uses([
          proof(
            goal(case(c1, 48, 18)),
            by(fact("gcd-bezout-identity.pl", clause(5)))
          ),
          proof(
            goal(answer(c1, 6, -1, 3)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
            uses([
              proof(
                goal(case(c1, 48, 18)),
                by(fact("gcd-bezout-identity.pl", clause(5)))
              ),
              proof(
                goal(extended_gcd(48, 18, 6, -1, 3)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(48, 6, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(18, 6, 0)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

check(c2, divides_inputs).
why(
  check(c2, divides_inputs),
  proof(
    goal(check(c2, divides_inputs)),
    by(rule("gcd-bezout-identity.pl", clause(18))),
    bindings([binding("Case", c2)]),
    uses([
      proof(
        goal(divides_ok(c2)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c2), binding("A", 101), binding("B", 462), binding("Gcd", 1), binding("S", 215), binding("T", -47)]),
        uses([
          proof(
            goal(case(c2, 101, 462)),
            by(fact("gcd-bezout-identity.pl", clause(6)))
          ),
          proof(
            goal(answer(c2, 1, 215, -47)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
            uses([
              proof(
                goal(case(c2, 101, 462)),
                by(fact("gcd-bezout-identity.pl", clause(6)))
              ),
              proof(
                goal(extended_gcd(101, 462, 1, 215, -47)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(101, 1, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(462, 1, 0)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

check(c3, divides_inputs).
why(
  check(c3, divides_inputs),
  proof(
    goal(check(c3, divides_inputs)),
    by(rule("gcd-bezout-identity.pl", clause(18))),
    bindings([binding("Case", c3)]),
    uses([
      proof(
        goal(divides_ok(c3)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c3), binding("A", 0), binding("B", 5), binding("Gcd", 5), binding("S", 0), binding("T", 1)]),
        uses([
          proof(
            goal(case(c3, 0, 5)),
            by(fact("gcd-bezout-identity.pl", clause(7)))
          ),
          proof(
            goal(answer(c3, 5, 0, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
            uses([
              proof(
                goal(case(c3, 0, 5)),
                by(fact("gcd-bezout-identity.pl", clause(7)))
              ),
              proof(
                goal(extended_gcd(0, 5, 5, 0, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(0, 5, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(5, 5, 0)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

check(c4, divides_inputs).
why(
  check(c4, divides_inputs),
  proof(
    goal(check(c4, divides_inputs)),
    by(rule("gcd-bezout-identity.pl", clause(18))),
    bindings([binding("Case", c4)]),
    uses([
      proof(
        goal(divides_ok(c4)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c4), binding("A", 270), binding("B", 192), binding("Gcd", 6), binding("S", 5), binding("T", -7)]),
        uses([
          proof(
            goal(case(c4, 270, 192)),
            by(fact("gcd-bezout-identity.pl", clause(8)))
          ),
          proof(
            goal(answer(c4, 6, 5, -7)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
            uses([
              proof(
                goal(case(c4, 270, 192)),
                by(fact("gcd-bezout-identity.pl", clause(8)))
              ),
              proof(
                goal(extended_gcd(270, 192, 6, 5, -7)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(270, 6, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(192, 6, 0)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

check(c5, divides_inputs).
why(
  check(c5, divides_inputs),
  proof(
    goal(check(c5, divides_inputs)),
    by(rule("gcd-bezout-identity.pl", clause(18))),
    bindings([binding("Case", c5)]),
    uses([
      proof(
        goal(divides_ok(c5)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c5), binding("A", -27), binding("B", 36), binding("Gcd", 9), binding("S", 1), binding("T", 1)]),
        uses([
          proof(
            goal(case(c5, -27, 36)),
            by(fact("gcd-bezout-identity.pl", clause(9)))
          ),
          proof(
            goal(answer(c5, 9, 1, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
            uses([
              proof(
                goal(case(c5, -27, 36)),
                by(fact("gcd-bezout-identity.pl", clause(9)))
              ),
              proof(
                goal(extended_gcd(-27, 36, 9, 1, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(-27, 9, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(36, 9, 0)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

check(c6, divides_inputs).
why(
  check(c6, divides_inputs),
  proof(
    goal(check(c6, divides_inputs)),
    by(rule("gcd-bezout-identity.pl", clause(18))),
    bindings([binding("Case", c6)]),
    uses([
      proof(
        goal(divides_ok(c6)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c6), binding("A", 123456), binding("B", 7890), binding("Gcd", 6), binding("S", -649), binding("T", 10155)]),
        uses([
          proof(
            goal(case(c6, 123456, 7890)),
            by(fact("gcd-bezout-identity.pl", clause(10)))
          ),
          proof(
            goal(answer(c6, 6, -649, 10155)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
            uses([
              proof(
                goal(case(c6, 123456, 7890)),
                by(fact("gcd-bezout-identity.pl", clause(10)))
              ),
              proof(
                goal(extended_gcd(123456, 7890, 6, -649, 10155)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(123456, 6, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(7890, 6, 0)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

check(c1, nonnegative_gcd).
why(
  check(c1, nonnegative_gcd),
  proof(
    goal(check(c1, nonnegative_gcd)),
    by(rule("gcd-bezout-identity.pl", clause(19))),
    bindings([binding("Case", c1)]),
    uses([
      proof(
        goal(nonnegative_ok(c1)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3)]),
        uses([
          proof(
            goal(answer(c1, 6, -1, 3)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
            uses([
              proof(
                goal(case(c1, 48, 18)),
                by(fact("gcd-bezout-identity.pl", clause(5)))
              ),
              proof(
                goal(extended_gcd(48, 18, 6, -1, 3)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(6, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

check(c2, nonnegative_gcd).
why(
  check(c2, nonnegative_gcd),
  proof(
    goal(check(c2, nonnegative_gcd)),
    by(rule("gcd-bezout-identity.pl", clause(19))),
    bindings([binding("Case", c2)]),
    uses([
      proof(
        goal(nonnegative_ok(c2)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47)]),
        uses([
          proof(
            goal(answer(c2, 1, 215, -47)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
            uses([
              proof(
                goal(case(c2, 101, 462)),
                by(fact("gcd-bezout-identity.pl", clause(6)))
              ),
              proof(
                goal(extended_gcd(101, 462, 1, 215, -47)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(1, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

check(c3, nonnegative_gcd).
why(
  check(c3, nonnegative_gcd),
  proof(
    goal(check(c3, nonnegative_gcd)),
    by(rule("gcd-bezout-identity.pl", clause(19))),
    bindings([binding("Case", c3)]),
    uses([
      proof(
        goal(nonnegative_ok(c3)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1)]),
        uses([
          proof(
            goal(answer(c3, 5, 0, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
            uses([
              proof(
                goal(case(c3, 0, 5)),
                by(fact("gcd-bezout-identity.pl", clause(7)))
              ),
              proof(
                goal(extended_gcd(0, 5, 5, 0, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(5, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

check(c4, nonnegative_gcd).
why(
  check(c4, nonnegative_gcd),
  proof(
    goal(check(c4, nonnegative_gcd)),
    by(rule("gcd-bezout-identity.pl", clause(19))),
    bindings([binding("Case", c4)]),
    uses([
      proof(
        goal(nonnegative_ok(c4)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7)]),
        uses([
          proof(
            goal(answer(c4, 6, 5, -7)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
            uses([
              proof(
                goal(case(c4, 270, 192)),
                by(fact("gcd-bezout-identity.pl", clause(8)))
              ),
              proof(
                goal(extended_gcd(270, 192, 6, 5, -7)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(6, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

check(c5, nonnegative_gcd).
why(
  check(c5, nonnegative_gcd),
  proof(
    goal(check(c5, nonnegative_gcd)),
    by(rule("gcd-bezout-identity.pl", clause(19))),
    bindings([binding("Case", c5)]),
    uses([
      proof(
        goal(nonnegative_ok(c5)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1)]),
        uses([
          proof(
            goal(answer(c5, 9, 1, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
            uses([
              proof(
                goal(case(c5, -27, 36)),
                by(fact("gcd-bezout-identity.pl", clause(9)))
              ),
              proof(
                goal(extended_gcd(-27, 36, 9, 1, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(9, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

check(c6, nonnegative_gcd).
why(
  check(c6, nonnegative_gcd),
  proof(
    goal(check(c6, nonnegative_gcd)),
    by(rule("gcd-bezout-identity.pl", clause(19))),
    bindings([binding("Case", c6)]),
    uses([
      proof(
        goal(nonnegative_ok(c6)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155)]),
        uses([
          proof(
            goal(answer(c6, 6, -649, 10155)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
            uses([
              proof(
                goal(case(c6, 123456, 7890)),
                by(fact("gcd-bezout-identity.pl", clause(10)))
              ),
              proof(
                goal(extended_gcd(123456, 7890, 6, -649, 10155)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(6, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

status(c1, done).
why(
  status(c1, done),
  proof(
    goal(status(c1, done)),
    by(rule("gcd-bezout-identity.pl", clause(20))),
    bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3)]),
    uses([
      proof(
        goal(answer(c1, 6, -1, 3)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
        uses([
          proof(
            goal(case(c1, 48, 18)),
            by(fact("gcd-bezout-identity.pl", clause(5)))
          ),
          proof(
            goal(extended_gcd(48, 18, 6, -1, 3)),
            by(builtin(extended_gcd, 5))
          )
        ])
      ),
      proof(
        goal(bezout_ok(c1)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c1), binding("A", 48), binding("B", 18), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("AS", -48), binding("BT", 54)]),
        uses([
          proof(
            goal(case(c1, 48, 18)),
            by(fact("gcd-bezout-identity.pl", clause(5)))
          ),
          proof(
            goal(answer(c1, 6, -1, 3)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
            uses([
              proof(
                goal(case(c1, 48, 18)),
                by(fact("gcd-bezout-identity.pl", clause(5)))
              ),
              proof(
                goal(extended_gcd(48, 18, 6, -1, 3)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(48, -1, -48)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(18, 3, 54)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(-48, 54, 6)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(divides_ok(c1)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c1), binding("A", 48), binding("B", 18), binding("Gcd", 6), binding("S", -1), binding("T", 3)]),
        uses([
          proof(
            goal(case(c1, 48, 18)),
            by(fact("gcd-bezout-identity.pl", clause(5)))
          ),
          proof(
            goal(answer(c1, 6, -1, 3)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
            uses([
              proof(
                goal(case(c1, 48, 18)),
                by(fact("gcd-bezout-identity.pl", clause(5)))
              ),
              proof(
                goal(extended_gcd(48, 18, 6, -1, 3)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(48, 6, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(18, 6, 0)),
            by(builtin(mod, 3))
          )
        ])
      ),
      proof(
        goal(nonnegative_ok(c1)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3)]),
        uses([
          proof(
            goal(answer(c1, 6, -1, 3)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c1), binding("Gcd", 6), binding("S", -1), binding("T", 3), binding("A", 48), binding("B", 18)]),
            uses([
              proof(
                goal(case(c1, 48, 18)),
                by(fact("gcd-bezout-identity.pl", clause(5)))
              ),
              proof(
                goal(extended_gcd(48, 18, 6, -1, 3)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(6, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

status(c2, done).
why(
  status(c2, done),
  proof(
    goal(status(c2, done)),
    by(rule("gcd-bezout-identity.pl", clause(20))),
    bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47)]),
    uses([
      proof(
        goal(answer(c2, 1, 215, -47)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
        uses([
          proof(
            goal(case(c2, 101, 462)),
            by(fact("gcd-bezout-identity.pl", clause(6)))
          ),
          proof(
            goal(extended_gcd(101, 462, 1, 215, -47)),
            by(builtin(extended_gcd, 5))
          )
        ])
      ),
      proof(
        goal(bezout_ok(c2)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c2), binding("A", 101), binding("B", 462), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("AS", 21715), binding("BT", -21714)]),
        uses([
          proof(
            goal(case(c2, 101, 462)),
            by(fact("gcd-bezout-identity.pl", clause(6)))
          ),
          proof(
            goal(answer(c2, 1, 215, -47)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
            uses([
              proof(
                goal(case(c2, 101, 462)),
                by(fact("gcd-bezout-identity.pl", clause(6)))
              ),
              proof(
                goal(extended_gcd(101, 462, 1, 215, -47)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(101, 215, 21715)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(462, -47, -21714)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(21715, -21714, 1)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(divides_ok(c2)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c2), binding("A", 101), binding("B", 462), binding("Gcd", 1), binding("S", 215), binding("T", -47)]),
        uses([
          proof(
            goal(case(c2, 101, 462)),
            by(fact("gcd-bezout-identity.pl", clause(6)))
          ),
          proof(
            goal(answer(c2, 1, 215, -47)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
            uses([
              proof(
                goal(case(c2, 101, 462)),
                by(fact("gcd-bezout-identity.pl", clause(6)))
              ),
              proof(
                goal(extended_gcd(101, 462, 1, 215, -47)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(101, 1, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(462, 1, 0)),
            by(builtin(mod, 3))
          )
        ])
      ),
      proof(
        goal(nonnegative_ok(c2)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47)]),
        uses([
          proof(
            goal(answer(c2, 1, 215, -47)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c2), binding("Gcd", 1), binding("S", 215), binding("T", -47), binding("A", 101), binding("B", 462)]),
            uses([
              proof(
                goal(case(c2, 101, 462)),
                by(fact("gcd-bezout-identity.pl", clause(6)))
              ),
              proof(
                goal(extended_gcd(101, 462, 1, 215, -47)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(1, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

status(c3, done).
why(
  status(c3, done),
  proof(
    goal(status(c3, done)),
    by(rule("gcd-bezout-identity.pl", clause(20))),
    bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1)]),
    uses([
      proof(
        goal(answer(c3, 5, 0, 1)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
        uses([
          proof(
            goal(case(c3, 0, 5)),
            by(fact("gcd-bezout-identity.pl", clause(7)))
          ),
          proof(
            goal(extended_gcd(0, 5, 5, 0, 1)),
            by(builtin(extended_gcd, 5))
          )
        ])
      ),
      proof(
        goal(bezout_ok(c3)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c3), binding("A", 0), binding("B", 5), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("AS", 0), binding("BT", 5)]),
        uses([
          proof(
            goal(case(c3, 0, 5)),
            by(fact("gcd-bezout-identity.pl", clause(7)))
          ),
          proof(
            goal(answer(c3, 5, 0, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
            uses([
              proof(
                goal(case(c3, 0, 5)),
                by(fact("gcd-bezout-identity.pl", clause(7)))
              ),
              proof(
                goal(extended_gcd(0, 5, 5, 0, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(0, 0, 0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(5, 1, 5)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(0, 5, 5)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(divides_ok(c3)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c3), binding("A", 0), binding("B", 5), binding("Gcd", 5), binding("S", 0), binding("T", 1)]),
        uses([
          proof(
            goal(case(c3, 0, 5)),
            by(fact("gcd-bezout-identity.pl", clause(7)))
          ),
          proof(
            goal(answer(c3, 5, 0, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
            uses([
              proof(
                goal(case(c3, 0, 5)),
                by(fact("gcd-bezout-identity.pl", clause(7)))
              ),
              proof(
                goal(extended_gcd(0, 5, 5, 0, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(0, 5, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(5, 5, 0)),
            by(builtin(mod, 3))
          )
        ])
      ),
      proof(
        goal(nonnegative_ok(c3)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1)]),
        uses([
          proof(
            goal(answer(c3, 5, 0, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c3), binding("Gcd", 5), binding("S", 0), binding("T", 1), binding("A", 0), binding("B", 5)]),
            uses([
              proof(
                goal(case(c3, 0, 5)),
                by(fact("gcd-bezout-identity.pl", clause(7)))
              ),
              proof(
                goal(extended_gcd(0, 5, 5, 0, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(5, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

status(c4, done).
why(
  status(c4, done),
  proof(
    goal(status(c4, done)),
    by(rule("gcd-bezout-identity.pl", clause(20))),
    bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7)]),
    uses([
      proof(
        goal(answer(c4, 6, 5, -7)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
        uses([
          proof(
            goal(case(c4, 270, 192)),
            by(fact("gcd-bezout-identity.pl", clause(8)))
          ),
          proof(
            goal(extended_gcd(270, 192, 6, 5, -7)),
            by(builtin(extended_gcd, 5))
          )
        ])
      ),
      proof(
        goal(bezout_ok(c4)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c4), binding("A", 270), binding("B", 192), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("AS", 1350), binding("BT", -1344)]),
        uses([
          proof(
            goal(case(c4, 270, 192)),
            by(fact("gcd-bezout-identity.pl", clause(8)))
          ),
          proof(
            goal(answer(c4, 6, 5, -7)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
            uses([
              proof(
                goal(case(c4, 270, 192)),
                by(fact("gcd-bezout-identity.pl", clause(8)))
              ),
              proof(
                goal(extended_gcd(270, 192, 6, 5, -7)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(270, 5, 1350)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(192, -7, -1344)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(1350, -1344, 6)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(divides_ok(c4)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c4), binding("A", 270), binding("B", 192), binding("Gcd", 6), binding("S", 5), binding("T", -7)]),
        uses([
          proof(
            goal(case(c4, 270, 192)),
            by(fact("gcd-bezout-identity.pl", clause(8)))
          ),
          proof(
            goal(answer(c4, 6, 5, -7)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
            uses([
              proof(
                goal(case(c4, 270, 192)),
                by(fact("gcd-bezout-identity.pl", clause(8)))
              ),
              proof(
                goal(extended_gcd(270, 192, 6, 5, -7)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(270, 6, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(192, 6, 0)),
            by(builtin(mod, 3))
          )
        ])
      ),
      proof(
        goal(nonnegative_ok(c4)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7)]),
        uses([
          proof(
            goal(answer(c4, 6, 5, -7)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c4), binding("Gcd", 6), binding("S", 5), binding("T", -7), binding("A", 270), binding("B", 192)]),
            uses([
              proof(
                goal(case(c4, 270, 192)),
                by(fact("gcd-bezout-identity.pl", clause(8)))
              ),
              proof(
                goal(extended_gcd(270, 192, 6, 5, -7)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(6, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

status(c5, done).
why(
  status(c5, done),
  proof(
    goal(status(c5, done)),
    by(rule("gcd-bezout-identity.pl", clause(20))),
    bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1)]),
    uses([
      proof(
        goal(answer(c5, 9, 1, 1)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
        uses([
          proof(
            goal(case(c5, -27, 36)),
            by(fact("gcd-bezout-identity.pl", clause(9)))
          ),
          proof(
            goal(extended_gcd(-27, 36, 9, 1, 1)),
            by(builtin(extended_gcd, 5))
          )
        ])
      ),
      proof(
        goal(bezout_ok(c5)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c5), binding("A", -27), binding("B", 36), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("AS", -27), binding("BT", 36)]),
        uses([
          proof(
            goal(case(c5, -27, 36)),
            by(fact("gcd-bezout-identity.pl", clause(9)))
          ),
          proof(
            goal(answer(c5, 9, 1, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
            uses([
              proof(
                goal(case(c5, -27, 36)),
                by(fact("gcd-bezout-identity.pl", clause(9)))
              ),
              proof(
                goal(extended_gcd(-27, 36, 9, 1, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(-27, 1, -27)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(36, 1, 36)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(-27, 36, 9)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(divides_ok(c5)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c5), binding("A", -27), binding("B", 36), binding("Gcd", 9), binding("S", 1), binding("T", 1)]),
        uses([
          proof(
            goal(case(c5, -27, 36)),
            by(fact("gcd-bezout-identity.pl", clause(9)))
          ),
          proof(
            goal(answer(c5, 9, 1, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
            uses([
              proof(
                goal(case(c5, -27, 36)),
                by(fact("gcd-bezout-identity.pl", clause(9)))
              ),
              proof(
                goal(extended_gcd(-27, 36, 9, 1, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(-27, 9, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(36, 9, 0)),
            by(builtin(mod, 3))
          )
        ])
      ),
      proof(
        goal(nonnegative_ok(c5)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1)]),
        uses([
          proof(
            goal(answer(c5, 9, 1, 1)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c5), binding("Gcd", 9), binding("S", 1), binding("T", 1), binding("A", -27), binding("B", 36)]),
            uses([
              proof(
                goal(case(c5, -27, 36)),
                by(fact("gcd-bezout-identity.pl", clause(9)))
              ),
              proof(
                goal(extended_gcd(-27, 36, 9, 1, 1)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(9, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

status(c6, done).
why(
  status(c6, done),
  proof(
    goal(status(c6, done)),
    by(rule("gcd-bezout-identity.pl", clause(20))),
    bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155)]),
    uses([
      proof(
        goal(answer(c6, 6, -649, 10155)),
        by(rule("gcd-bezout-identity.pl", clause(11))),
        bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
        uses([
          proof(
            goal(case(c6, 123456, 7890)),
            by(fact("gcd-bezout-identity.pl", clause(10)))
          ),
          proof(
            goal(extended_gcd(123456, 7890, 6, -649, 10155)),
            by(builtin(extended_gcd, 5))
          )
        ])
      ),
      proof(
        goal(bezout_ok(c6)),
        by(rule("gcd-bezout-identity.pl", clause(12))),
        bindings([binding("Case", c6), binding("A", 123456), binding("B", 7890), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("AS", -80122944), binding("BT", 80122950)]),
        uses([
          proof(
            goal(case(c6, 123456, 7890)),
            by(fact("gcd-bezout-identity.pl", clause(10)))
          ),
          proof(
            goal(answer(c6, 6, -649, 10155)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
            uses([
              proof(
                goal(case(c6, 123456, 7890)),
                by(fact("gcd-bezout-identity.pl", clause(10)))
              ),
              proof(
                goal(extended_gcd(123456, 7890, 6, -649, 10155)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mul(123456, -649, -80122944)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(7890, 10155, 80122950)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(add(-80122944, 80122950, 6)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(divides_ok(c6)),
        by(rule("gcd-bezout-identity.pl", clause(13))),
        bindings([binding("Case", c6), binding("A", 123456), binding("B", 7890), binding("Gcd", 6), binding("S", -649), binding("T", 10155)]),
        uses([
          proof(
            goal(case(c6, 123456, 7890)),
            by(fact("gcd-bezout-identity.pl", clause(10)))
          ),
          proof(
            goal(answer(c6, 6, -649, 10155)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
            uses([
              proof(
                goal(case(c6, 123456, 7890)),
                by(fact("gcd-bezout-identity.pl", clause(10)))
              ),
              proof(
                goal(extended_gcd(123456, 7890, 6, -649, 10155)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(mod(123456, 6, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(mod(7890, 6, 0)),
            by(builtin(mod, 3))
          )
        ])
      ),
      proof(
        goal(nonnegative_ok(c6)),
        by(rule("gcd-bezout-identity.pl", clause(14))),
        bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155)]),
        uses([
          proof(
            goal(answer(c6, 6, -649, 10155)),
            by(rule("gcd-bezout-identity.pl", clause(11))),
            bindings([binding("Case", c6), binding("Gcd", 6), binding("S", -649), binding("T", 10155), binding("A", 123456), binding("B", 7890)]),
            uses([
              proof(
                goal(case(c6, 123456, 7890)),
                by(fact("gcd-bezout-identity.pl", clause(10)))
              ),
              proof(
                goal(extended_gcd(123456, 7890, 6, -649, 10155)),
                by(builtin(extended_gcd, 5))
              )
            ])
          ),
          proof(
            goal(ge(6, 0)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

