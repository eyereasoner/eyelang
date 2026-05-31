is(test, true).
why(
  is(test, true),
  proof(
    goal(is(test, true)), by(rule("deep-taxonomy-1000.pl", clause(8))),
    uses([
      proof(
        goal(once(a(ind, a2))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

arc(check1, "C1 OK - the starting classification n0 is present.").
why(
  arc(check1, "C1 OK - the starting classification n0 is present."),
  proof(
    goal(arc(check1, "C1 OK - the starting classification n0 is present.")), by(rule("deep-taxonomy-1000.pl", clause(3013))),
    uses([
      proof(
        goal(once(a(ind, n0))), by(builtin(once, 1)),
        uses([
          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
        ])
      )
    ])
  )
).

arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.").
why(
  arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1."),
  proof(
    goal(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")), by(rule("deep-taxonomy-1000.pl", clause(3014))),
    uses([
      proof(
        goal(once(a(ind, n1))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n1)), by(rule("deep-taxonomy-1000.pl", clause(13))),
            bindings([binding("X", ind)]),
            uses([
              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, i1))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, i1)), by(rule("deep-taxonomy-1000.pl", clause(14))),
            bindings([binding("X", ind)]),
            uses([
              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, j1))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, j1)), by(rule("deep-taxonomy-1000.pl", clause(15))),
            bindings([binding("X", ind)]),
            uses([
              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
            ])
          )
        ])
      )
    ])
  )
).

arc(check3, "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches.").
why(
  arc(check3, "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches."),
  proof(
    goal(arc(check3, "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches.")), by(rule("deep-taxonomy-1000.pl", clause(3015))),
    uses([
      proof(
        goal(once(a(ind, n500))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n500)), by(rule("deep-taxonomy-1000.pl", clause(1510))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, i500))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, i500)), by(rule("deep-taxonomy-1000.pl", clause(1511))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, j500))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, j500)), by(rule("deep-taxonomy-1000.pl", clause(1512))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

arc(check4, "C4 OK - the final taxonomy step from n999 to n1000 was completed.").
why(
  arc(check4, "C4 OK - the final taxonomy step from n999 to n1000 was completed."),
  proof(
    goal(arc(check4, "C4 OK - the final taxonomy step from n999 to n1000 was completed.")), by(rule("deep-taxonomy-1000.pl", clause(3016))),
    uses([
      proof(
        goal(once(a(ind, n999))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n999)), by(rule("deep-taxonomy-1000.pl", clause(12))),
            bindings([binding("X", ind)]),
            uses([
              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, n1000))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
            bindings([binding("X", ind)]),
            uses([
              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
            ])
          )
        ])
      )
    ])
  )
).

