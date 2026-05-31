is(test, true).
why(
  is(test, true),
  proof(
    goal(is(test, true)),
    by(rule("deep-taxonomy-10000.pl", clause(8))),
    uses([
      proof(
        goal(once(a(ind, a2))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)),
            by(rule("deep-taxonomy-10000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n10000)),
                by(rule("deep-taxonomy-10000.pl", clause(19))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n9000)),
                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n8000)),
                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n7000)),
                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n6000)),
                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n5000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n4000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n3000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n2000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n1000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n0)),
                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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

arc(check1, "C1 OK - the starting classification n0 is present.").
why(
  arc(check1, "C1 OK - the starting classification n0 is present."),
  proof(
    goal(arc(check1, "C1 OK - the starting classification n0 is present.")),
    by(rule("deep-taxonomy-10000.pl", clause(30022))),
    uses([
      proof(
        goal(once(a(ind, n0))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n0)),
            by(fact("deep-taxonomy-10000.pl", clause(7)))
          )
        ])
      )
    ])
  )
).

arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.").
why(
  arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1."),
  proof(
    goal(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")),
    by(rule("deep-taxonomy-10000.pl", clause(30023))),
    uses([
      proof(
        goal(once(a(ind, n1))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n1)),
            by(rule("deep-taxonomy-10000.pl", clause(22))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n0)),
                by(fact("deep-taxonomy-10000.pl", clause(7)))
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, i1))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, i1)),
            by(rule("deep-taxonomy-10000.pl", clause(23))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n0)),
                by(fact("deep-taxonomy-10000.pl", clause(7)))
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, j1))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, j1)),
            by(rule("deep-taxonomy-10000.pl", clause(24))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n0)),
                by(fact("deep-taxonomy-10000.pl", clause(7)))
              )
            ])
          )
        ])
      )
    ])
  )
).

arc(check3, "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches.").
why(
  arc(check3, "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches."),
  proof(
    goal(arc(check3, "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches.")),
    by(rule("deep-taxonomy-10000.pl", clause(30024))),
    uses([
      proof(
        goal(once(a(ind, n5000))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n5000)),
            by(rule("deep-taxonomy-10000.pl", clause(14))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n4000)),
                by(rule("deep-taxonomy-10000.pl", clause(13))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n3000)),
                    by(rule("deep-taxonomy-10000.pl", clause(12))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n2000)),
                        by(rule("deep-taxonomy-10000.pl", clause(11))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n1000)),
                            by(rule("deep-taxonomy-10000.pl", clause(10))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n0)),
                                by(fact("deep-taxonomy-10000.pl", clause(7)))
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
      ),
      proof(
        goal(once(a(ind, i5000))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, i5000)),
            by(rule("deep-taxonomy-10000.pl", clause(15020))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n4999)),
                by(rule("deep-taxonomy-10000.pl", clause(20))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n4000)),
                    by(rule("deep-taxonomy-10000.pl", clause(13))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n3000)),
                        by(rule("deep-taxonomy-10000.pl", clause(12))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n2000)),
                            by(rule("deep-taxonomy-10000.pl", clause(11))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n1000)),
                                by(rule("deep-taxonomy-10000.pl", clause(10))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n0)),
                                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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
      ),
      proof(
        goal(once(a(ind, j5000))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, j5000)),
            by(rule("deep-taxonomy-10000.pl", clause(15021))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n4999)),
                by(rule("deep-taxonomy-10000.pl", clause(20))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n4000)),
                    by(rule("deep-taxonomy-10000.pl", clause(13))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n3000)),
                        by(rule("deep-taxonomy-10000.pl", clause(12))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n2000)),
                            by(rule("deep-taxonomy-10000.pl", clause(11))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n1000)),
                                by(rule("deep-taxonomy-10000.pl", clause(10))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n0)),
                                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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
    ])
  )
).

