easterDate(y2026, date(2026, april, 5)).
why(
  easterDate(y2026, date(2026, april, 5)),
  proof(
    goal(easterDate(y2026, date(2026, april, 5))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2026), binding("Year", 2026), binding("MonthName", april), binding("Day", 5), binding("Month", 4), binding("_J", 12), binding("_K", 20), binding("_Q", 6), binding("_R", 12), binding("_V", 2), binding("_Z", 4)]),
    uses([
      proof(
        goal(computus(y2026, 2026, 4, 5, 12, 20, 6, 12, 2, 4)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2026), binding("Year", 2026), binding("Month", 4), binding("Day", 5), binding("J", 12), binding("K", 20), binding("Q", 6), binding("R", 12), binding("V", 2), binding("Z", 4), binding("H", 26), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 228), binding("T1", 248), binding("T2", 243), binding("T3", 237), binding("T4", 252), binding("S", 6), binding("U", 2), binding("TwoN", 0), binding("TwoS", 12), binding("L1", 32), binding("L2", 44), binding("L3", 32), binding("L4", 30), binding("ElevenR", 132), binding("TwentyTwoV", 44), binding("W1", 144), binding("W2", 188), binding("W", 0), binding("SevenW", 0), binding("X1", 14), binding("X2", 14), binding("X3", 128)]),
        uses([
          proof(goal(case(y2026, 2026)), by(fact("easter-computus.pl", clause(4)))),
          proof(goal(mod(2026, 19, 12)), by(builtin(mod, 3))),
          proof(goal(div(2026, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2026, 100, 26)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 12, 228)), by(builtin(mul, 3))),
          proof(goal(add(228, 20, 248)), by(builtin(add, 3))),
          proof(goal(sub(248, 5, 243)), by(builtin(sub, 3))),
          proof(goal(sub(243, 6, 237)), by(builtin(sub, 3))),
          proof(goal(add(237, 15, 252)), by(builtin(add, 3))),
          proof(goal(mod(252, 30, 12)), by(builtin(mod, 3))),
          proof(goal(div(26, 4, 6)), by(builtin(div, 3))),
          proof(goal(mod(26, 4, 2)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 6, 12)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 12, 44)), by(builtin(add, 3))),
          proof(goal(sub(44, 12, 32)), by(builtin(sub, 3))),
          proof(goal(sub(32, 2, 30)), by(builtin(sub, 3))),
          proof(goal(mod(30, 7, 2)), by(builtin(mod, 3))),
          proof(goal(mul(11, 12, 132)), by(builtin(mul, 3))),
          proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
          proof(goal(add(12, 132, 144)), by(builtin(add, 3))),
          proof(goal(add(144, 44, 188)), by(builtin(add, 3))),
          proof(goal(div(188, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(12, 2, 14)), by(builtin(add, 3))),
          proof(goal(sub(14, 0, 14)), by(builtin(sub, 3))),
          proof(goal(add(14, 114, 128)), by(builtin(add, 3))),
          proof(goal(div(128, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(128, 31, 4)), by(builtin(mod, 3))),
          proof(goal(add(4, 1, 5)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20))))
    ])
  )
).

easterDate(y2027, date(2027, march, 28)).
why(
  easterDate(y2027, date(2027, march, 28)),
  proof(
    goal(easterDate(y2027, date(2027, march, 28))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2027), binding("Year", 2027), binding("MonthName", march), binding("Day", 28), binding("Month", 3), binding("_J", 13), binding("_K", 20), binding("_Q", 6), binding("_R", 1), binding("_V", 5), binding("_Z", 27)]),
    uses([
      proof(
        goal(computus(y2027, 2027, 3, 28, 13, 20, 6, 1, 5, 27)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2027), binding("Year", 2027), binding("Month", 3), binding("Day", 28), binding("J", 13), binding("K", 20), binding("Q", 6), binding("R", 1), binding("V", 5), binding("Z", 27), binding("H", 27), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 247), binding("T1", 267), binding("T2", 262), binding("T3", 256), binding("T4", 271), binding("S", 6), binding("U", 3), binding("TwoN", 0), binding("TwoS", 12), binding("L1", 32), binding("L2", 44), binding("L3", 43), binding("L4", 40), binding("ElevenR", 11), binding("TwentyTwoV", 110), binding("W1", 24), binding("W2", 134), binding("W", 0), binding("SevenW", 0), binding("X1", 6), binding("X2", 6), binding("X3", 120)]),
        uses([
          proof(goal(case(y2027, 2027)), by(fact("easter-computus.pl", clause(5)))),
          proof(goal(mod(2027, 19, 13)), by(builtin(mod, 3))),
          proof(goal(div(2027, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2027, 100, 27)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 13, 247)), by(builtin(mul, 3))),
          proof(goal(add(247, 20, 267)), by(builtin(add, 3))),
          proof(goal(sub(267, 5, 262)), by(builtin(sub, 3))),
          proof(goal(sub(262, 6, 256)), by(builtin(sub, 3))),
          proof(goal(add(256, 15, 271)), by(builtin(add, 3))),
          proof(goal(mod(271, 30, 1)), by(builtin(mod, 3))),
          proof(goal(div(27, 4, 6)), by(builtin(div, 3))),
          proof(goal(mod(27, 4, 3)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 6, 12)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 12, 44)), by(builtin(add, 3))),
          proof(goal(sub(44, 1, 43)), by(builtin(sub, 3))),
          proof(goal(sub(43, 3, 40)), by(builtin(sub, 3))),
          proof(goal(mod(40, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 1, 11)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(13, 11, 24)), by(builtin(add, 3))),
          proof(goal(add(24, 110, 134)), by(builtin(add, 3))),
          proof(goal(div(134, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(1, 5, 6)), by(builtin(add, 3))),
          proof(goal(sub(6, 0, 6)), by(builtin(sub, 3))),
          proof(goal(add(6, 114, 120)), by(builtin(add, 3))),
          proof(goal(div(120, 31, 3)), by(builtin(div, 3))),
          proof(goal(mod(120, 31, 27)), by(builtin(mod, 3))),
          proof(goal(add(27, 1, 28)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(3, march)), by(fact("easter-computus.pl", clause(19))))
    ])
  )
).

easterDate(y2028, date(2028, april, 16)).
why(
  easterDate(y2028, date(2028, april, 16)),
  proof(
    goal(easterDate(y2028, date(2028, april, 16))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2028), binding("Year", 2028), binding("MonthName", april), binding("Day", 16), binding("Month", 4), binding("_J", 14), binding("_K", 20), binding("_Q", 6), binding("_R", 20), binding("_V", 5), binding("_Z", 15)]),
    uses([
      proof(
        goal(computus(y2028, 2028, 4, 16, 14, 20, 6, 20, 5, 15)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2028), binding("Year", 2028), binding("Month", 4), binding("Day", 16), binding("J", 14), binding("K", 20), binding("Q", 6), binding("R", 20), binding("V", 5), binding("Z", 15), binding("H", 28), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 266), binding("T1", 286), binding("T2", 281), binding("T3", 275), binding("T4", 290), binding("S", 7), binding("U", 0), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 26), binding("L4", 26), binding("ElevenR", 220), binding("TwentyTwoV", 110), binding("W1", 234), binding("W2", 344), binding("W", 0), binding("SevenW", 0), binding("X1", 25), binding("X2", 25), binding("X3", 139)]),
        uses([
          proof(goal(case(y2028, 2028)), by(fact("easter-computus.pl", clause(6)))),
          proof(goal(mod(2028, 19, 14)), by(builtin(mod, 3))),
          proof(goal(div(2028, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2028, 100, 28)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 14, 266)), by(builtin(mul, 3))),
          proof(goal(add(266, 20, 286)), by(builtin(add, 3))),
          proof(goal(sub(286, 5, 281)), by(builtin(sub, 3))),
          proof(goal(sub(281, 6, 275)), by(builtin(sub, 3))),
          proof(goal(add(275, 15, 290)), by(builtin(add, 3))),
          proof(goal(mod(290, 30, 20)), by(builtin(mod, 3))),
          proof(goal(div(28, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(28, 4, 0)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 20, 26)), by(builtin(sub, 3))),
          proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
          proof(goal(mod(26, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 20, 220)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(14, 220, 234)), by(builtin(add, 3))),
          proof(goal(add(234, 110, 344)), by(builtin(add, 3))),
          proof(goal(div(344, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(20, 5, 25)), by(builtin(add, 3))),
          proof(goal(sub(25, 0, 25)), by(builtin(sub, 3))),
          proof(goal(add(25, 114, 139)), by(builtin(add, 3))),
          proof(goal(div(139, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(139, 31, 15)), by(builtin(mod, 3))),
          proof(goal(add(15, 1, 16)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20))))
    ])
  )
).

easterDate(y2029, date(2029, april, 1)).
why(
  easterDate(y2029, date(2029, april, 1)),
  proof(
    goal(easterDate(y2029, date(2029, april, 1))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2029), binding("Year", 2029), binding("MonthName", april), binding("Day", 1), binding("Month", 4), binding("_J", 15), binding("_K", 20), binding("_Q", 6), binding("_R", 9), binding("_V", 1), binding("_Z", 0)]),
    uses([
      proof(
        goal(computus(y2029, 2029, 4, 1, 15, 20, 6, 9, 1, 0)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2029), binding("Year", 2029), binding("Month", 4), binding("Day", 1), binding("J", 15), binding("K", 20), binding("Q", 6), binding("R", 9), binding("V", 1), binding("Z", 0), binding("H", 29), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 285), binding("T1", 305), binding("T2", 300), binding("T3", 294), binding("T4", 309), binding("S", 7), binding("U", 1), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 37), binding("L4", 36), binding("ElevenR", 99), binding("TwentyTwoV", 22), binding("W1", 114), binding("W2", 136), binding("W", 0), binding("SevenW", 0), binding("X1", 10), binding("X2", 10), binding("X3", 124)]),
        uses([
          proof(goal(case(y2029, 2029)), by(fact("easter-computus.pl", clause(7)))),
          proof(goal(mod(2029, 19, 15)), by(builtin(mod, 3))),
          proof(goal(div(2029, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2029, 100, 29)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 15, 285)), by(builtin(mul, 3))),
          proof(goal(add(285, 20, 305)), by(builtin(add, 3))),
          proof(goal(sub(305, 5, 300)), by(builtin(sub, 3))),
          proof(goal(sub(300, 6, 294)), by(builtin(sub, 3))),
          proof(goal(add(294, 15, 309)), by(builtin(add, 3))),
          proof(goal(mod(309, 30, 9)), by(builtin(mod, 3))),
          proof(goal(div(29, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(29, 4, 1)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 9, 37)), by(builtin(sub, 3))),
          proof(goal(sub(37, 1, 36)), by(builtin(sub, 3))),
          proof(goal(mod(36, 7, 1)), by(builtin(mod, 3))),
          proof(goal(mul(11, 9, 99)), by(builtin(mul, 3))),
          proof(goal(mul(22, 1, 22)), by(builtin(mul, 3))),
          proof(goal(add(15, 99, 114)), by(builtin(add, 3))),
          proof(goal(add(114, 22, 136)), by(builtin(add, 3))),
          proof(goal(div(136, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(9, 1, 10)), by(builtin(add, 3))),
          proof(goal(sub(10, 0, 10)), by(builtin(sub, 3))),
          proof(goal(add(10, 114, 124)), by(builtin(add, 3))),
          proof(goal(div(124, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(124, 31, 0)), by(builtin(mod, 3))),
          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20))))
    ])
  )
).

