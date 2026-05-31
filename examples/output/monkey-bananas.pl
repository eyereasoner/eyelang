plan(monkeyBananas, [go(loc3), push(loc1), climb_on, grab]).
why(
  plan(monkeyBananas, [go(loc3), push(loc1), climb_on, grab]),
  proof(
    goal(plan(monkeyBananas, [go(loc3), push(loc1), climb_on, grab])), by(rule("monkey-bananas.pl", clause(17))),
    bindings([binding("Moves", [go(loc3), push(loc1), climb_on, grab])]),
    uses([
      proof(
        goal(plan([go(loc3), push(loc1), climb_on, grab])), by(rule("monkey-bananas.pl", clause(4))),
        bindings([binding("Moves", [go(loc3), push(loc1), climb_on, grab]), binding("I", [loc1, loc2, loc3, n, n]), binding("G", [loc1, loc1, loc1, y, y])]),
        uses([
          proof(
            goal(candidate_plan([go(loc3), push(loc1), climb_on, grab])), by(fact("monkey-bananas.pl", clause(6))),
            bindings([binding("__anon3", go(loc3)), binding("__anon4", push(loc1)), binding("__anon5", climb_on), binding("__anon6", grab)])
          ),
          proof(goal(initial_state([loc1, loc2, loc3, n, n])), by(fact("monkey-bananas.pl", clause(10)))),
          proof(goal(goal_state([__anon12, __anon13, __anon14, __anon15, y])), by(fact("monkey-bananas.pl", clause(11)))),
          proof(
            goal(reachable([loc1, loc2, loc3, n, n], [go(loc3), push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
            bindings([binding("S1", [loc1, loc2, loc3, n, n]), binding("M", go(loc3)), binding("L", [push(loc1), climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc3, loc3, n, n])]),
            uses([
              proof(
                goal(legal_move([loc1, loc2, loc3, n, n], go(loc3), [loc1, loc3, loc3, n, n])), by(rule("monkey-bananas.pl", clause(16))),
                bindings([binding("B", loc1), binding("M", loc2), binding("L", loc3), binding("H", n), binding("X", loc3)]),
                uses([
                  proof(goal(member(loc3, [loc1, loc2, loc3])), by(builtin(member, 2))),
                  proof(goal(neq(loc3, loc2)), by(builtin(neq, 2)))
                ])
              ),
              proof(
                goal(reachable([loc1, loc3, loc3, n, n], [push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                bindings([binding("S1", [loc1, loc3, loc3, n, n]), binding("M", push(loc1)), binding("L", [climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, n, n])]),
                uses([
                  proof(
                    goal(legal_move([loc1, loc3, loc3, n, n], push(loc1), [loc1, loc1, loc1, n, n])), by(rule("monkey-bananas.pl", clause(15))),
                    bindings([binding("B", loc1), binding("M", loc3), binding("H", n), binding("X", loc1)]),
                    uses([
                      proof(goal(member(loc1, [loc1, loc2, loc3])), by(builtin(member, 2))),
                      proof(goal(neq(loc1, loc3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(
                    goal(reachable([loc1, loc1, loc1, n, n], [climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                    bindings([binding("S1", [loc1, loc1, loc1, n, n]), binding("M", climb_on), binding("L", [grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, n])]),
                    uses([
                      proof(
                        goal(legal_move([loc1, loc1, loc1, n, n], climb_on, [loc1, loc1, loc1, y, n])), by(fact("monkey-bananas.pl", clause(12))),
                        bindings([binding("B", loc1), binding("M", loc1), binding("H", n)])
                      ),
                      proof(
                        goal(reachable([loc1, loc1, loc1, y, n], [grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                        bindings([binding("S1", [loc1, loc1, loc1, y, n]), binding("M", grab), binding("L", []), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, y])]),
                        uses([
                          proof(
                            goal(legal_move([loc1, loc1, loc1, y, n], grab, [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(14))),
                            bindings([binding("B", loc1)])
                          ),
                          proof(
                            goal(reachable([loc1, loc1, loc1, y, y], [], [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(8))),
                            bindings([binding("S", [loc1, loc1, loc1, y, y])])
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

plan(monkeyBananas, [go(loc1), go(loc3), push(loc1), climb_on, grab]).
why(
  plan(monkeyBananas, [go(loc1), go(loc3), push(loc1), climb_on, grab]),
  proof(
    goal(plan(monkeyBananas, [go(loc1), go(loc3), push(loc1), climb_on, grab])), by(rule("monkey-bananas.pl", clause(17))),
    bindings([binding("Moves", [go(loc1), go(loc3), push(loc1), climb_on, grab])]),
    uses([
      proof(
        goal(plan([go(loc1), go(loc3), push(loc1), climb_on, grab])), by(rule("monkey-bananas.pl", clause(4))),
        bindings([binding("Moves", [go(loc1), go(loc3), push(loc1), climb_on, grab]), binding("I", [loc1, loc2, loc3, n, n]), binding("G", [loc1, loc1, loc1, y, y])]),
        uses([
          proof(
            goal(candidate_plan([go(loc1), go(loc3), push(loc1), climb_on, grab])), by(fact("monkey-bananas.pl", clause(7))),
            bindings([binding("__anon7", go(loc1)), binding("__anon8", go(loc3)), binding("__anon9", push(loc1)), binding("__anon10", climb_on), binding("__anon11", grab)])
          ),
          proof(goal(initial_state([loc1, loc2, loc3, n, n])), by(fact("monkey-bananas.pl", clause(10)))),
          proof(goal(goal_state([__anon12, __anon13, __anon14, __anon15, y])), by(fact("monkey-bananas.pl", clause(11)))),
          proof(
            goal(reachable([loc1, loc2, loc3, n, n], [go(loc1), go(loc3), push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
            bindings([binding("S1", [loc1, loc2, loc3, n, n]), binding("M", go(loc1)), binding("L", [go(loc3), push(loc1), climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc3, n, n])]),
            uses([
              proof(
                goal(legal_move([loc1, loc2, loc3, n, n], go(loc1), [loc1, loc1, loc3, n, n])), by(rule("monkey-bananas.pl", clause(16))),
                bindings([binding("B", loc1), binding("M", loc2), binding("L", loc3), binding("H", n), binding("X", loc1)]),
                uses([
                  proof(goal(member(loc1, [loc1, loc2, loc3])), by(builtin(member, 2))),
                  proof(goal(neq(loc1, loc2)), by(builtin(neq, 2)))
                ])
              ),
              proof(
                goal(reachable([loc1, loc1, loc3, n, n], [go(loc3), push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                bindings([binding("S1", [loc1, loc1, loc3, n, n]), binding("M", go(loc3)), binding("L", [push(loc1), climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc3, loc3, n, n])]),
                uses([
                  proof(
                    goal(legal_move([loc1, loc1, loc3, n, n], go(loc3), [loc1, loc3, loc3, n, n])), by(rule("monkey-bananas.pl", clause(16))),
                    bindings([binding("B", loc1), binding("M", loc1), binding("L", loc3), binding("H", n), binding("X", loc3)]),
                    uses([
                      proof(goal(member(loc3, [loc1, loc2, loc3])), by(builtin(member, 2))),
                      proof(goal(neq(loc3, loc1)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(
                    goal(reachable([loc1, loc3, loc3, n, n], [push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                    bindings([binding("S1", [loc1, loc3, loc3, n, n]), binding("M", push(loc1)), binding("L", [climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, n, n])]),
                    uses([
                      proof(
                        goal(legal_move([loc1, loc3, loc3, n, n], push(loc1), [loc1, loc1, loc1, n, n])), by(rule("monkey-bananas.pl", clause(15))),
                        bindings([binding("B", loc1), binding("M", loc3), binding("H", n), binding("X", loc1)]),
                        uses([
                          proof(goal(member(loc1, [loc1, loc2, loc3])), by(builtin(member, 2))),
                          proof(goal(neq(loc1, loc3)), by(builtin(neq, 2)))
                        ])
                      ),
                      proof(
                        goal(reachable([loc1, loc1, loc1, n, n], [climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                        bindings([binding("S1", [loc1, loc1, loc1, n, n]), binding("M", climb_on), binding("L", [grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, n])]),
                        uses([
                          proof(
                            goal(legal_move([loc1, loc1, loc1, n, n], climb_on, [loc1, loc1, loc1, y, n])), by(fact("monkey-bananas.pl", clause(12))),
                            bindings([binding("B", loc1), binding("M", loc1), binding("H", n)])
                          ),
                          proof(
                            goal(reachable([loc1, loc1, loc1, y, n], [grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                            bindings([binding("S1", [loc1, loc1, loc1, y, n]), binding("M", grab), binding("L", []), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, y])]),
                            uses([
                              proof(
                                goal(legal_move([loc1, loc1, loc1, y, n], grab, [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(14))),
                                bindings([binding("B", loc1)])
                              ),
                              proof(
                                goal(reachable([loc1, loc1, loc1, y, y], [], [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(8))),
                                bindings([binding("S", [loc1, loc1, loc1, y, y])])
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

plan(monkeyBananas, [go(loc3), push(loc1), climb_on, grab, climb_off]).
why(
  plan(monkeyBananas, [go(loc3), push(loc1), climb_on, grab, climb_off]),
  proof(
    goal(plan(monkeyBananas, [go(loc3), push(loc1), climb_on, grab, climb_off])), by(rule("monkey-bananas.pl", clause(17))),
    bindings([binding("Moves", [go(loc3), push(loc1), climb_on, grab, climb_off])]),
    uses([
      proof(
        goal(plan([go(loc3), push(loc1), climb_on, grab, climb_off])), by(rule("monkey-bananas.pl", clause(4))),
        bindings([binding("Moves", [go(loc3), push(loc1), climb_on, grab, climb_off]), binding("I", [loc1, loc2, loc3, n, n]), binding("G", [loc1, loc1, loc1, n, y])]),
        uses([
          proof(
            goal(candidate_plan([go(loc3), push(loc1), climb_on, grab, climb_off])), by(fact("monkey-bananas.pl", clause(7))),
            bindings([binding("__anon7", go(loc3)), binding("__anon8", push(loc1)), binding("__anon9", climb_on), binding("__anon10", grab), binding("__anon11", climb_off)])
          ),
          proof(goal(initial_state([loc1, loc2, loc3, n, n])), by(fact("monkey-bananas.pl", clause(10)))),
          proof(goal(goal_state([__anon12, __anon13, __anon14, __anon15, y])), by(fact("monkey-bananas.pl", clause(11)))),
          proof(
            goal(reachable([loc1, loc2, loc3, n, n], [go(loc3), push(loc1), climb_on, grab, climb_off], [loc1, loc1, loc1, n, y])), by(rule("monkey-bananas.pl", clause(9))),
            bindings([binding("S1", [loc1, loc2, loc3, n, n]), binding("M", go(loc3)), binding("L", [push(loc1), climb_on, grab, climb_off]), binding("S3", [loc1, loc1, loc1, n, y]), binding("S2", [loc1, loc3, loc3, n, n])]),
            uses([
              proof(
                goal(legal_move([loc1, loc2, loc3, n, n], go(loc3), [loc1, loc3, loc3, n, n])), by(rule("monkey-bananas.pl", clause(16))),
                bindings([binding("B", loc1), binding("M", loc2), binding("L", loc3), binding("H", n), binding("X", loc3)]),
                uses([
                  proof(goal(member(loc3, [loc1, loc2, loc3])), by(builtin(member, 2))),
                  proof(goal(neq(loc3, loc2)), by(builtin(neq, 2)))
                ])
              ),
              proof(
                goal(reachable([loc1, loc3, loc3, n, n], [push(loc1), climb_on, grab, climb_off], [loc1, loc1, loc1, n, y])), by(rule("monkey-bananas.pl", clause(9))),
                bindings([binding("S1", [loc1, loc3, loc3, n, n]), binding("M", push(loc1)), binding("L", [climb_on, grab, climb_off]), binding("S3", [loc1, loc1, loc1, n, y]), binding("S2", [loc1, loc1, loc1, n, n])]),
                uses([
                  proof(
                    goal(legal_move([loc1, loc3, loc3, n, n], push(loc1), [loc1, loc1, loc1, n, n])), by(rule("monkey-bananas.pl", clause(15))),
                    bindings([binding("B", loc1), binding("M", loc3), binding("H", n), binding("X", loc1)]),
                    uses([
                      proof(goal(member(loc1, [loc1, loc2, loc3])), by(builtin(member, 2))),
                      proof(goal(neq(loc1, loc3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(
                    goal(reachable([loc1, loc1, loc1, n, n], [climb_on, grab, climb_off], [loc1, loc1, loc1, n, y])), by(rule("monkey-bananas.pl", clause(9))),
                    bindings([binding("S1", [loc1, loc1, loc1, n, n]), binding("M", climb_on), binding("L", [grab, climb_off]), binding("S3", [loc1, loc1, loc1, n, y]), binding("S2", [loc1, loc1, loc1, y, n])]),
                    uses([
                      proof(
                        goal(legal_move([loc1, loc1, loc1, n, n], climb_on, [loc1, loc1, loc1, y, n])), by(fact("monkey-bananas.pl", clause(12))),
                        bindings([binding("B", loc1), binding("M", loc1), binding("H", n)])
                      ),
                      proof(
                        goal(reachable([loc1, loc1, loc1, y, n], [grab, climb_off], [loc1, loc1, loc1, n, y])), by(rule("monkey-bananas.pl", clause(9))),
                        bindings([binding("S1", [loc1, loc1, loc1, y, n]), binding("M", grab), binding("L", [climb_off]), binding("S3", [loc1, loc1, loc1, n, y]), binding("S2", [loc1, loc1, loc1, y, y])]),
                        uses([
                          proof(
                            goal(legal_move([loc1, loc1, loc1, y, n], grab, [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(14))),
                            bindings([binding("B", loc1)])
                          ),
                          proof(
                            goal(reachable([loc1, loc1, loc1, y, y], [climb_off], [loc1, loc1, loc1, n, y])), by(rule("monkey-bananas.pl", clause(9))),
                            bindings([binding("S1", [loc1, loc1, loc1, y, y]), binding("M", climb_off), binding("L", []), binding("S3", [loc1, loc1, loc1, n, y]), binding("S2", [loc1, loc1, loc1, n, y])]),
                            uses([
                              proof(
                                goal(legal_move([loc1, loc1, loc1, y, y], climb_off, [loc1, loc1, loc1, n, y])), by(fact("monkey-bananas.pl", clause(13))),
                                bindings([binding("B", loc1), binding("M", loc1), binding("H", y)])
                              ),
                              proof(
                                goal(reachable([loc1, loc1, loc1, n, y], [], [loc1, loc1, loc1, n, y])), by(fact("monkey-bananas.pl", clause(8))),
                                bindings([binding("S", [loc1, loc1, loc1, n, y])])
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

plan(monkeyBananas, [go(loc3), push(loc2), push(loc1), climb_on, grab]).
why(
  plan(monkeyBananas, [go(loc3), push(loc2), push(loc1), climb_on, grab]),
  proof(
    goal(plan(monkeyBananas, [go(loc3), push(loc2), push(loc1), climb_on, grab])), by(rule("monkey-bananas.pl", clause(17))),
    bindings([binding("Moves", [go(loc3), push(loc2), push(loc1), climb_on, grab])]),
    uses([
      proof(
        goal(plan([go(loc3), push(loc2), push(loc1), climb_on, grab])), by(rule("monkey-bananas.pl", clause(4))),
        bindings([binding("Moves", [go(loc3), push(loc2), push(loc1), climb_on, grab]), binding("I", [loc1, loc2, loc3, n, n]), binding("G", [loc1, loc1, loc1, y, y])]),
        uses([
          proof(
            goal(candidate_plan([go(loc3), push(loc2), push(loc1), climb_on, grab])), by(fact("monkey-bananas.pl", clause(7))),
            bindings([binding("__anon7", go(loc3)), binding("__anon8", push(loc2)), binding("__anon9", push(loc1)), binding("__anon10", climb_on), binding("__anon11", grab)])
          ),
          proof(goal(initial_state([loc1, loc2, loc3, n, n])), by(fact("monkey-bananas.pl", clause(10)))),
          proof(goal(goal_state([__anon12, __anon13, __anon14, __anon15, y])), by(fact("monkey-bananas.pl", clause(11)))),
          proof(
            goal(reachable([loc1, loc2, loc3, n, n], [go(loc3), push(loc2), push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
            bindings([binding("S1", [loc1, loc2, loc3, n, n]), binding("M", go(loc3)), binding("L", [push(loc2), push(loc1), climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc3, loc3, n, n])]),
            uses([
              proof(
                goal(legal_move([loc1, loc2, loc3, n, n], go(loc3), [loc1, loc3, loc3, n, n])), by(rule("monkey-bananas.pl", clause(16))),
                bindings([binding("B", loc1), binding("M", loc2), binding("L", loc3), binding("H", n), binding("X", loc3)]),
                uses([
                  proof(goal(member(loc3, [loc1, loc2, loc3])), by(builtin(member, 2))),
                  proof(goal(neq(loc3, loc2)), by(builtin(neq, 2)))
                ])
              ),
              proof(
                goal(reachable([loc1, loc3, loc3, n, n], [push(loc2), push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                bindings([binding("S1", [loc1, loc3, loc3, n, n]), binding("M", push(loc2)), binding("L", [push(loc1), climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc2, loc2, n, n])]),
                uses([
                  proof(
                    goal(legal_move([loc1, loc3, loc3, n, n], push(loc2), [loc1, loc2, loc2, n, n])), by(rule("monkey-bananas.pl", clause(15))),
                    bindings([binding("B", loc1), binding("M", loc3), binding("H", n), binding("X", loc2)]),
                    uses([
                      proof(goal(member(loc2, [loc1, loc2, loc3])), by(builtin(member, 2))),
                      proof(goal(neq(loc2, loc3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(
                    goal(reachable([loc1, loc2, loc2, n, n], [push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                    bindings([binding("S1", [loc1, loc2, loc2, n, n]), binding("M", push(loc1)), binding("L", [climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, n, n])]),
                    uses([
                      proof(
                        goal(legal_move([loc1, loc2, loc2, n, n], push(loc1), [loc1, loc1, loc1, n, n])), by(rule("monkey-bananas.pl", clause(15))),
                        bindings([binding("B", loc1), binding("M", loc2), binding("H", n), binding("X", loc1)]),
                        uses([
                          proof(goal(member(loc1, [loc1, loc2, loc3])), by(builtin(member, 2))),
                          proof(goal(neq(loc1, loc2)), by(builtin(neq, 2)))
                        ])
                      ),
                      proof(
                        goal(reachable([loc1, loc1, loc1, n, n], [climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                        bindings([binding("S1", [loc1, loc1, loc1, n, n]), binding("M", climb_on), binding("L", [grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, n])]),
                        uses([
                          proof(
                            goal(legal_move([loc1, loc1, loc1, n, n], climb_on, [loc1, loc1, loc1, y, n])), by(fact("monkey-bananas.pl", clause(12))),
                            bindings([binding("B", loc1), binding("M", loc1), binding("H", n)])
                          ),
                          proof(
                            goal(reachable([loc1, loc1, loc1, y, n], [grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                            bindings([binding("S1", [loc1, loc1, loc1, y, n]), binding("M", grab), binding("L", []), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, y])]),
                            uses([
                              proof(
                                goal(legal_move([loc1, loc1, loc1, y, n], grab, [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(14))),
                                bindings([binding("B", loc1)])
                              ),
                              proof(
                                goal(reachable([loc1, loc1, loc1, y, y], [], [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(8))),
                                bindings([binding("S", [loc1, loc1, loc1, y, y])])
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

solved(monkeyBananas, true).
why(
  solved(monkeyBananas, true),
  proof(
    goal(solved(monkeyBananas, true)), by(rule("monkey-bananas.pl", clause(18))),
    bindings([binding("_Moves", [go(loc3), push(loc1), climb_on, grab])]),
    uses([
      proof(
        goal(plan([go(loc3), push(loc1), climb_on, grab])), by(rule("monkey-bananas.pl", clause(4))),
        bindings([binding("Moves", [go(loc3), push(loc1), climb_on, grab]), binding("I", [loc1, loc2, loc3, n, n]), binding("G", [loc1, loc1, loc1, y, y])]),
        uses([
          proof(goal(candidate_plan([__anon3, __anon4, __anon5, __anon6])), by(fact("monkey-bananas.pl", clause(6)))),
          proof(goal(initial_state([loc1, loc2, loc3, n, n])), by(fact("monkey-bananas.pl", clause(10)))),
          proof(goal(goal_state([__anon12, __anon13, __anon14, __anon15, y])), by(fact("monkey-bananas.pl", clause(11)))),
          proof(
            goal(reachable([loc1, loc2, loc3, n, n], [go(loc3), push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
            bindings([binding("S1", [loc1, loc2, loc3, n, n]), binding("M", go(loc3)), binding("L", [push(loc1), climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc3, loc3, n, n])]),
            uses([
              proof(
                goal(legal_move([loc1, loc2, loc3, n, n], go(loc3), [loc1, loc3, loc3, n, n])), by(rule("monkey-bananas.pl", clause(16))),
                bindings([binding("B", loc1), binding("M", loc2), binding("L", loc3), binding("H", n), binding("X", loc3)]),
                uses([
                  proof(goal(member(loc3, [loc1, loc2, loc3])), by(builtin(member, 2))),
                  proof(goal(neq(loc3, loc2)), by(builtin(neq, 2)))
                ])
              ),
              proof(
                goal(reachable([loc1, loc3, loc3, n, n], [push(loc1), climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                bindings([binding("S1", [loc1, loc3, loc3, n, n]), binding("M", push(loc1)), binding("L", [climb_on, grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, n, n])]),
                uses([
                  proof(
                    goal(legal_move([loc1, loc3, loc3, n, n], push(loc1), [loc1, loc1, loc1, n, n])), by(rule("monkey-bananas.pl", clause(15))),
                    bindings([binding("B", loc1), binding("M", loc3), binding("H", n), binding("X", loc1)]),
                    uses([
                      proof(goal(member(loc1, [loc1, loc2, loc3])), by(builtin(member, 2))),
                      proof(goal(neq(loc1, loc3)), by(builtin(neq, 2)))
                    ])
                  ),
                  proof(
                    goal(reachable([loc1, loc1, loc1, n, n], [climb_on, grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                    bindings([binding("S1", [loc1, loc1, loc1, n, n]), binding("M", climb_on), binding("L", [grab]), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, n])]),
                    uses([
                      proof(
                        goal(legal_move([loc1, loc1, loc1, n, n], climb_on, [loc1, loc1, loc1, y, n])), by(fact("monkey-bananas.pl", clause(12))),
                        bindings([binding("B", loc1), binding("M", loc1), binding("H", n)])
                      ),
                      proof(
                        goal(reachable([loc1, loc1, loc1, y, n], [grab], [loc1, loc1, loc1, y, y])), by(rule("monkey-bananas.pl", clause(9))),
                        bindings([binding("S1", [loc1, loc1, loc1, y, n]), binding("M", grab), binding("L", []), binding("S3", [loc1, loc1, loc1, y, y]), binding("S2", [loc1, loc1, loc1, y, y])]),
                        uses([
                          proof(
                            goal(legal_move([loc1, loc1, loc1, y, n], grab, [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(14))),
                            bindings([binding("B", loc1)])
                          ),
                          proof(
                            goal(reachable([loc1, loc1, loc1, y, y], [], [loc1, loc1, loc1, y, y])), by(fact("monkey-bananas.pl", clause(8))),
                            bindings([binding("S", [loc1, loc1, loc1, y, y])])
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