arc(check4, "C4 OK - the final taxonomy step from n9999 to n10000 was completed.").
why(
  arc(check4, "C4 OK - the final taxonomy step from n9999 to n10000 was completed."),
  proof(
    goal(arc(check4, "C4 OK - the final taxonomy step from n9999 to n10000 was completed.")),
    by(rule("deep-taxonomy-10000.pl", clause(30025))),
    uses([
      proof(
        goal(once(a(ind, n9999))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n9999)),
            by(rule("deep-taxonomy-10000.pl", clause(21))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n9000)),
                by(rule("deep-taxonomy-10000.pl", clause(18))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n8000)),
                    by(rule("deep-taxonomy-10000.pl", clause(17))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n7000)),
                        by(rule("deep-taxonomy-10000.pl", clause(16))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n6000)),
                            by(rule("deep-taxonomy-10000.pl", clause(15))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n5000)),
                                by(rule("deep-taxonomy-10000.pl", clause(14))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n4000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(13))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n3000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(12))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n2000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(11))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n1000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n0)),
                                                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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
                    ])
                  )
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, n10000))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n10000)),
            by(rule("deep-taxonomy-10000.pl", clause(19))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n9000)),
                by(rule("deep-taxonomy-10000.pl", clause(18))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n8000)),
                    by(rule("deep-taxonomy-10000.pl", clause(17))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n7000)),
                        by(rule("deep-taxonomy-10000.pl", clause(16))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n6000)),
                            by(rule("deep-taxonomy-10000.pl", clause(15))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n5000)),
                                by(rule("deep-taxonomy-10000.pl", clause(14))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n4000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(13))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n3000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(12))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n2000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(11))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n1000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n0)),
                                                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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

arc(check5, "C5 OK - once n10000 is reached, the terminal class a2 is derived.").
why(
  arc(check5, "C5 OK - once n10000 is reached, the terminal class a2 is derived."),
  proof(
    goal(arc(check5, "C5 OK - once n10000 is reached, the terminal class a2 is derived.")),
    by(rule("deep-taxonomy-10000.pl", clause(30026))),
    uses([
      proof(
        goal(once(a(ind, n10000))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, n10000)),
            by(rule("deep-taxonomy-10000.pl", clause(19))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n9000)),
                by(rule("deep-taxonomy-10000.pl", clause(18))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n8000)),
                    by(rule("deep-taxonomy-10000.pl", clause(17))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n7000)),
                        by(rule("deep-taxonomy-10000.pl", clause(16))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n6000)),
                            by(rule("deep-taxonomy-10000.pl", clause(15))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n5000)),
                                by(rule("deep-taxonomy-10000.pl", clause(14))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n4000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(13))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n3000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(12))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n2000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(11))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n1000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n0)),
                                                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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
                    ])
                  )
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(a(ind, a2))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)),
            by(rule("deep-taxonomy-10000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n10000)),
                by(rule("deep-taxonomy-10000.pl", clause(19))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n9000)),
                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n8000)),
                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n7000)),
                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n6000)),
                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n5000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n4000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n3000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n2000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n1000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n0)),
                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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

arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.").
why(
  arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present."),
  proof(
    goal(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.")),
    by(rule("deep-taxonomy-10000.pl", clause(30027))),
    uses([
      proof(
        goal(once(a(ind, a2))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)),
            by(rule("deep-taxonomy-10000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n10000)),
                by(rule("deep-taxonomy-10000.pl", clause(19))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n9000)),
                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n8000)),
                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n7000)),
                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n6000)),
                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n5000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n4000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n3000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n2000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n1000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n0)),
                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
        goal(once(is(test, true))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)),
            by(rule("deep-taxonomy-10000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)),
                    by(rule("deep-taxonomy-10000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n10000)),
                        by(rule("deep-taxonomy-10000.pl", clause(19))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n9000)),
                            by(rule("deep-taxonomy-10000.pl", clause(18))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n8000)),
                                by(rule("deep-taxonomy-10000.pl", clause(17))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n7000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(16))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n6000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(15))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n5000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(14))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n4000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n3000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n2000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n1000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n0)),
                                                                by(fact("deep-taxonomy-10000.pl", clause(7)))
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

