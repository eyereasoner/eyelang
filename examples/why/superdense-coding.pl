decodesAs(message(1), 1).
why(
  decodesAs(message(1), 1),
  proof(
    goal(decodesAs(message(1), 1)), by(rule("superdense-coding.pl", clause(26))),
    bindings([binding("N", 1), binding("M", 1)]),
    uses([
      proof(
        goal(sdcoding(1, 1)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 1), binding("M", 1), binding("Proof", path(false, false, true))]),
        uses([
          proof(
            goal(sdc_path(1, 1, path(false, false, true))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 1), binding("M", 1), binding("X", false), binding("Y", false), binding("B", true)]),
            uses([
              proof(goal(r(false, false)), by(fact("superdense-coding.pl", clause(4)))),
              proof(
                goal(alice(1, false, true)), by(rule("superdense-coding.pl", clause(16))),
                bindings([binding("X", false), binding("Y", true)]),
                uses([
                  proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8))))
                ])
              ),
              proof(
                goal(bob(true, false, 1)), by(rule("superdense-coding.pl", clause(20))),
                bindings([binding("X", true), binding("Y", false)]),
                uses([
                  proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11))))
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(1, 1, path(false, false, true)))), by(builtin(not, 1)))
        ])
      )
    ])
  )
).

decodesAs(message(3), 3).
why(
  decodesAs(message(3), 3),
  proof(
    goal(decodesAs(message(3), 3)), by(rule("superdense-coding.pl", clause(26))),
    bindings([binding("N", 3), binding("M", 3)]),
    uses([
      proof(
        goal(sdcoding(3, 3)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 3), binding("M", 3), binding("Proof", path(false, false, false))]),
        uses([
          proof(
            goal(sdc_path(3, 3, path(false, false, false))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 3), binding("M", 3), binding("X", false), binding("Y", false), binding("B", false)]),
            uses([
              proof(goal(r(false, false)), by(fact("superdense-coding.pl", clause(4)))),
              proof(
                goal(alice(3, false, false)), by(rule("superdense-coding.pl", clause(18))),
                bindings([binding("X", false), binding("Y", false)]),
                uses([
                  proof(
                    goal(kg(false, false)), by(rule("superdense-coding.pl", clause(13))),
                    bindings([binding("X", false), binding("Y", false), binding("Z", true)]),
                    uses([
                      proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8)))),
                      proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11))))
                    ])
                  )
                ])
              ),
              proof(
                goal(bob(false, false, 3)), by(rule("superdense-coding.pl", clause(22))),
                bindings([binding("X", false), binding("Y", false)]),
                uses([
                  proof(goal(identity(false, false)), by(fact("superdense-coding.pl", clause(6))))
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(3, 3, path(false, false, false)))), by(builtin(not, 1)))
        ])
      )
    ])
  )
).

decodesAs(message(0), 0).
why(
  decodesAs(message(0), 0),
  proof(
    goal(decodesAs(message(0), 0)), by(rule("superdense-coding.pl", clause(26))),
    bindings([binding("N", 0), binding("M", 0)]),
    uses([
      proof(
        goal(sdcoding(0, 0)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 0), binding("M", 0), binding("Proof", path(true, true, true))]),
        uses([
          proof(
            goal(sdc_path(0, 0, path(true, true, true))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 0), binding("M", 0), binding("X", true), binding("Y", true), binding("B", true)]),
            uses([
              proof(goal(r(true, true)), by(fact("superdense-coding.pl", clause(5)))),
              proof(
                goal(alice(0, true, true)), by(rule("superdense-coding.pl", clause(15))),
                bindings([binding("X", true), binding("Y", true)]),
                uses([
                  proof(goal(identity(true, true)), by(fact("superdense-coding.pl", clause(7))))
                ])
              ),
              proof(
                goal(bob(true, true, 0)), by(rule("superdense-coding.pl", clause(19))),
                bindings([binding("X", true), binding("Y", true)]),
                uses([
                  proof(
                    goal(gk(true, true)), by(rule("superdense-coding.pl", clause(14))),
                    bindings([binding("X", true), binding("Y", true), binding("Z", false)]),
                    uses([
                      proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11)))),
                      proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8))))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(0, 0, path(true, true, true)))), by(builtin(not, 1)))
        ])
      )
    ])
  )
).

decodesAs(message(2), 2).
why(
  decodesAs(message(2), 2),
  proof(
    goal(decodesAs(message(2), 2)), by(rule("superdense-coding.pl", clause(26))),
    bindings([binding("N", 2), binding("M", 2)]),
    uses([
      proof(
        goal(sdcoding(2, 2)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 2), binding("M", 2), binding("Proof", path(true, true, false))]),
        uses([
          proof(
            goal(sdc_path(2, 2, path(true, true, false))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 2), binding("M", 2), binding("X", true), binding("Y", true), binding("B", false)]),
            uses([
              proof(goal(r(true, true)), by(fact("superdense-coding.pl", clause(5)))),
              proof(
                goal(alice(2, true, false)), by(rule("superdense-coding.pl", clause(17))),
                bindings([binding("X", true), binding("Y", false)]),
                uses([
                  proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11))))
                ])
              ),
              proof(
                goal(bob(false, true, 2)), by(rule("superdense-coding.pl", clause(21))),
                bindings([binding("X", false), binding("Y", true)]),
                uses([
                  proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8))))
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(2, 2, path(true, true, false)))), by(builtin(not, 1)))
        ])
      )
    ])
  )
).