easterDate(y2030, date(2030, april, 21)).
why(
  easterDate(y2030, date(2030, april, 21)),
  proof(
    goal(easterDate(y2030, date(2030, april, 21))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2030), binding("Year", 2030), binding("MonthName", april), binding("Day", 21), binding("Month", 4), binding("_J", 16), binding("_K", 20), binding("_Q", 6), binding("_R", 28), binding("_V", 2), binding("_Z", 20)]),
    uses([
      proof(
        goal(computus(y2030, 2030, 4, 21, 16, 20, 6, 28, 2, 20)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2030), binding("Year", 2030), binding("Month", 4), binding("Day", 21), binding("J", 16), binding("K", 20), binding("Q", 6), binding("R", 28), binding("V", 2), binding("Z", 20), binding("H", 30), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 304), binding("T1", 324), binding("T2", 319), binding("T3", 313), binding("T4", 328), binding("S", 7), binding("U", 2), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 18), binding("L4", 16), binding("ElevenR", 308), binding("TwentyTwoV", 44), binding("W1", 324), binding("W2", 368), binding("W", 0), binding("SevenW", 0), binding("X1", 30), binding("X2", 30), binding("X3", 144)]),
        uses([
          proof(goal(case(y2030, 2030)), by(fact("easter-computus.pl", clause(8)))),
          proof(goal(mod(2030, 19, 16)), by(builtin(mod, 3))),
          proof(goal(div(2030, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2030, 100, 30)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 16, 304)), by(builtin(mul, 3))),
          proof(goal(add(304, 20, 324)), by(builtin(add, 3))),
          proof(goal(sub(324, 5, 319)), by(builtin(sub, 3))),
          proof(goal(sub(319, 6, 313)), by(builtin(sub, 3))),
          proof(goal(add(313, 15, 328)), by(builtin(add, 3))),
          proof(goal(mod(328, 30, 28)), by(builtin(mod, 3))),
          proof(goal(div(30, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(30, 4, 2)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 28, 18)), by(builtin(sub, 3))),
          proof(goal(sub(18, 2, 16)), by(builtin(sub, 3))),
          proof(goal(mod(16, 7, 2)), by(builtin(mod, 3))),
          proof(goal(mul(11, 28, 308)), by(builtin(mul, 3))),
          proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
          proof(goal(add(16, 308, 324)), by(builtin(add, 3))),
          proof(goal(add(324, 44, 368)), by(builtin(add, 3))),
          proof(goal(div(368, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(28, 2, 30)), by(builtin(add, 3))),
          proof(goal(sub(30, 0, 30)), by(builtin(sub, 3))),
          proof(goal(add(30, 114, 144)), by(builtin(add, 3))),
          proof(goal(div(144, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(144, 31, 20)), by(builtin(mod, 3))),
          proof(goal(add(20, 1, 21)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20))))
    ])
  )
).

easterDate(y2031, date(2031, april, 13)).
why(
  easterDate(y2031, date(2031, april, 13)),
  proof(
    goal(easterDate(y2031, date(2031, april, 13))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2031), binding("Year", 2031), binding("MonthName", april), binding("Day", 13), binding("Month", 4), binding("_J", 17), binding("_K", 20), binding("_Q", 6), binding("_R", 17), binding("_V", 5), binding("_Z", 12)]),
    uses([
      proof(
        goal(computus(y2031, 2031, 4, 13, 17, 20, 6, 17, 5, 12)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2031), binding("Year", 2031), binding("Month", 4), binding("Day", 13), binding("J", 17), binding("K", 20), binding("Q", 6), binding("R", 17), binding("V", 5), binding("Z", 12), binding("H", 31), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 323), binding("T1", 343), binding("T2", 338), binding("T3", 332), binding("T4", 347), binding("S", 7), binding("U", 3), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 29), binding("L4", 26), binding("ElevenR", 187), binding("TwentyTwoV", 110), binding("W1", 204), binding("W2", 314), binding("W", 0), binding("SevenW", 0), binding("X1", 22), binding("X2", 22), binding("X3", 136)]),
        uses([
          proof(goal(case(y2031, 2031)), by(fact("easter-computus.pl", clause(9)))),
          proof(goal(mod(2031, 19, 17)), by(builtin(mod, 3))),
          proof(goal(div(2031, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2031, 100, 31)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 17, 323)), by(builtin(mul, 3))),
          proof(goal(add(323, 20, 343)), by(builtin(add, 3))),
          proof(goal(sub(343, 5, 338)), by(builtin(sub, 3))),
          proof(goal(sub(338, 6, 332)), by(builtin(sub, 3))),
          proof(goal(add(332, 15, 347)), by(builtin(add, 3))),
          proof(goal(mod(347, 30, 17)), by(builtin(mod, 3))),
          proof(goal(div(31, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(31, 4, 3)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 17, 29)), by(builtin(sub, 3))),
          proof(goal(sub(29, 3, 26)), by(builtin(sub, 3))),
          proof(goal(mod(26, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 17, 187)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(17, 187, 204)), by(builtin(add, 3))),
          proof(goal(add(204, 110, 314)), by(builtin(add, 3))),
          proof(goal(div(314, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(17, 5, 22)), by(builtin(add, 3))),
          proof(goal(sub(22, 0, 22)), by(builtin(sub, 3))),
          proof(goal(add(22, 114, 136)), by(builtin(add, 3))),
          proof(goal(div(136, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(136, 31, 12)), by(builtin(mod, 3))),
          proof(goal(add(12, 1, 13)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20))))
    ])
  )
).

easterDate(y2032, date(2032, march, 28)).
why(
  easterDate(y2032, date(2032, march, 28)),
  proof(
    goal(easterDate(y2032, date(2032, march, 28))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2032), binding("Year", 2032), binding("MonthName", march), binding("Day", 28), binding("Month", 3), binding("_J", 18), binding("_K", 20), binding("_Q", 6), binding("_R", 6), binding("_V", 0), binding("_Z", 27)]),
    uses([
      proof(
        goal(computus(y2032, 2032, 3, 28, 18, 20, 6, 6, 0, 27)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2032), binding("Year", 2032), binding("Month", 3), binding("Day", 28), binding("J", 18), binding("K", 20), binding("Q", 6), binding("R", 6), binding("V", 0), binding("Z", 27), binding("H", 32), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 342), binding("T1", 362), binding("T2", 357), binding("T3", 351), binding("T4", 366), binding("S", 8), binding("U", 0), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 42), binding("L4", 42), binding("ElevenR", 66), binding("TwentyTwoV", 0), binding("W1", 84), binding("W2", 84), binding("W", 0), binding("SevenW", 0), binding("X1", 6), binding("X2", 6), binding("X3", 120)]),
        uses([
          proof(goal(case(y2032, 2032)), by(fact("easter-computus.pl", clause(10)))),
          proof(goal(mod(2032, 19, 18)), by(builtin(mod, 3))),
          proof(goal(div(2032, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2032, 100, 32)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 18, 342)), by(builtin(mul, 3))),
          proof(goal(add(342, 20, 362)), by(builtin(add, 3))),
          proof(goal(sub(362, 5, 357)), by(builtin(sub, 3))),
          proof(goal(sub(357, 6, 351)), by(builtin(sub, 3))),
          proof(goal(add(351, 15, 366)), by(builtin(add, 3))),
          proof(goal(mod(366, 30, 6)), by(builtin(mod, 3))),
          proof(goal(div(32, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(32, 4, 0)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 6, 42)), by(builtin(sub, 3))),
          proof(goal(sub(42, 0, 42)), by(builtin(sub, 3))),
          proof(goal(mod(42, 7, 0)), by(builtin(mod, 3))),
          proof(goal(mul(11, 6, 66)), by(builtin(mul, 3))),
          proof(goal(mul(22, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(18, 66, 84)), by(builtin(add, 3))),
          proof(goal(add(84, 0, 84)), by(builtin(add, 3))),
          proof(goal(div(84, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(6, 0, 6)), by(builtin(add, 3))),
          proof(goal(sub(6, 0, 6)), by(builtin(sub, 3))),
          proof(goal(add(6, 114, 120)), by(builtin(add, 3))),
          proof(goal(div(120, 31, 3)), by(builtin(div, 3))),
          proof(goal(mod(120, 31, 27)), by(builtin(mod, 3))),
          proof(goal(add(27, 1, 28)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(3, march)), by(fact("easter-computus.pl", clause(19))))
    ])
  )
).

easterDate(y2033, date(2033, april, 17)).
why(
  easterDate(y2033, date(2033, april, 17)),
  proof(
    goal(easterDate(y2033, date(2033, april, 17))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2033), binding("Year", 2033), binding("MonthName", april), binding("Day", 17), binding("Month", 4), binding("_J", 0), binding("_K", 20), binding("_Q", 6), binding("_R", 24), binding("_V", 2), binding("_Z", 16)]),
    uses([
      proof(
        goal(computus(y2033, 2033, 4, 17, 0, 20, 6, 24, 2, 16)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2033), binding("Year", 2033), binding("Month", 4), binding("Day", 17), binding("J", 0), binding("K", 20), binding("Q", 6), binding("R", 24), binding("V", 2), binding("Z", 16), binding("H", 33), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 0), binding("T1", 20), binding("T2", 15), binding("T3", 9), binding("T4", 24), binding("S", 8), binding("U", 1), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 24), binding("L4", 23), binding("ElevenR", 264), binding("TwentyTwoV", 44), binding("W1", 264), binding("W2", 308), binding("W", 0), binding("SevenW", 0), binding("X1", 26), binding("X2", 26), binding("X3", 140)]),
        uses([
          proof(goal(case(y2033, 2033)), by(fact("easter-computus.pl", clause(11)))),
          proof(goal(mod(2033, 19, 0)), by(builtin(mod, 3))),
          proof(goal(div(2033, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2033, 100, 33)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(0, 20, 20)), by(builtin(add, 3))),
          proof(goal(sub(20, 5, 15)), by(builtin(sub, 3))),
          proof(goal(sub(15, 6, 9)), by(builtin(sub, 3))),
          proof(goal(add(9, 15, 24)), by(builtin(add, 3))),
          proof(goal(mod(24, 30, 24)), by(builtin(mod, 3))),
          proof(goal(div(33, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(33, 4, 1)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 24, 24)), by(builtin(sub, 3))),
          proof(goal(sub(24, 1, 23)), by(builtin(sub, 3))),
          proof(goal(mod(23, 7, 2)), by(builtin(mod, 3))),
          proof(goal(mul(11, 24, 264)), by(builtin(mul, 3))),
          proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
          proof(goal(add(0, 264, 264)), by(builtin(add, 3))),
          proof(goal(add(264, 44, 308)), by(builtin(add, 3))),
          proof(goal(div(308, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(24, 2, 26)), by(builtin(add, 3))),
          proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
          proof(goal(add(26, 114, 140)), by(builtin(add, 3))),
          proof(goal(div(140, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(140, 31, 16)), by(builtin(mod, 3))),
          proof(goal(add(16, 1, 17)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20))))
    ])
  )
).