answer(report, "The test succeeds: starting from one individual classified as n0, the rules eventually classify it as n10000 and then as a2.").
why(
  answer(report, "The test succeeds: starting from one individual classified as n0, the rules eventually classify it as n10000 and then as a2."),
  proof(
    goal(answer(report, "The test succeeds: starting from one individual classified as n0, the rules eventually classify it as n10000 and then as a2.")),
    by(rule("deep-taxonomy-10000.pl", clause(30028))),
    uses([
      proof(
        goal(once(is(test, true))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)),
            by(rule("deep-taxonomy-10000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)),
                    by(rule("deep-taxonomy-10000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n10000)),
                        by(rule("deep-taxonomy-10000.pl", clause(19))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n9000)),
                            by(rule("deep-taxonomy-10000.pl", clause(18))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n8000)),
                                by(rule("deep-taxonomy-10000.pl", clause(17))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n7000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(16))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n6000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(15))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n5000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(14))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n4000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n3000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n2000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n1000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n0)),
                                                                by(fact("deep-taxonomy-10000.pl", clause(7)))
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

reason(report, "The adjacent rules mirror the Eyeling N3 deep-taxonomy-10000 chain. Redundant checkpoint rules are included only as proof accelerators: each shortcut is entailed by the adjacent chain, and once/1 prevents backtracking into the long adjacent-only proof after a check has succeeded.").
why(
  reason(report, "The adjacent rules mirror the Eyeling N3 deep-taxonomy-10000 chain. Redundant checkpoint rules are included only as proof accelerators: each shortcut is entailed by the adjacent chain, and once/1 prevents backtracking into the long adjacent-only proof after a check has succeeded."),
  proof(
    goal(reason(report, "The adjacent rules mirror the Eyeling N3 deep-taxonomy-10000 chain. Redundant checkpoint rules are included only as proof accelerators: each shortcut is entailed by the adjacent chain, and once/1 prevents backtracking into the long adjacent-only proof after a check has succeeded.")),
    by(rule("deep-taxonomy-10000.pl", clause(30029))),
    uses([
      proof(
        goal(once(a(ind, a2))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(a(ind, a2)),
            by(rule("deep-taxonomy-10000.pl", clause(9))),
            bindings([binding("X", ind)]),
            uses([
              proof(
                goal(a(ind, n10000)),
                by(rule("deep-taxonomy-10000.pl", clause(19))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n9000)),
                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n8000)),
                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n7000)),
                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n6000)),
                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n5000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n4000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n3000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n2000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n1000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n0)),
                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
        goal(once(is(test, true))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)),
            by(rule("deep-taxonomy-10000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)),
                    by(rule("deep-taxonomy-10000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n10000)),
                        by(rule("deep-taxonomy-10000.pl", clause(19))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n9000)),
                            by(rule("deep-taxonomy-10000.pl", clause(18))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n8000)),
                                by(rule("deep-taxonomy-10000.pl", clause(17))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n7000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(16))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n6000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(15))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n5000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(14))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n4000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n3000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n2000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n1000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n0)),
                                                                by(fact("deep-taxonomy-10000.pl", clause(7)))
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

checkPassed(report, check1).
why(
  checkPassed(report, check1),
  proof(
    goal(checkPassed(report, check1)),
    by(rule("deep-taxonomy-10000.pl", clause(30030))),
    bindings([binding("Check", check1), binding("_Message", "C1 OK - the starting classification n0 is present.")]),
    uses([
      proof(
        goal(arc(check1, "C1 OK - the starting classification n0 is present.")),
        by(rule("deep-taxonomy-10000.pl", clause(30022))),
        uses([
          proof(
            goal(once(a(ind, n0))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n0)),
                by(fact("deep-taxonomy-10000.pl", clause(7)))
              )
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
    goal(checkPassed(report, check2)),
    by(rule("deep-taxonomy-10000.pl", clause(30030))),
    bindings([binding("Check", check2), binding("_Message", "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")]),
    uses([
      proof(
        goal(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")),
        by(rule("deep-taxonomy-10000.pl", clause(30023))),
        uses([
          proof(
            goal(once(a(ind, n1))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n1)),
                by(rule("deep-taxonomy-10000.pl", clause(22))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n0)),
                    by(fact("deep-taxonomy-10000.pl", clause(7)))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, i1))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, i1)),
                by(rule("deep-taxonomy-10000.pl", clause(23))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n0)),
                    by(fact("deep-taxonomy-10000.pl", clause(7)))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, j1))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, j1)),
                by(rule("deep-taxonomy-10000.pl", clause(24))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n0)),
                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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

checkPassed(report, check3).
why(
  checkPassed(report, check3),
  proof(
    goal(checkPassed(report, check3)),
    by(rule("deep-taxonomy-10000.pl", clause(30030))),
    bindings([binding("Check", check3), binding("_Message", "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches.")]),
    uses([
      proof(
        goal(arc(check3, "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches.")),
        by(rule("deep-taxonomy-10000.pl", clause(30024))),
        uses([
          proof(
            goal(once(a(ind, n5000))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n5000)),
                by(rule("deep-taxonomy-10000.pl", clause(14))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n4000)),
                    by(rule("deep-taxonomy-10000.pl", clause(13))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n3000)),
                        by(rule("deep-taxonomy-10000.pl", clause(12))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n2000)),
                            by(rule("deep-taxonomy-10000.pl", clause(11))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n1000)),
                                by(rule("deep-taxonomy-10000.pl", clause(10))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n0)),
                                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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
          ),
          proof(
            goal(once(a(ind, i5000))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, i5000)),
                by(rule("deep-taxonomy-10000.pl", clause(15020))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n4999)),
                    by(rule("deep-taxonomy-10000.pl", clause(20))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n4000)),
                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n3000)),
                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n2000)),
                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n1000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n0)),
                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
          ),
          proof(
            goal(once(a(ind, j5000))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, j5000)),
                by(rule("deep-taxonomy-10000.pl", clause(15021))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n4999)),
                    by(rule("deep-taxonomy-10000.pl", clause(20))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n4000)),
                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n3000)),
                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n2000)),
                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n1000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n0)),
                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
        ])
      )
    ])
  )
).