preservesMessage(protocol, true).
why(
  preservesMessage(protocol, true),
  proof(
    goal(preservesMessage(protocol, true)), by(rule("superdense-coding.pl", clause(27))),
    uses([
      proof(
        goal(sdcoding(0, 0)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 0), binding("M", 0), binding("Proof", path(true, true, true))]),
        uses([
          proof(
            goal(sdc_path(0, 0, path(true, true, true))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 0), binding("M", 0), binding("X", true), binding("Y", true), binding("B", true)]),
            uses([
              proof(goal(r(true, true)), by(fact("superdense-coding.pl", clause(5)))),
              proof(
                goal(alice(0, true, true)), by(rule("superdense-coding.pl", clause(15))),
                bindings([binding("X", true), binding("Y", true)]),
                uses([
                  proof(goal(identity(true, true)), by(fact("superdense-coding.pl", clause(7))))
                ])
              ),
              proof(
                goal(bob(true, true, 0)), by(rule("superdense-coding.pl", clause(19))),
                bindings([binding("X", true), binding("Y", true)]),
                uses([
                  proof(
                    goal(gk(true, true)), by(rule("superdense-coding.pl", clause(14))),
                    bindings([binding("X", true), binding("Y", true), binding("Z", false)]),
                    uses([
                      proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11)))),
                      proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8))))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(0, 0, path(true, true, true)))), by(builtin(not, 1)))
        ])
      ),
      proof(
        goal(sdcoding(1, 1)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 1), binding("M", 1), binding("Proof", path(false, false, true))]),
        uses([
          proof(
            goal(sdc_path(1, 1, path(false, false, true))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 1), binding("M", 1), binding("X", false), binding("Y", false), binding("B", true)]),
            uses([
              proof(goal(r(false, false)), by(fact("superdense-coding.pl", clause(4)))),
              proof(
                goal(alice(1, false, true)), by(rule("superdense-coding.pl", clause(16))),
                bindings([binding("X", false), binding("Y", true)]),
                uses([
                  proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8))))
                ])
              ),
              proof(
                goal(bob(true, false, 1)), by(rule("superdense-coding.pl", clause(20))),
                bindings([binding("X", true), binding("Y", false)]),
                uses([
                  proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11))))
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(1, 1, path(false, false, true)))), by(builtin(not, 1)))
        ])
      ),
      proof(
        goal(sdcoding(2, 2)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 2), binding("M", 2), binding("Proof", path(true, true, false))]),
        uses([
          proof(
            goal(sdc_path(2, 2, path(true, true, false))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 2), binding("M", 2), binding("X", true), binding("Y", true), binding("B", false)]),
            uses([
              proof(goal(r(true, true)), by(fact("superdense-coding.pl", clause(5)))),
              proof(
                goal(alice(2, true, false)), by(rule("superdense-coding.pl", clause(17))),
                bindings([binding("X", true), binding("Y", false)]),
                uses([
                  proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11))))
                ])
              ),
              proof(
                goal(bob(false, true, 2)), by(rule("superdense-coding.pl", clause(21))),
                bindings([binding("X", false), binding("Y", true)]),
                uses([
                  proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8))))
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(2, 2, path(true, true, false)))), by(builtin(not, 1)))
        ])
      ),
      proof(
        goal(sdcoding(3, 3)), by(rule("superdense-coding.pl", clause(25))),
        bindings([binding("N", 3), binding("M", 3), binding("Proof", path(false, false, false))]),
        uses([
          proof(
            goal(sdc_path(3, 3, path(false, false, false))), by(rule("superdense-coding.pl", clause(23))),
            bindings([binding("N", 3), binding("M", 3), binding("X", false), binding("Y", false), binding("B", false)]),
            uses([
              proof(goal(r(false, false)), by(fact("superdense-coding.pl", clause(4)))),
              proof(
                goal(alice(3, false, false)), by(rule("superdense-coding.pl", clause(18))),
                bindings([binding("X", false), binding("Y", false)]),
                uses([
                  proof(
                    goal(kg(false, false)), by(rule("superdense-coding.pl", clause(13))),
                    bindings([binding("X", false), binding("Y", false), binding("Z", true)]),
                    uses([
                      proof(goal(g(false, true)), by(fact("superdense-coding.pl", clause(8)))),
                      proof(goal(k(true, false)), by(fact("superdense-coding.pl", clause(11))))
                    ])
                  )
                ])
              ),
              proof(
                goal(bob(false, false, 3)), by(rule("superdense-coding.pl", clause(22))),
                bindings([binding("X", false), binding("Y", false)]),
                uses([
                  proof(goal(identity(false, false)), by(fact("superdense-coding.pl", clause(6))))
                ])
              )
            ])
          ),
          proof(goal(not(duplicate_sdc_path(3, 3, path(false, false, false)))), by(builtin(not, 1)))
        ])
      )
    ])
  )
).

cancelsCrossTalk(protocol, true).
why(
  cancelsCrossTalk(protocol, true),
  proof(
    goal(cancelsCrossTalk(protocol, true)), by(rule("superdense-coding.pl", clause(28))),
    uses([
      proof(goal(not(sdcoding(0, 1))), by(builtin(not, 1))),
      proof(goal(not(sdcoding(1, 0))), by(builtin(not, 1))),
      proof(goal(not(sdcoding(2, 3))), by(builtin(not, 1))),
      proof(goal(not(sdcoding(3, 2))), by(builtin(not, 1)))
    ])
  )
).