easterDate(y2034, date(2034, april, 9)).
why(
  easterDate(y2034, date(2034, april, 9)),
  proof(
    goal(easterDate(y2034, date(2034, april, 9))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2034), binding("Year", 2034), binding("MonthName", april), binding("Day", 9), binding("Month", 4), binding("_J", 1), binding("_K", 20), binding("_Q", 6), binding("_R", 13), binding("_V", 5), binding("_Z", 8)]),
    uses([
      proof(
        goal(computus(y2034, 2034, 4, 9, 1, 20, 6, 13, 5, 8)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2034), binding("Year", 2034), binding("Month", 4), binding("Day", 9), binding("J", 1), binding("K", 20), binding("Q", 6), binding("R", 13), binding("V", 5), binding("Z", 8), binding("H", 34), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 19), binding("T1", 39), binding("T2", 34), binding("T3", 28), binding("T4", 43), binding("S", 8), binding("U", 2), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 35), binding("L4", 33), binding("ElevenR", 143), binding("TwentyTwoV", 110), binding("W1", 144), binding("W2", 254), binding("W", 0), binding("SevenW", 0), binding("X1", 18), binding("X2", 18), binding("X3", 132)]),
        uses([
          proof(goal(case(y2034, 2034)), by(fact("easter-computus.pl", clause(12)))),
          proof(goal(mod(2034, 19, 1)), by(builtin(mod, 3))),
          proof(goal(div(2034, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2034, 100, 34)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 1, 19)), by(builtin(mul, 3))),
          proof(goal(add(19, 20, 39)), by(builtin(add, 3))),
          proof(goal(sub(39, 5, 34)), by(builtin(sub, 3))),
          proof(goal(sub(34, 6, 28)), by(builtin(sub, 3))),
          proof(goal(add(28, 15, 43)), by(builtin(add, 3))),
          proof(goal(mod(43, 30, 13)), by(builtin(mod, 3))),
          proof(goal(div(34, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(34, 4, 2)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 13, 35)), by(builtin(sub, 3))),
          proof(goal(sub(35, 2, 33)), by(builtin(sub, 3))),
          proof(goal(mod(33, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 13, 143)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(1, 143, 144)), by(builtin(add, 3))),
          proof(goal(add(144, 110, 254)), by(builtin(add, 3))),
          proof(goal(div(254, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(13, 5, 18)), by(builtin(add, 3))),
          proof(goal(sub(18, 0, 18)), by(builtin(sub, 3))),
          proof(goal(add(18, 114, 132)), by(builtin(add, 3))),
          proof(goal(div(132, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(132, 31, 8)), by(builtin(mod, 3))),
          proof(goal(add(8, 1, 9)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20))))
    ])
  )
).

