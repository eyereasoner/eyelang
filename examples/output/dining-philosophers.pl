dp_type(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_Request).
why(
  dp_type(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_Request),
  proof(
    goal(dp_type(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_Request).
why(
  dp_type(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_Request),
  proof(
    goal(dp_type(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_Request).
why(
  dp_type(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_Request),
  proof(
    goal(dp_type(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_Request).
why(
  dp_type(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_Request),
  proof(
    goal(dp_type(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_Request).
why(
  dp_type(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_Request),
  proof(
    goal(dp_type(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_Request).
why(
  dp_type(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_Request),
  proof(
    goal(dp_type(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_Request).
why(
  dp_type(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_Request),
  proof(
    goal(dp_type(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_Request).
why(
  dp_type(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_Request),
  proof(
    goal(dp_type(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_Request).
why(
  dp_type(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_Request),
  proof(
    goal(dp_type(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_Request).
why(
  dp_type(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_Request),
  proof(
    goal(dp_type(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_Request).
why(
  dp_type(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_Request),
  proof(
    goal(dp_type(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_Request).
why(
  dp_type(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_Request),
  proof(
    goal(dp_type(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_Request).
why(
  dp_type(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_Request),
  proof(
    goal(dp_type(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_Request).
why(
  dp_type(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_Request),
  proof(
    goal(dp_type(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_Request).
why(
  dp_type(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_Request),
  proof(
    goal(dp_type(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_Request).
why(
  dp_type(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_Request),
  proof(
    goal(dp_type(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_Request).
why(
  dp_type(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_Request),
  proof(
    goal(dp_type(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_Request).
why(
  dp_type(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_Request),
  proof(
    goal(dp_type(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_Request).
why(
  dp_type(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_Request),
  proof(
    goal(dp_type(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_Request).
why(
  dp_type(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_Request),
  proof(
    goal(dp_type(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_Request).
why(
  dp_type(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_Request),
  proof(
    goal(dp_type(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_Request).
why(
  dp_type(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_Request),
  proof(
    goal(dp_type(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_Request).
why(
  dp_type(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_Request),
  proof(
    goal(dp_type(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_Request).
why(
  dp_type(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_Request),
  proof(
    goal(dp_type(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_Request).
why(
  dp_type(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_Request),
  proof(
    goal(dp_type(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_Request).
why(
  dp_type(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_Request),
  proof(
    goal(dp_type(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_Request)), by(rule("dining-philosophers.pl", clause(147))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_type(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_SendFork).
why(
  dp_type(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_SendFork).
why(
  dp_type(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_SendFork).
why(
  dp_type(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_SendFork).
why(
  dp_type(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_SendFork).
why(
  dp_type(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_SendFork).
why(
  dp_type(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_SendFork).
why(
  dp_type(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_SendFork).
why(
  dp_type(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_SendFork).
why(
  dp_type(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_SendFork).
why(
  dp_type(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_SendFork).
why(
  dp_type(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_SendFork).
why(
  dp_type(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_SendFork).
why(
  dp_type(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_SendFork).
why(
  dp_type(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_SendFork).
why(
  dp_type(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_SendFork).
why(
  dp_type(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_SendFork).
why(
  dp_type(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_SendFork).
why(
  dp_type(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_SendFork).
why(
  dp_type(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_SendFork).
why(
  dp_type(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_SendFork).
why(
  dp_type(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_SendFork).
why(
  dp_type(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_SendFork).
why(
  dp_type(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_SendFork).
why(
  dp_type(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_SendFork).
why(
  dp_type(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
        ])
      )
    ])
  )
).

dp_type(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_SendFork).
why(
  dp_type(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_SendFork),
  proof(
    goal(dp_type(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_SendFork)), by(rule("dining-philosophers.pl", clause(152))),
    bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
        ])
      )
    ])
  )
).

dp_type(dp_mP1_1, dp_Meal).
why(
  dp_type(dp_mP1_1, dp_Meal),
  proof(
    goal(dp_type(dp_mP1_1, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP1_1), binding("_P", dp_P1), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP1_1, dp_P1, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_1), binding("P", dp_P1), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Dirty), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P1)), by(fact("dining-philosophers.pl", clause(47)))),
          proof(goal(meal_handle(dp_P1, 1, dp_mP1_1)), by(fact("dining-philosophers.pl", clause(126)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C1, dp_F51, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F51), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F51)), by(fact("dining-philosophers.pl", clause(110)))),
              proof(goal(start_state(dp_C0, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(66))))
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F12, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F12), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F12)), by(fact("dining-philosophers.pl", clause(107)))),
              proof(goal(start_state(dp_C0, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(62))))
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP3_1, dp_Meal).
why(
  dp_type(dp_mP3_1, dp_Meal),
  proof(
    goal(dp_type(dp_mP3_1, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP3_1), binding("_P", dp_P3), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP3_1, dp_P3, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_1), binding("P", dp_P3), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(meal_handle(dp_P3, 1, dp_mP3_1)), by(fact("dining-philosophers.pl", clause(132)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C1, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C1), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C0), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(
                goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F34, dp_P3, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F34), binding("H", dp_P3), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F34)), by(fact("dining-philosophers.pl", clause(108)))),
              proof(goal(start_state(dp_C0, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(64))))
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP2_1, dp_Meal).
why(
  dp_type(dp_mP2_1, dp_Meal),
  proof(
    goal(dp_type(dp_mP2_1, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP2_1), binding("_P", dp_P2), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP2_1, dp_P2, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_1), binding("P", dp_P2), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(meal_handle(dp_P2, 1, dp_mP2_1)), by(fact("dining-philosophers.pl", clause(129)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C3, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP4_1, dp_Meal).
why(
  dp_type(dp_mP4_1, dp_Meal),
  proof(
    goal(dp_type(dp_mP4_1, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP4_1), binding("_P", dp_P4), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP4_1, dp_P4, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_1), binding("P", dp_P4), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(meal_handle(dp_P4, 1, dp_mP4_1)), by(fact("dining-philosophers.pl", clause(135)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C3, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F45, dp_P4, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C3), binding("F", dp_F45), binding("H", dp_P4), binding("Cleanliness", dp_Dirty), binding("C", dp_C2)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(goal(keep(dp_C2, dp_F45)), by(fact("dining-philosophers.pl", clause(111)))),
              proof(goal(start_state(dp_C2, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(70))))
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP5_1, dp_Meal).
why(
  dp_type(dp_mP5_1, dp_Meal),
  proof(
    goal(dp_type(dp_mP5_1, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP5_1), binding("_P", dp_P5), binding("_N", 1), binding("_S", dp_s3)]),
    uses([
      proof(
        goal(meal(dp_mP5_1, dp_P5, 1, dp_s3)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_1), binding("P", dp_P5), binding("N", 1), binding("S", dp_s3), binding("C", dp_C4), binding("CS", dp_C5), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
          proof(goal(slot(dp_C4, dp_s3, 1)), by(fact("dining-philosophers.pl", clause(26)))),
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(meal_handle(dp_P5, 1, dp_mP5_1)), by(fact("dining-philosophers.pl", clause(138)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C5, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C5, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP1_2, dp_Meal).
why(
  dp_type(dp_mP1_2, dp_Meal),
  proof(
    goal(dp_type(dp_mP1_2, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP1_2), binding("_P", dp_P1), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP1_2, dp_P1, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_2), binding("P", dp_P1), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(meal_handle(dp_P1, 2, dp_mP1_2)), by(fact("dining-philosophers.pl", clause(127)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C7, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP3_2, dp_Meal).
why(
  dp_type(dp_mP3_2, dp_Meal),
  proof(
    goal(dp_type(dp_mP3_2, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP3_2), binding("_P", dp_P3), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP3_2, dp_P3, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_2), binding("P", dp_P3), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(meal_handle(dp_P3, 2, dp_mP3_2)), by(fact("dining-philosophers.pl", clause(133)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C7, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP2_2, dp_Meal).
why(
  dp_type(dp_mP2_2, dp_Meal),
  proof(
    goal(dp_type(dp_mP2_2, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP2_2), binding("_P", dp_P2), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP2_2, dp_P2, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_2), binding("P", dp_P2), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(meal_handle(dp_P2, 2, dp_mP2_2)), by(fact("dining-philosophers.pl", clause(130)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C9, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP4_2, dp_Meal).
why(
  dp_type(dp_mP4_2, dp_Meal),
  proof(
    goal(dp_type(dp_mP4_2, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP4_2), binding("_P", dp_P4), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP4_2, dp_P4, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_2), binding("P", dp_P4), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(meal_handle(dp_P4, 2, dp_mP4_2)), by(fact("dining-philosophers.pl", clause(136)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C9, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP5_2, dp_Meal).
why(
  dp_type(dp_mP5_2, dp_Meal),
  proof(
    goal(dp_type(dp_mP5_2, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP5_2), binding("_P", dp_P5), binding("_N", 2), binding("_S", dp_s6)]),
    uses([
      proof(
        goal(meal(dp_mP5_2, dp_P5, 2, dp_s6)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_2), binding("P", dp_P5), binding("N", 2), binding("S", dp_s6), binding("C", dp_C10), binding("CS", dp_C11), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
          proof(goal(slot(dp_C10, dp_s6, 2)), by(fact("dining-philosophers.pl", clause(35)))),
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(meal_handle(dp_P5, 2, dp_mP5_2)), by(fact("dining-philosophers.pl", clause(139)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C11, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C11, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP1_3, dp_Meal).
why(
  dp_type(dp_mP1_3, dp_Meal),
  proof(
    goal(dp_type(dp_mP1_3, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP1_3), binding("_P", dp_P1), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP1_3, dp_P1, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_3), binding("P", dp_P1), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(meal_handle(dp_P1, 3, dp_mP1_3)), by(fact("dining-philosophers.pl", clause(128)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C13, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP3_3, dp_Meal).
why(
  dp_type(dp_mP3_3, dp_Meal),
  proof(
    goal(dp_type(dp_mP3_3, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP3_3), binding("_P", dp_P3), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP3_3, dp_P3, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_3), binding("P", dp_P3), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(meal_handle(dp_P3, 3, dp_mP3_3)), by(fact("dining-philosophers.pl", clause(134)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C13, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP2_3, dp_Meal).
why(
  dp_type(dp_mP2_3, dp_Meal),
  proof(
    goal(dp_type(dp_mP2_3, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP2_3), binding("_P", dp_P2), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP2_3, dp_P2, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_3), binding("P", dp_P2), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(meal_handle(dp_P2, 3, dp_mP2_3)), by(fact("dining-philosophers.pl", clause(131)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C15, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP4_3, dp_Meal).
why(
  dp_type(dp_mP4_3, dp_Meal),
  proof(
    goal(dp_type(dp_mP4_3, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP4_3), binding("_P", dp_P4), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP4_3, dp_P4, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_3), binding("P", dp_P4), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(meal_handle(dp_P4, 3, dp_mP4_3)), by(fact("dining-philosophers.pl", clause(137)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C15, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_type(dp_mP5_3, dp_Meal).
why(
  dp_type(dp_mP5_3, dp_Meal),
  proof(
    goal(dp_type(dp_mP5_3, dp_Meal)), by(rule("dining-philosophers.pl", clause(157))),
    bindings([binding("M", dp_mP5_3), binding("_P", dp_P5), binding("_N", 3), binding("_S", dp_s9)]),
    uses([
      proof(
        goal(meal(dp_mP5_3, dp_P5, 3, dp_s9)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_3), binding("P", dp_P5), binding("N", 3), binding("S", dp_s9), binding("C", dp_C16), binding("CS", dp_C17), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
          proof(goal(slot(dp_C16, dp_s9, 3)), by(fact("dining-philosophers.pl", clause(44)))),
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(meal_handle(dp_P5, 3, dp_mP5_3)), by(fact("dining-philosophers.pl", clause(140)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C17, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C17, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_in(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_C0).
why(
  dp_in(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_C0),
  proof(
    goal(dp_in(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_C0)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_C2).
why(
  dp_in(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_C2),
  proof(
    goal(dp_in(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_C2)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_C2).
why(
  dp_in(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_C2),
  proof(
    goal(dp_in(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_C2)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_C4).
why(
  dp_in(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_C4),
  proof(
    goal(dp_in(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_C4)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_C6).
why(
  dp_in(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_C6),
  proof(
    goal(dp_in(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_C6)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_C6).
why(
  dp_in(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_C6),
  proof(
    goal(dp_in(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_C6)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_C8).
why(
  dp_in(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_C8),
  proof(
    goal(dp_in(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_C8)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_C8).
why(
  dp_in(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_C8),
  proof(
    goal(dp_in(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_C8)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_C10).
why(
  dp_in(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_C10),
  proof(
    goal(dp_in(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_C10)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_C12).
why(
  dp_in(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_C12),
  proof(
    goal(dp_in(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_C12)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_C12).
why(
  dp_in(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_C12),
  proof(
    goal(dp_in(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_C12)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_C14).
why(
  dp_in(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_C14),
  proof(
    goal(dp_in(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_C14)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_C14).
why(
  dp_in(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_C14),
  proof(
    goal(dp_in(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_C14)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_C16).
why(
  dp_in(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_C16),
  proof(
    goal(dp_in(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_C16)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_C2).
why(
  dp_in(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_C2),
  proof(
    goal(dp_in(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_C2)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_C4).
why(
  dp_in(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_C4),
  proof(
    goal(dp_in(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_C4)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_C6).
why(
  dp_in(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_C6),
  proof(
    goal(dp_in(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_C6)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_C6).
why(
  dp_in(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_C6),
  proof(
    goal(dp_in(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_C6)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_C8).
why(
  dp_in(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_C8),
  proof(
    goal(dp_in(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_C8)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_C8).
why(
  dp_in(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_C8),
  proof(
    goal(dp_in(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_C8)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_C10).
why(
  dp_in(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_C10),
  proof(
    goal(dp_in(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_C10)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_C12).
why(
  dp_in(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_C12),
  proof(
    goal(dp_in(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_C12)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_C12).
why(
  dp_in(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_C12),
  proof(
    goal(dp_in(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_C12)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_C14).
why(
  dp_in(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_C14),
  proof(
    goal(dp_in(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_C14)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_C14).
why(
  dp_in(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_C14),
  proof(
    goal(dp_in(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_C14)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_C16).
why(
  dp_in(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_C16),
  proof(
    goal(dp_in(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_C16)), by(rule("dining-philosophers.pl", clause(148))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_in(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_C0).
why(
  dp_in(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_C0),
  proof(
    goal(dp_in(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_C0)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_C2).
why(
  dp_in(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_C2),
  proof(
    goal(dp_in(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_C2)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_C2).
why(
  dp_in(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_C2),
  proof(
    goal(dp_in(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_C2)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_C4).
why(
  dp_in(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_C4),
  proof(
    goal(dp_in(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_C4)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_C6).
why(
  dp_in(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_C6),
  proof(
    goal(dp_in(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_C6)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_C6).
why(
  dp_in(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_C6),
  proof(
    goal(dp_in(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_C6)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_C8).
why(
  dp_in(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_C8),
  proof(
    goal(dp_in(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_C8)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_C8).
why(
  dp_in(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_C8),
  proof(
    goal(dp_in(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_C8)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_C10).
why(
  dp_in(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_C10),
  proof(
    goal(dp_in(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_C10)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_C12).
why(
  dp_in(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_C12),
  proof(
    goal(dp_in(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_C12)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_C12).
why(
  dp_in(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_C12),
  proof(
    goal(dp_in(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_C12)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_C14).
why(
  dp_in(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_C14),
  proof(
    goal(dp_in(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_C14)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_C14).
why(
  dp_in(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_C14),
  proof(
    goal(dp_in(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_C14)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_C16).
why(
  dp_in(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_C16),
  proof(
    goal(dp_in(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_C16)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_C2).
why(
  dp_in(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_C2),
  proof(
    goal(dp_in(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_C2)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_C4).
why(
  dp_in(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_C4),
  proof(
    goal(dp_in(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_C4)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_C6).
why(
  dp_in(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_C6),
  proof(
    goal(dp_in(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_C6)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_C6).
why(
  dp_in(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_C6),
  proof(
    goal(dp_in(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_C6)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_C8).
why(
  dp_in(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_C8),
  proof(
    goal(dp_in(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_C8)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_C8).
why(
  dp_in(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_C8),
  proof(
    goal(dp_in(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_C8)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_C10).
why(
  dp_in(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_C10),
  proof(
    goal(dp_in(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_C10)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_C12).
why(
  dp_in(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_C12),
  proof(
    goal(dp_in(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_C12)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_C12).
why(
  dp_in(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_C12),
  proof(
    goal(dp_in(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_C12)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_C14).
why(
  dp_in(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_C14),
  proof(
    goal(dp_in(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_C14)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_C14).
why(
  dp_in(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_C14),
  proof(
    goal(dp_in(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_C14)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
        ])
      )
    ])
  )
).

dp_in(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_C16).
why(
  dp_in(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_C16),
  proof(
    goal(dp_in(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_C16)), by(rule("dining-philosophers.pl", clause(153))),
    bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
        ])
      )
    ])
  )
).

dp_from(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_P3).
why(
  dp_from(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_P3),
  proof(
    goal(dp_from(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_P2).
why(
  dp_from(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_P2),
  proof(
    goal(dp_from(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_P4).
why(
  dp_from(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_P4),
  proof(
    goal(dp_from(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_P5).
why(
  dp_from(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_P5),
  proof(
    goal(dp_from(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_P1).
why(
  dp_from(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_P1),
  proof(
    goal(dp_from(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_P3).
why(
  dp_from(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_P3),
  proof(
    goal(dp_from(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_P2).
why(
  dp_from(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_P2),
  proof(
    goal(dp_from(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_P4).
why(
  dp_from(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_P4),
  proof(
    goal(dp_from(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_P5).
why(
  dp_from(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_P5),
  proof(
    goal(dp_from(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_P1).
why(
  dp_from(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_P1),
  proof(
    goal(dp_from(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_P3).
why(
  dp_from(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_P3),
  proof(
    goal(dp_from(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_P2).
why(
  dp_from(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_P2),
  proof(
    goal(dp_from(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_P4).
why(
  dp_from(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_P4),
  proof(
    goal(dp_from(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_P5).
why(
  dp_from(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_P5),
  proof(
    goal(dp_from(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_P2).
why(
  dp_from(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_P2),
  proof(
    goal(dp_from(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_P5).
why(
  dp_from(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_P5),
  proof(
    goal(dp_from(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_P1).
why(
  dp_from(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_P1),
  proof(
    goal(dp_from(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_P3).
why(
  dp_from(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_P3),
  proof(
    goal(dp_from(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_P2).
why(
  dp_from(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_P2),
  proof(
    goal(dp_from(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_P4).
why(
  dp_from(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_P4),
  proof(
    goal(dp_from(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_P5).
why(
  dp_from(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_P5),
  proof(
    goal(dp_from(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_P1).
why(
  dp_from(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_P1),
  proof(
    goal(dp_from(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_P3).
why(
  dp_from(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_P3),
  proof(
    goal(dp_from(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_P2).
why(
  dp_from(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_P2),
  proof(
    goal(dp_from(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_P4).
why(
  dp_from(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_P4),
  proof(
    goal(dp_from(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_P5).
why(
  dp_from(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_P5),
  proof(
    goal(dp_from(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(149))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_from(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_P2).
why(
  dp_from(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_P2),
  proof(
    goal(dp_from(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_P1).
why(
  dp_from(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_P1),
  proof(
    goal(dp_from(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_P3).
why(
  dp_from(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_P3),
  proof(
    goal(dp_from(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_P4).
why(
  dp_from(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_P4),
  proof(
    goal(dp_from(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_P5).
why(
  dp_from(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_P5),
  proof(
    goal(dp_from(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_P2).
why(
  dp_from(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_P2),
  proof(
    goal(dp_from(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_P1).
why(
  dp_from(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_P1),
  proof(
    goal(dp_from(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_P3).
why(
  dp_from(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_P3),
  proof(
    goal(dp_from(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_P4).
why(
  dp_from(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_P4),
  proof(
    goal(dp_from(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_P5).
why(
  dp_from(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_P5),
  proof(
    goal(dp_from(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_P2).
why(
  dp_from(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_P2),
  proof(
    goal(dp_from(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_P1).
why(
  dp_from(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_P1),
  proof(
    goal(dp_from(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_P3).
why(
  dp_from(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_P3),
  proof(
    goal(dp_from(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_P4).
why(
  dp_from(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_P4),
  proof(
    goal(dp_from(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_P3).
why(
  dp_from(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_P3),
  proof(
    goal(dp_from(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_P1).
why(
  dp_from(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_P1),
  proof(
    goal(dp_from(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_P2).
why(
  dp_from(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_P2),
  proof(
    goal(dp_from(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_P4).
why(
  dp_from(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_P4),
  proof(
    goal(dp_from(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_P3).
why(
  dp_from(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_P3),
  proof(
    goal(dp_from(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_P5).
why(
  dp_from(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_P5),
  proof(
    goal(dp_from(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_P1).
why(
  dp_from(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_P1),
  proof(
    goal(dp_from(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_P2).
why(
  dp_from(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_P2),
  proof(
    goal(dp_from(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_P4).
why(
  dp_from(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_P4),
  proof(
    goal(dp_from(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_P3).
why(
  dp_from(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_P3),
  proof(
    goal(dp_from(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_P5).
why(
  dp_from(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_P5),
  proof(
    goal(dp_from(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
        ])
      )
    ])
  )
).

dp_from(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_P1).
why(
  dp_from(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_P1),
  proof(
    goal(dp_from(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(154))),
    bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
        ])
      )
    ])
  )
).

dp_to(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_P2).
why(
  dp_to(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_P2),
  proof(
    goal(dp_to(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_P1).
why(
  dp_to(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_P1),
  proof(
    goal(dp_to(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_P3).
why(
  dp_to(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_P3),
  proof(
    goal(dp_to(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_P4).
why(
  dp_to(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_P4),
  proof(
    goal(dp_to(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_P5).
why(
  dp_to(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_P5),
  proof(
    goal(dp_to(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_P2).
why(
  dp_to(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_P2),
  proof(
    goal(dp_to(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_P1).
why(
  dp_to(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_P1),
  proof(
    goal(dp_to(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_P3).
why(
  dp_to(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_P3),
  proof(
    goal(dp_to(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_P4).
why(
  dp_to(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_P4),
  proof(
    goal(dp_to(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_P5).
why(
  dp_to(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_P5),
  proof(
    goal(dp_to(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_P2).
why(
  dp_to(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_P2),
  proof(
    goal(dp_to(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_P1).
why(
  dp_to(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_P1),
  proof(
    goal(dp_to(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_P3).
why(
  dp_to(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_P3),
  proof(
    goal(dp_to(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_P4).
why(
  dp_to(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_P4),
  proof(
    goal(dp_to(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_P3).
why(
  dp_to(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_P3),
  proof(
    goal(dp_to(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_P1).
why(
  dp_to(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_P1),
  proof(
    goal(dp_to(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_P2).
why(
  dp_to(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_P2),
  proof(
    goal(dp_to(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_P4).
why(
  dp_to(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_P4),
  proof(
    goal(dp_to(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_P3).
why(
  dp_to(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_P3),
  proof(
    goal(dp_to(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_P5).
why(
  dp_to(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_P5),
  proof(
    goal(dp_to(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_P1).
why(
  dp_to(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_P1),
  proof(
    goal(dp_to(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_P2).
why(
  dp_to(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_P2),
  proof(
    goal(dp_to(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_P4).
why(
  dp_to(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_P4),
  proof(
    goal(dp_to(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_P3).
why(
  dp_to(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_P3),
  proof(
    goal(dp_to(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_P5).
why(
  dp_to(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_P5),
  proof(
    goal(dp_to(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_P1).
why(
  dp_to(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_P1),
  proof(
    goal(dp_to(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(150))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_to(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_P3).
why(
  dp_to(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_P3),
  proof(
    goal(dp_to(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_P2).
why(
  dp_to(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_P2),
  proof(
    goal(dp_to(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_P4).
why(
  dp_to(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_P4),
  proof(
    goal(dp_to(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_P5).
why(
  dp_to(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_P5),
  proof(
    goal(dp_to(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_P1).
why(
  dp_to(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_P1),
  proof(
    goal(dp_to(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_P3).
why(
  dp_to(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_P3),
  proof(
    goal(dp_to(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_P2).
why(
  dp_to(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_P2),
  proof(
    goal(dp_to(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_P4).
why(
  dp_to(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_P4),
  proof(
    goal(dp_to(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_P5).
why(
  dp_to(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_P5),
  proof(
    goal(dp_to(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_P1).
why(
  dp_to(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_P1),
  proof(
    goal(dp_to(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_P1)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_P3).
why(
  dp_to(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_P3),
  proof(
    goal(dp_to(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_P3)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_P2).
why(
  dp_to(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_P2),
  proof(
    goal(dp_to(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_P2)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_P4).
why(
  dp_to(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_P4),
  proof(
    goal(dp_to(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_P4)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_P5).
why(
  dp_to(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_P5),
  proof(
    goal(dp_to(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_P5)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_P2).
why(
  dp_to(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_P2),
  proof(
    goal(dp_to(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_P5).
why(
  dp_to(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_P5),
  proof(
    goal(dp_to(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_P1).
why(
  dp_to(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_P1),
  proof(
    goal(dp_to(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_P3).
why(
  dp_to(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_P3),
  proof(
    goal(dp_to(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_P2).
why(
  dp_to(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_P2),
  proof(
    goal(dp_to(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_P4).
why(
  dp_to(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_P4),
  proof(
    goal(dp_to(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_P5).
why(
  dp_to(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_P5),
  proof(
    goal(dp_to(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_P1).
why(
  dp_to(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_P1),
  proof(
    goal(dp_to(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_P1)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_P3).
why(
  dp_to(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_P3),
  proof(
    goal(dp_to(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_P3)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_P2).
why(
  dp_to(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_P2),
  proof(
    goal(dp_to(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_P2)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_P4).
why(
  dp_to(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_P4),
  proof(
    goal(dp_to(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_P4)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
        ])
      )
    ])
  )
).

dp_to(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_P5).
why(
  dp_to(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_P5),
  proof(
    goal(dp_to(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_P5)), by(rule("dining-philosophers.pl", clause(155))),
    bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_F23).
why(
  dp_fork(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_F23),
  proof(
    goal(dp_fork(request(dp_C0, dp_P3, dp_P2, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_F12).
why(
  dp_fork(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_F12),
  proof(
    goal(dp_fork(request(dp_C2, dp_P2, dp_P1, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_F34).
why(
  dp_fork(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_F34),
  proof(
    goal(dp_fork(request(dp_C2, dp_P4, dp_P3, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_F45).
why(
  dp_fork(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_F45),
  proof(
    goal(dp_fork(request(dp_C4, dp_P5, dp_P4, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_F51).
why(
  dp_fork(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_F51),
  proof(
    goal(dp_fork(request(dp_C6, dp_P1, dp_P5, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_F23).
why(
  dp_fork(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_F23),
  proof(
    goal(dp_fork(request(dp_C6, dp_P3, dp_P2, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_F12).
why(
  dp_fork(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_F12),
  proof(
    goal(dp_fork(request(dp_C8, dp_P2, dp_P1, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_F34).
why(
  dp_fork(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_F34),
  proof(
    goal(dp_fork(request(dp_C8, dp_P4, dp_P3, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_F45).
why(
  dp_fork(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_F45),
  proof(
    goal(dp_fork(request(dp_C10, dp_P5, dp_P4, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_F51).
why(
  dp_fork(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_F51),
  proof(
    goal(dp_fork(request(dp_C12, dp_P1, dp_P5, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
          proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_F23).
why(
  dp_fork(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_F23),
  proof(
    goal(dp_fork(request(dp_C12, dp_P3, dp_P2, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
          proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_F12).
why(
  dp_fork(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_F12),
  proof(
    goal(dp_fork(request(dp_C14, dp_P2, dp_P1, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
          proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_F34).
why(
  dp_fork(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_F34),
  proof(
    goal(dp_fork(request(dp_C14, dp_P4, dp_P3, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
          proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_F45).
why(
  dp_fork(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_F45),
  proof(
    goal(dp_fork(request(dp_C16, dp_P5, dp_P4, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
          proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_F23).
why(
  dp_fork(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_F23),
  proof(
    goal(dp_fork(request(dp_C2, dp_P2, dp_P3, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_F51).
why(
  dp_fork(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_F51),
  proof(
    goal(dp_fork(request(dp_C4, dp_P5, dp_P1, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_F12).
why(
  dp_fork(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_F12),
  proof(
    goal(dp_fork(request(dp_C6, dp_P1, dp_P2, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_F34).
why(
  dp_fork(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_F34),
  proof(
    goal(dp_fork(request(dp_C6, dp_P3, dp_P4, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_F23).
why(
  dp_fork(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_F23),
  proof(
    goal(dp_fork(request(dp_C8, dp_P2, dp_P3, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_F45).
why(
  dp_fork(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_F45),
  proof(
    goal(dp_fork(request(dp_C8, dp_P4, dp_P5, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_F51).
why(
  dp_fork(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_F51),
  proof(
    goal(dp_fork(request(dp_C10, dp_P5, dp_P1, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_F12).
why(
  dp_fork(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_F12),
  proof(
    goal(dp_fork(request(dp_C12, dp_P1, dp_P2, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
          proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_F34).
why(
  dp_fork(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_F34),
  proof(
    goal(dp_fork(request(dp_C12, dp_P3, dp_P4, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
          proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_F23).
why(
  dp_fork(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_F23),
  proof(
    goal(dp_fork(request(dp_C14, dp_P2, dp_P3, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
          proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_F45).
why(
  dp_fork(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_F45),
  proof(
    goal(dp_fork(request(dp_C14, dp_P4, dp_P5, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
          proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_F51).
why(
  dp_fork(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_F51),
  proof(
    goal(dp_fork(request(dp_C16, dp_P5, dp_P1, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(151))),
    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
        bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
        uses([
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
          proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_F23).
why(
  dp_fork(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_F23),
  proof(
    goal(dp_fork(send(dp_C0, dp_P2, dp_P3, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_F12).
why(
  dp_fork(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_F12),
  proof(
    goal(dp_fork(send(dp_C2, dp_P1, dp_P2, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_F34).
why(
  dp_fork(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_F34),
  proof(
    goal(dp_fork(send(dp_C2, dp_P3, dp_P4, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_F45).
why(
  dp_fork(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_F45),
  proof(
    goal(dp_fork(send(dp_C4, dp_P4, dp_P5, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_F51).
why(
  dp_fork(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_F51),
  proof(
    goal(dp_fork(send(dp_C6, dp_P5, dp_P1, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_F23).
why(
  dp_fork(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_F23),
  proof(
    goal(dp_fork(send(dp_C6, dp_P2, dp_P3, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_F12).
why(
  dp_fork(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_F12),
  proof(
    goal(dp_fork(send(dp_C8, dp_P1, dp_P2, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_F34).
why(
  dp_fork(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_F34),
  proof(
    goal(dp_fork(send(dp_C8, dp_P3, dp_P4, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_F45).
why(
  dp_fork(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_F45),
  proof(
    goal(dp_fork(send(dp_C10, dp_P4, dp_P5, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_F51).
why(
  dp_fork(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_F51),
  proof(
    goal(dp_fork(send(dp_C12, dp_P5, dp_P1, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
              proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
              proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_F23).
why(
  dp_fork(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_F23),
  proof(
    goal(dp_fork(send(dp_C12, dp_P2, dp_P3, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
              proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
              proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_F12).
why(
  dp_fork(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_F12),
  proof(
    goal(dp_fork(send(dp_C14, dp_P1, dp_P2, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
              proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
              proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_F34).
why(
  dp_fork(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_F34),
  proof(
    goal(dp_fork(send(dp_C14, dp_P3, dp_P4, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
              proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
              proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_F45).
why(
  dp_fork(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_F45),
  proof(
    goal(dp_fork(send(dp_C16, dp_P4, dp_P5, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
              proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
              proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_F23).
why(
  dp_fork(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_F23),
  proof(
    goal(dp_fork(send(dp_C2, dp_P3, dp_P2, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_F51).
why(
  dp_fork(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_F51),
  proof(
    goal(dp_fork(send(dp_C4, dp_P1, dp_P5, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_F12).
why(
  dp_fork(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_F12),
  proof(
    goal(dp_fork(send(dp_C6, dp_P2, dp_P1, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_F34).
why(
  dp_fork(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_F34),
  proof(
    goal(dp_fork(send(dp_C6, dp_P4, dp_P3, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_F23).
why(
  dp_fork(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_F23),
  proof(
    goal(dp_fork(send(dp_C8, dp_P3, dp_P2, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_F45).
why(
  dp_fork(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_F45),
  proof(
    goal(dp_fork(send(dp_C8, dp_P5, dp_P4, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_F51).
why(
  dp_fork(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_F51),
  proof(
    goal(dp_fork(send(dp_C10, dp_P1, dp_P5, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_F12).
why(
  dp_fork(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_F12),
  proof(
    goal(dp_fork(send(dp_C12, dp_P2, dp_P1, dp_F12), dp_F12)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
              proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
              proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
              proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_F34).
why(
  dp_fork(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_F34),
  proof(
    goal(dp_fork(send(dp_C12, dp_P4, dp_P3, dp_F34), dp_F34)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
    uses([
      proof(
        goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
        uses([
          proof(
            goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
              proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
              proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
              proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_F23).
why(
  dp_fork(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_F23),
  proof(
    goal(dp_fork(send(dp_C14, dp_P3, dp_P2, dp_F23), dp_F23)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
              proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
              proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
              proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_F45).
why(
  dp_fork(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_F45),
  proof(
    goal(dp_fork(send(dp_C14, dp_P5, dp_P4, dp_F45), dp_F45)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
    uses([
      proof(
        goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
        uses([
          proof(
            goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
              proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
              proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
              proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
        ])
      )
    ])
  )
).

dp_fork(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_F51).
why(
  dp_fork(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_F51),
  proof(
    goal(dp_fork(send(dp_C16, dp_P1, dp_P5, dp_F51), dp_F51)), by(rule("dining-philosophers.pl", clause(156))),
    bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
    uses([
      proof(
        goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
        bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
        uses([
          proof(
            goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
            bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
            uses([
              proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
              proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
              proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
              proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
            ])
          ),
          proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP1_1, dp_P1).
why(
  dp_philosopher(dp_mP1_1, dp_P1),
  proof(
    goal(dp_philosopher(dp_mP1_1, dp_P1)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP1_1), binding("P", dp_P1), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP1_1, dp_P1, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_1), binding("P", dp_P1), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Dirty), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P1)), by(fact("dining-philosophers.pl", clause(47)))),
          proof(goal(meal_handle(dp_P1, 1, dp_mP1_1)), by(fact("dining-philosophers.pl", clause(126)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C1, dp_F51, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F51), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F51)), by(fact("dining-philosophers.pl", clause(110)))),
              proof(goal(start_state(dp_C0, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(66))))
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F12, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F12), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F12)), by(fact("dining-philosophers.pl", clause(107)))),
              proof(goal(start_state(dp_C0, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(62))))
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP3_1, dp_P3).
why(
  dp_philosopher(dp_mP3_1, dp_P3),
  proof(
    goal(dp_philosopher(dp_mP3_1, dp_P3)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP3_1), binding("P", dp_P3), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP3_1, dp_P3, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_1), binding("P", dp_P3), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(meal_handle(dp_P3, 1, dp_mP3_1)), by(fact("dining-philosophers.pl", clause(132)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C1, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C1), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C0), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(
                goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F34, dp_P3, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F34), binding("H", dp_P3), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F34)), by(fact("dining-philosophers.pl", clause(108)))),
              proof(goal(start_state(dp_C0, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(64))))
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP2_1, dp_P2).
why(
  dp_philosopher(dp_mP2_1, dp_P2),
  proof(
    goal(dp_philosopher(dp_mP2_1, dp_P2)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP2_1), binding("P", dp_P2), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP2_1, dp_P2, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_1), binding("P", dp_P2), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(meal_handle(dp_P2, 1, dp_mP2_1)), by(fact("dining-philosophers.pl", clause(129)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C3, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP4_1, dp_P4).
why(
  dp_philosopher(dp_mP4_1, dp_P4),
  proof(
    goal(dp_philosopher(dp_mP4_1, dp_P4)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP4_1), binding("P", dp_P4), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP4_1, dp_P4, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_1), binding("P", dp_P4), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(meal_handle(dp_P4, 1, dp_mP4_1)), by(fact("dining-philosophers.pl", clause(135)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C3, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F45, dp_P4, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C3), binding("F", dp_F45), binding("H", dp_P4), binding("Cleanliness", dp_Dirty), binding("C", dp_C2)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(goal(keep(dp_C2, dp_F45)), by(fact("dining-philosophers.pl", clause(111)))),
              proof(goal(start_state(dp_C2, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(70))))
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP5_1, dp_P5).
why(
  dp_philosopher(dp_mP5_1, dp_P5),
  proof(
    goal(dp_philosopher(dp_mP5_1, dp_P5)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP5_1), binding("P", dp_P5), binding("_N", 1), binding("_S", dp_s3)]),
    uses([
      proof(
        goal(meal(dp_mP5_1, dp_P5, 1, dp_s3)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_1), binding("P", dp_P5), binding("N", 1), binding("S", dp_s3), binding("C", dp_C4), binding("CS", dp_C5), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
          proof(goal(slot(dp_C4, dp_s3, 1)), by(fact("dining-philosophers.pl", clause(26)))),
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(meal_handle(dp_P5, 1, dp_mP5_1)), by(fact("dining-philosophers.pl", clause(138)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C5, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C5, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP1_2, dp_P1).
why(
  dp_philosopher(dp_mP1_2, dp_P1),
  proof(
    goal(dp_philosopher(dp_mP1_2, dp_P1)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP1_2), binding("P", dp_P1), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP1_2, dp_P1, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_2), binding("P", dp_P1), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(meal_handle(dp_P1, 2, dp_mP1_2)), by(fact("dining-philosophers.pl", clause(127)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C7, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP3_2, dp_P3).
why(
  dp_philosopher(dp_mP3_2, dp_P3),
  proof(
    goal(dp_philosopher(dp_mP3_2, dp_P3)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP3_2), binding("P", dp_P3), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP3_2, dp_P3, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_2), binding("P", dp_P3), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(meal_handle(dp_P3, 2, dp_mP3_2)), by(fact("dining-philosophers.pl", clause(133)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C7, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP2_2, dp_P2).
why(
  dp_philosopher(dp_mP2_2, dp_P2),
  proof(
    goal(dp_philosopher(dp_mP2_2, dp_P2)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP2_2), binding("P", dp_P2), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP2_2, dp_P2, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_2), binding("P", dp_P2), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(meal_handle(dp_P2, 2, dp_mP2_2)), by(fact("dining-philosophers.pl", clause(130)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C9, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP4_2, dp_P4).
why(
  dp_philosopher(dp_mP4_2, dp_P4),
  proof(
    goal(dp_philosopher(dp_mP4_2, dp_P4)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP4_2), binding("P", dp_P4), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP4_2, dp_P4, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_2), binding("P", dp_P4), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(meal_handle(dp_P4, 2, dp_mP4_2)), by(fact("dining-philosophers.pl", clause(136)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C9, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP5_2, dp_P5).
why(
  dp_philosopher(dp_mP5_2, dp_P5),
  proof(
    goal(dp_philosopher(dp_mP5_2, dp_P5)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP5_2), binding("P", dp_P5), binding("_N", 2), binding("_S", dp_s6)]),
    uses([
      proof(
        goal(meal(dp_mP5_2, dp_P5, 2, dp_s6)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_2), binding("P", dp_P5), binding("N", 2), binding("S", dp_s6), binding("C", dp_C10), binding("CS", dp_C11), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
          proof(goal(slot(dp_C10, dp_s6, 2)), by(fact("dining-philosophers.pl", clause(35)))),
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(meal_handle(dp_P5, 2, dp_mP5_2)), by(fact("dining-philosophers.pl", clause(139)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C11, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C11, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP1_3, dp_P1).
why(
  dp_philosopher(dp_mP1_3, dp_P1),
  proof(
    goal(dp_philosopher(dp_mP1_3, dp_P1)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP1_3), binding("P", dp_P1), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP1_3, dp_P1, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_3), binding("P", dp_P1), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(meal_handle(dp_P1, 3, dp_mP1_3)), by(fact("dining-philosophers.pl", clause(128)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C13, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP3_3, dp_P3).
why(
  dp_philosopher(dp_mP3_3, dp_P3),
  proof(
    goal(dp_philosopher(dp_mP3_3, dp_P3)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP3_3), binding("P", dp_P3), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP3_3, dp_P3, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_3), binding("P", dp_P3), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(meal_handle(dp_P3, 3, dp_mP3_3)), by(fact("dining-philosophers.pl", clause(134)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C13, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP2_3, dp_P2).
why(
  dp_philosopher(dp_mP2_3, dp_P2),
  proof(
    goal(dp_philosopher(dp_mP2_3, dp_P2)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP2_3), binding("P", dp_P2), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP2_3, dp_P2, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_3), binding("P", dp_P2), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(meal_handle(dp_P2, 3, dp_mP2_3)), by(fact("dining-philosophers.pl", clause(131)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C15, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP4_3, dp_P4).
why(
  dp_philosopher(dp_mP4_3, dp_P4),
  proof(
    goal(dp_philosopher(dp_mP4_3, dp_P4)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP4_3), binding("P", dp_P4), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP4_3, dp_P4, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_3), binding("P", dp_P4), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(meal_handle(dp_P4, 3, dp_mP4_3)), by(fact("dining-philosophers.pl", clause(137)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C15, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_philosopher(dp_mP5_3, dp_P5).
why(
  dp_philosopher(dp_mP5_3, dp_P5),
  proof(
    goal(dp_philosopher(dp_mP5_3, dp_P5)), by(rule("dining-philosophers.pl", clause(158))),
    bindings([binding("M", dp_mP5_3), binding("P", dp_P5), binding("_N", 3), binding("_S", dp_s9)]),
    uses([
      proof(
        goal(meal(dp_mP5_3, dp_P5, 3, dp_s9)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_3), binding("P", dp_P5), binding("N", 3), binding("S", dp_s9), binding("C", dp_C16), binding("CS", dp_C17), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
          proof(goal(slot(dp_C16, dp_s9, 3)), by(fact("dining-philosophers.pl", clause(44)))),
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(meal_handle(dp_P5, 3, dp_mP5_3)), by(fact("dining-philosophers.pl", clause(140)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C17, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C17, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP1_1, 1).
why(
  dp_mealNo(dp_mP1_1, 1),
  proof(
    goal(dp_mealNo(dp_mP1_1, 1)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP1_1), binding("N", 1), binding("_P", dp_P1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP1_1, dp_P1, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_1), binding("P", dp_P1), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Dirty), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P1)), by(fact("dining-philosophers.pl", clause(47)))),
          proof(goal(meal_handle(dp_P1, 1, dp_mP1_1)), by(fact("dining-philosophers.pl", clause(126)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C1, dp_F51, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F51), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F51)), by(fact("dining-philosophers.pl", clause(110)))),
              proof(goal(start_state(dp_C0, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(66))))
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F12, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F12), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F12)), by(fact("dining-philosophers.pl", clause(107)))),
              proof(goal(start_state(dp_C0, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(62))))
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP3_1, 1).
why(
  dp_mealNo(dp_mP3_1, 1),
  proof(
    goal(dp_mealNo(dp_mP3_1, 1)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP3_1), binding("N", 1), binding("_P", dp_P3), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP3_1, dp_P3, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_1), binding("P", dp_P3), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(meal_handle(dp_P3, 1, dp_mP3_1)), by(fact("dining-philosophers.pl", clause(132)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C1, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C1), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C0), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(
                goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F34, dp_P3, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F34), binding("H", dp_P3), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F34)), by(fact("dining-philosophers.pl", clause(108)))),
              proof(goal(start_state(dp_C0, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(64))))
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP2_1, 1).
why(
  dp_mealNo(dp_mP2_1, 1),
  proof(
    goal(dp_mealNo(dp_mP2_1, 1)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP2_1), binding("N", 1), binding("_P", dp_P2), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP2_1, dp_P2, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_1), binding("P", dp_P2), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(meal_handle(dp_P2, 1, dp_mP2_1)), by(fact("dining-philosophers.pl", clause(129)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C3, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP4_1, 1).
why(
  dp_mealNo(dp_mP4_1, 1),
  proof(
    goal(dp_mealNo(dp_mP4_1, 1)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP4_1), binding("N", 1), binding("_P", dp_P4), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP4_1, dp_P4, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_1), binding("P", dp_P4), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(meal_handle(dp_P4, 1, dp_mP4_1)), by(fact("dining-philosophers.pl", clause(135)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C3, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F45, dp_P4, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C3), binding("F", dp_F45), binding("H", dp_P4), binding("Cleanliness", dp_Dirty), binding("C", dp_C2)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(goal(keep(dp_C2, dp_F45)), by(fact("dining-philosophers.pl", clause(111)))),
              proof(goal(start_state(dp_C2, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(70))))
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP5_1, 1).
why(
  dp_mealNo(dp_mP5_1, 1),
  proof(
    goal(dp_mealNo(dp_mP5_1, 1)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP5_1), binding("N", 1), binding("_P", dp_P5), binding("_S", dp_s3)]),
    uses([
      proof(
        goal(meal(dp_mP5_1, dp_P5, 1, dp_s3)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_1), binding("P", dp_P5), binding("N", 1), binding("S", dp_s3), binding("C", dp_C4), binding("CS", dp_C5), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
          proof(goal(slot(dp_C4, dp_s3, 1)), by(fact("dining-philosophers.pl", clause(26)))),
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(meal_handle(dp_P5, 1, dp_mP5_1)), by(fact("dining-philosophers.pl", clause(138)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C5, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C5, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP1_2, 2).
why(
  dp_mealNo(dp_mP1_2, 2),
  proof(
    goal(dp_mealNo(dp_mP1_2, 2)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP1_2), binding("N", 2), binding("_P", dp_P1), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP1_2, dp_P1, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_2), binding("P", dp_P1), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(meal_handle(dp_P1, 2, dp_mP1_2)), by(fact("dining-philosophers.pl", clause(127)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C7, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP3_2, 2).
why(
  dp_mealNo(dp_mP3_2, 2),
  proof(
    goal(dp_mealNo(dp_mP3_2, 2)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP3_2), binding("N", 2), binding("_P", dp_P3), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP3_2, dp_P3, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_2), binding("P", dp_P3), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(meal_handle(dp_P3, 2, dp_mP3_2)), by(fact("dining-philosophers.pl", clause(133)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C7, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP2_2, 2).
why(
  dp_mealNo(dp_mP2_2, 2),
  proof(
    goal(dp_mealNo(dp_mP2_2, 2)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP2_2), binding("N", 2), binding("_P", dp_P2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP2_2, dp_P2, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_2), binding("P", dp_P2), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(meal_handle(dp_P2, 2, dp_mP2_2)), by(fact("dining-philosophers.pl", clause(130)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C9, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP4_2, 2).
why(
  dp_mealNo(dp_mP4_2, 2),
  proof(
    goal(dp_mealNo(dp_mP4_2, 2)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP4_2), binding("N", 2), binding("_P", dp_P4), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP4_2, dp_P4, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_2), binding("P", dp_P4), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(meal_handle(dp_P4, 2, dp_mP4_2)), by(fact("dining-philosophers.pl", clause(136)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C9, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP5_2, 2).
why(
  dp_mealNo(dp_mP5_2, 2),
  proof(
    goal(dp_mealNo(dp_mP5_2, 2)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP5_2), binding("N", 2), binding("_P", dp_P5), binding("_S", dp_s6)]),
    uses([
      proof(
        goal(meal(dp_mP5_2, dp_P5, 2, dp_s6)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_2), binding("P", dp_P5), binding("N", 2), binding("S", dp_s6), binding("C", dp_C10), binding("CS", dp_C11), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
          proof(goal(slot(dp_C10, dp_s6, 2)), by(fact("dining-philosophers.pl", clause(35)))),
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(meal_handle(dp_P5, 2, dp_mP5_2)), by(fact("dining-philosophers.pl", clause(139)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C11, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C11, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP1_3, 3).
why(
  dp_mealNo(dp_mP1_3, 3),
  proof(
    goal(dp_mealNo(dp_mP1_3, 3)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP1_3), binding("N", 3), binding("_P", dp_P1), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP1_3, dp_P1, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_3), binding("P", dp_P1), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(meal_handle(dp_P1, 3, dp_mP1_3)), by(fact("dining-philosophers.pl", clause(128)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C13, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP3_3, 3).
why(
  dp_mealNo(dp_mP3_3, 3),
  proof(
    goal(dp_mealNo(dp_mP3_3, 3)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP3_3), binding("N", 3), binding("_P", dp_P3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP3_3, dp_P3, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_3), binding("P", dp_P3), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(meal_handle(dp_P3, 3, dp_mP3_3)), by(fact("dining-philosophers.pl", clause(134)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C13, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP2_3, 3).
why(
  dp_mealNo(dp_mP2_3, 3),
  proof(
    goal(dp_mealNo(dp_mP2_3, 3)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP2_3), binding("N", 3), binding("_P", dp_P2), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP2_3, dp_P2, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_3), binding("P", dp_P2), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(meal_handle(dp_P2, 3, dp_mP2_3)), by(fact("dining-philosophers.pl", clause(131)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C15, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP4_3, 3).
why(
  dp_mealNo(dp_mP4_3, 3),
  proof(
    goal(dp_mealNo(dp_mP4_3, 3)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP4_3), binding("N", 3), binding("_P", dp_P4), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP4_3, dp_P4, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_3), binding("P", dp_P4), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(meal_handle(dp_P4, 3, dp_mP4_3)), by(fact("dining-philosophers.pl", clause(137)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C15, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_mealNo(dp_mP5_3, 3).
why(
  dp_mealNo(dp_mP5_3, 3),
  proof(
    goal(dp_mealNo(dp_mP5_3, 3)), by(rule("dining-philosophers.pl", clause(159))),
    bindings([binding("M", dp_mP5_3), binding("N", 3), binding("_P", dp_P5), binding("_S", dp_s9)]),
    uses([
      proof(
        goal(meal(dp_mP5_3, dp_P5, 3, dp_s9)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_3), binding("P", dp_P5), binding("N", 3), binding("S", dp_s9), binding("C", dp_C16), binding("CS", dp_C17), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
          proof(goal(slot(dp_C16, dp_s9, 3)), by(fact("dining-philosophers.pl", clause(44)))),
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(meal_handle(dp_P5, 3, dp_mP5_3)), by(fact("dining-philosophers.pl", clause(140)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C17, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C17, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP1_1, dp_s1).
why(
  dp_inSlot(dp_mP1_1, dp_s1),
  proof(
    goal(dp_inSlot(dp_mP1_1, dp_s1)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP1_1), binding("S", dp_s1), binding("_P", dp_P1), binding("_N", 1)]),
    uses([
      proof(
        goal(meal(dp_mP1_1, dp_P1, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_1), binding("P", dp_P1), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Dirty), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P1)), by(fact("dining-philosophers.pl", clause(47)))),
          proof(goal(meal_handle(dp_P1, 1, dp_mP1_1)), by(fact("dining-philosophers.pl", clause(126)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C1, dp_F51, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F51), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F51)), by(fact("dining-philosophers.pl", clause(110)))),
              proof(goal(start_state(dp_C0, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(66))))
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F12, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F12), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F12)), by(fact("dining-philosophers.pl", clause(107)))),
              proof(goal(start_state(dp_C0, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(62))))
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP3_1, dp_s1).
why(
  dp_inSlot(dp_mP3_1, dp_s1),
  proof(
    goal(dp_inSlot(dp_mP3_1, dp_s1)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP3_1), binding("S", dp_s1), binding("_P", dp_P3), binding("_N", 1)]),
    uses([
      proof(
        goal(meal(dp_mP3_1, dp_P3, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_1), binding("P", dp_P3), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(meal_handle(dp_P3, 1, dp_mP3_1)), by(fact("dining-philosophers.pl", clause(132)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C1, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C1), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C0), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(
                goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F34, dp_P3, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F34), binding("H", dp_P3), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F34)), by(fact("dining-philosophers.pl", clause(108)))),
              proof(goal(start_state(dp_C0, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(64))))
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP2_1, dp_s2).
why(
  dp_inSlot(dp_mP2_1, dp_s2),
  proof(
    goal(dp_inSlot(dp_mP2_1, dp_s2)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP2_1), binding("S", dp_s2), binding("_P", dp_P2), binding("_N", 1)]),
    uses([
      proof(
        goal(meal(dp_mP2_1, dp_P2, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_1), binding("P", dp_P2), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(meal_handle(dp_P2, 1, dp_mP2_1)), by(fact("dining-philosophers.pl", clause(129)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C3, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP4_1, dp_s2).
why(
  dp_inSlot(dp_mP4_1, dp_s2),
  proof(
    goal(dp_inSlot(dp_mP4_1, dp_s2)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP4_1), binding("S", dp_s2), binding("_P", dp_P4), binding("_N", 1)]),
    uses([
      proof(
        goal(meal(dp_mP4_1, dp_P4, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_1), binding("P", dp_P4), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(meal_handle(dp_P4, 1, dp_mP4_1)), by(fact("dining-philosophers.pl", clause(135)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C3, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F45, dp_P4, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C3), binding("F", dp_F45), binding("H", dp_P4), binding("Cleanliness", dp_Dirty), binding("C", dp_C2)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(goal(keep(dp_C2, dp_F45)), by(fact("dining-philosophers.pl", clause(111)))),
              proof(goal(start_state(dp_C2, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(70))))
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP5_1, dp_s3).
why(
  dp_inSlot(dp_mP5_1, dp_s3),
  proof(
    goal(dp_inSlot(dp_mP5_1, dp_s3)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP5_1), binding("S", dp_s3), binding("_P", dp_P5), binding("_N", 1)]),
    uses([
      proof(
        goal(meal(dp_mP5_1, dp_P5, 1, dp_s3)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_1), binding("P", dp_P5), binding("N", 1), binding("S", dp_s3), binding("C", dp_C4), binding("CS", dp_C5), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
          proof(goal(slot(dp_C4, dp_s3, 1)), by(fact("dining-philosophers.pl", clause(26)))),
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(meal_handle(dp_P5, 1, dp_mP5_1)), by(fact("dining-philosophers.pl", clause(138)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C5, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C5, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP1_2, dp_s4).
why(
  dp_inSlot(dp_mP1_2, dp_s4),
  proof(
    goal(dp_inSlot(dp_mP1_2, dp_s4)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP1_2), binding("S", dp_s4), binding("_P", dp_P1), binding("_N", 2)]),
    uses([
      proof(
        goal(meal(dp_mP1_2, dp_P1, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_2), binding("P", dp_P1), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(meal_handle(dp_P1, 2, dp_mP1_2)), by(fact("dining-philosophers.pl", clause(127)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C7, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP3_2, dp_s4).
why(
  dp_inSlot(dp_mP3_2, dp_s4),
  proof(
    goal(dp_inSlot(dp_mP3_2, dp_s4)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP3_2), binding("S", dp_s4), binding("_P", dp_P3), binding("_N", 2)]),
    uses([
      proof(
        goal(meal(dp_mP3_2, dp_P3, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_2), binding("P", dp_P3), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(meal_handle(dp_P3, 2, dp_mP3_2)), by(fact("dining-philosophers.pl", clause(133)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C7, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP2_2, dp_s5).
why(
  dp_inSlot(dp_mP2_2, dp_s5),
  proof(
    goal(dp_inSlot(dp_mP2_2, dp_s5)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP2_2), binding("S", dp_s5), binding("_P", dp_P2), binding("_N", 2)]),
    uses([
      proof(
        goal(meal(dp_mP2_2, dp_P2, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_2), binding("P", dp_P2), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(meal_handle(dp_P2, 2, dp_mP2_2)), by(fact("dining-philosophers.pl", clause(130)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C9, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP4_2, dp_s5).
why(
  dp_inSlot(dp_mP4_2, dp_s5),
  proof(
    goal(dp_inSlot(dp_mP4_2, dp_s5)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP4_2), binding("S", dp_s5), binding("_P", dp_P4), binding("_N", 2)]),
    uses([
      proof(
        goal(meal(dp_mP4_2, dp_P4, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_2), binding("P", dp_P4), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(meal_handle(dp_P4, 2, dp_mP4_2)), by(fact("dining-philosophers.pl", clause(136)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C9, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP5_2, dp_s6).
why(
  dp_inSlot(dp_mP5_2, dp_s6),
  proof(
    goal(dp_inSlot(dp_mP5_2, dp_s6)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP5_2), binding("S", dp_s6), binding("_P", dp_P5), binding("_N", 2)]),
    uses([
      proof(
        goal(meal(dp_mP5_2, dp_P5, 2, dp_s6)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_2), binding("P", dp_P5), binding("N", 2), binding("S", dp_s6), binding("C", dp_C10), binding("CS", dp_C11), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
          proof(goal(slot(dp_C10, dp_s6, 2)), by(fact("dining-philosophers.pl", clause(35)))),
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(meal_handle(dp_P5, 2, dp_mP5_2)), by(fact("dining-philosophers.pl", clause(139)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C11, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C11, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP1_3, dp_s7).
why(
  dp_inSlot(dp_mP1_3, dp_s7),
  proof(
    goal(dp_inSlot(dp_mP1_3, dp_s7)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP1_3), binding("S", dp_s7), binding("_P", dp_P1), binding("_N", 3)]),
    uses([
      proof(
        goal(meal(dp_mP1_3, dp_P1, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_3), binding("P", dp_P1), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(meal_handle(dp_P1, 3, dp_mP1_3)), by(fact("dining-philosophers.pl", clause(128)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C13, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP3_3, dp_s7).
why(
  dp_inSlot(dp_mP3_3, dp_s7),
  proof(
    goal(dp_inSlot(dp_mP3_3, dp_s7)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP3_3), binding("S", dp_s7), binding("_P", dp_P3), binding("_N", 3)]),
    uses([
      proof(
        goal(meal(dp_mP3_3, dp_P3, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_3), binding("P", dp_P3), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(meal_handle(dp_P3, 3, dp_mP3_3)), by(fact("dining-philosophers.pl", clause(134)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C13, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP2_3, dp_s8).
why(
  dp_inSlot(dp_mP2_3, dp_s8),
  proof(
    goal(dp_inSlot(dp_mP2_3, dp_s8)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP2_3), binding("S", dp_s8), binding("_P", dp_P2), binding("_N", 3)]),
    uses([
      proof(
        goal(meal(dp_mP2_3, dp_P2, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_3), binding("P", dp_P2), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(meal_handle(dp_P2, 3, dp_mP2_3)), by(fact("dining-philosophers.pl", clause(131)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C15, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP4_3, dp_s8).
why(
  dp_inSlot(dp_mP4_3, dp_s8),
  proof(
    goal(dp_inSlot(dp_mP4_3, dp_s8)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP4_3), binding("S", dp_s8), binding("_P", dp_P4), binding("_N", 3)]),
    uses([
      proof(
        goal(meal(dp_mP4_3, dp_P4, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_3), binding("P", dp_P4), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(meal_handle(dp_P4, 3, dp_mP4_3)), by(fact("dining-philosophers.pl", clause(137)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C15, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_inSlot(dp_mP5_3, dp_s9).
why(
  dp_inSlot(dp_mP5_3, dp_s9),
  proof(
    goal(dp_inSlot(dp_mP5_3, dp_s9)), by(rule("dining-philosophers.pl", clause(160))),
    bindings([binding("M", dp_mP5_3), binding("S", dp_s9), binding("_P", dp_P5), binding("_N", 3)]),
    uses([
      proof(
        goal(meal(dp_mP5_3, dp_P5, 3, dp_s9)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_3), binding("P", dp_P5), binding("N", 3), binding("S", dp_s9), binding("C", dp_C16), binding("CS", dp_C17), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
          proof(goal(slot(dp_C16, dp_s9, 3)), by(fact("dining-philosophers.pl", clause(44)))),
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(meal_handle(dp_P5, 3, dp_mP5_3)), by(fact("dining-philosophers.pl", clause(140)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C17, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C17, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

dp_usesFork(dp_mP1_1, dp_F51).
why(
  dp_usesFork(dp_mP1_1, dp_F51),
  proof(
    goal(dp_usesFork(dp_mP1_1, dp_F51)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP1_1), binding("LF", dp_F51), binding("P", dp_P1), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP1_1, dp_P1, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_1), binding("P", dp_P1), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Dirty), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P1)), by(fact("dining-philosophers.pl", clause(47)))),
          proof(goal(meal_handle(dp_P1, 1, dp_mP1_1)), by(fact("dining-philosophers.pl", clause(126)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C1, dp_F51, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F51), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F51)), by(fact("dining-philosophers.pl", clause(110)))),
              proof(goal(start_state(dp_C0, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(66))))
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F12, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F12), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F12)), by(fact("dining-philosophers.pl", clause(107)))),
              proof(goal(start_state(dp_C0, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(62))))
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10))))
    ])
  )
).

dp_usesFork(dp_mP3_1, dp_F23).
why(
  dp_usesFork(dp_mP3_1, dp_F23),
  proof(
    goal(dp_usesFork(dp_mP3_1, dp_F23)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP3_1), binding("LF", dp_F23), binding("P", dp_P3), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP3_1, dp_P3, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_1), binding("P", dp_P3), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(meal_handle(dp_P3, 1, dp_mP3_1)), by(fact("dining-philosophers.pl", clause(132)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C1, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C1), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C0), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(
                goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F34, dp_P3, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F34), binding("H", dp_P3), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F34)), by(fact("dining-philosophers.pl", clause(108)))),
              proof(goal(start_state(dp_C0, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(64))))
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14))))
    ])
  )
).

dp_usesFork(dp_mP2_1, dp_F12).
why(
  dp_usesFork(dp_mP2_1, dp_F12),
  proof(
    goal(dp_usesFork(dp_mP2_1, dp_F12)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP2_1), binding("LF", dp_F12), binding("P", dp_P2), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP2_1, dp_P2, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_1), binding("P", dp_P2), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(meal_handle(dp_P2, 1, dp_mP2_1)), by(fact("dining-philosophers.pl", clause(129)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C3, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12))))
    ])
  )
).

dp_usesFork(dp_mP4_1, dp_F34).
why(
  dp_usesFork(dp_mP4_1, dp_F34),
  proof(
    goal(dp_usesFork(dp_mP4_1, dp_F34)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP4_1), binding("LF", dp_F34), binding("P", dp_P4), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP4_1, dp_P4, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_1), binding("P", dp_P4), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(meal_handle(dp_P4, 1, dp_mP4_1)), by(fact("dining-philosophers.pl", clause(135)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C3, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F45, dp_P4, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C3), binding("F", dp_F45), binding("H", dp_P4), binding("Cleanliness", dp_Dirty), binding("C", dp_C2)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(goal(keep(dp_C2, dp_F45)), by(fact("dining-philosophers.pl", clause(111)))),
              proof(goal(start_state(dp_C2, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(70))))
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16))))
    ])
  )
).

dp_usesFork(dp_mP5_1, dp_F45).
why(
  dp_usesFork(dp_mP5_1, dp_F45),
  proof(
    goal(dp_usesFork(dp_mP5_1, dp_F45)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP5_1), binding("LF", dp_F45), binding("P", dp_P5), binding("_N", 1), binding("_S", dp_s3)]),
    uses([
      proof(
        goal(meal(dp_mP5_1, dp_P5, 1, dp_s3)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_1), binding("P", dp_P5), binding("N", 1), binding("S", dp_s3), binding("C", dp_C4), binding("CS", dp_C5), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
          proof(goal(slot(dp_C4, dp_s3, 1)), by(fact("dining-philosophers.pl", clause(26)))),
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(meal_handle(dp_P5, 1, dp_mP5_1)), by(fact("dining-philosophers.pl", clause(138)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C5, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C5, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18))))
    ])
  )
).

dp_usesFork(dp_mP1_2, dp_F51).
why(
  dp_usesFork(dp_mP1_2, dp_F51),
  proof(
    goal(dp_usesFork(dp_mP1_2, dp_F51)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP1_2), binding("LF", dp_F51), binding("P", dp_P1), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP1_2, dp_P1, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_2), binding("P", dp_P1), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(meal_handle(dp_P1, 2, dp_mP1_2)), by(fact("dining-philosophers.pl", clause(127)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C7, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10))))
    ])
  )
).

dp_usesFork(dp_mP3_2, dp_F23).
why(
  dp_usesFork(dp_mP3_2, dp_F23),
  proof(
    goal(dp_usesFork(dp_mP3_2, dp_F23)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP3_2), binding("LF", dp_F23), binding("P", dp_P3), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP3_2, dp_P3, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_2), binding("P", dp_P3), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(meal_handle(dp_P3, 2, dp_mP3_2)), by(fact("dining-philosophers.pl", clause(133)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C7, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14))))
    ])
  )
).

dp_usesFork(dp_mP2_2, dp_F12).
why(
  dp_usesFork(dp_mP2_2, dp_F12),
  proof(
    goal(dp_usesFork(dp_mP2_2, dp_F12)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP2_2), binding("LF", dp_F12), binding("P", dp_P2), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP2_2, dp_P2, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_2), binding("P", dp_P2), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(meal_handle(dp_P2, 2, dp_mP2_2)), by(fact("dining-philosophers.pl", clause(130)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C9, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12))))
    ])
  )
).

dp_usesFork(dp_mP4_2, dp_F34).
why(
  dp_usesFork(dp_mP4_2, dp_F34),
  proof(
    goal(dp_usesFork(dp_mP4_2, dp_F34)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP4_2), binding("LF", dp_F34), binding("P", dp_P4), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP4_2, dp_P4, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_2), binding("P", dp_P4), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(meal_handle(dp_P4, 2, dp_mP4_2)), by(fact("dining-philosophers.pl", clause(136)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C9, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16))))
    ])
  )
).

dp_usesFork(dp_mP5_2, dp_F45).
why(
  dp_usesFork(dp_mP5_2, dp_F45),
  proof(
    goal(dp_usesFork(dp_mP5_2, dp_F45)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP5_2), binding("LF", dp_F45), binding("P", dp_P5), binding("_N", 2), binding("_S", dp_s6)]),
    uses([
      proof(
        goal(meal(dp_mP5_2, dp_P5, 2, dp_s6)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_2), binding("P", dp_P5), binding("N", 2), binding("S", dp_s6), binding("C", dp_C10), binding("CS", dp_C11), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
          proof(goal(slot(dp_C10, dp_s6, 2)), by(fact("dining-philosophers.pl", clause(35)))),
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(meal_handle(dp_P5, 2, dp_mP5_2)), by(fact("dining-philosophers.pl", clause(139)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C11, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C11, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18))))
    ])
  )
).

dp_usesFork(dp_mP1_3, dp_F51).
why(
  dp_usesFork(dp_mP1_3, dp_F51),
  proof(
    goal(dp_usesFork(dp_mP1_3, dp_F51)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP1_3), binding("LF", dp_F51), binding("P", dp_P1), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP1_3, dp_P1, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_3), binding("P", dp_P1), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(meal_handle(dp_P1, 3, dp_mP1_3)), by(fact("dining-philosophers.pl", clause(128)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C13, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10))))
    ])
  )
).

dp_usesFork(dp_mP3_3, dp_F23).
why(
  dp_usesFork(dp_mP3_3, dp_F23),
  proof(
    goal(dp_usesFork(dp_mP3_3, dp_F23)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP3_3), binding("LF", dp_F23), binding("P", dp_P3), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP3_3, dp_P3, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_3), binding("P", dp_P3), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(meal_handle(dp_P3, 3, dp_mP3_3)), by(fact("dining-philosophers.pl", clause(134)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C13, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14))))
    ])
  )
).

dp_usesFork(dp_mP2_3, dp_F12).
why(
  dp_usesFork(dp_mP2_3, dp_F12),
  proof(
    goal(dp_usesFork(dp_mP2_3, dp_F12)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP2_3), binding("LF", dp_F12), binding("P", dp_P2), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP2_3, dp_P2, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_3), binding("P", dp_P2), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(meal_handle(dp_P2, 3, dp_mP2_3)), by(fact("dining-philosophers.pl", clause(131)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C15, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12))))
    ])
  )
).

dp_usesFork(dp_mP4_3, dp_F34).
why(
  dp_usesFork(dp_mP4_3, dp_F34),
  proof(
    goal(dp_usesFork(dp_mP4_3, dp_F34)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP4_3), binding("LF", dp_F34), binding("P", dp_P4), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP4_3, dp_P4, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_3), binding("P", dp_P4), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(meal_handle(dp_P4, 3, dp_mP4_3)), by(fact("dining-philosophers.pl", clause(137)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C15, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16))))
    ])
  )
).

dp_usesFork(dp_mP5_3, dp_F45).
why(
  dp_usesFork(dp_mP5_3, dp_F45),
  proof(
    goal(dp_usesFork(dp_mP5_3, dp_F45)), by(rule("dining-philosophers.pl", clause(161))),
    bindings([binding("M", dp_mP5_3), binding("LF", dp_F45), binding("P", dp_P5), binding("_N", 3), binding("_S", dp_s9)]),
    uses([
      proof(
        goal(meal(dp_mP5_3, dp_P5, 3, dp_s9)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_3), binding("P", dp_P5), binding("N", 3), binding("S", dp_s9), binding("C", dp_C16), binding("CS", dp_C17), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
          proof(goal(slot(dp_C16, dp_s9, 3)), by(fact("dining-philosophers.pl", clause(44)))),
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(meal_handle(dp_P5, 3, dp_mP5_3)), by(fact("dining-philosophers.pl", clause(140)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C17, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C17, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18))))
    ])
  )
).

dp_usesFork(dp_mP1_1, dp_F12).
why(
  dp_usesFork(dp_mP1_1, dp_F12),
  proof(
    goal(dp_usesFork(dp_mP1_1, dp_F12)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP1_1), binding("RF", dp_F12), binding("P", dp_P1), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP1_1, dp_P1, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_1), binding("P", dp_P1), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Dirty), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P1)), by(fact("dining-philosophers.pl", clause(47)))),
          proof(goal(meal_handle(dp_P1, 1, dp_mP1_1)), by(fact("dining-philosophers.pl", clause(126)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C1, dp_F51, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F51), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F51)), by(fact("dining-philosophers.pl", clause(110)))),
              proof(goal(start_state(dp_C0, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(66))))
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F12, dp_P1, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F12), binding("H", dp_P1), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F12)), by(fact("dining-philosophers.pl", clause(107)))),
              proof(goal(start_state(dp_C0, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(62))))
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11))))
    ])
  )
).

dp_usesFork(dp_mP3_1, dp_F34).
why(
  dp_usesFork(dp_mP3_1, dp_F34),
  proof(
    goal(dp_usesFork(dp_mP3_1, dp_F34)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP3_1), binding("RF", dp_F34), binding("P", dp_P3), binding("_N", 1), binding("_S", dp_s1)]),
    uses([
      proof(
        goal(meal(dp_mP3_1, dp_P3, 1, dp_s1)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_1), binding("P", dp_P3), binding("N", 1), binding("S", dp_s1), binding("C", dp_C0), binding("CS", dp_C1), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
          proof(goal(slot(dp_C0, dp_s1, 1)), by(fact("dining-philosophers.pl", clause(20)))),
          proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
          proof(goal(meal_handle(dp_P3, 1, dp_mP3_1)), by(fact("dining-philosophers.pl", clause(132)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C1, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C1), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C0), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(
                goal(send_fork(dp_C0, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C0), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C0, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C0), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C0, dp_P3)), by(fact("dining-philosophers.pl", clause(48)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C0, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(63))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C1, dp_F34, dp_P3, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C1), binding("F", dp_F34), binding("H", dp_P3), binding("Cleanliness", dp_Dirty), binding("C", dp_C0)]),
            uses([
              proof(goal(after_sends(dp_C0, dp_C1)), by(fact("dining-philosophers.pl", clause(21)))),
              proof(goal(keep(dp_C0, dp_F34)), by(fact("dining-philosophers.pl", clause(108)))),
              proof(goal(start_state(dp_C0, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(64))))
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15))))
    ])
  )
).

dp_usesFork(dp_mP2_1, dp_F23).
why(
  dp_usesFork(dp_mP2_1, dp_F23),
  proof(
    goal(dp_usesFork(dp_mP2_1, dp_F23)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP2_1), binding("RF", dp_F23), binding("P", dp_P2), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP2_1, dp_P2, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_1), binding("P", dp_P2), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
          proof(goal(meal_handle(dp_P2, 1, dp_mP2_1)), by(fact("dining-philosophers.pl", clause(129)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C3, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(67))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C2), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P2)), by(fact("dining-philosophers.pl", clause(49)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(68))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13))))
    ])
  )
).

dp_usesFork(dp_mP4_1, dp_F45).
why(
  dp_usesFork(dp_mP4_1, dp_F45),
  proof(
    goal(dp_usesFork(dp_mP4_1, dp_F45)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP4_1), binding("RF", dp_F45), binding("P", dp_P4), binding("_N", 1), binding("_S", dp_s2)]),
    uses([
      proof(
        goal(meal(dp_mP4_1, dp_P4, 1, dp_s2)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_1), binding("P", dp_P4), binding("N", 1), binding("S", dp_s2), binding("C", dp_C2), binding("CS", dp_C3), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Dirty)]),
        uses([
          proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
          proof(goal(slot(dp_C2, dp_s2, 1)), by(fact("dining-philosophers.pl", clause(23)))),
          proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
          proof(goal(meal_handle(dp_P4, 1, dp_mP4_1)), by(fact("dining-philosophers.pl", clause(135)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C3, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C3), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C2), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(
                goal(send_fork(dp_C2, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C2), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C2, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C2), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C2, dp_P4)), by(fact("dining-philosophers.pl", clause(50)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C2, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(69))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C3, dp_F45, dp_P4, dp_Dirty)), by(rule("dining-philosophers.pl", clause(145))),
            bindings([binding("CS", dp_C3), binding("F", dp_F45), binding("H", dp_P4), binding("Cleanliness", dp_Dirty), binding("C", dp_C2)]),
            uses([
              proof(goal(after_sends(dp_C2, dp_C3)), by(fact("dining-philosophers.pl", clause(24)))),
              proof(goal(keep(dp_C2, dp_F45)), by(fact("dining-philosophers.pl", clause(111)))),
              proof(goal(start_state(dp_C2, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(70))))
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17))))
    ])
  )
).

dp_usesFork(dp_mP5_1, dp_F51).
why(
  dp_usesFork(dp_mP5_1, dp_F51),
  proof(
    goal(dp_usesFork(dp_mP5_1, dp_F51)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP5_1), binding("RF", dp_F51), binding("P", dp_P5), binding("_N", 1), binding("_S", dp_s3)]),
    uses([
      proof(
        goal(meal(dp_mP5_1, dp_P5, 1, dp_s3)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_1), binding("P", dp_P5), binding("N", 1), binding("S", dp_s3), binding("C", dp_C4), binding("CS", dp_C5), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
          proof(goal(slot(dp_C4, dp_s3, 1)), by(fact("dining-philosophers.pl", clause(26)))),
          proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
          proof(goal(meal_handle(dp_P5, 1, dp_mP5_1)), by(fact("dining-philosophers.pl", clause(138)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C5, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(75))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C5, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C5), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C4), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C4, dp_C5)), by(fact("dining-philosophers.pl", clause(27)))),
              proof(
                goal(send_fork(dp_C4, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C4), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C4, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C4), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C4, dp_P5)), by(fact("dining-philosophers.pl", clause(51)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C4, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(76))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19))))
    ])
  )
).

dp_usesFork(dp_mP1_2, dp_F12).
why(
  dp_usesFork(dp_mP1_2, dp_F12),
  proof(
    goal(dp_usesFork(dp_mP1_2, dp_F12)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP1_2), binding("RF", dp_F12), binding("P", dp_P1), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP1_2, dp_P1, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_2), binding("P", dp_P1), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
          proof(goal(meal_handle(dp_P1, 2, dp_mP1_2)), by(fact("dining-philosophers.pl", clause(127)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C7, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(81))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P1)), by(fact("dining-philosophers.pl", clause(52)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(77))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11))))
    ])
  )
).

dp_usesFork(dp_mP3_2, dp_F34).
why(
  dp_usesFork(dp_mP3_2, dp_F34),
  proof(
    goal(dp_usesFork(dp_mP3_2, dp_F34)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP3_2), binding("RF", dp_F34), binding("P", dp_P3), binding("_N", 2), binding("_S", dp_s4)]),
    uses([
      proof(
        goal(meal(dp_mP3_2, dp_P3, 2, dp_s4)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_2), binding("P", dp_P3), binding("N", 2), binding("S", dp_s4), binding("C", dp_C6), binding("CS", dp_C7), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
          proof(goal(slot(dp_C6, dp_s4, 2)), by(fact("dining-philosophers.pl", clause(29)))),
          proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
          proof(goal(meal_handle(dp_P3, 2, dp_mP3_2)), by(fact("dining-philosophers.pl", clause(133)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C7, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(78))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C7, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C7), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C6), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C6, dp_C7)), by(fact("dining-philosophers.pl", clause(30)))),
              proof(
                goal(send_fork(dp_C6, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C6), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C6, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C6), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C6, dp_P3)), by(fact("dining-philosophers.pl", clause(53)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C6, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(79))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15))))
    ])
  )
).

dp_usesFork(dp_mP2_2, dp_F23).
why(
  dp_usesFork(dp_mP2_2, dp_F23),
  proof(
    goal(dp_usesFork(dp_mP2_2, dp_F23)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP2_2), binding("RF", dp_F23), binding("P", dp_P2), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP2_2, dp_P2, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_2), binding("P", dp_P2), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
          proof(goal(meal_handle(dp_P2, 2, dp_mP2_2)), by(fact("dining-philosophers.pl", clause(130)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C9, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(82))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P2)), by(fact("dining-philosophers.pl", clause(54)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(83))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13))))
    ])
  )
).

dp_usesFork(dp_mP4_2, dp_F45).
why(
  dp_usesFork(dp_mP4_2, dp_F45),
  proof(
    goal(dp_usesFork(dp_mP4_2, dp_F45)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP4_2), binding("RF", dp_F45), binding("P", dp_P4), binding("_N", 2), binding("_S", dp_s5)]),
    uses([
      proof(
        goal(meal(dp_mP4_2, dp_P4, 2, dp_s5)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_2), binding("P", dp_P4), binding("N", 2), binding("S", dp_s5), binding("C", dp_C8), binding("CS", dp_C9), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
          proof(goal(slot(dp_C8, dp_s5, 2)), by(fact("dining-philosophers.pl", clause(32)))),
          proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
          proof(goal(meal_handle(dp_P4, 2, dp_mP4_2)), by(fact("dining-philosophers.pl", clause(136)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C9, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(84))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C9, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C9), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C8), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C8, dp_C9)), by(fact("dining-philosophers.pl", clause(33)))),
              proof(
                goal(send_fork(dp_C8, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C8), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C8, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C8), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C8, dp_P4)), by(fact("dining-philosophers.pl", clause(55)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C8, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(85))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17))))
    ])
  )
).

dp_usesFork(dp_mP5_2, dp_F51).
why(
  dp_usesFork(dp_mP5_2, dp_F51),
  proof(
    goal(dp_usesFork(dp_mP5_2, dp_F51)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP5_2), binding("RF", dp_F51), binding("P", dp_P5), binding("_N", 2), binding("_S", dp_s6)]),
    uses([
      proof(
        goal(meal(dp_mP5_2, dp_P5, 2, dp_s6)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_2), binding("P", dp_P5), binding("N", 2), binding("S", dp_s6), binding("C", dp_C10), binding("CS", dp_C11), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
          proof(goal(slot(dp_C10, dp_s6, 2)), by(fact("dining-philosophers.pl", clause(35)))),
          proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
          proof(goal(meal_handle(dp_P5, 2, dp_mP5_2)), by(fact("dining-philosophers.pl", clause(139)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C11, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(90))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C11, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C11), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C10), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C10, dp_C11)), by(fact("dining-philosophers.pl", clause(36)))),
              proof(
                goal(send_fork(dp_C10, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C10), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C10, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C10), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C10, dp_P5)), by(fact("dining-philosophers.pl", clause(56)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C10, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(91))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19))))
    ])
  )
).

dp_usesFork(dp_mP1_3, dp_F12).
why(
  dp_usesFork(dp_mP1_3, dp_F12),
  proof(
    goal(dp_usesFork(dp_mP1_3, dp_F12)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP1_3), binding("RF", dp_F12), binding("P", dp_P1), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP1_3, dp_P1, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP1_3), binding("P", dp_P1), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F51), binding("RF", dp_F12), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
          proof(goal(meal_handle(dp_P1, 3, dp_mP1_3)), by(fact("dining-philosophers.pl", clause(128)))),
          proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
          proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
          proof(
            goal(after_send_state(dp_C13, dp_F51, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F51), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P5), binding("P", dp_P1), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P5), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(left_fork(dp_P1, dp_F51)), by(fact("dining-philosophers.pl", clause(10)))),
                      proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96)))),
                      proof(goal(neq(dp_P5, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F51, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(96))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F12, dp_P1, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F12), binding("P", dp_P1), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P1), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P1), binding("Q", dp_P2), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P1)), by(fact("dining-philosophers.pl", clause(57)))),
                      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11)))),
                      proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92)))),
                      proof(goal(neq(dp_P2, dp_P1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F12, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(92))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P1, dp_F12)), by(fact("dining-philosophers.pl", clause(11))))
    ])
  )
).

dp_usesFork(dp_mP3_3, dp_F34).
why(
  dp_usesFork(dp_mP3_3, dp_F34),
  proof(
    goal(dp_usesFork(dp_mP3_3, dp_F34)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP3_3), binding("RF", dp_F34), binding("P", dp_P3), binding("_N", 3), binding("_S", dp_s7)]),
    uses([
      proof(
        goal(meal(dp_mP3_3, dp_P3, 3, dp_s7)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP3_3), binding("P", dp_P3), binding("N", 3), binding("S", dp_s7), binding("C", dp_C12), binding("CS", dp_C13), binding("LF", dp_F23), binding("RF", dp_F34), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
          proof(goal(slot(dp_C12, dp_s7, 3)), by(fact("dining-philosophers.pl", clause(38)))),
          proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
          proof(goal(meal_handle(dp_P3, 3, dp_mP3_3)), by(fact("dining-philosophers.pl", clause(134)))),
          proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
          proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
          proof(
            goal(after_send_state(dp_C13, dp_F23, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F23), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P2)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P2), binding("P", dp_P3), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P2), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(left_fork(dp_P3, dp_F23)), by(fact("dining-philosophers.pl", clause(14)))),
                      proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93)))),
                      proof(goal(neq(dp_P2, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F23, dp_P2, dp_Dirty)), by(fact("dining-philosophers.pl", clause(93))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C13, dp_F34, dp_P3, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C13), binding("F", dp_F34), binding("P", dp_P3), binding("C", dp_C12), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C12, dp_C13)), by(fact("dining-philosophers.pl", clause(39)))),
              proof(
                goal(send_fork(dp_C12, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C12), binding("Q", dp_P4), binding("P", dp_P3), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C12, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C12), binding("P", dp_P3), binding("Q", dp_P4), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C12, dp_P3)), by(fact("dining-philosophers.pl", clause(58)))),
                      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15)))),
                      proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94)))),
                      proof(goal(neq(dp_P4, dp_P3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C12, dp_F34, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(94))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P3, dp_F34)), by(fact("dining-philosophers.pl", clause(15))))
    ])
  )
).

dp_usesFork(dp_mP2_3, dp_F23).
why(
  dp_usesFork(dp_mP2_3, dp_F23),
  proof(
    goal(dp_usesFork(dp_mP2_3, dp_F23)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP2_3), binding("RF", dp_F23), binding("P", dp_P2), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP2_3, dp_P2, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP2_3), binding("P", dp_P2), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F12), binding("RF", dp_F23), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
          proof(goal(meal_handle(dp_P2, 3, dp_mP2_3)), by(fact("dining-philosophers.pl", clause(131)))),
          proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
          proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
          proof(
            goal(after_send_state(dp_C15, dp_F12, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F12), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P1, dp_P2, dp_F12)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P1), binding("P", dp_P2), binding("F", dp_F12)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P1, dp_F12)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P1), binding("F", dp_F12), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(left_fork(dp_P2, dp_F12)), by(fact("dining-philosophers.pl", clause(12)))),
                      proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97)))),
                      proof(goal(neq(dp_P1, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F12, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(97))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F23, dp_P2, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F23), binding("P", dp_P2), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P2, dp_F23)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P2), binding("F", dp_F23)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P2, dp_P3, dp_F23)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P2), binding("Q", dp_P3), binding("F", dp_F23), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P2)), by(fact("dining-philosophers.pl", clause(59)))),
                      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13)))),
                      proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98)))),
                      proof(goal(neq(dp_P3, dp_P2)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F23, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(98))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P2, dp_F23)), by(fact("dining-philosophers.pl", clause(13))))
    ])
  )
).

dp_usesFork(dp_mP4_3, dp_F45).
why(
  dp_usesFork(dp_mP4_3, dp_F45),
  proof(
    goal(dp_usesFork(dp_mP4_3, dp_F45)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP4_3), binding("RF", dp_F45), binding("P", dp_P4), binding("_N", 3), binding("_S", dp_s8)]),
    uses([
      proof(
        goal(meal(dp_mP4_3, dp_P4, 3, dp_s8)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP4_3), binding("P", dp_P4), binding("N", 3), binding("S", dp_s8), binding("C", dp_C14), binding("CS", dp_C15), binding("LF", dp_F34), binding("RF", dp_F45), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
          proof(goal(slot(dp_C14, dp_s8, 3)), by(fact("dining-philosophers.pl", clause(41)))),
          proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
          proof(goal(meal_handle(dp_P4, 3, dp_mP4_3)), by(fact("dining-philosophers.pl", clause(137)))),
          proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
          proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
          proof(
            goal(after_send_state(dp_C15, dp_F34, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F34), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P3)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P3, dp_P4, dp_F34)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P3), binding("P", dp_P4), binding("F", dp_F34)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P3, dp_F34)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P3), binding("F", dp_F34), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(left_fork(dp_P4, dp_F34)), by(fact("dining-philosophers.pl", clause(16)))),
                      proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99)))),
                      proof(goal(neq(dp_P3, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F34, dp_P3, dp_Dirty)), by(fact("dining-philosophers.pl", clause(99))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C15, dp_F45, dp_P4, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C15), binding("F", dp_F45), binding("P", dp_P4), binding("C", dp_C14), binding("_Q", dp_P5)]),
            uses([
              proof(goal(after_sends(dp_C14, dp_C15)), by(fact("dining-philosophers.pl", clause(42)))),
              proof(
                goal(send_fork(dp_C14, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C14), binding("Q", dp_P5), binding("P", dp_P4), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C14, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C14), binding("P", dp_P4), binding("Q", dp_P5), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C14, dp_P4)), by(fact("dining-philosophers.pl", clause(60)))),
                      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17)))),
                      proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100)))),
                      proof(goal(neq(dp_P5, dp_P4)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C14, dp_F45, dp_P5, dp_Dirty)), by(fact("dining-philosophers.pl", clause(100))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P4, dp_F45)), by(fact("dining-philosophers.pl", clause(17))))
    ])
  )
).

dp_usesFork(dp_mP5_3, dp_F51).
why(
  dp_usesFork(dp_mP5_3, dp_F51),
  proof(
    goal(dp_usesFork(dp_mP5_3, dp_F51)), by(rule("dining-philosophers.pl", clause(162))),
    bindings([binding("M", dp_mP5_3), binding("RF", dp_F51), binding("P", dp_P5), binding("_N", 3), binding("_S", dp_s9)]),
    uses([
      proof(
        goal(meal(dp_mP5_3, dp_P5, 3, dp_s9)), by(rule("dining-philosophers.pl", clause(146))),
        bindings([binding("M", dp_mP5_3), binding("P", dp_P5), binding("N", 3), binding("S", dp_s9), binding("C", dp_C16), binding("CS", dp_C17), binding("LF", dp_F45), binding("RF", dp_F51), binding("_LeftCleanliness", dp_Clean), binding("_RightCleanliness", dp_Clean)]),
        uses([
          proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
          proof(goal(slot(dp_C16, dp_s9, 3)), by(fact("dining-philosophers.pl", clause(44)))),
          proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
          proof(goal(meal_handle(dp_P5, 3, dp_mP5_3)), by(fact("dining-philosophers.pl", clause(140)))),
          proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
          proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
          proof(
            goal(after_send_state(dp_C17, dp_F45, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F45), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P4)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P4, dp_P5, dp_F45)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P4), binding("P", dp_P5), binding("F", dp_F45)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P4, dp_F45)), by(rule("dining-philosophers.pl", clause(141))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P4), binding("F", dp_F45), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(left_fork(dp_P5, dp_F45)), by(fact("dining-philosophers.pl", clause(18)))),
                      proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105)))),
                      proof(goal(neq(dp_P4, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F45, dp_P4, dp_Dirty)), by(fact("dining-philosophers.pl", clause(105))))
                ])
              )
            ])
          ),
          proof(
            goal(after_send_state(dp_C17, dp_F51, dp_P5, dp_Clean)), by(rule("dining-philosophers.pl", clause(144))),
            bindings([binding("CS", dp_C17), binding("F", dp_F51), binding("P", dp_P5), binding("C", dp_C16), binding("_Q", dp_P1)]),
            uses([
              proof(goal(after_sends(dp_C16, dp_C17)), by(fact("dining-philosophers.pl", clause(45)))),
              proof(
                goal(send_fork(dp_C16, dp_P1, dp_P5, dp_F51)), by(rule("dining-philosophers.pl", clause(143))),
                bindings([binding("C", dp_C16), binding("Q", dp_P1), binding("P", dp_P5), binding("F", dp_F51)]),
                uses([
                  proof(
                    goal(request(dp_C16, dp_P5, dp_P1, dp_F51)), by(rule("dining-philosophers.pl", clause(142))),
                    bindings([binding("C", dp_C16), binding("P", dp_P5), binding("Q", dp_P1), binding("F", dp_F51), binding("_Cleanliness", dp_Dirty)]),
                    uses([
                      proof(goal(hungry(dp_C16, dp_P5)), by(fact("dining-philosophers.pl", clause(61)))),
                      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19)))),
                      proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106)))),
                      proof(goal(neq(dp_P1, dp_P5)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(goal(start_state(dp_C16, dp_F51, dp_P1, dp_Dirty)), by(fact("dining-philosophers.pl", clause(106))))
                ])
              )
            ])
          )
        ])
      ),
      proof(goal(right_fork(dp_P5, dp_F51)), by(fact("dining-philosophers.pl", clause(19))))
    ])
  )
).