checkPassed(report, check4).
why(
  checkPassed(report, check4),
  proof(
    goal(checkPassed(report, check4)),
    by(rule("deep-taxonomy-10000.pl", clause(30030))),
    bindings([binding("Check", check4), binding("_Message", "C4 OK - the final taxonomy step from n9999 to n10000 was completed.")]),
    uses([
      proof(
        goal(arc(check4, "C4 OK - the final taxonomy step from n9999 to n10000 was completed.")),
        by(rule("deep-taxonomy-10000.pl", clause(30025))),
        uses([
          proof(
            goal(once(a(ind, n9999))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n9999)),
                by(rule("deep-taxonomy-10000.pl", clause(21))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n9000)),
                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n8000)),
                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n7000)),
                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n6000)),
                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n5000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n4000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n3000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n2000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n1000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n0)),
                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
                        ])
                      )
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, n10000))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n10000)),
                by(rule("deep-taxonomy-10000.pl", clause(19))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n9000)),
                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n8000)),
                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n7000)),
                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n6000)),
                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n5000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n4000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n3000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n2000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n1000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n0)),
                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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

checkPassed(report, check5).
why(
  checkPassed(report, check5),
  proof(
    goal(checkPassed(report, check5)),
    by(rule("deep-taxonomy-10000.pl", clause(30030))),
    bindings([binding("Check", check5), binding("_Message", "C5 OK - once n10000 is reached, the terminal class a2 is derived.")]),
    uses([
      proof(
        goal(arc(check5, "C5 OK - once n10000 is reached, the terminal class a2 is derived.")),
        by(rule("deep-taxonomy-10000.pl", clause(30026))),
        uses([
          proof(
            goal(once(a(ind, n10000))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, n10000)),
                by(rule("deep-taxonomy-10000.pl", clause(19))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n9000)),
                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n8000)),
                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n7000)),
                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n6000)),
                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n5000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n4000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n3000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n2000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n1000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n0)),
                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
                        ])
                      )
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(once(a(ind, a2))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, a2)),
                by(rule("deep-taxonomy-10000.pl", clause(9))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n10000)),
                    by(rule("deep-taxonomy-10000.pl", clause(19))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n9000)),
                        by(rule("deep-taxonomy-10000.pl", clause(18))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n8000)),
                            by(rule("deep-taxonomy-10000.pl", clause(17))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n7000)),
                                by(rule("deep-taxonomy-10000.pl", clause(16))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n6000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(15))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n5000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(14))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n4000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(13))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n3000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n2000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n1000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n0)),
                                                            by(fact("deep-taxonomy-10000.pl", clause(7)))
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