easterDate(y2035, date(2035, march, 25)).
why(
  easterDate(y2035, date(2035, march, 25)),
  proof(
    goal(easterDate(y2035, date(2035, march, 25))), by(rule("easter-computus.pl", clause(23))),
    bindings([binding("Case", y2035), binding("Year", 2035), binding("MonthName", march), binding("Day", 25), binding("Month", 3), binding("_J", 2), binding("_K", 20), binding("_Q", 6), binding("_R", 2), binding("_V", 1), binding("_Z", 24)]),
    uses([
      proof(
        goal(computus(y2035, 2035, 3, 25, 2, 20, 6, 2, 1, 24)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2035), binding("Year", 2035), binding("Month", 3), binding("Day", 25), binding("J", 2), binding("K", 20), binding("Q", 6), binding("R", 2), binding("V", 1), binding("Z", 24), binding("H", 35), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 38), binding("T1", 58), binding("T2", 53), binding("T3", 47), binding("T4", 62), binding("S", 8), binding("U", 3), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 46), binding("L4", 43), binding("ElevenR", 22), binding("TwentyTwoV", 22), binding("W1", 24), binding("W2", 46), binding("W", 0), binding("SevenW", 0), binding("X1", 3), binding("X2", 3), binding("X3", 117)]),
        uses([
          proof(goal(case(y2035, 2035)), by(fact("easter-computus.pl", clause(13)))),
          proof(goal(mod(2035, 19, 2)), by(builtin(mod, 3))),
          proof(goal(div(2035, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2035, 100, 35)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 2, 38)), by(builtin(mul, 3))),
          proof(goal(add(38, 20, 58)), by(builtin(add, 3))),
          proof(goal(sub(58, 5, 53)), by(builtin(sub, 3))),
          proof(goal(sub(53, 6, 47)), by(builtin(sub, 3))),
          proof(goal(add(47, 15, 62)), by(builtin(add, 3))),
          proof(goal(mod(62, 30, 2)), by(builtin(mod, 3))),
          proof(goal(div(35, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(35, 4, 3)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 2, 46)), by(builtin(sub, 3))),
          proof(goal(sub(46, 3, 43)), by(builtin(sub, 3))),
          proof(goal(mod(43, 7, 1)), by(builtin(mod, 3))),
          proof(goal(mul(11, 2, 22)), by(builtin(mul, 3))),
          proof(goal(mul(22, 1, 22)), by(builtin(mul, 3))),
          proof(goal(add(2, 22, 24)), by(builtin(add, 3))),
          proof(goal(add(24, 22, 46)), by(builtin(add, 3))),
          proof(goal(div(46, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
          proof(goal(sub(3, 0, 3)), by(builtin(sub, 3))),
          proof(goal(add(3, 114, 117)), by(builtin(add, 3))),
          proof(goal(div(117, 31, 3)), by(builtin(div, 3))),
          proof(goal(mod(117, 31, 24)), by(builtin(mod, 3))),
          proof(goal(add(24, 1, 25)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(month_name(3, march)), by(fact("easter-computus.pl", clause(19))))
    ])
  )
).

computusRemainders(y2026, remainders(12, 12, 2)).
why(
  computusRemainders(y2026, remainders(12, 12, 2)),
  proof(
    goal(computusRemainders(y2026, remainders(12, 12, 2))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2026), binding("J", 12), binding("R", 12), binding("V", 2), binding("_Year", 2026), binding("_Month", 4), binding("_Day", 5), binding("_K", 20), binding("_Q", 6), binding("_Z", 4)]),
    uses([
      proof(
        goal(computus(y2026, 2026, 4, 5, 12, 20, 6, 12, 2, 4)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2026), binding("Year", 2026), binding("Month", 4), binding("Day", 5), binding("J", 12), binding("K", 20), binding("Q", 6), binding("R", 12), binding("V", 2), binding("Z", 4), binding("H", 26), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 228), binding("T1", 248), binding("T2", 243), binding("T3", 237), binding("T4", 252), binding("S", 6), binding("U", 2), binding("TwoN", 0), binding("TwoS", 12), binding("L1", 32), binding("L2", 44), binding("L3", 32), binding("L4", 30), binding("ElevenR", 132), binding("TwentyTwoV", 44), binding("W1", 144), binding("W2", 188), binding("W", 0), binding("SevenW", 0), binding("X1", 14), binding("X2", 14), binding("X3", 128)]),
        uses([
          proof(goal(case(y2026, 2026)), by(fact("easter-computus.pl", clause(4)))),
          proof(goal(mod(2026, 19, 12)), by(builtin(mod, 3))),
          proof(goal(div(2026, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2026, 100, 26)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 12, 228)), by(builtin(mul, 3))),
          proof(goal(add(228, 20, 248)), by(builtin(add, 3))),
          proof(goal(sub(248, 5, 243)), by(builtin(sub, 3))),
          proof(goal(sub(243, 6, 237)), by(builtin(sub, 3))),
          proof(goal(add(237, 15, 252)), by(builtin(add, 3))),
          proof(goal(mod(252, 30, 12)), by(builtin(mod, 3))),
          proof(goal(div(26, 4, 6)), by(builtin(div, 3))),
          proof(goal(mod(26, 4, 2)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 6, 12)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 12, 44)), by(builtin(add, 3))),
          proof(goal(sub(44, 12, 32)), by(builtin(sub, 3))),
          proof(goal(sub(32, 2, 30)), by(builtin(sub, 3))),
          proof(goal(mod(30, 7, 2)), by(builtin(mod, 3))),
          proof(goal(mul(11, 12, 132)), by(builtin(mul, 3))),
          proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
          proof(goal(add(12, 132, 144)), by(builtin(add, 3))),
          proof(goal(add(144, 44, 188)), by(builtin(add, 3))),
          proof(goal(div(188, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(12, 2, 14)), by(builtin(add, 3))),
          proof(goal(sub(14, 0, 14)), by(builtin(sub, 3))),
          proof(goal(add(14, 114, 128)), by(builtin(add, 3))),
          proof(goal(div(128, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(128, 31, 4)), by(builtin(mod, 3))),
          proof(goal(add(4, 1, 5)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2027, remainders(13, 1, 5)).
why(
  computusRemainders(y2027, remainders(13, 1, 5)),
  proof(
    goal(computusRemainders(y2027, remainders(13, 1, 5))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2027), binding("J", 13), binding("R", 1), binding("V", 5), binding("_Year", 2027), binding("_Month", 3), binding("_Day", 28), binding("_K", 20), binding("_Q", 6), binding("_Z", 27)]),
    uses([
      proof(
        goal(computus(y2027, 2027, 3, 28, 13, 20, 6, 1, 5, 27)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2027), binding("Year", 2027), binding("Month", 3), binding("Day", 28), binding("J", 13), binding("K", 20), binding("Q", 6), binding("R", 1), binding("V", 5), binding("Z", 27), binding("H", 27), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 247), binding("T1", 267), binding("T2", 262), binding("T3", 256), binding("T4", 271), binding("S", 6), binding("U", 3), binding("TwoN", 0), binding("TwoS", 12), binding("L1", 32), binding("L2", 44), binding("L3", 43), binding("L4", 40), binding("ElevenR", 11), binding("TwentyTwoV", 110), binding("W1", 24), binding("W2", 134), binding("W", 0), binding("SevenW", 0), binding("X1", 6), binding("X2", 6), binding("X3", 120)]),
        uses([
          proof(goal(case(y2027, 2027)), by(fact("easter-computus.pl", clause(5)))),
          proof(goal(mod(2027, 19, 13)), by(builtin(mod, 3))),
          proof(goal(div(2027, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2027, 100, 27)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 13, 247)), by(builtin(mul, 3))),
          proof(goal(add(247, 20, 267)), by(builtin(add, 3))),
          proof(goal(sub(267, 5, 262)), by(builtin(sub, 3))),
          proof(goal(sub(262, 6, 256)), by(builtin(sub, 3))),
          proof(goal(add(256, 15, 271)), by(builtin(add, 3))),
          proof(goal(mod(271, 30, 1)), by(builtin(mod, 3))),
          proof(goal(div(27, 4, 6)), by(builtin(div, 3))),
          proof(goal(mod(27, 4, 3)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 6, 12)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 12, 44)), by(builtin(add, 3))),
          proof(goal(sub(44, 1, 43)), by(builtin(sub, 3))),
          proof(goal(sub(43, 3, 40)), by(builtin(sub, 3))),
          proof(goal(mod(40, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 1, 11)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(13, 11, 24)), by(builtin(add, 3))),
          proof(goal(add(24, 110, 134)), by(builtin(add, 3))),
          proof(goal(div(134, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(1, 5, 6)), by(builtin(add, 3))),
          proof(goal(sub(6, 0, 6)), by(builtin(sub, 3))),
          proof(goal(add(6, 114, 120)), by(builtin(add, 3))),
          proof(goal(div(120, 31, 3)), by(builtin(div, 3))),
          proof(goal(mod(120, 31, 27)), by(builtin(mod, 3))),
          proof(goal(add(27, 1, 28)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2028, remainders(14, 20, 5)).
why(
  computusRemainders(y2028, remainders(14, 20, 5)),
  proof(
    goal(computusRemainders(y2028, remainders(14, 20, 5))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2028), binding("J", 14), binding("R", 20), binding("V", 5), binding("_Year", 2028), binding("_Month", 4), binding("_Day", 16), binding("_K", 20), binding("_Q", 6), binding("_Z", 15)]),
    uses([
      proof(
        goal(computus(y2028, 2028, 4, 16, 14, 20, 6, 20, 5, 15)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2028), binding("Year", 2028), binding("Month", 4), binding("Day", 16), binding("J", 14), binding("K", 20), binding("Q", 6), binding("R", 20), binding("V", 5), binding("Z", 15), binding("H", 28), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 266), binding("T1", 286), binding("T2", 281), binding("T3", 275), binding("T4", 290), binding("S", 7), binding("U", 0), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 26), binding("L4", 26), binding("ElevenR", 220), binding("TwentyTwoV", 110), binding("W1", 234), binding("W2", 344), binding("W", 0), binding("SevenW", 0), binding("X1", 25), binding("X2", 25), binding("X3", 139)]),
        uses([
          proof(goal(case(y2028, 2028)), by(fact("easter-computus.pl", clause(6)))),
          proof(goal(mod(2028, 19, 14)), by(builtin(mod, 3))),
          proof(goal(div(2028, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2028, 100, 28)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 14, 266)), by(builtin(mul, 3))),
          proof(goal(add(266, 20, 286)), by(builtin(add, 3))),
          proof(goal(sub(286, 5, 281)), by(builtin(sub, 3))),
          proof(goal(sub(281, 6, 275)), by(builtin(sub, 3))),
          proof(goal(add(275, 15, 290)), by(builtin(add, 3))),
          proof(goal(mod(290, 30, 20)), by(builtin(mod, 3))),
          proof(goal(div(28, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(28, 4, 0)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 20, 26)), by(builtin(sub, 3))),
          proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
          proof(goal(mod(26, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 20, 220)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(14, 220, 234)), by(builtin(add, 3))),
          proof(goal(add(234, 110, 344)), by(builtin(add, 3))),
          proof(goal(div(344, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(20, 5, 25)), by(builtin(add, 3))),
          proof(goal(sub(25, 0, 25)), by(builtin(sub, 3))),
          proof(goal(add(25, 114, 139)), by(builtin(add, 3))),
          proof(goal(div(139, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(139, 31, 15)), by(builtin(mod, 3))),
          proof(goal(add(15, 1, 16)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2029, remainders(15, 9, 1)).
why(
  computusRemainders(y2029, remainders(15, 9, 1)),
  proof(
    goal(computusRemainders(y2029, remainders(15, 9, 1))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2029), binding("J", 15), binding("R", 9), binding("V", 1), binding("_Year", 2029), binding("_Month", 4), binding("_Day", 1), binding("_K", 20), binding("_Q", 6), binding("_Z", 0)]),
    uses([
      proof(
        goal(computus(y2029, 2029, 4, 1, 15, 20, 6, 9, 1, 0)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2029), binding("Year", 2029), binding("Month", 4), binding("Day", 1), binding("J", 15), binding("K", 20), binding("Q", 6), binding("R", 9), binding("V", 1), binding("Z", 0), binding("H", 29), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 285), binding("T1", 305), binding("T2", 300), binding("T3", 294), binding("T4", 309), binding("S", 7), binding("U", 1), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 37), binding("L4", 36), binding("ElevenR", 99), binding("TwentyTwoV", 22), binding("W1", 114), binding("W2", 136), binding("W", 0), binding("SevenW", 0), binding("X1", 10), binding("X2", 10), binding("X3", 124)]),
        uses([
          proof(goal(case(y2029, 2029)), by(fact("easter-computus.pl", clause(7)))),
          proof(goal(mod(2029, 19, 15)), by(builtin(mod, 3))),
          proof(goal(div(2029, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2029, 100, 29)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 15, 285)), by(builtin(mul, 3))),
          proof(goal(add(285, 20, 305)), by(builtin(add, 3))),
          proof(goal(sub(305, 5, 300)), by(builtin(sub, 3))),
          proof(goal(sub(300, 6, 294)), by(builtin(sub, 3))),
          proof(goal(add(294, 15, 309)), by(builtin(add, 3))),
          proof(goal(mod(309, 30, 9)), by(builtin(mod, 3))),
          proof(goal(div(29, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(29, 4, 1)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 9, 37)), by(builtin(sub, 3))),
          proof(goal(sub(37, 1, 36)), by(builtin(sub, 3))),
          proof(goal(mod(36, 7, 1)), by(builtin(mod, 3))),
          proof(goal(mul(11, 9, 99)), by(builtin(mul, 3))),
          proof(goal(mul(22, 1, 22)), by(builtin(mul, 3))),
          proof(goal(add(15, 99, 114)), by(builtin(add, 3))),
          proof(goal(add(114, 22, 136)), by(builtin(add, 3))),
          proof(goal(div(136, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(9, 1, 10)), by(builtin(add, 3))),
          proof(goal(sub(10, 0, 10)), by(builtin(sub, 3))),
          proof(goal(add(10, 114, 124)), by(builtin(add, 3))),
          proof(goal(div(124, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(124, 31, 0)), by(builtin(mod, 3))),
          proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2030, remainders(16, 28, 2)).
why(
  computusRemainders(y2030, remainders(16, 28, 2)),
  proof(
    goal(computusRemainders(y2030, remainders(16, 28, 2))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2030), binding("J", 16), binding("R", 28), binding("V", 2), binding("_Year", 2030), binding("_Month", 4), binding("_Day", 21), binding("_K", 20), binding("_Q", 6), binding("_Z", 20)]),
    uses([
      proof(
        goal(computus(y2030, 2030, 4, 21, 16, 20, 6, 28, 2, 20)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2030), binding("Year", 2030), binding("Month", 4), binding("Day", 21), binding("J", 16), binding("K", 20), binding("Q", 6), binding("R", 28), binding("V", 2), binding("Z", 20), binding("H", 30), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 304), binding("T1", 324), binding("T2", 319), binding("T3", 313), binding("T4", 328), binding("S", 7), binding("U", 2), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 18), binding("L4", 16), binding("ElevenR", 308), binding("TwentyTwoV", 44), binding("W1", 324), binding("W2", 368), binding("W", 0), binding("SevenW", 0), binding("X1", 30), binding("X2", 30), binding("X3", 144)]),
        uses([
          proof(goal(case(y2030, 2030)), by(fact("easter-computus.pl", clause(8)))),
          proof(goal(mod(2030, 19, 16)), by(builtin(mod, 3))),
          proof(goal(div(2030, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2030, 100, 30)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 16, 304)), by(builtin(mul, 3))),
          proof(goal(add(304, 20, 324)), by(builtin(add, 3))),
          proof(goal(sub(324, 5, 319)), by(builtin(sub, 3))),
          proof(goal(sub(319, 6, 313)), by(builtin(sub, 3))),
          proof(goal(add(313, 15, 328)), by(builtin(add, 3))),
          proof(goal(mod(328, 30, 28)), by(builtin(mod, 3))),
          proof(goal(div(30, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(30, 4, 2)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 28, 18)), by(builtin(sub, 3))),
          proof(goal(sub(18, 2, 16)), by(builtin(sub, 3))),
          proof(goal(mod(16, 7, 2)), by(builtin(mod, 3))),
          proof(goal(mul(11, 28, 308)), by(builtin(mul, 3))),
          proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
          proof(goal(add(16, 308, 324)), by(builtin(add, 3))),
          proof(goal(add(324, 44, 368)), by(builtin(add, 3))),
          proof(goal(div(368, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(28, 2, 30)), by(builtin(add, 3))),
          proof(goal(sub(30, 0, 30)), by(builtin(sub, 3))),
          proof(goal(add(30, 114, 144)), by(builtin(add, 3))),
          proof(goal(div(144, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(144, 31, 20)), by(builtin(mod, 3))),
          proof(goal(add(20, 1, 21)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2031, remainders(17, 17, 5)).
why(
  computusRemainders(y2031, remainders(17, 17, 5)),
  proof(
    goal(computusRemainders(y2031, remainders(17, 17, 5))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2031), binding("J", 17), binding("R", 17), binding("V", 5), binding("_Year", 2031), binding("_Month", 4), binding("_Day", 13), binding("_K", 20), binding("_Q", 6), binding("_Z", 12)]),
    uses([
      proof(
        goal(computus(y2031, 2031, 4, 13, 17, 20, 6, 17, 5, 12)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2031), binding("Year", 2031), binding("Month", 4), binding("Day", 13), binding("J", 17), binding("K", 20), binding("Q", 6), binding("R", 17), binding("V", 5), binding("Z", 12), binding("H", 31), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 323), binding("T1", 343), binding("T2", 338), binding("T3", 332), binding("T4", 347), binding("S", 7), binding("U", 3), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 29), binding("L4", 26), binding("ElevenR", 187), binding("TwentyTwoV", 110), binding("W1", 204), binding("W2", 314), binding("W", 0), binding("SevenW", 0), binding("X1", 22), binding("X2", 22), binding("X3", 136)]),
        uses([
          proof(goal(case(y2031, 2031)), by(fact("easter-computus.pl", clause(9)))),
          proof(goal(mod(2031, 19, 17)), by(builtin(mod, 3))),
          proof(goal(div(2031, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2031, 100, 31)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 17, 323)), by(builtin(mul, 3))),
          proof(goal(add(323, 20, 343)), by(builtin(add, 3))),
          proof(goal(sub(343, 5, 338)), by(builtin(sub, 3))),
          proof(goal(sub(338, 6, 332)), by(builtin(sub, 3))),
          proof(goal(add(332, 15, 347)), by(builtin(add, 3))),
          proof(goal(mod(347, 30, 17)), by(builtin(mod, 3))),
          proof(goal(div(31, 4, 7)), by(builtin(div, 3))),
          proof(goal(mod(31, 4, 3)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
          proof(goal(sub(46, 17, 29)), by(builtin(sub, 3))),
          proof(goal(sub(29, 3, 26)), by(builtin(sub, 3))),
          proof(goal(mod(26, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 17, 187)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(17, 187, 204)), by(builtin(add, 3))),
          proof(goal(add(204, 110, 314)), by(builtin(add, 3))),
          proof(goal(div(314, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(17, 5, 22)), by(builtin(add, 3))),
          proof(goal(sub(22, 0, 22)), by(builtin(sub, 3))),
          proof(goal(add(22, 114, 136)), by(builtin(add, 3))),
          proof(goal(div(136, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(136, 31, 12)), by(builtin(mod, 3))),
          proof(goal(add(12, 1, 13)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2032, remainders(18, 6, 0)).
why(
  computusRemainders(y2032, remainders(18, 6, 0)),
  proof(
    goal(computusRemainders(y2032, remainders(18, 6, 0))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2032), binding("J", 18), binding("R", 6), binding("V", 0), binding("_Year", 2032), binding("_Month", 3), binding("_Day", 28), binding("_K", 20), binding("_Q", 6), binding("_Z", 27)]),
    uses([
      proof(
        goal(computus(y2032, 2032, 3, 28, 18, 20, 6, 6, 0, 27)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2032), binding("Year", 2032), binding("Month", 3), binding("Day", 28), binding("J", 18), binding("K", 20), binding("Q", 6), binding("R", 6), binding("V", 0), binding("Z", 27), binding("H", 32), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 342), binding("T1", 362), binding("T2", 357), binding("T3", 351), binding("T4", 366), binding("S", 8), binding("U", 0), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 42), binding("L4", 42), binding("ElevenR", 66), binding("TwentyTwoV", 0), binding("W1", 84), binding("W2", 84), binding("W", 0), binding("SevenW", 0), binding("X1", 6), binding("X2", 6), binding("X3", 120)]),
        uses([
          proof(goal(case(y2032, 2032)), by(fact("easter-computus.pl", clause(10)))),
          proof(goal(mod(2032, 19, 18)), by(builtin(mod, 3))),
          proof(goal(div(2032, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2032, 100, 32)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 18, 342)), by(builtin(mul, 3))),
          proof(goal(add(342, 20, 362)), by(builtin(add, 3))),
          proof(goal(sub(362, 5, 357)), by(builtin(sub, 3))),
          proof(goal(sub(357, 6, 351)), by(builtin(sub, 3))),
          proof(goal(add(351, 15, 366)), by(builtin(add, 3))),
          proof(goal(mod(366, 30, 6)), by(builtin(mod, 3))),
          proof(goal(div(32, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(32, 4, 0)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 6, 42)), by(builtin(sub, 3))),
          proof(goal(sub(42, 0, 42)), by(builtin(sub, 3))),
          proof(goal(mod(42, 7, 0)), by(builtin(mod, 3))),
          proof(goal(mul(11, 6, 66)), by(builtin(mul, 3))),
          proof(goal(mul(22, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(18, 66, 84)), by(builtin(add, 3))),
          proof(goal(add(84, 0, 84)), by(builtin(add, 3))),
          proof(goal(div(84, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(6, 0, 6)), by(builtin(add, 3))),
          proof(goal(sub(6, 0, 6)), by(builtin(sub, 3))),
          proof(goal(add(6, 114, 120)), by(builtin(add, 3))),
          proof(goal(div(120, 31, 3)), by(builtin(div, 3))),
          proof(goal(mod(120, 31, 27)), by(builtin(mod, 3))),
          proof(goal(add(27, 1, 28)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2033, remainders(0, 24, 2)).
why(
  computusRemainders(y2033, remainders(0, 24, 2)),
  proof(
    goal(computusRemainders(y2033, remainders(0, 24, 2))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2033), binding("J", 0), binding("R", 24), binding("V", 2), binding("_Year", 2033), binding("_Month", 4), binding("_Day", 17), binding("_K", 20), binding("_Q", 6), binding("_Z", 16)]),
    uses([
      proof(
        goal(computus(y2033, 2033, 4, 17, 0, 20, 6, 24, 2, 16)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2033), binding("Year", 2033), binding("Month", 4), binding("Day", 17), binding("J", 0), binding("K", 20), binding("Q", 6), binding("R", 24), binding("V", 2), binding("Z", 16), binding("H", 33), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 0), binding("T1", 20), binding("T2", 15), binding("T3", 9), binding("T4", 24), binding("S", 8), binding("U", 1), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 24), binding("L4", 23), binding("ElevenR", 264), binding("TwentyTwoV", 44), binding("W1", 264), binding("W2", 308), binding("W", 0), binding("SevenW", 0), binding("X1", 26), binding("X2", 26), binding("X3", 140)]),
        uses([
          proof(goal(case(y2033, 2033)), by(fact("easter-computus.pl", clause(11)))),
          proof(goal(mod(2033, 19, 0)), by(builtin(mod, 3))),
          proof(goal(div(2033, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2033, 100, 33)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(0, 20, 20)), by(builtin(add, 3))),
          proof(goal(sub(20, 5, 15)), by(builtin(sub, 3))),
          proof(goal(sub(15, 6, 9)), by(builtin(sub, 3))),
          proof(goal(add(9, 15, 24)), by(builtin(add, 3))),
          proof(goal(mod(24, 30, 24)), by(builtin(mod, 3))),
          proof(goal(div(33, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(33, 4, 1)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 24, 24)), by(builtin(sub, 3))),
          proof(goal(sub(24, 1, 23)), by(builtin(sub, 3))),
          proof(goal(mod(23, 7, 2)), by(builtin(mod, 3))),
          proof(goal(mul(11, 24, 264)), by(builtin(mul, 3))),
          proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
          proof(goal(add(0, 264, 264)), by(builtin(add, 3))),
          proof(goal(add(264, 44, 308)), by(builtin(add, 3))),
          proof(goal(div(308, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(24, 2, 26)), by(builtin(add, 3))),
          proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
          proof(goal(add(26, 114, 140)), by(builtin(add, 3))),
          proof(goal(div(140, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(140, 31, 16)), by(builtin(mod, 3))),
          proof(goal(add(16, 1, 17)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2034, remainders(1, 13, 5)).
why(
  computusRemainders(y2034, remainders(1, 13, 5)),
  proof(
    goal(computusRemainders(y2034, remainders(1, 13, 5))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2034), binding("J", 1), binding("R", 13), binding("V", 5), binding("_Year", 2034), binding("_Month", 4), binding("_Day", 9), binding("_K", 20), binding("_Q", 6), binding("_Z", 8)]),
    uses([
      proof(
        goal(computus(y2034, 2034, 4, 9, 1, 20, 6, 13, 5, 8)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2034), binding("Year", 2034), binding("Month", 4), binding("Day", 9), binding("J", 1), binding("K", 20), binding("Q", 6), binding("R", 13), binding("V", 5), binding("Z", 8), binding("H", 34), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 19), binding("T1", 39), binding("T2", 34), binding("T3", 28), binding("T4", 43), binding("S", 8), binding("U", 2), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 35), binding("L4", 33), binding("ElevenR", 143), binding("TwentyTwoV", 110), binding("W1", 144), binding("W2", 254), binding("W", 0), binding("SevenW", 0), binding("X1", 18), binding("X2", 18), binding("X3", 132)]),
        uses([
          proof(goal(case(y2034, 2034)), by(fact("easter-computus.pl", clause(12)))),
          proof(goal(mod(2034, 19, 1)), by(builtin(mod, 3))),
          proof(goal(div(2034, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2034, 100, 34)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 1, 19)), by(builtin(mul, 3))),
          proof(goal(add(19, 20, 39)), by(builtin(add, 3))),
          proof(goal(sub(39, 5, 34)), by(builtin(sub, 3))),
          proof(goal(sub(34, 6, 28)), by(builtin(sub, 3))),
          proof(goal(add(28, 15, 43)), by(builtin(add, 3))),
          proof(goal(mod(43, 30, 13)), by(builtin(mod, 3))),
          proof(goal(div(34, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(34, 4, 2)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 13, 35)), by(builtin(sub, 3))),
          proof(goal(sub(35, 2, 33)), by(builtin(sub, 3))),
          proof(goal(mod(33, 7, 5)), by(builtin(mod, 3))),
          proof(goal(mul(11, 13, 143)), by(builtin(mul, 3))),
          proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
          proof(goal(add(1, 143, 144)), by(builtin(add, 3))),
          proof(goal(add(144, 110, 254)), by(builtin(add, 3))),
          proof(goal(div(254, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(13, 5, 18)), by(builtin(add, 3))),
          proof(goal(sub(18, 0, 18)), by(builtin(sub, 3))),
          proof(goal(add(18, 114, 132)), by(builtin(add, 3))),
          proof(goal(div(132, 31, 4)), by(builtin(div, 3))),
          proof(goal(mod(132, 31, 8)), by(builtin(mod, 3))),
          proof(goal(add(8, 1, 9)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

computusRemainders(y2035, remainders(2, 2, 1)).
why(
  computusRemainders(y2035, remainders(2, 2, 1)),
  proof(
    goal(computusRemainders(y2035, remainders(2, 2, 1))), by(rule("easter-computus.pl", clause(24))),
    bindings([binding("Case", y2035), binding("J", 2), binding("R", 2), binding("V", 1), binding("_Year", 2035), binding("_Month", 3), binding("_Day", 25), binding("_K", 20), binding("_Q", 6), binding("_Z", 24)]),
    uses([
      proof(
        goal(computus(y2035, 2035, 3, 25, 2, 20, 6, 2, 1, 24)), by(rule("easter-computus.pl", clause(21))),
        bindings([binding("Case", y2035), binding("Year", 2035), binding("Month", 3), binding("Day", 25), binding("J", 2), binding("K", 20), binding("Q", 6), binding("R", 2), binding("V", 1), binding("Z", 24), binding("H", 35), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 38), binding("T1", 58), binding("T2", 53), binding("T3", 47), binding("T4", 62), binding("S", 8), binding("U", 3), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 46), binding("L4", 43), binding("ElevenR", 22), binding("TwentyTwoV", 22), binding("W1", 24), binding("W2", 46), binding("W", 0), binding("SevenW", 0), binding("X1", 3), binding("X2", 3), binding("X3", 117)]),
        uses([
          proof(goal(case(y2035, 2035)), by(fact("easter-computus.pl", clause(13)))),
          proof(goal(mod(2035, 19, 2)), by(builtin(mod, 3))),
          proof(goal(div(2035, 100, 20)), by(builtin(div, 3))),
          proof(goal(mod(2035, 100, 35)), by(builtin(mod, 3))),
          proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
          proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
          proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
          proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
          proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
          proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
          proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
          proof(goal(mul(19, 2, 38)), by(builtin(mul, 3))),
          proof(goal(add(38, 20, 58)), by(builtin(add, 3))),
          proof(goal(sub(58, 5, 53)), by(builtin(sub, 3))),
          proof(goal(sub(53, 6, 47)), by(builtin(sub, 3))),
          proof(goal(add(47, 15, 62)), by(builtin(add, 3))),
          proof(goal(mod(62, 30, 2)), by(builtin(mod, 3))),
          proof(goal(div(35, 4, 8)), by(builtin(div, 3))),
          proof(goal(mod(35, 4, 3)), by(builtin(mod, 3))),
          proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
          proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
          proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
          proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
          proof(goal(sub(48, 2, 46)), by(builtin(sub, 3))),
          proof(goal(sub(46, 3, 43)), by(builtin(sub, 3))),
          proof(goal(mod(43, 7, 1)), by(builtin(mod, 3))),
          proof(goal(mul(11, 2, 22)), by(builtin(mul, 3))),
          proof(goal(mul(22, 1, 22)), by(builtin(mul, 3))),
          proof(goal(add(2, 22, 24)), by(builtin(add, 3))),
          proof(goal(add(24, 22, 46)), by(builtin(add, 3))),
          proof(goal(div(46, 451, 0)), by(builtin(div, 3))),
          proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
          proof(goal(sub(3, 0, 3)), by(builtin(sub, 3))),
          proof(goal(add(3, 114, 117)), by(builtin(add, 3))),
          proof(goal(div(117, 31, 3)), by(builtin(div, 3))),
          proof(goal(mod(117, 31, 24)), by(builtin(mod, 3))),
          proof(goal(add(24, 1, 25)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

legalGregorianWindow(y2026, true).
why(
  legalGregorianWindow(y2026, true),
  proof(
    goal(legalGregorianWindow(y2026, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2026)]),
    uses([
      proof(
        goal(checks_pass(y2026)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2026), binding("_Year", 2026), binding("Month", 4), binding("Day", 5), binding("J", 12), binding("_K", 20), binding("_Q", 6), binding("R", 12), binding("V", 2), binding("_Z", 4), binding("_Name", april)]),
        uses([
          proof(
            goal(computus(y2026, 2026, 4, 5, 12, 20, 6, 12, 2, 4)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2026), binding("Year", 2026), binding("Month", 4), binding("Day", 5), binding("J", 12), binding("K", 20), binding("Q", 6), binding("R", 12), binding("V", 2), binding("Z", 4), binding("H", 26), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 228), binding("T1", 248), binding("T2", 243), binding("T3", 237), binding("T4", 252), binding("S", 6), binding("U", 2), binding("TwoN", 0), binding("TwoS", 12), binding("L1", 32), binding("L2", 44), binding("L3", 32), binding("L4", 30), binding("ElevenR", 132), binding("TwentyTwoV", 44), binding("W1", 144), binding("W2", 188), binding("W", 0), binding("SevenW", 0), binding("X1", 14), binding("X2", 14), binding("X3", 128)]),
            uses([
              proof(goal(case(y2026, 2026)), by(fact("easter-computus.pl", clause(4)))),
              proof(goal(mod(2026, 19, 12)), by(builtin(mod, 3))),
              proof(goal(div(2026, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2026, 100, 26)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 12, 228)), by(builtin(mul, 3))),
              proof(goal(add(228, 20, 248)), by(builtin(add, 3))),
              proof(goal(sub(248, 5, 243)), by(builtin(sub, 3))),
              proof(goal(sub(243, 6, 237)), by(builtin(sub, 3))),
              proof(goal(add(237, 15, 252)), by(builtin(add, 3))),
              proof(goal(mod(252, 30, 12)), by(builtin(mod, 3))),
              proof(goal(div(26, 4, 6)), by(builtin(div, 3))),
              proof(goal(mod(26, 4, 2)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 6, 12)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 12, 44)), by(builtin(add, 3))),
              proof(goal(sub(44, 12, 32)), by(builtin(sub, 3))),
              proof(goal(sub(32, 2, 30)), by(builtin(sub, 3))),
              proof(goal(mod(30, 7, 2)), by(builtin(mod, 3))),
              proof(goal(mul(11, 12, 132)), by(builtin(mul, 3))),
              proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
              proof(goal(add(12, 132, 144)), by(builtin(add, 3))),
              proof(goal(add(144, 44, 188)), by(builtin(add, 3))),
              proof(goal(div(188, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(12, 2, 14)), by(builtin(add, 3))),
              proof(goal(sub(14, 0, 14)), by(builtin(sub, 3))),
              proof(goal(add(14, 114, 128)), by(builtin(add, 3))),
              proof(goal(div(128, 31, 4)), by(builtin(div, 3))),
              proof(goal(mod(128, 31, 4)), by(builtin(mod, 3))),
              proof(goal(add(4, 1, 5)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(12)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 12)]),
            uses([
              proof(goal(between(0, 18, 12)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(12)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 12)]),
            uses([
              proof(goal(between(0, 29, 12)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(2)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 2)]),
            uses([
              proof(goal(between(0, 6, 2)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20)))),
          proof(
            goal(legal_easter_date(4, 5)), by(rule("easter-computus.pl", clause(18))),
            bindings([binding("D", 5)]),
            uses([
              proof(goal(between(1, 25, 5)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2027, true).
why(
  legalGregorianWindow(y2027, true),
  proof(
    goal(legalGregorianWindow(y2027, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2027)]),
    uses([
      proof(
        goal(checks_pass(y2027)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2027), binding("_Year", 2027), binding("Month", 3), binding("Day", 28), binding("J", 13), binding("_K", 20), binding("_Q", 6), binding("R", 1), binding("V", 5), binding("_Z", 27), binding("_Name", march)]),
        uses([
          proof(
            goal(computus(y2027, 2027, 3, 28, 13, 20, 6, 1, 5, 27)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2027), binding("Year", 2027), binding("Month", 3), binding("Day", 28), binding("J", 13), binding("K", 20), binding("Q", 6), binding("R", 1), binding("V", 5), binding("Z", 27), binding("H", 27), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 247), binding("T1", 267), binding("T2", 262), binding("T3", 256), binding("T4", 271), binding("S", 6), binding("U", 3), binding("TwoN", 0), binding("TwoS", 12), binding("L1", 32), binding("L2", 44), binding("L3", 43), binding("L4", 40), binding("ElevenR", 11), binding("TwentyTwoV", 110), binding("W1", 24), binding("W2", 134), binding("W", 0), binding("SevenW", 0), binding("X1", 6), binding("X2", 6), binding("X3", 120)]),
            uses([
              proof(goal(case(y2027, 2027)), by(fact("easter-computus.pl", clause(5)))),
              proof(goal(mod(2027, 19, 13)), by(builtin(mod, 3))),
              proof(goal(div(2027, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2027, 100, 27)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 13, 247)), by(builtin(mul, 3))),
              proof(goal(add(247, 20, 267)), by(builtin(add, 3))),
              proof(goal(sub(267, 5, 262)), by(builtin(sub, 3))),
              proof(goal(sub(262, 6, 256)), by(builtin(sub, 3))),
              proof(goal(add(256, 15, 271)), by(builtin(add, 3))),
              proof(goal(mod(271, 30, 1)), by(builtin(mod, 3))),
              proof(goal(div(27, 4, 6)), by(builtin(div, 3))),
              proof(goal(mod(27, 4, 3)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 6, 12)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 12, 44)), by(builtin(add, 3))),
              proof(goal(sub(44, 1, 43)), by(builtin(sub, 3))),
              proof(goal(sub(43, 3, 40)), by(builtin(sub, 3))),
              proof(goal(mod(40, 7, 5)), by(builtin(mod, 3))),
              proof(goal(mul(11, 1, 11)), by(builtin(mul, 3))),
              proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
              proof(goal(add(13, 11, 24)), by(builtin(add, 3))),
              proof(goal(add(24, 110, 134)), by(builtin(add, 3))),
              proof(goal(div(134, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(1, 5, 6)), by(builtin(add, 3))),
              proof(goal(sub(6, 0, 6)), by(builtin(sub, 3))),
              proof(goal(add(6, 114, 120)), by(builtin(add, 3))),
              proof(goal(div(120, 31, 3)), by(builtin(div, 3))),
              proof(goal(mod(120, 31, 27)), by(builtin(mod, 3))),
              proof(goal(add(27, 1, 28)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(13)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 13)]),
            uses([
              proof(goal(between(0, 18, 13)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(1)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 1)]),
            uses([
              proof(goal(between(0, 29, 1)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(5)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 5)]),
            uses([
              proof(goal(between(0, 6, 5)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(3, march)), by(fact("easter-computus.pl", clause(19)))),
          proof(
            goal(legal_easter_date(3, 28)), by(rule("easter-computus.pl", clause(17))),
            bindings([binding("D", 28)]),
            uses([
              proof(goal(between(22, 31, 28)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2028, true).
why(
  legalGregorianWindow(y2028, true),
  proof(
    goal(legalGregorianWindow(y2028, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2028)]),
    uses([
      proof(
        goal(checks_pass(y2028)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2028), binding("_Year", 2028), binding("Month", 4), binding("Day", 16), binding("J", 14), binding("_K", 20), binding("_Q", 6), binding("R", 20), binding("V", 5), binding("_Z", 15), binding("_Name", april)]),
        uses([
          proof(
            goal(computus(y2028, 2028, 4, 16, 14, 20, 6, 20, 5, 15)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2028), binding("Year", 2028), binding("Month", 4), binding("Day", 16), binding("J", 14), binding("K", 20), binding("Q", 6), binding("R", 20), binding("V", 5), binding("Z", 15), binding("H", 28), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 266), binding("T1", 286), binding("T2", 281), binding("T3", 275), binding("T4", 290), binding("S", 7), binding("U", 0), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 26), binding("L4", 26), binding("ElevenR", 220), binding("TwentyTwoV", 110), binding("W1", 234), binding("W2", 344), binding("W", 0), binding("SevenW", 0), binding("X1", 25), binding("X2", 25), binding("X3", 139)]),
            uses([
              proof(goal(case(y2028, 2028)), by(fact("easter-computus.pl", clause(6)))),
              proof(goal(mod(2028, 19, 14)), by(builtin(mod, 3))),
              proof(goal(div(2028, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2028, 100, 28)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 14, 266)), by(builtin(mul, 3))),
              proof(goal(add(266, 20, 286)), by(builtin(add, 3))),
              proof(goal(sub(286, 5, 281)), by(builtin(sub, 3))),
              proof(goal(sub(281, 6, 275)), by(builtin(sub, 3))),
              proof(goal(add(275, 15, 290)), by(builtin(add, 3))),
              proof(goal(mod(290, 30, 20)), by(builtin(mod, 3))),
              proof(goal(div(28, 4, 7)), by(builtin(div, 3))),
              proof(goal(mod(28, 4, 0)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
              proof(goal(sub(46, 20, 26)), by(builtin(sub, 3))),
              proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
              proof(goal(mod(26, 7, 5)), by(builtin(mod, 3))),
              proof(goal(mul(11, 20, 220)), by(builtin(mul, 3))),
              proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
              proof(goal(add(14, 220, 234)), by(builtin(add, 3))),
              proof(goal(add(234, 110, 344)), by(builtin(add, 3))),
              proof(goal(div(344, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(20, 5, 25)), by(builtin(add, 3))),
              proof(goal(sub(25, 0, 25)), by(builtin(sub, 3))),
              proof(goal(add(25, 114, 139)), by(builtin(add, 3))),
              proof(goal(div(139, 31, 4)), by(builtin(div, 3))),
              proof(goal(mod(139, 31, 15)), by(builtin(mod, 3))),
              proof(goal(add(15, 1, 16)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(14)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 14)]),
            uses([
              proof(goal(between(0, 18, 14)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(20)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 20)]),
            uses([
              proof(goal(between(0, 29, 20)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(5)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 5)]),
            uses([
              proof(goal(between(0, 6, 5)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20)))),
          proof(
            goal(legal_easter_date(4, 16)), by(rule("easter-computus.pl", clause(18))),
            bindings([binding("D", 16)]),
            uses([
              proof(goal(between(1, 25, 16)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2029, true).
why(
  legalGregorianWindow(y2029, true),
  proof(
    goal(legalGregorianWindow(y2029, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2029)]),
    uses([
      proof(
        goal(checks_pass(y2029)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2029), binding("_Year", 2029), binding("Month", 4), binding("Day", 1), binding("J", 15), binding("_K", 20), binding("_Q", 6), binding("R", 9), binding("V", 1), binding("_Z", 0), binding("_Name", april)]),
        uses([
          proof(
            goal(computus(y2029, 2029, 4, 1, 15, 20, 6, 9, 1, 0)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2029), binding("Year", 2029), binding("Month", 4), binding("Day", 1), binding("J", 15), binding("K", 20), binding("Q", 6), binding("R", 9), binding("V", 1), binding("Z", 0), binding("H", 29), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 285), binding("T1", 305), binding("T2", 300), binding("T3", 294), binding("T4", 309), binding("S", 7), binding("U", 1), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 37), binding("L4", 36), binding("ElevenR", 99), binding("TwentyTwoV", 22), binding("W1", 114), binding("W2", 136), binding("W", 0), binding("SevenW", 0), binding("X1", 10), binding("X2", 10), binding("X3", 124)]),
            uses([
              proof(goal(case(y2029, 2029)), by(fact("easter-computus.pl", clause(7)))),
              proof(goal(mod(2029, 19, 15)), by(builtin(mod, 3))),
              proof(goal(div(2029, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2029, 100, 29)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 15, 285)), by(builtin(mul, 3))),
              proof(goal(add(285, 20, 305)), by(builtin(add, 3))),
              proof(goal(sub(305, 5, 300)), by(builtin(sub, 3))),
              proof(goal(sub(300, 6, 294)), by(builtin(sub, 3))),
              proof(goal(add(294, 15, 309)), by(builtin(add, 3))),
              proof(goal(mod(309, 30, 9)), by(builtin(mod, 3))),
              proof(goal(div(29, 4, 7)), by(builtin(div, 3))),
              proof(goal(mod(29, 4, 1)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
              proof(goal(sub(46, 9, 37)), by(builtin(sub, 3))),
              proof(goal(sub(37, 1, 36)), by(builtin(sub, 3))),
              proof(goal(mod(36, 7, 1)), by(builtin(mod, 3))),
              proof(goal(mul(11, 9, 99)), by(builtin(mul, 3))),
              proof(goal(mul(22, 1, 22)), by(builtin(mul, 3))),
              proof(goal(add(15, 99, 114)), by(builtin(add, 3))),
              proof(goal(add(114, 22, 136)), by(builtin(add, 3))),
              proof(goal(div(136, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(9, 1, 10)), by(builtin(add, 3))),
              proof(goal(sub(10, 0, 10)), by(builtin(sub, 3))),
              proof(goal(add(10, 114, 124)), by(builtin(add, 3))),
              proof(goal(div(124, 31, 4)), by(builtin(div, 3))),
              proof(goal(mod(124, 31, 0)), by(builtin(mod, 3))),
              proof(goal(add(0, 1, 1)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(15)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 15)]),
            uses([
              proof(goal(between(0, 18, 15)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(9)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 9)]),
            uses([
              proof(goal(between(0, 29, 9)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(1)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 1)]),
            uses([
              proof(goal(between(0, 6, 1)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20)))),
          proof(
            goal(legal_easter_date(4, 1)), by(rule("easter-computus.pl", clause(18))),
            bindings([binding("D", 1)]),
            uses([
              proof(goal(between(1, 25, 1)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2030, true).
why(
  legalGregorianWindow(y2030, true),
  proof(
    goal(legalGregorianWindow(y2030, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2030)]),
    uses([
      proof(
        goal(checks_pass(y2030)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2030), binding("_Year", 2030), binding("Month", 4), binding("Day", 21), binding("J", 16), binding("_K", 20), binding("_Q", 6), binding("R", 28), binding("V", 2), binding("_Z", 20), binding("_Name", april)]),
        uses([
          proof(
            goal(computus(y2030, 2030, 4, 21, 16, 20, 6, 28, 2, 20)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2030), binding("Year", 2030), binding("Month", 4), binding("Day", 21), binding("J", 16), binding("K", 20), binding("Q", 6), binding("R", 28), binding("V", 2), binding("Z", 20), binding("H", 30), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 304), binding("T1", 324), binding("T2", 319), binding("T3", 313), binding("T4", 328), binding("S", 7), binding("U", 2), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 18), binding("L4", 16), binding("ElevenR", 308), binding("TwentyTwoV", 44), binding("W1", 324), binding("W2", 368), binding("W", 0), binding("SevenW", 0), binding("X1", 30), binding("X2", 30), binding("X3", 144)]),
            uses([
              proof(goal(case(y2030, 2030)), by(fact("easter-computus.pl", clause(8)))),
              proof(goal(mod(2030, 19, 16)), by(builtin(mod, 3))),
              proof(goal(div(2030, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2030, 100, 30)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 16, 304)), by(builtin(mul, 3))),
              proof(goal(add(304, 20, 324)), by(builtin(add, 3))),
              proof(goal(sub(324, 5, 319)), by(builtin(sub, 3))),
              proof(goal(sub(319, 6, 313)), by(builtin(sub, 3))),
              proof(goal(add(313, 15, 328)), by(builtin(add, 3))),
              proof(goal(mod(328, 30, 28)), by(builtin(mod, 3))),
              proof(goal(div(30, 4, 7)), by(builtin(div, 3))),
              proof(goal(mod(30, 4, 2)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
              proof(goal(sub(46, 28, 18)), by(builtin(sub, 3))),
              proof(goal(sub(18, 2, 16)), by(builtin(sub, 3))),
              proof(goal(mod(16, 7, 2)), by(builtin(mod, 3))),
              proof(goal(mul(11, 28, 308)), by(builtin(mul, 3))),
              proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
              proof(goal(add(16, 308, 324)), by(builtin(add, 3))),
              proof(goal(add(324, 44, 368)), by(builtin(add, 3))),
              proof(goal(div(368, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(28, 2, 30)), by(builtin(add, 3))),
              proof(goal(sub(30, 0, 30)), by(builtin(sub, 3))),
              proof(goal(add(30, 114, 144)), by(builtin(add, 3))),
              proof(goal(div(144, 31, 4)), by(builtin(div, 3))),
              proof(goal(mod(144, 31, 20)), by(builtin(mod, 3))),
              proof(goal(add(20, 1, 21)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(16)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 16)]),
            uses([
              proof(goal(between(0, 18, 16)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(28)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 28)]),
            uses([
              proof(goal(between(0, 29, 28)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(2)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 2)]),
            uses([
              proof(goal(between(0, 6, 2)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20)))),
          proof(
            goal(legal_easter_date(4, 21)), by(rule("easter-computus.pl", clause(18))),
            bindings([binding("D", 21)]),
            uses([
              proof(goal(between(1, 25, 21)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2031, true).
why(
  legalGregorianWindow(y2031, true),
  proof(
    goal(legalGregorianWindow(y2031, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2031)]),
    uses([
      proof(
        goal(checks_pass(y2031)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2031), binding("_Year", 2031), binding("Month", 4), binding("Day", 13), binding("J", 17), binding("_K", 20), binding("_Q", 6), binding("R", 17), binding("V", 5), binding("_Z", 12), binding("_Name", april)]),
        uses([
          proof(
            goal(computus(y2031, 2031, 4, 13, 17, 20, 6, 17, 5, 12)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2031), binding("Year", 2031), binding("Month", 4), binding("Day", 13), binding("J", 17), binding("K", 20), binding("Q", 6), binding("R", 17), binding("V", 5), binding("Z", 12), binding("H", 31), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 323), binding("T1", 343), binding("T2", 338), binding("T3", 332), binding("T4", 347), binding("S", 7), binding("U", 3), binding("TwoN", 0), binding("TwoS", 14), binding("L1", 32), binding("L2", 46), binding("L3", 29), binding("L4", 26), binding("ElevenR", 187), binding("TwentyTwoV", 110), binding("W1", 204), binding("W2", 314), binding("W", 0), binding("SevenW", 0), binding("X1", 22), binding("X2", 22), binding("X3", 136)]),
            uses([
              proof(goal(case(y2031, 2031)), by(fact("easter-computus.pl", clause(9)))),
              proof(goal(mod(2031, 19, 17)), by(builtin(mod, 3))),
              proof(goal(div(2031, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2031, 100, 31)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 17, 323)), by(builtin(mul, 3))),
              proof(goal(add(323, 20, 343)), by(builtin(add, 3))),
              proof(goal(sub(343, 5, 338)), by(builtin(sub, 3))),
              proof(goal(sub(338, 6, 332)), by(builtin(sub, 3))),
              proof(goal(add(332, 15, 347)), by(builtin(add, 3))),
              proof(goal(mod(347, 30, 17)), by(builtin(mod, 3))),
              proof(goal(div(31, 4, 7)), by(builtin(div, 3))),
              proof(goal(mod(31, 4, 3)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 7, 14)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 14, 46)), by(builtin(add, 3))),
              proof(goal(sub(46, 17, 29)), by(builtin(sub, 3))),
              proof(goal(sub(29, 3, 26)), by(builtin(sub, 3))),
              proof(goal(mod(26, 7, 5)), by(builtin(mod, 3))),
              proof(goal(mul(11, 17, 187)), by(builtin(mul, 3))),
              proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
              proof(goal(add(17, 187, 204)), by(builtin(add, 3))),
              proof(goal(add(204, 110, 314)), by(builtin(add, 3))),
              proof(goal(div(314, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(17, 5, 22)), by(builtin(add, 3))),
              proof(goal(sub(22, 0, 22)), by(builtin(sub, 3))),
              proof(goal(add(22, 114, 136)), by(builtin(add, 3))),
              proof(goal(div(136, 31, 4)), by(builtin(div, 3))),
              proof(goal(mod(136, 31, 12)), by(builtin(mod, 3))),
              proof(goal(add(12, 1, 13)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(17)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 17)]),
            uses([
              proof(goal(between(0, 18, 17)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(17)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 17)]),
            uses([
              proof(goal(between(0, 29, 17)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(5)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 5)]),
            uses([
              proof(goal(between(0, 6, 5)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20)))),
          proof(
            goal(legal_easter_date(4, 13)), by(rule("easter-computus.pl", clause(18))),
            bindings([binding("D", 13)]),
            uses([
              proof(goal(between(1, 25, 13)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2032, true).
why(
  legalGregorianWindow(y2032, true),
  proof(
    goal(legalGregorianWindow(y2032, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2032)]),
    uses([
      proof(
        goal(checks_pass(y2032)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2032), binding("_Year", 2032), binding("Month", 3), binding("Day", 28), binding("J", 18), binding("_K", 20), binding("_Q", 6), binding("R", 6), binding("V", 0), binding("_Z", 27), binding("_Name", march)]),
        uses([
          proof(
            goal(computus(y2032, 2032, 3, 28, 18, 20, 6, 6, 0, 27)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2032), binding("Year", 2032), binding("Month", 3), binding("Day", 28), binding("J", 18), binding("K", 20), binding("Q", 6), binding("R", 6), binding("V", 0), binding("Z", 27), binding("H", 32), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 342), binding("T1", 362), binding("T2", 357), binding("T3", 351), binding("T4", 366), binding("S", 8), binding("U", 0), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 42), binding("L4", 42), binding("ElevenR", 66), binding("TwentyTwoV", 0), binding("W1", 84), binding("W2", 84), binding("W", 0), binding("SevenW", 0), binding("X1", 6), binding("X2", 6), binding("X3", 120)]),
            uses([
              proof(goal(case(y2032, 2032)), by(fact("easter-computus.pl", clause(10)))),
              proof(goal(mod(2032, 19, 18)), by(builtin(mod, 3))),
              proof(goal(div(2032, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2032, 100, 32)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 18, 342)), by(builtin(mul, 3))),
              proof(goal(add(342, 20, 362)), by(builtin(add, 3))),
              proof(goal(sub(362, 5, 357)), by(builtin(sub, 3))),
              proof(goal(sub(357, 6, 351)), by(builtin(sub, 3))),
              proof(goal(add(351, 15, 366)), by(builtin(add, 3))),
              proof(goal(mod(366, 30, 6)), by(builtin(mod, 3))),
              proof(goal(div(32, 4, 8)), by(builtin(div, 3))),
              proof(goal(mod(32, 4, 0)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
              proof(goal(sub(48, 6, 42)), by(builtin(sub, 3))),
              proof(goal(sub(42, 0, 42)), by(builtin(sub, 3))),
              proof(goal(mod(42, 7, 0)), by(builtin(mod, 3))),
              proof(goal(mul(11, 6, 66)), by(builtin(mul, 3))),
              proof(goal(mul(22, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(18, 66, 84)), by(builtin(add, 3))),
              proof(goal(add(84, 0, 84)), by(builtin(add, 3))),
              proof(goal(div(84, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(6, 0, 6)), by(builtin(add, 3))),
              proof(goal(sub(6, 0, 6)), by(builtin(sub, 3))),
              proof(goal(add(6, 114, 120)), by(builtin(add, 3))),
              proof(goal(div(120, 31, 3)), by(builtin(div, 3))),
              proof(goal(mod(120, 31, 27)), by(builtin(mod, 3))),
              proof(goal(add(27, 1, 28)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(18)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 18)]),
            uses([
              proof(goal(between(0, 18, 18)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(6)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 6)]),
            uses([
              proof(goal(between(0, 29, 6)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(0)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 0)]),
            uses([
              proof(goal(between(0, 6, 0)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(3, march)), by(fact("easter-computus.pl", clause(19)))),
          proof(
            goal(legal_easter_date(3, 28)), by(rule("easter-computus.pl", clause(17))),
            bindings([binding("D", 28)]),
            uses([
              proof(goal(between(22, 31, 28)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2033, true).
why(
  legalGregorianWindow(y2033, true),
  proof(
    goal(legalGregorianWindow(y2033, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2033)]),
    uses([
      proof(
        goal(checks_pass(y2033)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2033), binding("_Year", 2033), binding("Month", 4), binding("Day", 17), binding("J", 0), binding("_K", 20), binding("_Q", 6), binding("R", 24), binding("V", 2), binding("_Z", 16), binding("_Name", april)]),
        uses([
          proof(
            goal(computus(y2033, 2033, 4, 17, 0, 20, 6, 24, 2, 16)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2033), binding("Year", 2033), binding("Month", 4), binding("Day", 17), binding("J", 0), binding("K", 20), binding("Q", 6), binding("R", 24), binding("V", 2), binding("Z", 16), binding("H", 33), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 0), binding("T1", 20), binding("T2", 15), binding("T3", 9), binding("T4", 24), binding("S", 8), binding("U", 1), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 24), binding("L4", 23), binding("ElevenR", 264), binding("TwentyTwoV", 44), binding("W1", 264), binding("W2", 308), binding("W", 0), binding("SevenW", 0), binding("X1", 26), binding("X2", 26), binding("X3", 140)]),
            uses([
              proof(goal(case(y2033, 2033)), by(fact("easter-computus.pl", clause(11)))),
              proof(goal(mod(2033, 19, 0)), by(builtin(mod, 3))),
              proof(goal(div(2033, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2033, 100, 33)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(0, 20, 20)), by(builtin(add, 3))),
              proof(goal(sub(20, 5, 15)), by(builtin(sub, 3))),
              proof(goal(sub(15, 6, 9)), by(builtin(sub, 3))),
              proof(goal(add(9, 15, 24)), by(builtin(add, 3))),
              proof(goal(mod(24, 30, 24)), by(builtin(mod, 3))),
              proof(goal(div(33, 4, 8)), by(builtin(div, 3))),
              proof(goal(mod(33, 4, 1)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
              proof(goal(sub(48, 24, 24)), by(builtin(sub, 3))),
              proof(goal(sub(24, 1, 23)), by(builtin(sub, 3))),
              proof(goal(mod(23, 7, 2)), by(builtin(mod, 3))),
              proof(goal(mul(11, 24, 264)), by(builtin(mul, 3))),
              proof(goal(mul(22, 2, 44)), by(builtin(mul, 3))),
              proof(goal(add(0, 264, 264)), by(builtin(add, 3))),
              proof(goal(add(264, 44, 308)), by(builtin(add, 3))),
              proof(goal(div(308, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(24, 2, 26)), by(builtin(add, 3))),
              proof(goal(sub(26, 0, 26)), by(builtin(sub, 3))),
              proof(goal(add(26, 114, 140)), by(builtin(add, 3))),
              proof(goal(div(140, 31, 4)), by(builtin(div, 3))),
              proof(goal(mod(140, 31, 16)), by(builtin(mod, 3))),
              proof(goal(add(16, 1, 17)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(0)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 0)]),
            uses([
              proof(goal(between(0, 18, 0)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(24)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 24)]),
            uses([
              proof(goal(between(0, 29, 24)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(2)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 2)]),
            uses([
              proof(goal(between(0, 6, 2)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20)))),
          proof(
            goal(legal_easter_date(4, 17)), by(rule("easter-computus.pl", clause(18))),
            bindings([binding("D", 17)]),
            uses([
              proof(goal(between(1, 25, 17)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2034, true).
why(
  legalGregorianWindow(y2034, true),
  proof(
    goal(legalGregorianWindow(y2034, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2034)]),
    uses([
      proof(
        goal(checks_pass(y2034)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2034), binding("_Year", 2034), binding("Month", 4), binding("Day", 9), binding("J", 1), binding("_K", 20), binding("_Q", 6), binding("R", 13), binding("V", 5), binding("_Z", 8), binding("_Name", april)]),
        uses([
          proof(
            goal(computus(y2034, 2034, 4, 9, 1, 20, 6, 13, 5, 8)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2034), binding("Year", 2034), binding("Month", 4), binding("Day", 9), binding("J", 1), binding("K", 20), binding("Q", 6), binding("R", 13), binding("V", 5), binding("Z", 8), binding("H", 34), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 19), binding("T1", 39), binding("T2", 34), binding("T3", 28), binding("T4", 43), binding("S", 8), binding("U", 2), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 35), binding("L4", 33), binding("ElevenR", 143), binding("TwentyTwoV", 110), binding("W1", 144), binding("W2", 254), binding("W", 0), binding("SevenW", 0), binding("X1", 18), binding("X2", 18), binding("X3", 132)]),
            uses([
              proof(goal(case(y2034, 2034)), by(fact("easter-computus.pl", clause(12)))),
              proof(goal(mod(2034, 19, 1)), by(builtin(mod, 3))),
              proof(goal(div(2034, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2034, 100, 34)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 1, 19)), by(builtin(mul, 3))),
              proof(goal(add(19, 20, 39)), by(builtin(add, 3))),
              proof(goal(sub(39, 5, 34)), by(builtin(sub, 3))),
              proof(goal(sub(34, 6, 28)), by(builtin(sub, 3))),
              proof(goal(add(28, 15, 43)), by(builtin(add, 3))),
              proof(goal(mod(43, 30, 13)), by(builtin(mod, 3))),
              proof(goal(div(34, 4, 8)), by(builtin(div, 3))),
              proof(goal(mod(34, 4, 2)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
              proof(goal(sub(48, 13, 35)), by(builtin(sub, 3))),
              proof(goal(sub(35, 2, 33)), by(builtin(sub, 3))),
              proof(goal(mod(33, 7, 5)), by(builtin(mod, 3))),
              proof(goal(mul(11, 13, 143)), by(builtin(mul, 3))),
              proof(goal(mul(22, 5, 110)), by(builtin(mul, 3))),
              proof(goal(add(1, 143, 144)), by(builtin(add, 3))),
              proof(goal(add(144, 110, 254)), by(builtin(add, 3))),
              proof(goal(div(254, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(13, 5, 18)), by(builtin(add, 3))),
              proof(goal(sub(18, 0, 18)), by(builtin(sub, 3))),
              proof(goal(add(18, 114, 132)), by(builtin(add, 3))),
              proof(goal(div(132, 31, 4)), by(builtin(div, 3))),
              proof(goal(mod(132, 31, 8)), by(builtin(mod, 3))),
              proof(goal(add(8, 1, 9)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(1)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 1)]),
            uses([
              proof(goal(between(0, 18, 1)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(13)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 13)]),
            uses([
              proof(goal(between(0, 29, 13)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(5)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 5)]),
            uses([
              proof(goal(between(0, 6, 5)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(4, april)), by(fact("easter-computus.pl", clause(20)))),
          proof(
            goal(legal_easter_date(4, 9)), by(rule("easter-computus.pl", clause(18))),
            bindings([binding("D", 9)]),
            uses([
              proof(goal(between(1, 25, 9)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

legalGregorianWindow(y2035, true).
why(
  legalGregorianWindow(y2035, true),
  proof(
    goal(legalGregorianWindow(y2035, true)), by(rule("easter-computus.pl", clause(25))),
    bindings([binding("Case", y2035)]),
    uses([
      proof(
        goal(checks_pass(y2035)), by(rule("easter-computus.pl", clause(22))),
        bindings([binding("Case", y2035), binding("_Year", 2035), binding("Month", 3), binding("Day", 25), binding("J", 2), binding("_K", 20), binding("_Q", 6), binding("R", 2), binding("V", 1), binding("_Z", 24), binding("_Name", march)]),
        uses([
          proof(
            goal(computus(y2035, 2035, 3, 25, 2, 20, 6, 2, 1, 24)), by(rule("easter-computus.pl", clause(21))),
            bindings([binding("Case", y2035), binding("Year", 2035), binding("Month", 3), binding("Day", 25), binding("J", 2), binding("K", 20), binding("Q", 6), binding("R", 2), binding("V", 1), binding("Z", 24), binding("H", 35), binding("M", 5), binding("N", 0), binding("KP8", 28), binding("P", 1), binding("KminusP", 19), binding("KminusPplus1", 20), binding("NineteenJ", 38), binding("T1", 58), binding("T2", 53), binding("T3", 47), binding("T4", 62), binding("S", 8), binding("U", 3), binding("TwoN", 0), binding("TwoS", 16), binding("L1", 32), binding("L2", 48), binding("L3", 46), binding("L4", 43), binding("ElevenR", 22), binding("TwentyTwoV", 22), binding("W1", 24), binding("W2", 46), binding("W", 0), binding("SevenW", 0), binding("X1", 3), binding("X2", 3), binding("X3", 117)]),
            uses([
              proof(goal(case(y2035, 2035)), by(fact("easter-computus.pl", clause(13)))),
              proof(goal(mod(2035, 19, 2)), by(builtin(mod, 3))),
              proof(goal(div(2035, 100, 20)), by(builtin(div, 3))),
              proof(goal(mod(2035, 100, 35)), by(builtin(mod, 3))),
              proof(goal(div(20, 4, 5)), by(builtin(div, 3))),
              proof(goal(mod(20, 4, 0)), by(builtin(mod, 3))),
              proof(goal(add(20, 8, 28)), by(builtin(add, 3))),
              proof(goal(div(28, 25, 1)), by(builtin(div, 3))),
              proof(goal(sub(20, 1, 19)), by(builtin(sub, 3))),
              proof(goal(add(19, 1, 20)), by(builtin(add, 3))),
              proof(goal(div(20, 3, 6)), by(builtin(div, 3))),
              proof(goal(mul(19, 2, 38)), by(builtin(mul, 3))),
              proof(goal(add(38, 20, 58)), by(builtin(add, 3))),
              proof(goal(sub(58, 5, 53)), by(builtin(sub, 3))),
              proof(goal(sub(53, 6, 47)), by(builtin(sub, 3))),
              proof(goal(add(47, 15, 62)), by(builtin(add, 3))),
              proof(goal(mod(62, 30, 2)), by(builtin(mod, 3))),
              proof(goal(div(35, 4, 8)), by(builtin(div, 3))),
              proof(goal(mod(35, 4, 3)), by(builtin(mod, 3))),
              proof(goal(mul(2, 0, 0)), by(builtin(mul, 3))),
              proof(goal(mul(2, 8, 16)), by(builtin(mul, 3))),
              proof(goal(add(32, 0, 32)), by(builtin(add, 3))),
              proof(goal(add(32, 16, 48)), by(builtin(add, 3))),
              proof(goal(sub(48, 2, 46)), by(builtin(sub, 3))),
              proof(goal(sub(46, 3, 43)), by(builtin(sub, 3))),
              proof(goal(mod(43, 7, 1)), by(builtin(mod, 3))),
              proof(goal(mul(11, 2, 22)), by(builtin(mul, 3))),
              proof(goal(mul(22, 1, 22)), by(builtin(mul, 3))),
              proof(goal(add(2, 22, 24)), by(builtin(add, 3))),
              proof(goal(add(24, 22, 46)), by(builtin(add, 3))),
              proof(goal(div(46, 451, 0)), by(builtin(div, 3))),
              proof(goal(mul(7, 0, 0)), by(builtin(mul, 3))),
              proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
              proof(goal(sub(3, 0, 3)), by(builtin(sub, 3))),
              proof(goal(add(3, 114, 117)), by(builtin(add, 3))),
              proof(goal(div(117, 31, 3)), by(builtin(div, 3))),
              proof(goal(mod(117, 31, 24)), by(builtin(mod, 3))),
              proof(goal(add(24, 1, 25)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(valid_golden(2)), by(rule("easter-computus.pl", clause(14))),
            bindings([binding("N", 2)]),
            uses([
              proof(goal(between(0, 18, 2)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_epact(2)), by(rule("easter-computus.pl", clause(15))),
            bindings([binding("N", 2)]),
            uses([
              proof(goal(between(0, 29, 2)), by(builtin(between, 3)))
            ])
          ),
          proof(
            goal(valid_weekday(1)), by(rule("easter-computus.pl", clause(16))),
            bindings([binding("N", 1)]),
            uses([
              proof(goal(between(0, 6, 1)), by(builtin(between, 3)))
            ])
          ),
          proof(goal(month_name(3, march)), by(fact("easter-computus.pl", clause(19)))),
          proof(
            goal(legal_easter_date(3, 25)), by(rule("easter-computus.pl", clause(17))),
            bindings([binding("D", 25)]),
            uses([
              proof(goal(between(22, 31, 25)), by(builtin(between, 3)))
            ])
          )
        ])
      )
    ])
  )
).