arc(check5, "C5 OK - once n1000 is reached, the terminal class a2 is derived.").
why(
  arc(check5, "C5 OK - once n1000 is reached, the terminal class a2 is derived."),
  proof(
    goal(arc(check5, "C5 OK - once n1000 is reached, the terminal class a2 is derived.")), by(rule("deep-taxonomy-1000.pl", clause(3017))),
    uses([
      proof(
        goal(once(a(ind, n1000))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
            bindings([binding("X", ind)]),
            uses([
              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, a2))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.").
why(
  arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present."),
  proof(
    goal(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.")), by(rule("deep-taxonomy-1000.pl", clause(3018))),
    uses([
      proof(
        goal(once(a(ind, a2))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(is(test, true))), by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)), by(rule("deep-taxonomy-1000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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

answer(report, "The test succeeds: starting from one individual classified as n0, the rules eventually classify it as n1000 and then as a2.").
why(
  answer(report, "The test succeeds: starting from one individual classified as n0, the rules eventually classify it as n1000 and then as a2."),
  proof(
    goal(answer(report, "The test succeeds: starting from one individual classified as n0, the rules eventually classify it as n1000 and then as a2.")), by(rule("deep-taxonomy-1000.pl", clause(3019))),
    uses([
      proof(
        goal(once(is(test, true))), by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)), by(rule("deep-taxonomy-1000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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

reason(report, "The adjacent rules mirror the Eyeling N3 deep-taxonomy-1000 chain. Redundant checkpoint rules are included only as proof accelerators: each shortcut is entailed by the adjacent chain, and once/1 prevents backtracking into the long adjacent-only proof after a check has succeeded.").
why(
  reason(report, "The adjacent rules mirror the Eyeling N3 deep-taxonomy-1000 chain. Redundant checkpoint rules are included only as proof accelerators: each shortcut is entailed by the adjacent chain, and once/1 prevents backtracking into the long adjacent-only proof after a check has succeeded."),
  proof(
    goal(reason(report, "The adjacent rules mirror the Eyeling N3 deep-taxonomy-1000 chain. Redundant checkpoint rules are included only as proof accelerators: each shortcut is entailed by the adjacent chain, and once/1 prevents backtracking into the long adjacent-only proof after a check has succeeded.")), by(rule("deep-taxonomy-1000.pl", clause(3020))),
    uses([
      proof(
        goal(once(a(ind, a2))), by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(is(test, true))), by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)), by(rule("deep-taxonomy-1000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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

checkPassed(report, check1).
why(
  checkPassed(report, check1),
  proof(
    goal(checkPassed(report, check1)), by(rule("deep-taxonomy-1000.pl", clause(3021))),
    bindings([binding("Check", check1), binding("_Message", "C1 OK - the starting classification n0 is present.")]),
    uses([
      proof(
        goal(arc(check1, "C1 OK - the starting classification n0 is present.")), by(rule("deep-taxonomy-1000.pl", clause(3013))),
        uses([
          proof(
            goal(once(a(ind, n0))), by(builtin(once, 1)),
            uses([
              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
            ])
          )
        ])
      )
    ])
  )
).

checkPassed(report, check2).
why(
  checkPassed(report, check2),
  proof(
    goal(checkPassed(report, check2)), by(rule("deep-taxonomy-1000.pl", clause(3021))),
    bindings([binding("Check", check2), binding("_Message", "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")]),
    uses([
      proof(
        goal(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")), by(rule("deep-taxonomy-1000.pl", clause(3014))),
        uses([
          proof(
            goal(once(a(ind, n1))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n1)), by(rule("deep-taxonomy-1000.pl", clause(13))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, i1))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, i1)), by(rule("deep-taxonomy-1000.pl", clause(14))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, j1))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, j1)), by(rule("deep-taxonomy-1000.pl", clause(15))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

checkPassed(report, check3).
why(
  checkPassed(report, check3),
  proof(
    goal(checkPassed(report, check3)), by(rule("deep-taxonomy-1000.pl", clause(3021))),
    bindings([binding("Check", check3), binding("_Message", "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches.")]),
    uses([
      proof(
        goal(arc(check3, "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches.")), by(rule("deep-taxonomy-1000.pl", clause(3015))),
        uses([
          proof(
            goal(once(a(ind, n500))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n500)), by(rule("deep-taxonomy-1000.pl", clause(1510))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, i500))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, i500)), by(rule("deep-taxonomy-1000.pl", clause(1511))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, j500))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, j500)), by(rule("deep-taxonomy-1000.pl", clause(1512))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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

checkPassed(report, check4).
why(
  checkPassed(report, check4),
  proof(
    goal(checkPassed(report, check4)), by(rule("deep-taxonomy-1000.pl", clause(3021))),
    bindings([binding("Check", check4), binding("_Message", "C4 OK - the final taxonomy step from n999 to n1000 was completed.")]),
    uses([
      proof(
        goal(arc(check4, "C4 OK - the final taxonomy step from n999 to n1000 was completed.")), by(rule("deep-taxonomy-1000.pl", clause(3016))),
        uses([
          proof(
            goal(once(a(ind, n999))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n999)), by(rule("deep-taxonomy-1000.pl", clause(12))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, n1000))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

checkPassed(report, check5).
why(
  checkPassed(report, check5),
  proof(
    goal(checkPassed(report, check5)), by(rule("deep-taxonomy-1000.pl", clause(3021))),
    bindings([binding("Check", check5), binding("_Message", "C5 OK - once n1000 is reached, the terminal class a2 is derived.")]),
    uses([
      proof(
        goal(arc(check5, "C5 OK - once n1000 is reached, the terminal class a2 is derived.")), by(rule("deep-taxonomy-1000.pl", clause(3017))),
        uses([
          proof(
            goal(once(a(ind, n1000))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                bindings([binding("X", ind)]),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, a2))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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

checkPassed(report, check6).
why(
  checkPassed(report, check6),
  proof(
    goal(checkPassed(report, check6)), by(rule("deep-taxonomy-1000.pl", clause(3021))),
    bindings([binding("Check", check6), binding("_Message", "C6 OK - the success flag is raised only after the terminal class a2 is present.")]),
    uses([
      proof(
        goal(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.")), by(rule("deep-taxonomy-1000.pl", clause(3018))),
        uses([
          proof(
            goal(once(a(ind, a2))), by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(once(is(test, true))), by(builtin(once, 1)),
            uses([
              proof(
                goal(is(test, true)), by(rule("deep-taxonomy-1000.pl", clause(8))),
                uses([
                  proof(
                    goal(once(a(ind, a2))), by(builtin(once, 1)),
                    uses([
                      proof(
                        goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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

result(report, success).
why(
  result(report, success),
  proof(
    goal(result(report, success)), by(rule("deep-taxonomy-1000.pl", clause(3022))),
    bindings([binding("_C1", "C1 OK - the starting classification n0 is present."), binding("_C2", "C2 OK - the first expansion produced n1 together with side labels i1 and j1."), binding("_C3", "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches."), binding("_C4", "C4 OK - the final taxonomy step from n999 to n1000 was completed."), binding("_C5", "C5 OK - once n1000 is reached, the terminal class a2 is derived."), binding("_C6", "C6 OK - the success flag is raised only after the terminal class a2 is present.")]),
    uses([
      proof(
        goal(once(is(test, true))), by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)), by(rule("deep-taxonomy-1000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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
        goal(once(arc(check1, "C1 OK - the starting classification n0 is present."))), by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check1, "C1 OK - the starting classification n0 is present.")), by(rule("deep-taxonomy-1000.pl", clause(3013))),
            uses([
              proof(
                goal(once(a(ind, n0))), by(builtin(once, 1)),
                uses([
                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1."))), by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")), by(rule("deep-taxonomy-1000.pl", clause(3014))),
            uses([
              proof(
                goal(once(a(ind, n1))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n1)), by(rule("deep-taxonomy-1000.pl", clause(13))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, i1))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, i1)), by(rule("deep-taxonomy-1000.pl", clause(14))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, j1))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, j1)), by(rule("deep-taxonomy-1000.pl", clause(15))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(arc(check3, "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches."))), by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check3, "C3 OK - the chain reaches the midpoint n500 and still carries both side-label branches.")), by(rule("deep-taxonomy-1000.pl", clause(3015))),
            uses([
              proof(
                goal(once(a(ind, n500))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n500)), by(rule("deep-taxonomy-1000.pl", clause(1510))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, i500))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, i500)), by(rule("deep-taxonomy-1000.pl", clause(1511))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, j500))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, j500)), by(rule("deep-taxonomy-1000.pl", clause(1512))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n499)), by(rule("deep-taxonomy-1000.pl", clause(11))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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
        goal(once(arc(check4, "C4 OK - the final taxonomy step from n999 to n1000 was completed."))), by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check4, "C4 OK - the final taxonomy step from n999 to n1000 was completed.")), by(rule("deep-taxonomy-1000.pl", clause(3016))),
            uses([
              proof(
                goal(once(a(ind, n999))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n999)), by(rule("deep-taxonomy-1000.pl", clause(12))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, n1000))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(arc(check5, "C5 OK - once n1000 is reached, the terminal class a2 is derived."))), by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check5, "C5 OK - once n1000 is reached, the terminal class a2 is derived.")), by(rule("deep-taxonomy-1000.pl", clause(3017))),
            uses([
              proof(
                goal(once(a(ind, n1000))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, a2))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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
        goal(once(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present."))), by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.")), by(rule("deep-taxonomy-1000.pl", clause(3018))),
            uses([
              proof(
                goal(once(a(ind, a2))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(once(is(test, true))), by(builtin(once, 1)),
                uses([
                  proof(
                    goal(is(test, true)), by(rule("deep-taxonomy-1000.pl", clause(8))),
                    uses([
                      proof(
                        goal(once(a(ind, a2))), by(builtin(once, 1)),
                        uses([
                          proof(
                            goal(a(ind, a2)), by(rule("deep-taxonomy-1000.pl", clause(9))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n1000)), by(rule("deep-taxonomy-1000.pl", clause(10))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(goal(a(ind, n0)), by(fact("deep-taxonomy-1000.pl", clause(7))))
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
    ])
  )
).