checkPassed(report, check6).
why(
  checkPassed(report, check6),
  proof(
    goal(checkPassed(report, check6)),
    by(rule("deep-taxonomy-10000.pl", clause(30030))),
    bindings([binding("Check", check6), binding("_Message", "C6 OK - the success flag is raised only after the terminal class a2 is present.")]),
    uses([
      proof(
        goal(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.")),
        by(rule("deep-taxonomy-10000.pl", clause(30027))),
        uses([
          proof(
            goal(once(a(ind, a2))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(a(ind, a2)),
                by(rule("deep-taxonomy-10000.pl", clause(9))),
                bindings([binding("X", ind)]),
                uses([
                  proof(
                    goal(a(ind, n10000)),
                    by(rule("deep-taxonomy-10000.pl", clause(19))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n9000)),
                        by(rule("deep-taxonomy-10000.pl", clause(18))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n8000)),
                            by(rule("deep-taxonomy-10000.pl", clause(17))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n7000)),
                                by(rule("deep-taxonomy-10000.pl", clause(16))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n6000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(15))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n5000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(14))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n4000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(13))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n3000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n2000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n1000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n0)),
                                                            by(fact("deep-taxonomy-10000.pl", clause(7)))
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
            goal(once(is(test, true))),
            by(builtin(once, 1)),
            uses([
              proof(
                goal(is(test, true)),
                by(rule("deep-taxonomy-10000.pl", clause(8))),
                uses([
                  proof(
                    goal(once(a(ind, a2))),
                    by(builtin(once, 1)),
                    uses([
                      proof(
                        goal(a(ind, a2)),
                        by(rule("deep-taxonomy-10000.pl", clause(9))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n10000)),
                            by(rule("deep-taxonomy-10000.pl", clause(19))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n9000)),
                                by(rule("deep-taxonomy-10000.pl", clause(18))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n8000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(17))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n7000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(16))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n6000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(15))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n5000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(14))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n4000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n3000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n2000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n1000)),
                                                                by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                                bindings([binding("X", ind)]),
                                                                uses([
                                                                  proof(
                                                                    goal(a(ind, n0)),
                                                                    by(fact("deep-taxonomy-10000.pl", clause(7)))
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
    ])
  )
).

result(report, success).
why(
  result(report, success),
  proof(
    goal(result(report, success)),
    by(rule("deep-taxonomy-10000.pl", clause(30031))),
    bindings([binding("_C1", "C1 OK - the starting classification n0 is present."), binding("_C2", "C2 OK - the first expansion produced n1 together with side labels i1 and j1."), binding("_C3", "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches."), binding("_C4", "C4 OK - the final taxonomy step from n9999 to n10000 was completed."), binding("_C5", "C5 OK - once n10000 is reached, the terminal class a2 is derived."), binding("_C6", "C6 OK - the success flag is raised only after the terminal class a2 is present.")]),
    uses([
      proof(
        goal(once(is(test, true))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(is(test, true)),
            by(rule("deep-taxonomy-10000.pl", clause(8))),
            uses([
              proof(
                goal(once(a(ind, a2))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)),
                    by(rule("deep-taxonomy-10000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n10000)),
                        by(rule("deep-taxonomy-10000.pl", clause(19))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n9000)),
                            by(rule("deep-taxonomy-10000.pl", clause(18))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n8000)),
                                by(rule("deep-taxonomy-10000.pl", clause(17))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n7000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(16))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n6000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(15))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n5000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(14))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n4000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n3000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n2000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n1000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n0)),
                                                                by(fact("deep-taxonomy-10000.pl", clause(7)))
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
      ),
      proof(
        goal(once(arc(check1, "C1 OK - the starting classification n0 is present."))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check1, "C1 OK - the starting classification n0 is present.")),
            by(rule("deep-taxonomy-10000.pl", clause(30022))),
            uses([
              proof(
                goal(once(a(ind, n0))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n0)),
                    by(fact("deep-taxonomy-10000.pl", clause(7)))
                  )
                ])
              )
            ])
          )
        ])
      ),
      proof(
        goal(once(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1."))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check2, "C2 OK - the first expansion produced n1 together with side labels i1 and j1.")),
            by(rule("deep-taxonomy-10000.pl", clause(30023))),
            uses([
              proof(
                goal(once(a(ind, n1))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n1)),
                    by(rule("deep-taxonomy-10000.pl", clause(22))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n0)),
                        by(fact("deep-taxonomy-10000.pl", clause(7)))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, i1))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, i1)),
                    by(rule("deep-taxonomy-10000.pl", clause(23))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n0)),
                        by(fact("deep-taxonomy-10000.pl", clause(7)))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, j1))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, j1)),
                    by(rule("deep-taxonomy-10000.pl", clause(24))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n0)),
                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
        goal(once(arc(check3, "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches."))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check3, "C3 OK - the chain reaches the midpoint n5000 and still carries both side-label branches.")),
            by(rule("deep-taxonomy-10000.pl", clause(30024))),
            uses([
              proof(
                goal(once(a(ind, n5000))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n5000)),
                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n4000)),
                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n3000)),
                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n2000)),
                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n1000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n0)),
                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
              ),
              proof(
                goal(once(a(ind, i5000))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, i5000)),
                    by(rule("deep-taxonomy-10000.pl", clause(15020))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n4999)),
                        by(rule("deep-taxonomy-10000.pl", clause(20))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n4000)),
                            by(rule("deep-taxonomy-10000.pl", clause(13))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n3000)),
                                by(rule("deep-taxonomy-10000.pl", clause(12))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n2000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(11))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n1000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(10))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n0)),
                                            by(fact("deep-taxonomy-10000.pl", clause(7)))
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
              ),
              proof(
                goal(once(a(ind, j5000))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, j5000)),
                    by(rule("deep-taxonomy-10000.pl", clause(15021))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n4999)),
                        by(rule("deep-taxonomy-10000.pl", clause(20))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n4000)),
                            by(rule("deep-taxonomy-10000.pl", clause(13))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n3000)),
                                by(rule("deep-taxonomy-10000.pl", clause(12))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n2000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(11))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n1000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(10))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n0)),
                                            by(fact("deep-taxonomy-10000.pl", clause(7)))
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
            ])
          )
        ])
      ),
      proof(
        goal(once(arc(check4, "C4 OK - the final taxonomy step from n9999 to n10000 was completed."))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check4, "C4 OK - the final taxonomy step from n9999 to n10000 was completed.")),
            by(rule("deep-taxonomy-10000.pl", clause(30025))),
            uses([
              proof(
                goal(once(a(ind, n9999))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n9999)),
                    by(rule("deep-taxonomy-10000.pl", clause(21))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n9000)),
                        by(rule("deep-taxonomy-10000.pl", clause(18))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n8000)),
                            by(rule("deep-taxonomy-10000.pl", clause(17))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n7000)),
                                by(rule("deep-taxonomy-10000.pl", clause(16))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n6000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(15))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n5000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(14))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n4000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(13))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n3000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n2000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n1000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n0)),
                                                            by(fact("deep-taxonomy-10000.pl", clause(7)))
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
                            ])
                          )
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, n10000))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n10000)),
                    by(rule("deep-taxonomy-10000.pl", clause(19))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n9000)),
                        by(rule("deep-taxonomy-10000.pl", clause(18))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n8000)),
                            by(rule("deep-taxonomy-10000.pl", clause(17))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n7000)),
                                by(rule("deep-taxonomy-10000.pl", clause(16))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n6000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(15))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n5000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(14))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n4000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(13))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n3000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n2000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n1000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n0)),
                                                            by(fact("deep-taxonomy-10000.pl", clause(7)))
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
        goal(once(arc(check5, "C5 OK - once n10000 is reached, the terminal class a2 is derived."))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check5, "C5 OK - once n10000 is reached, the terminal class a2 is derived.")),
            by(rule("deep-taxonomy-10000.pl", clause(30026))),
            uses([
              proof(
                goal(once(a(ind, n10000))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, n10000)),
                    by(rule("deep-taxonomy-10000.pl", clause(19))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n9000)),
                        by(rule("deep-taxonomy-10000.pl", clause(18))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n8000)),
                            by(rule("deep-taxonomy-10000.pl", clause(17))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n7000)),
                                by(rule("deep-taxonomy-10000.pl", clause(16))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n6000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(15))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n5000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(14))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n4000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(13))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n3000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n2000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n1000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n0)),
                                                            by(fact("deep-taxonomy-10000.pl", clause(7)))
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
                            ])
                          )
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(once(a(ind, a2))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)),
                    by(rule("deep-taxonomy-10000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n10000)),
                        by(rule("deep-taxonomy-10000.pl", clause(19))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n9000)),
                            by(rule("deep-taxonomy-10000.pl", clause(18))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n8000)),
                                by(rule("deep-taxonomy-10000.pl", clause(17))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n7000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(16))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n6000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(15))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n5000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(14))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n4000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n3000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n2000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n1000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n0)),
                                                                by(fact("deep-taxonomy-10000.pl", clause(7)))
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
      ),
      proof(
        goal(once(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present."))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(arc(check6, "C6 OK - the success flag is raised only after the terminal class a2 is present.")),
            by(rule("deep-taxonomy-10000.pl", clause(30027))),
            uses([
              proof(
                goal(once(a(ind, a2))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(a(ind, a2)),
                    by(rule("deep-taxonomy-10000.pl", clause(9))),
                    bindings([binding("X", ind)]),
                    uses([
                      proof(
                        goal(a(ind, n10000)),
                        by(rule("deep-taxonomy-10000.pl", clause(19))),
                        bindings([binding("X", ind)]),
                        uses([
                          proof(
                            goal(a(ind, n9000)),
                            by(rule("deep-taxonomy-10000.pl", clause(18))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n8000)),
                                by(rule("deep-taxonomy-10000.pl", clause(17))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n7000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(16))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n6000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(15))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n5000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(14))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n4000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n3000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n2000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n1000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n0)),
                                                                by(fact("deep-taxonomy-10000.pl", clause(7)))
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
                goal(once(is(test, true))),
                by(builtin(once, 1)),
                uses([
                  proof(
                    goal(is(test, true)),
                    by(rule("deep-taxonomy-10000.pl", clause(8))),
                    uses([
                      proof(
                        goal(once(a(ind, a2))),
                        by(builtin(once, 1)),
                        uses([
                          proof(
                            goal(a(ind, a2)),
                            by(rule("deep-taxonomy-10000.pl", clause(9))),
                            bindings([binding("X", ind)]),
                            uses([
                              proof(
                                goal(a(ind, n10000)),
                                by(rule("deep-taxonomy-10000.pl", clause(19))),
                                bindings([binding("X", ind)]),
                                uses([
                                  proof(
                                    goal(a(ind, n9000)),
                                    by(rule("deep-taxonomy-10000.pl", clause(18))),
                                    bindings([binding("X", ind)]),
                                    uses([
                                      proof(
                                        goal(a(ind, n8000)),
                                        by(rule("deep-taxonomy-10000.pl", clause(17))),
                                        bindings([binding("X", ind)]),
                                        uses([
                                          proof(
                                            goal(a(ind, n7000)),
                                            by(rule("deep-taxonomy-10000.pl", clause(16))),
                                            bindings([binding("X", ind)]),
                                            uses([
                                              proof(
                                                goal(a(ind, n6000)),
                                                by(rule("deep-taxonomy-10000.pl", clause(15))),
                                                bindings([binding("X", ind)]),
                                                uses([
                                                  proof(
                                                    goal(a(ind, n5000)),
                                                    by(rule("deep-taxonomy-10000.pl", clause(14))),
                                                    bindings([binding("X", ind)]),
                                                    uses([
                                                      proof(
                                                        goal(a(ind, n4000)),
                                                        by(rule("deep-taxonomy-10000.pl", clause(13))),
                                                        bindings([binding("X", ind)]),
                                                        uses([
                                                          proof(
                                                            goal(a(ind, n3000)),
                                                            by(rule("deep-taxonomy-10000.pl", clause(12))),
                                                            bindings([binding("X", ind)]),
                                                            uses([
                                                              proof(
                                                                goal(a(ind, n2000)),
                                                                by(rule("deep-taxonomy-10000.pl", clause(11))),
                                                                bindings([binding("X", ind)]),
                                                                uses([
                                                                  proof(
                                                                    goal(a(ind, n1000)),
                                                                    by(rule("deep-taxonomy-10000.pl", clause(10))),
                                                                    bindings([binding("X", ind)]),
                                                                    uses([
                                                                      proof(
                                                                        goal(a(ind, n0)),
                                                                        by(fact("deep-taxonomy-10000.pl", clause(7)))
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
        ])
      )
    ])
  )
).

