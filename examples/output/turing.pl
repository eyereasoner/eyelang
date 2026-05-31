input(case1, [1, 0, 1, 0, 0, 1]).
why(
  input(case1, [1, 0, 1, 0, 0, 1]),
  proof(
    goal(input(case1, [1, 0, 1, 0, 0, 1])),
    by(rule("turing.pl", clause(27))),
    bindings([binding("Case", case1), binding("InTape", [1, 0, 1, 0, 0, 1])]),
    uses([
      proof(
        goal(case(case1, [1, 0, 1, 0, 0, 1])),
        by(fact("turing.pl", clause(23)))
      )
    ])
  )
).

input(case2, [1, 0, 1, 1, 1, 1]).
why(
  input(case2, [1, 0, 1, 1, 1, 1]),
  proof(
    goal(input(case2, [1, 0, 1, 1, 1, 1])),
    by(rule("turing.pl", clause(27))),
    bindings([binding("Case", case2), binding("InTape", [1, 0, 1, 1, 1, 1])]),
    uses([
      proof(
        goal(case(case2, [1, 0, 1, 1, 1, 1])),
        by(fact("turing.pl", clause(24)))
      )
    ])
  )
).

input(case3, [1, 1, 1, 1, 1, 1]).
why(
  input(case3, [1, 1, 1, 1, 1, 1]),
  proof(
    goal(input(case3, [1, 1, 1, 1, 1, 1])),
    by(rule("turing.pl", clause(27))),
    bindings([binding("Case", case3), binding("InTape", [1, 1, 1, 1, 1, 1])]),
    uses([
      proof(
        goal(case(case3, [1, 1, 1, 1, 1, 1])),
        by(fact("turing.pl", clause(25)))
      )
    ])
  )
).

input(case4, []).
why(
  input(case4, []),
  proof(
    goal(input(case4, [])),
    by(rule("turing.pl", clause(27))),
    bindings([binding("Case", case4), binding("InTape", [])]),
    uses([
      proof(
        goal(case(case4, [])),
        by(fact("turing.pl", clause(26)))
      )
    ])
  )
).

output(case1, [1, 0, 1, 0, 1, 0, #]).
why(
  output(case1, [1, 0, 1, 0, 1, 0, #]),
  proof(
    goal(output(case1, [1, 0, 1, 0, 1, 0, #])),
    by(rule("turing.pl", clause(28))),
    bindings([binding("Case", case1), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("InTape", [1, 0, 1, 0, 0, 1])]),
    uses([
      proof(
        goal(case(case1, [1, 0, 1, 0, 0, 1])),
        by(fact("turing.pl", clause(23)))
      ),
      proof(
        goal(compute([1, 0, 1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
        by(rule("turing.pl", clause(5))),
        bindings([binding("Head", 1), binding("Tail", [0, 1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], 1, [0, 1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", 1), binding("Right", [0, 1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1]), binding("B", 0), binding("C", [1, 0, 0, 1])]),
            uses([
              proof(
                goal(t([0, 1, 1, r], 0)),
                by(fact("turing.pl", clause(18)))
              ),
              proof(
                goal(move(r, [], 1, [0, 1, 0, 0, 1], [1], 0, [1, 0, 0, 1])),
                by(fact("turing.pl", clause(13))),
                bindings([binding("Left", []), binding("Cell", 1), binding("Head", 0), binding("Tail", [1, 0, 0, 1])])
              ),
              proof(
                goal(continue(0, [1], 0, [1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                uses([
                  proof(
                    goal(find(0, [1], 0, [1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 1]), binding("B", 1), binding("C", [0, 0, 1])]),
                    uses([
                      proof(
                        goal(t([0, 0, 0, r], 0)),
                        by(fact("turing.pl", clause(17)))
                      ),
                      proof(
                        goal(move(r, [1], 0, [1, 0, 0, 1], [0, 1], 1, [0, 0, 1])),
                        by(fact("turing.pl", clause(13))),
                        bindings([binding("Left", [1]), binding("Cell", 0), binding("Head", 1), binding("Tail", [0, 0, 1])])
                      ),
                      proof(
                        goal(continue(0, [0, 1], 1, [0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                        by(rule("turing.pl", clause(8))),
                        bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                        uses([
                          proof(
                            goal(find(0, [0, 1], 1, [0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                            by(rule("turing.pl", clause(6))),
                            bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 0, 1]), binding("B", 0), binding("C", [0, 1])]),
                            uses([
                              proof(
                                goal(t([0, 1, 1, r], 0)),
                                by(fact("turing.pl", clause(18)))
                              ),
                              proof(
                                goal(move(r, [0, 1], 1, [0, 0, 1], [1, 0, 1], 0, [0, 1])),
                                by(fact("turing.pl", clause(13))),
                                bindings([binding("Left", [0, 1]), binding("Cell", 1), binding("Head", 0), binding("Tail", [0, 1])])
                              ),
                              proof(
                                goal(continue(0, [1, 0, 1], 0, [0, 1], [1, 0, 1, 0, 1, 0, #])),
                                by(rule("turing.pl", clause(8))),
                                bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 0), binding("Right", [0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                uses([
                                  proof(
                                    goal(find(0, [1, 0, 1], 0, [0, 1], [1, 0, 1, 0, 1, 0, #])),
                                    by(rule("turing.pl", clause(6))),
                                    bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 0), binding("Right", [0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 1, 0, 1]), binding("B", 0), binding("C", [1])]),
                                    uses([
                                      proof(
                                        goal(t([0, 0, 0, r], 0)),
                                        by(fact("turing.pl", clause(17)))
                                      ),
                                      proof(
                                        goal(move(r, [1, 0, 1], 0, [0, 1], [0, 1, 0, 1], 0, [1])),
                                        by(fact("turing.pl", clause(13))),
                                        bindings([binding("Left", [1, 0, 1]), binding("Cell", 0), binding("Head", 0), binding("Tail", [1])])
                                      ),
                                      proof(
                                        goal(continue(0, [0, 1, 0, 1], 0, [1], [1, 0, 1, 0, 1, 0, #])),
                                        by(rule("turing.pl", clause(8))),
                                        bindings([binding("State", 0), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                        uses([
                                          proof(
                                            goal(find(0, [0, 1, 0, 1], 0, [1], [1, 0, 1, 0, 1, 0, #])),
                                            by(rule("turing.pl", clause(6))),
                                            bindings([binding("State", 0), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 0, 1, 0, 1]), binding("B", 1), binding("C", [])]),
                                            uses([
                                              proof(
                                                goal(t([0, 0, 0, r], 0)),
                                                by(fact("turing.pl", clause(17)))
                                              ),
                                              proof(
                                                goal(move(r, [0, 1, 0, 1], 0, [1], [0, 0, 1, 0, 1], 1, [])),
                                                by(fact("turing.pl", clause(13))),
                                                bindings([binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Head", 1), binding("Tail", [])])
                                              ),
                                              proof(
                                                goal(continue(0, [0, 0, 1, 0, 1], 1, [], [1, 0, 1, 0, 1, 0, #])),
                                                by(rule("turing.pl", clause(8))),
                                                bindings([binding("State", 0), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                uses([
                                                  proof(
                                                    goal(find(0, [0, 0, 1, 0, 1], 1, [], [1, 0, 1, 0, 1, 0, #])),
                                                    by(rule("turing.pl", clause(6))),
                                                    bindings([binding("State", 0), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 0, 0, 1, 0, 1]), binding("B", #), binding("C", [])]),
                                                    uses([
                                                      proof(
                                                        goal(t([0, 1, 1, r], 0)),
                                                        by(fact("turing.pl", clause(18)))
                                                      ),
                                                      proof(
                                                        goal(move(r, [0, 0, 1, 0, 1], 1, [], [1, 0, 0, 1, 0, 1], #, [])),
                                                        by(fact("turing.pl", clause(12))),
                                                        bindings([binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1)])
                                                      ),
                                                      proof(
                                                        goal(continue(0, [1, 0, 0, 1, 0, 1], #, [], [1, 0, 1, 0, 1, 0, #])),
                                                        by(rule("turing.pl", clause(8))),
                                                        bindings([binding("State", 0), binding("Left", [1, 0, 0, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                        uses([
                                                          proof(
                                                            goal(find(0, [1, 0, 0, 1, 0, 1], #, [], [1, 0, 1, 0, 1, 0, #])),
                                                            by(rule("turing.pl", clause(6))),
                                                            bindings([binding("State", 0), binding("Left", [1, 0, 0, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", [0, 0, 1, 0, 1]), binding("B", 1), binding("C", [#])]),
                                                            uses([
                                                              proof(
                                                                goal(t([0, #, #, l], 1)),
                                                                by(fact("turing.pl", clause(19)))
                                                              ),
                                                              proof(
                                                                goal(move(l, [1, 0, 0, 1, 0, 1], #, [], [0, 0, 1, 0, 1], 1, [#])),
                                                                by(fact("turing.pl", clause(10))),
                                                                bindings([binding("Head", 1), binding("Tail", [0, 0, 1, 0, 1]), binding("Cell", #), binding("Right", [])])
                                                              ),
                                                              proof(
                                                                goal(continue(1, [0, 0, 1, 0, 1], 1, [#], [1, 0, 1, 0, 1, 0, #])),
                                                                by(rule("turing.pl", clause(8))),
                                                                bindings([binding("State", 1), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                                uses([
                                                                  proof(
                                                                    goal(find(1, [0, 0, 1, 0, 1], 1, [#], [1, 0, 1, 0, 1, 0, #])),
                                                                    by(rule("turing.pl", clause(6))),
                                                                    bindings([binding("State", 1), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [0, 1, 0, 1]), binding("B", 0), binding("C", [0, #])]),
                                                                    uses([
                                                                      proof(
                                                                        goal(t([1, 1, 0, l], 1)),
                                                                        by(fact("turing.pl", clause(21)))
                                                                      ),
                                                                      proof(
                                                                        goal(move(l, [0, 0, 1, 0, 1], 0, [#], [0, 1, 0, 1], 0, [0, #])),
                                                                        by(fact("turing.pl", clause(10))),
                                                                        bindings([binding("Head", 0), binding("Tail", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [#])])
                                                                      ),
                                                                      proof(
                                                                        goal(continue(1, [0, 1, 0, 1], 0, [0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                        by(rule("turing.pl", clause(8))),
                                                                        bindings([binding("State", 1), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [0, #]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                                        uses([
                                                                          proof(
                                                                            goal(find(1, [0, 1, 0, 1], 0, [0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                            by(rule("turing.pl", clause(6))),
                                                                            bindings([binding("State", 1), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [0, #]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", [0, 1, 0, 1]), binding("B", 1), binding("C", [0, #])]),
                                                                            uses([
                                                                              proof(
                                                                                goal(t([1, 0, 1, s], halt)),
                                                                                by(fact("turing.pl", clause(20)))
                                                                              ),
                                                                              proof(
                                                                                goal(move(s, [0, 1, 0, 1], 1, [0, #], [0, 1, 0, 1], 1, [0, #])),
                                                                                by(fact("turing.pl", clause(11))),
                                                                                bindings([binding("Left", [0, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #])])
                                                                              ),
                                                                              proof(
                                                                                goal(continue(halt, [0, 1, 0, 1], 1, [0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                                by(rule("turing.pl", clause(7))),
                                                                                bindings([binding("Left", [0, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("R", [1, 0, 1, 0])]),
                                                                                uses([
                                                                                  proof(
                                                                                    goal(rever([0, 1, 0, 1], [1, 0, 1, 0])),
                                                                                    by(rule("turing.pl", clause(15))),
                                                                                    bindings([binding("A", 0), binding("B", [1, 0, 1]), binding("C", [1, 0, 1, 0]), binding("D", [1, 0, 1])]),
                                                                                    uses([
                                                                                      proof(
                                                                                        goal(rever([1, 0, 1], [1, 0, 1])),
                                                                                        by(rule("turing.pl", clause(15))),
                                                                                        bindings([binding("A", 1), binding("B", [0, 1]), binding("C", [1, 0, 1]), binding("D", [1, 0])]),
                                                                                        uses([
                                                                                          proof(
                                                                                            goal(rever([0, 1], [1, 0])),
                                                                                            by(rule("turing.pl", clause(15))),
                                                                                            bindings([binding("A", 0), binding("B", [1]), binding("C", [1, 0]), binding("D", [1])]),
                                                                                            uses([
                                                                                              proof(
                                                                                                goal(rever([1], [1])),
                                                                                                by(rule("turing.pl", clause(15))),
                                                                                                bindings([binding("A", 1), binding("B", []), binding("C", [1]), binding("D", [])]),
                                                                                                uses([
                                                                                                  proof(
                                                                                                    goal(rever([], [])),
                                                                                                    by(fact("turing.pl", clause(14)))
                                                                                                  ),
                                                                                                  proof(
                                                                                                    goal(append([], [1], [1])),
                                                                                                    by(builtin(append, 3))
                                                                                                  )
                                                                                                ])
                                                                                              ),
                                                                                              proof(
                                                                                                goal(append([1], [0], [1, 0])),
                                                                                                by(builtin(append, 3))
                                                                                              )
                                                                                            ])
                                                                                          ),
                                                                                          proof(
                                                                                            goal(append([1, 0], [1], [1, 0, 1])),
                                                                                            by(builtin(append, 3))
                                                                                          )
                                                                                        ])
                                                                                      ),
                                                                                      proof(
                                                                                        goal(append([1, 0, 1], [0], [1, 0, 1, 0])),
                                                                                        by(builtin(append, 3))
                                                                                      )
                                                                                    ])
                                                                                  ),
                                                                                  proof(
                                                                                    goal(append([1, 0, 1, 0], [1, 0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                                    by(builtin(append, 3))
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
            ])
          )
        ])
      )
    ])
  )
).

output(case2, [1, 1, 0, 0, 0, 0, #]).
why(
  output(case2, [1, 1, 0, 0, 0, 0, #]),
  proof(
    goal(output(case2, [1, 1, 0, 0, 0, 0, #])),
    by(rule("turing.pl", clause(28))),
    bindings([binding("Case", case2), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("InTape", [1, 0, 1, 1, 1, 1])]),
    uses([
      proof(
        goal(case(case2, [1, 0, 1, 1, 1, 1])),
        by(fact("turing.pl", clause(24)))
      ),
      proof(
        goal(compute([1, 0, 1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
        by(rule("turing.pl", clause(5))),
        bindings([binding("Head", 1), binding("Tail", [0, 1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], 1, [0, 1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", 1), binding("Right", [0, 1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1]), binding("B", 0), binding("C", [1, 1, 1, 1])]),
            uses([
              proof(
                goal(t([0, 1, 1, r], 0)),
                by(fact("turing.pl", clause(18)))
              ),
              proof(
                goal(move(r, [], 1, [0, 1, 1, 1, 1], [1], 0, [1, 1, 1, 1])),
                by(fact("turing.pl", clause(13))),
                bindings([binding("Left", []), binding("Cell", 1), binding("Head", 0), binding("Tail", [1, 1, 1, 1])])
              ),
              proof(
                goal(continue(0, [1], 0, [1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                uses([
                  proof(
                    goal(find(0, [1], 0, [1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 1]), binding("B", 1), binding("C", [1, 1, 1])]),
                    uses([
                      proof(
                        goal(t([0, 0, 0, r], 0)),
                        by(fact("turing.pl", clause(17)))
                      ),
                      proof(
                        goal(move(r, [1], 0, [1, 1, 1, 1], [0, 1], 1, [1, 1, 1])),
                        by(fact("turing.pl", clause(13))),
                        bindings([binding("Left", [1]), binding("Cell", 0), binding("Head", 1), binding("Tail", [1, 1, 1])])
                      ),
                      proof(
                        goal(continue(0, [0, 1], 1, [1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                        by(rule("turing.pl", clause(8))),
                        bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                        uses([
                          proof(
                            goal(find(0, [0, 1], 1, [1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                            by(rule("turing.pl", clause(6))),
                            bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 0, 1]), binding("B", 1), binding("C", [1, 1])]),
                            uses([
                              proof(
                                goal(t([0, 1, 1, r], 0)),
                                by(fact("turing.pl", clause(18)))
                              ),
                              proof(
                                goal(move(r, [0, 1], 1, [1, 1, 1], [1, 0, 1], 1, [1, 1])),
                                by(fact("turing.pl", clause(13))),
                                bindings([binding("Left", [0, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1])])
                              ),
                              proof(
                                goal(continue(0, [1, 0, 1], 1, [1, 1], [1, 1, 0, 0, 0, 0, #])),
                                by(rule("turing.pl", clause(8))),
                                bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                uses([
                                  proof(
                                    goal(find(0, [1, 0, 1], 1, [1, 1], [1, 1, 0, 0, 0, 0, #])),
                                    by(rule("turing.pl", clause(6))),
                                    bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 0, 1]), binding("B", 1), binding("C", [1])]),
                                    uses([
                                      proof(
                                        goal(t([0, 1, 1, r], 0)),
                                        by(fact("turing.pl", clause(18)))
                                      ),
                                      proof(
                                        goal(move(r, [1, 0, 1], 1, [1, 1], [1, 1, 0, 1], 1, [1])),
                                        by(fact("turing.pl", clause(13))),
                                        bindings([binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1])])
                                      ),
                                      proof(
                                        goal(continue(0, [1, 1, 0, 1], 1, [1], [1, 1, 0, 0, 0, 0, #])),
                                        by(rule("turing.pl", clause(8))),
                                        bindings([binding("State", 0), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                        uses([
                                          proof(
                                            goal(find(0, [1, 1, 0, 1], 1, [1], [1, 1, 0, 0, 0, 0, #])),
                                            by(rule("turing.pl", clause(6))),
                                            bindings([binding("State", 0), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 0, 1]), binding("B", 1), binding("C", [])]),
                                            uses([
                                              proof(
                                                goal(t([0, 1, 1, r], 0)),
                                                by(fact("turing.pl", clause(18)))
                                              ),
                                              proof(
                                                goal(move(r, [1, 1, 0, 1], 1, [1], [1, 1, 1, 0, 1], 1, [])),
                                                by(fact("turing.pl", clause(13))),
                                                bindings([binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [])])
                                              ),
                                              proof(
                                                goal(continue(0, [1, 1, 1, 0, 1], 1, [], [1, 1, 0, 0, 0, 0, #])),
                                                by(rule("turing.pl", clause(8))),
                                                bindings([binding("State", 0), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                uses([
                                                  proof(
                                                    goal(find(0, [1, 1, 1, 0, 1], 1, [], [1, 1, 0, 0, 0, 0, #])),
                                                    by(rule("turing.pl", clause(6))),
                                                    bindings([binding("State", 0), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1, 0, 1]), binding("B", #), binding("C", [])]),
                                                    uses([
                                                      proof(
                                                        goal(t([0, 1, 1, r], 0)),
                                                        by(fact("turing.pl", clause(18)))
                                                      ),
                                                      proof(
                                                        goal(move(r, [1, 1, 1, 0, 1], 1, [], [1, 1, 1, 1, 0, 1], #, [])),
                                                        by(fact("turing.pl", clause(12))),
                                                        bindings([binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1)])
                                                      ),
                                                      proof(
                                                        goal(continue(0, [1, 1, 1, 1, 0, 1], #, [], [1, 1, 0, 0, 0, 0, #])),
                                                        by(rule("turing.pl", clause(8))),
                                                        bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                        uses([
                                                          proof(
                                                            goal(find(0, [1, 1, 1, 1, 0, 1], #, [], [1, 1, 0, 0, 0, 0, #])),
                                                            by(rule("turing.pl", clause(6))),
                                                            bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1, 0, 1]), binding("B", 1), binding("C", [#])]),
                                                            uses([
                                                              proof(
                                                                goal(t([0, #, #, l], 1)),
                                                                by(fact("turing.pl", clause(19)))
                                                              ),
                                                              proof(
                                                                goal(move(l, [1, 1, 1, 1, 0, 1], #, [], [1, 1, 1, 0, 1], 1, [#])),
                                                                by(fact("turing.pl", clause(10))),
                                                                bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 0, 1]), binding("Cell", #), binding("Right", [])])
                                                              ),
                                                              proof(
                                                                goal(continue(1, [1, 1, 1, 0, 1], 1, [#], [1, 1, 0, 0, 0, 0, #])),
                                                                by(rule("turing.pl", clause(8))),
                                                                bindings([binding("State", 1), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                uses([
                                                                  proof(
                                                                    goal(find(1, [1, 1, 1, 0, 1], 1, [#], [1, 1, 0, 0, 0, 0, #])),
                                                                    by(rule("turing.pl", clause(6))),
                                                                    bindings([binding("State", 1), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 0, 1]), binding("B", 1), binding("C", [0, #])]),
                                                                    uses([
                                                                      proof(
                                                                        goal(t([1, 1, 0, l], 1)),
                                                                        by(fact("turing.pl", clause(21)))
                                                                      ),
                                                                      proof(
                                                                        goal(move(l, [1, 1, 1, 0, 1], 0, [#], [1, 1, 0, 1], 1, [0, #])),
                                                                        by(fact("turing.pl", clause(10))),
                                                                        bindings([binding("Head", 1), binding("Tail", [1, 1, 0, 1]), binding("Cell", 0), binding("Right", [#])])
                                                                      ),
                                                                      proof(
                                                                        goal(continue(1, [1, 1, 0, 1], 1, [0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                        by(rule("turing.pl", clause(8))),
                                                                        bindings([binding("State", 1), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                        uses([
                                                                          proof(
                                                                            goal(find(1, [1, 1, 0, 1], 1, [0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                            by(rule("turing.pl", clause(6))),
                                                                            bindings([binding("State", 1), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 0, 1]), binding("B", 1), binding("C", [0, 0, #])]),
                                                                            uses([
                                                                              proof(
                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                by(fact("turing.pl", clause(21)))
                                                                              ),
                                                                              proof(
                                                                                goal(move(l, [1, 1, 0, 1], 0, [0, #], [1, 0, 1], 1, [0, 0, #])),
                                                                                by(fact("turing.pl", clause(10))),
                                                                                bindings([binding("Head", 1), binding("Tail", [1, 0, 1]), binding("Cell", 0), binding("Right", [0, #])])
                                                                              ),
                                                                              proof(
                                                                                goal(continue(1, [1, 0, 1], 1, [0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                by(rule("turing.pl", clause(8))),
                                                                                bindings([binding("State", 1), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                                uses([
                                                                                  proof(
                                                                                    goal(find(1, [1, 0, 1], 1, [0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                    by(rule("turing.pl", clause(6))),
                                                                                    bindings([binding("State", 1), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [0, 1]), binding("B", 1), binding("C", [0, 0, 0, #])]),
                                                                                    uses([
                                                                                      proof(
                                                                                        goal(t([1, 1, 0, l], 1)),
                                                                                        by(fact("turing.pl", clause(21)))
                                                                                      ),
                                                                                      proof(
                                                                                        goal(move(l, [1, 0, 1], 0, [0, 0, #], [0, 1], 1, [0, 0, 0, #])),
                                                                                        by(fact("turing.pl", clause(10))),
                                                                                        bindings([binding("Head", 1), binding("Tail", [0, 1]), binding("Cell", 0), binding("Right", [0, 0, #])])
                                                                                      ),
                                                                                      proof(
                                                                                        goal(continue(1, [0, 1], 1, [0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                        by(rule("turing.pl", clause(8))),
                                                                                        bindings([binding("State", 1), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                                        uses([
                                                                                          proof(
                                                                                            goal(find(1, [0, 1], 1, [0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                            by(rule("turing.pl", clause(6))),
                                                                                            bindings([binding("State", 1), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1]), binding("B", 0), binding("C", [0, 0, 0, 0, #])]),
                                                                                            uses([
                                                                                              proof(
                                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                                by(fact("turing.pl", clause(21)))
                                                                                              ),
                                                                                              proof(
                                                                                                goal(move(l, [0, 1], 0, [0, 0, 0, #], [1], 0, [0, 0, 0, 0, #])),
                                                                                                by(fact("turing.pl", clause(10))),
                                                                                                bindings([binding("Head", 0), binding("Tail", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, #])])
                                                                                              ),
                                                                                              proof(
                                                                                                goal(continue(1, [1], 0, [0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                by(rule("turing.pl", clause(8))),
                                                                                                bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                                                uses([
                                                                                                  proof(
                                                                                                    goal(find(1, [1], 0, [0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                    by(rule("turing.pl", clause(6))),
                                                                                                    bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", [1]), binding("B", 1), binding("C", [0, 0, 0, 0, #])]),
                                                                                                    uses([
                                                                                                      proof(
                                                                                                        goal(t([1, 0, 1, s], halt)),
                                                                                                        by(fact("turing.pl", clause(20)))
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(move(s, [1], 1, [0, 0, 0, 0, #], [1], 1, [0, 0, 0, 0, #])),
                                                                                                        by(fact("turing.pl", clause(11))),
                                                                                                        bindings([binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #])])
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(continue(halt, [1], 1, [0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                        by(rule("turing.pl", clause(7))),
                                                                                                        bindings([binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("R", [1])]),
                                                                                                        uses([
                                                                                                          proof(
                                                                                                            goal(rever([1], [1])),
                                                                                                            by(rule("turing.pl", clause(15))),
                                                                                                            bindings([binding("A", 1), binding("B", []), binding("C", [1]), binding("D", [])]),
                                                                                                            uses([
                                                                                                              proof(
                                                                                                                goal(rever([], [])),
                                                                                                                by(fact("turing.pl", clause(14)))
                                                                                                              ),
                                                                                                              proof(
                                                                                                                goal(append([], [1], [1])),
                                                                                                                by(builtin(append, 3))
                                                                                                              )
                                                                                                            ])
                                                                                                          ),
                                                                                                          proof(
                                                                                                            goal(append([1], [1, 0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                            by(builtin(append, 3))
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

output(case3, [1, 0, 0, 0, 0, 0, 0, #]).
why(
  output(case3, [1, 0, 0, 0, 0, 0, 0, #]),
  proof(
    goal(output(case3, [1, 0, 0, 0, 0, 0, 0, #])),
    by(rule("turing.pl", clause(28))),
    bindings([binding("Case", case3), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("InTape", [1, 1, 1, 1, 1, 1])]),
    uses([
      proof(
        goal(case(case3, [1, 1, 1, 1, 1, 1])),
        by(fact("turing.pl", clause(25)))
      ),
      proof(
        goal(compute([1, 1, 1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
        by(rule("turing.pl", clause(5))),
        bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], 1, [1, 1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", 1), binding("Right", [1, 1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1]), binding("B", 1), binding("C", [1, 1, 1, 1])]),
            uses([
              proof(
                goal(t([0, 1, 1, r], 0)),
                by(fact("turing.pl", clause(18)))
              ),
              proof(
                goal(move(r, [], 1, [1, 1, 1, 1, 1], [1], 1, [1, 1, 1, 1])),
                by(fact("turing.pl", clause(13))),
                bindings([binding("Left", []), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1, 1, 1])])
              ),
              proof(
                goal(continue(0, [1], 1, [1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 1), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                uses([
                  proof(
                    goal(find(0, [1], 1, [1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 1), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1]), binding("B", 1), binding("C", [1, 1, 1])]),
                    uses([
                      proof(
                        goal(t([0, 1, 1, r], 0)),
                        by(fact("turing.pl", clause(18)))
                      ),
                      proof(
                        goal(move(r, [1], 1, [1, 1, 1, 1], [1, 1], 1, [1, 1, 1])),
                        by(fact("turing.pl", clause(13))),
                        bindings([binding("Left", [1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1, 1])])
                      ),
                      proof(
                        goal(continue(0, [1, 1], 1, [1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                        by(rule("turing.pl", clause(8))),
                        bindings([binding("State", 0), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                        uses([
                          proof(
                            goal(find(0, [1, 1], 1, [1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                            by(rule("turing.pl", clause(6))),
                            bindings([binding("State", 0), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1]), binding("B", 1), binding("C", [1, 1])]),
                            uses([
                              proof(
                                goal(t([0, 1, 1, r], 0)),
                                by(fact("turing.pl", clause(18)))
                              ),
                              proof(
                                goal(move(r, [1, 1], 1, [1, 1, 1], [1, 1, 1], 1, [1, 1])),
                                by(fact("turing.pl", clause(13))),
                                bindings([binding("Left", [1, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1])])
                              ),
                              proof(
                                goal(continue(0, [1, 1, 1], 1, [1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                                by(rule("turing.pl", clause(8))),
                                bindings([binding("State", 0), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                uses([
                                  proof(
                                    goal(find(0, [1, 1, 1], 1, [1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                                    by(rule("turing.pl", clause(6))),
                                    bindings([binding("State", 0), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1]), binding("B", 1), binding("C", [1])]),
                                    uses([
                                      proof(
                                        goal(t([0, 1, 1, r], 0)),
                                        by(fact("turing.pl", clause(18)))
                                      ),
                                      proof(
                                        goal(move(r, [1, 1, 1], 1, [1, 1], [1, 1, 1, 1], 1, [1])),
                                        by(fact("turing.pl", clause(13))),
                                        bindings([binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1])])
                                      ),
                                      proof(
                                        goal(continue(0, [1, 1, 1, 1], 1, [1], [1, 0, 0, 0, 0, 0, 0, #])),
                                        by(rule("turing.pl", clause(8))),
                                        bindings([binding("State", 0), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                        uses([
                                          proof(
                                            goal(find(0, [1, 1, 1, 1], 1, [1], [1, 0, 0, 0, 0, 0, 0, #])),
                                            by(rule("turing.pl", clause(6))),
                                            bindings([binding("State", 0), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1, 1]), binding("B", 1), binding("C", [])]),
                                            uses([
                                              proof(
                                                goal(t([0, 1, 1, r], 0)),
                                                by(fact("turing.pl", clause(18)))
                                              ),
                                              proof(
                                                goal(move(r, [1, 1, 1, 1], 1, [1], [1, 1, 1, 1, 1], 1, [])),
                                                by(fact("turing.pl", clause(13))),
                                                bindings([binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [])])
                                              ),
                                              proof(
                                                goal(continue(0, [1, 1, 1, 1, 1], 1, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                by(rule("turing.pl", clause(8))),
                                                bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                uses([
                                                  proof(
                                                    goal(find(0, [1, 1, 1, 1, 1], 1, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                    by(rule("turing.pl", clause(6))),
                                                    bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1, 1, 1]), binding("B", #), binding("C", [])]),
                                                    uses([
                                                      proof(
                                                        goal(t([0, 1, 1, r], 0)),
                                                        by(fact("turing.pl", clause(18)))
                                                      ),
                                                      proof(
                                                        goal(move(r, [1, 1, 1, 1, 1], 1, [], [1, 1, 1, 1, 1, 1], #, [])),
                                                        by(fact("turing.pl", clause(12))),
                                                        bindings([binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1)])
                                                      ),
                                                      proof(
                                                        goal(continue(0, [1, 1, 1, 1, 1, 1], #, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                        by(rule("turing.pl", clause(8))),
                                                        bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                        uses([
                                                          proof(
                                                            goal(find(0, [1, 1, 1, 1, 1, 1], #, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                            by(rule("turing.pl", clause(6))),
                                                            bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1, 1, 1]), binding("B", 1), binding("C", [#])]),
                                                            uses([
                                                              proof(
                                                                goal(t([0, #, #, l], 1)),
                                                                by(fact("turing.pl", clause(19)))
                                                              ),
                                                              proof(
                                                                goal(move(l, [1, 1, 1, 1, 1, 1], #, [], [1, 1, 1, 1, 1], 1, [#])),
                                                                by(fact("turing.pl", clause(10))),
                                                                bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 1, 1]), binding("Cell", #), binding("Right", [])])
                                                              ),
                                                              proof(
                                                                goal(continue(1, [1, 1, 1, 1, 1], 1, [#], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                by(rule("turing.pl", clause(8))),
                                                                bindings([binding("State", 1), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                uses([
                                                                  proof(
                                                                    goal(find(1, [1, 1, 1, 1, 1], 1, [#], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                    by(rule("turing.pl", clause(6))),
                                                                    bindings([binding("State", 1), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1, 1]), binding("B", 1), binding("C", [0, #])]),
                                                                    uses([
                                                                      proof(
                                                                        goal(t([1, 1, 0, l], 1)),
                                                                        by(fact("turing.pl", clause(21)))
                                                                      ),
                                                                      proof(
                                                                        goal(move(l, [1, 1, 1, 1, 1], 0, [#], [1, 1, 1, 1], 1, [0, #])),
                                                                        by(fact("turing.pl", clause(10))),
                                                                        bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 1]), binding("Cell", 0), binding("Right", [#])])
                                                                      ),
                                                                      proof(
                                                                        goal(continue(1, [1, 1, 1, 1], 1, [0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                        by(rule("turing.pl", clause(8))),
                                                                        bindings([binding("State", 1), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                        uses([
                                                                          proof(
                                                                            goal(find(1, [1, 1, 1, 1], 1, [0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                            by(rule("turing.pl", clause(6))),
                                                                            bindings([binding("State", 1), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1]), binding("B", 1), binding("C", [0, 0, #])]),
                                                                            uses([
                                                                              proof(
                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                by(fact("turing.pl", clause(21)))
                                                                              ),
                                                                              proof(
                                                                                goal(move(l, [1, 1, 1, 1], 0, [0, #], [1, 1, 1], 1, [0, 0, #])),
                                                                                by(fact("turing.pl", clause(10))),
                                                                                bindings([binding("Head", 1), binding("Tail", [1, 1, 1]), binding("Cell", 0), binding("Right", [0, #])])
                                                                              ),
                                                                              proof(
                                                                                goal(continue(1, [1, 1, 1], 1, [0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                by(rule("turing.pl", clause(8))),
                                                                                bindings([binding("State", 1), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                uses([
                                                                                  proof(
                                                                                    goal(find(1, [1, 1, 1], 1, [0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                    by(rule("turing.pl", clause(6))),
                                                                                    bindings([binding("State", 1), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1]), binding("B", 1), binding("C", [0, 0, 0, #])]),
                                                                                    uses([
                                                                                      proof(
                                                                                        goal(t([1, 1, 0, l], 1)),
                                                                                        by(fact("turing.pl", clause(21)))
                                                                                      ),
                                                                                      proof(
                                                                                        goal(move(l, [1, 1, 1], 0, [0, 0, #], [1, 1], 1, [0, 0, 0, #])),
                                                                                        by(fact("turing.pl", clause(10))),
                                                                                        bindings([binding("Head", 1), binding("Tail", [1, 1]), binding("Cell", 0), binding("Right", [0, 0, #])])
                                                                                      ),
                                                                                      proof(
                                                                                        goal(continue(1, [1, 1], 1, [0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                        by(rule("turing.pl", clause(8))),
                                                                                        bindings([binding("State", 1), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                        uses([
                                                                                          proof(
                                                                                            goal(find(1, [1, 1], 1, [0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                            by(rule("turing.pl", clause(6))),
                                                                                            bindings([binding("State", 1), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1]), binding("B", 1), binding("C", [0, 0, 0, 0, #])]),
                                                                                            uses([
                                                                                              proof(
                                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                                by(fact("turing.pl", clause(21)))
                                                                                              ),
                                                                                              proof(
                                                                                                goal(move(l, [1, 1], 0, [0, 0, 0, #], [1], 1, [0, 0, 0, 0, #])),
                                                                                                by(fact("turing.pl", clause(10))),
                                                                                                bindings([binding("Head", 1), binding("Tail", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, #])])
                                                                                              ),
                                                                                              proof(
                                                                                                goal(continue(1, [1], 1, [0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                by(rule("turing.pl", clause(8))),
                                                                                                bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                                uses([
                                                                                                  proof(
                                                                                                    goal(find(1, [1], 1, [0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                    by(rule("turing.pl", clause(6))),
                                                                                                    bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", []), binding("B", 1), binding("C", [0, 0, 0, 0, 0, #])]),
                                                                                                    uses([
                                                                                                      proof(
                                                                                                        goal(t([1, 1, 0, l], 1)),
                                                                                                        by(fact("turing.pl", clause(21)))
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(move(l, [1], 0, [0, 0, 0, 0, #], [], 1, [0, 0, 0, 0, 0, #])),
                                                                                                        by(fact("turing.pl", clause(10))),
                                                                                                        bindings([binding("Head", 1), binding("Tail", []), binding("Cell", 0), binding("Right", [0, 0, 0, 0, #])])
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(continue(1, [], 1, [0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                        by(rule("turing.pl", clause(8))),
                                                                                                        bindings([binding("State", 1), binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                                        uses([
                                                                                                          proof(
                                                                                                            goal(find(1, [], 1, [0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                            by(rule("turing.pl", clause(6))),
                                                                                                            bindings([binding("State", 1), binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", []), binding("B", #), binding("C", [0, 0, 0, 0, 0, 0, #])]),
                                                                                                            uses([
                                                                                                              proof(
                                                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                                                by(fact("turing.pl", clause(21)))
                                                                                                              ),
                                                                                                              proof(
                                                                                                                goal(move(l, [], 0, [0, 0, 0, 0, 0, #], [], #, [0, 0, 0, 0, 0, 0, #])),
                                                                                                                by(fact("turing.pl", clause(9))),
                                                                                                                bindings([binding("Cell", 0), binding("Right", [0, 0, 0, 0, 0, #])])
                                                                                                              ),
                                                                                                              proof(
                                                                                                                goal(continue(1, [], #, [0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                by(rule("turing.pl", clause(8))),
                                                                                                                bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [0, 0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                                                uses([
                                                                                                                  proof(
                                                                                                                    goal(find(1, [], #, [0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                    by(rule("turing.pl", clause(6))),
                                                                                                                    bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [0, 0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", []), binding("B", 1), binding("C", [0, 0, 0, 0, 0, 0, #])]),
                                                                                                                    uses([
                                                                                                                      proof(
                                                                                                                        goal(t([1, #, 1, s], halt)),
                                                                                                                        by(fact("turing.pl", clause(22)))
                                                                                                                      ),
                                                                                                                      proof(
                                                                                                                        goal(move(s, [], 1, [0, 0, 0, 0, 0, 0, #], [], 1, [0, 0, 0, 0, 0, 0, #])),
                                                                                                                        by(fact("turing.pl", clause(11))),
                                                                                                                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, 0, #])])
                                                                                                                      ),
                                                                                                                      proof(
                                                                                                                        goal(continue(halt, [], 1, [0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                        by(rule("turing.pl", clause(7))),
                                                                                                                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("R", [])]),
                                                                                                                        uses([
                                                                                                                          proof(
                                                                                                                            goal(rever([], [])),
                                                                                                                            by(fact("turing.pl", clause(14)))
                                                                                                                          ),
                                                                                                                          proof(
                                                                                                                            goal(append([], [1, 0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                            by(builtin(append, 3))
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

output(case4, [1, #]).
why(
  output(case4, [1, #]),
  proof(
    goal(output(case4, [1, #])),
    by(rule("turing.pl", clause(28))),
    bindings([binding("Case", case4), binding("OutTape", [1, #]), binding("InTape", [])]),
    uses([
      proof(
        goal(case(case4, [])),
        by(fact("turing.pl", clause(26)))
      ),
      proof(
        goal(compute([], [1, #])),
        by(rule("turing.pl", clause(4))),
        bindings([binding("OutTape", [1, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], #, [], [1, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", #), binding("Right", []), binding("OutTape", [1, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", []), binding("B", #), binding("C", [#])]),
            uses([
              proof(
                goal(t([0, #, #, l], 1)),
                by(fact("turing.pl", clause(19)))
              ),
              proof(
                goal(move(l, [], #, [], [], #, [#])),
                by(fact("turing.pl", clause(9))),
                bindings([binding("Cell", #), binding("Right", [])])
              ),
              proof(
                goal(continue(1, [], #, [#], [1, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [#]), binding("OutTape", [1, #])]),
                uses([
                  proof(
                    goal(find(1, [], #, [#], [1, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [#]), binding("OutTape", [1, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", []), binding("B", 1), binding("C", [#])]),
                    uses([
                      proof(
                        goal(t([1, #, 1, s], halt)),
                        by(fact("turing.pl", clause(22)))
                      ),
                      proof(
                        goal(move(s, [], 1, [#], [], 1, [#])),
                        by(fact("turing.pl", clause(11))),
                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [#])])
                      ),
                      proof(
                        goal(continue(halt, [], 1, [#], [1, #])),
                        by(rule("turing.pl", clause(7))),
                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, #]), binding("R", [])]),
                        uses([
                          proof(
                            goal(rever([], [])),
                            by(fact("turing.pl", clause(14)))
                          ),
                          proof(
                            goal(append([], [1, #], [1, #])),
                            by(builtin(append, 3))
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

addsOne(case1, true).
why(
  addsOne(case1, true),
  proof(
    goal(addsOne(case1, true)),
    by(rule("turing.pl", clause(29))),
    bindings([binding("Case", case1), binding("InTape", [1, 0, 1, 0, 0, 1]), binding("_OutTape", [1, 0, 1, 0, 1, 0, #])]),
    uses([
      proof(
        goal(case(case1, [1, 0, 1, 0, 0, 1])),
        by(fact("turing.pl", clause(23)))
      ),
      proof(
        goal(compute([1, 0, 1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
        by(rule("turing.pl", clause(5))),
        bindings([binding("Head", 1), binding("Tail", [0, 1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], 1, [0, 1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", 1), binding("Right", [0, 1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1]), binding("B", 0), binding("C", [1, 0, 0, 1])]),
            uses([
              proof(
                goal(t([0, 1, 1, r], 0)),
                by(fact("turing.pl", clause(18)))
              ),
              proof(
                goal(move(r, [], 1, [0, 1, 0, 0, 1], [1], 0, [1, 0, 0, 1])),
                by(fact("turing.pl", clause(13))),
                bindings([binding("Left", []), binding("Cell", 1), binding("Head", 0), binding("Tail", [1, 0, 0, 1])])
              ),
              proof(
                goal(continue(0, [1], 0, [1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                uses([
                  proof(
                    goal(find(0, [1], 0, [1, 0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 1]), binding("B", 1), binding("C", [0, 0, 1])]),
                    uses([
                      proof(
                        goal(t([0, 0, 0, r], 0)),
                        by(fact("turing.pl", clause(17)))
                      ),
                      proof(
                        goal(move(r, [1], 0, [1, 0, 0, 1], [0, 1], 1, [0, 0, 1])),
                        by(fact("turing.pl", clause(13))),
                        bindings([binding("Left", [1]), binding("Cell", 0), binding("Head", 1), binding("Tail", [0, 0, 1])])
                      ),
                      proof(
                        goal(continue(0, [0, 1], 1, [0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                        by(rule("turing.pl", clause(8))),
                        bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                        uses([
                          proof(
                            goal(find(0, [0, 1], 1, [0, 0, 1], [1, 0, 1, 0, 1, 0, #])),
                            by(rule("turing.pl", clause(6))),
                            bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 0, 1]), binding("B", 0), binding("C", [0, 1])]),
                            uses([
                              proof(
                                goal(t([0, 1, 1, r], 0)),
                                by(fact("turing.pl", clause(18)))
                              ),
                              proof(
                                goal(move(r, [0, 1], 1, [0, 0, 1], [1, 0, 1], 0, [0, 1])),
                                by(fact("turing.pl", clause(13))),
                                bindings([binding("Left", [0, 1]), binding("Cell", 1), binding("Head", 0), binding("Tail", [0, 1])])
                              ),
                              proof(
                                goal(continue(0, [1, 0, 1], 0, [0, 1], [1, 0, 1, 0, 1, 0, #])),
                                by(rule("turing.pl", clause(8))),
                                bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 0), binding("Right", [0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                uses([
                                  proof(
                                    goal(find(0, [1, 0, 1], 0, [0, 1], [1, 0, 1, 0, 1, 0, #])),
                                    by(rule("turing.pl", clause(6))),
                                    bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 0), binding("Right", [0, 1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 1, 0, 1]), binding("B", 0), binding("C", [1])]),
                                    uses([
                                      proof(
                                        goal(t([0, 0, 0, r], 0)),
                                        by(fact("turing.pl", clause(17)))
                                      ),
                                      proof(
                                        goal(move(r, [1, 0, 1], 0, [0, 1], [0, 1, 0, 1], 0, [1])),
                                        by(fact("turing.pl", clause(13))),
                                        bindings([binding("Left", [1, 0, 1]), binding("Cell", 0), binding("Head", 0), binding("Tail", [1])])
                                      ),
                                      proof(
                                        goal(continue(0, [0, 1, 0, 1], 0, [1], [1, 0, 1, 0, 1, 0, #])),
                                        by(rule("turing.pl", clause(8))),
                                        bindings([binding("State", 0), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                        uses([
                                          proof(
                                            goal(find(0, [0, 1, 0, 1], 0, [1], [1, 0, 1, 0, 1, 0, #])),
                                            by(rule("turing.pl", clause(6))),
                                            bindings([binding("State", 0), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [1]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 0, 1, 0, 1]), binding("B", 1), binding("C", [])]),
                                            uses([
                                              proof(
                                                goal(t([0, 0, 0, r], 0)),
                                                by(fact("turing.pl", clause(17)))
                                              ),
                                              proof(
                                                goal(move(r, [0, 1, 0, 1], 0, [1], [0, 0, 1, 0, 1], 1, [])),
                                                by(fact("turing.pl", clause(13))),
                                                bindings([binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Head", 1), binding("Tail", [])])
                                              ),
                                              proof(
                                                goal(continue(0, [0, 0, 1, 0, 1], 1, [], [1, 0, 1, 0, 1, 0, #])),
                                                by(rule("turing.pl", clause(8))),
                                                bindings([binding("State", 0), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                uses([
                                                  proof(
                                                    goal(find(0, [0, 0, 1, 0, 1], 1, [], [1, 0, 1, 0, 1, 0, #])),
                                                    by(rule("turing.pl", clause(6))),
                                                    bindings([binding("State", 0), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 0, 0, 1, 0, 1]), binding("B", #), binding("C", [])]),
                                                    uses([
                                                      proof(
                                                        goal(t([0, 1, 1, r], 0)),
                                                        by(fact("turing.pl", clause(18)))
                                                      ),
                                                      proof(
                                                        goal(move(r, [0, 0, 1, 0, 1], 1, [], [1, 0, 0, 1, 0, 1], #, [])),
                                                        by(fact("turing.pl", clause(12))),
                                                        bindings([binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1)])
                                                      ),
                                                      proof(
                                                        goal(continue(0, [1, 0, 0, 1, 0, 1], #, [], [1, 0, 1, 0, 1, 0, #])),
                                                        by(rule("turing.pl", clause(8))),
                                                        bindings([binding("State", 0), binding("Left", [1, 0, 0, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                        uses([
                                                          proof(
                                                            goal(find(0, [1, 0, 0, 1, 0, 1], #, [], [1, 0, 1, 0, 1, 0, #])),
                                                            by(rule("turing.pl", clause(6))),
                                                            bindings([binding("State", 0), binding("Left", [1, 0, 0, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", [0, 0, 1, 0, 1]), binding("B", 1), binding("C", [#])]),
                                                            uses([
                                                              proof(
                                                                goal(t([0, #, #, l], 1)),
                                                                by(fact("turing.pl", clause(19)))
                                                              ),
                                                              proof(
                                                                goal(move(l, [1, 0, 0, 1, 0, 1], #, [], [0, 0, 1, 0, 1], 1, [#])),
                                                                by(fact("turing.pl", clause(10))),
                                                                bindings([binding("Head", 1), binding("Tail", [0, 0, 1, 0, 1]), binding("Cell", #), binding("Right", [])])
                                                              ),
                                                              proof(
                                                                goal(continue(1, [0, 0, 1, 0, 1], 1, [#], [1, 0, 1, 0, 1, 0, #])),
                                                                by(rule("turing.pl", clause(8))),
                                                                bindings([binding("State", 1), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                                uses([
                                                                  proof(
                                                                    goal(find(1, [0, 0, 1, 0, 1], 1, [#], [1, 0, 1, 0, 1, 0, #])),
                                                                    by(rule("turing.pl", clause(6))),
                                                                    bindings([binding("State", 1), binding("Left", [0, 0, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [0, 1, 0, 1]), binding("B", 0), binding("C", [0, #])]),
                                                                    uses([
                                                                      proof(
                                                                        goal(t([1, 1, 0, l], 1)),
                                                                        by(fact("turing.pl", clause(21)))
                                                                      ),
                                                                      proof(
                                                                        goal(move(l, [0, 0, 1, 0, 1], 0, [#], [0, 1, 0, 1], 0, [0, #])),
                                                                        by(fact("turing.pl", clause(10))),
                                                                        bindings([binding("Head", 0), binding("Tail", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [#])])
                                                                      ),
                                                                      proof(
                                                                        goal(continue(1, [0, 1, 0, 1], 0, [0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                        by(rule("turing.pl", clause(8))),
                                                                        bindings([binding("State", 1), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [0, #]), binding("OutTape", [1, 0, 1, 0, 1, 0, #])]),
                                                                        uses([
                                                                          proof(
                                                                            goal(find(1, [0, 1, 0, 1], 0, [0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                            by(rule("turing.pl", clause(6))),
                                                                            bindings([binding("State", 1), binding("Left", [0, 1, 0, 1]), binding("Cell", 0), binding("Right", [0, #]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", [0, 1, 0, 1]), binding("B", 1), binding("C", [0, #])]),
                                                                            uses([
                                                                              proof(
                                                                                goal(t([1, 0, 1, s], halt)),
                                                                                by(fact("turing.pl", clause(20)))
                                                                              ),
                                                                              proof(
                                                                                goal(move(s, [0, 1, 0, 1], 1, [0, #], [0, 1, 0, 1], 1, [0, #])),
                                                                                by(fact("turing.pl", clause(11))),
                                                                                bindings([binding("Left", [0, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #])])
                                                                              ),
                                                                              proof(
                                                                                goal(continue(halt, [0, 1, 0, 1], 1, [0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                                by(rule("turing.pl", clause(7))),
                                                                                bindings([binding("Left", [0, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 0, 1, 0, 1, 0, #]), binding("R", [1, 0, 1, 0])]),
                                                                                uses([
                                                                                  proof(
                                                                                    goal(rever([0, 1, 0, 1], [1, 0, 1, 0])),
                                                                                    by(rule("turing.pl", clause(15))),
                                                                                    bindings([binding("A", 0), binding("B", [1, 0, 1]), binding("C", [1, 0, 1, 0]), binding("D", [1, 0, 1])]),
                                                                                    uses([
                                                                                      proof(
                                                                                        goal(rever([1, 0, 1], [1, 0, 1])),
                                                                                        by(rule("turing.pl", clause(15))),
                                                                                        bindings([binding("A", 1), binding("B", [0, 1]), binding("C", [1, 0, 1]), binding("D", [1, 0])]),
                                                                                        uses([
                                                                                          proof(
                                                                                            goal(rever([0, 1], [1, 0])),
                                                                                            by(rule("turing.pl", clause(15))),
                                                                                            bindings([binding("A", 0), binding("B", [1]), binding("C", [1, 0]), binding("D", [1])]),
                                                                                            uses([
                                                                                              proof(
                                                                                                goal(rever([1], [1])),
                                                                                                by(rule("turing.pl", clause(15))),
                                                                                                bindings([binding("A", 1), binding("B", []), binding("C", [1]), binding("D", [])]),
                                                                                                uses([
                                                                                                  proof(
                                                                                                    goal(rever([], [])),
                                                                                                    by(fact("turing.pl", clause(14)))
                                                                                                  ),
                                                                                                  proof(
                                                                                                    goal(append([], [1], [1])),
                                                                                                    by(builtin(append, 3))
                                                                                                  )
                                                                                                ])
                                                                                              ),
                                                                                              proof(
                                                                                                goal(append([1], [0], [1, 0])),
                                                                                                by(builtin(append, 3))
                                                                                              )
                                                                                            ])
                                                                                          ),
                                                                                          proof(
                                                                                            goal(append([1, 0], [1], [1, 0, 1])),
                                                                                            by(builtin(append, 3))
                                                                                          )
                                                                                        ])
                                                                                      ),
                                                                                      proof(
                                                                                        goal(append([1, 0, 1], [0], [1, 0, 1, 0])),
                                                                                        by(builtin(append, 3))
                                                                                      )
                                                                                    ])
                                                                                  ),
                                                                                  proof(
                                                                                    goal(append([1, 0, 1, 0], [1, 0, #], [1, 0, 1, 0, 1, 0, #])),
                                                                                    by(builtin(append, 3))
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
            ])
          )
        ])
      )
    ])
  )
).

addsOne(case2, true).
why(
  addsOne(case2, true),
  proof(
    goal(addsOne(case2, true)),
    by(rule("turing.pl", clause(29))),
    bindings([binding("Case", case2), binding("InTape", [1, 0, 1, 1, 1, 1]), binding("_OutTape", [1, 1, 0, 0, 0, 0, #])]),
    uses([
      proof(
        goal(case(case2, [1, 0, 1, 1, 1, 1])),
        by(fact("turing.pl", clause(24)))
      ),
      proof(
        goal(compute([1, 0, 1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
        by(rule("turing.pl", clause(5))),
        bindings([binding("Head", 1), binding("Tail", [0, 1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], 1, [0, 1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", 1), binding("Right", [0, 1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1]), binding("B", 0), binding("C", [1, 1, 1, 1])]),
            uses([
              proof(
                goal(t([0, 1, 1, r], 0)),
                by(fact("turing.pl", clause(18)))
              ),
              proof(
                goal(move(r, [], 1, [0, 1, 1, 1, 1], [1], 0, [1, 1, 1, 1])),
                by(fact("turing.pl", clause(13))),
                bindings([binding("Left", []), binding("Cell", 1), binding("Head", 0), binding("Tail", [1, 1, 1, 1])])
              ),
              proof(
                goal(continue(0, [1], 0, [1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                uses([
                  proof(
                    goal(find(0, [1], 0, [1, 1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 0), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", r), binding("Next", 0), binding("A", [0, 1]), binding("B", 1), binding("C", [1, 1, 1])]),
                    uses([
                      proof(
                        goal(t([0, 0, 0, r], 0)),
                        by(fact("turing.pl", clause(17)))
                      ),
                      proof(
                        goal(move(r, [1], 0, [1, 1, 1, 1], [0, 1], 1, [1, 1, 1])),
                        by(fact("turing.pl", clause(13))),
                        bindings([binding("Left", [1]), binding("Cell", 0), binding("Head", 1), binding("Tail", [1, 1, 1])])
                      ),
                      proof(
                        goal(continue(0, [0, 1], 1, [1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                        by(rule("turing.pl", clause(8))),
                        bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                        uses([
                          proof(
                            goal(find(0, [0, 1], 1, [1, 1, 1], [1, 1, 0, 0, 0, 0, #])),
                            by(rule("turing.pl", clause(6))),
                            bindings([binding("State", 0), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 0, 1]), binding("B", 1), binding("C", [1, 1])]),
                            uses([
                              proof(
                                goal(t([0, 1, 1, r], 0)),
                                by(fact("turing.pl", clause(18)))
                              ),
                              proof(
                                goal(move(r, [0, 1], 1, [1, 1, 1], [1, 0, 1], 1, [1, 1])),
                                by(fact("turing.pl", clause(13))),
                                bindings([binding("Left", [0, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1])])
                              ),
                              proof(
                                goal(continue(0, [1, 0, 1], 1, [1, 1], [1, 1, 0, 0, 0, 0, #])),
                                by(rule("turing.pl", clause(8))),
                                bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                uses([
                                  proof(
                                    goal(find(0, [1, 0, 1], 1, [1, 1], [1, 1, 0, 0, 0, 0, #])),
                                    by(rule("turing.pl", clause(6))),
                                    bindings([binding("State", 0), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 0, 1]), binding("B", 1), binding("C", [1])]),
                                    uses([
                                      proof(
                                        goal(t([0, 1, 1, r], 0)),
                                        by(fact("turing.pl", clause(18)))
                                      ),
                                      proof(
                                        goal(move(r, [1, 0, 1], 1, [1, 1], [1, 1, 0, 1], 1, [1])),
                                        by(fact("turing.pl", clause(13))),
                                        bindings([binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1])])
                                      ),
                                      proof(
                                        goal(continue(0, [1, 1, 0, 1], 1, [1], [1, 1, 0, 0, 0, 0, #])),
                                        by(rule("turing.pl", clause(8))),
                                        bindings([binding("State", 0), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                        uses([
                                          proof(
                                            goal(find(0, [1, 1, 0, 1], 1, [1], [1, 1, 0, 0, 0, 0, #])),
                                            by(rule("turing.pl", clause(6))),
                                            bindings([binding("State", 0), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 0, 1]), binding("B", 1), binding("C", [])]),
                                            uses([
                                              proof(
                                                goal(t([0, 1, 1, r], 0)),
                                                by(fact("turing.pl", clause(18)))
                                              ),
                                              proof(
                                                goal(move(r, [1, 1, 0, 1], 1, [1], [1, 1, 1, 0, 1], 1, [])),
                                                by(fact("turing.pl", clause(13))),
                                                bindings([binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [])])
                                              ),
                                              proof(
                                                goal(continue(0, [1, 1, 1, 0, 1], 1, [], [1, 1, 0, 0, 0, 0, #])),
                                                by(rule("turing.pl", clause(8))),
                                                bindings([binding("State", 0), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                uses([
                                                  proof(
                                                    goal(find(0, [1, 1, 1, 0, 1], 1, [], [1, 1, 0, 0, 0, 0, #])),
                                                    by(rule("turing.pl", clause(6))),
                                                    bindings([binding("State", 0), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1, 0, 1]), binding("B", #), binding("C", [])]),
                                                    uses([
                                                      proof(
                                                        goal(t([0, 1, 1, r], 0)),
                                                        by(fact("turing.pl", clause(18)))
                                                      ),
                                                      proof(
                                                        goal(move(r, [1, 1, 1, 0, 1], 1, [], [1, 1, 1, 1, 0, 1], #, [])),
                                                        by(fact("turing.pl", clause(12))),
                                                        bindings([binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1)])
                                                      ),
                                                      proof(
                                                        goal(continue(0, [1, 1, 1, 1, 0, 1], #, [], [1, 1, 0, 0, 0, 0, #])),
                                                        by(rule("turing.pl", clause(8))),
                                                        bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                        uses([
                                                          proof(
                                                            goal(find(0, [1, 1, 1, 1, 0, 1], #, [], [1, 1, 0, 0, 0, 0, #])),
                                                            by(rule("turing.pl", clause(6))),
                                                            bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 0, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1, 0, 1]), binding("B", 1), binding("C", [#])]),
                                                            uses([
                                                              proof(
                                                                goal(t([0, #, #, l], 1)),
                                                                by(fact("turing.pl", clause(19)))
                                                              ),
                                                              proof(
                                                                goal(move(l, [1, 1, 1, 1, 0, 1], #, [], [1, 1, 1, 0, 1], 1, [#])),
                                                                by(fact("turing.pl", clause(10))),
                                                                bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 0, 1]), binding("Cell", #), binding("Right", [])])
                                                              ),
                                                              proof(
                                                                goal(continue(1, [1, 1, 1, 0, 1], 1, [#], [1, 1, 0, 0, 0, 0, #])),
                                                                by(rule("turing.pl", clause(8))),
                                                                bindings([binding("State", 1), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                uses([
                                                                  proof(
                                                                    goal(find(1, [1, 1, 1, 0, 1], 1, [#], [1, 1, 0, 0, 0, 0, #])),
                                                                    by(rule("turing.pl", clause(6))),
                                                                    bindings([binding("State", 1), binding("Left", [1, 1, 1, 0, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 0, 1]), binding("B", 1), binding("C", [0, #])]),
                                                                    uses([
                                                                      proof(
                                                                        goal(t([1, 1, 0, l], 1)),
                                                                        by(fact("turing.pl", clause(21)))
                                                                      ),
                                                                      proof(
                                                                        goal(move(l, [1, 1, 1, 0, 1], 0, [#], [1, 1, 0, 1], 1, [0, #])),
                                                                        by(fact("turing.pl", clause(10))),
                                                                        bindings([binding("Head", 1), binding("Tail", [1, 1, 0, 1]), binding("Cell", 0), binding("Right", [#])])
                                                                      ),
                                                                      proof(
                                                                        goal(continue(1, [1, 1, 0, 1], 1, [0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                        by(rule("turing.pl", clause(8))),
                                                                        bindings([binding("State", 1), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                        uses([
                                                                          proof(
                                                                            goal(find(1, [1, 1, 0, 1], 1, [0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                            by(rule("turing.pl", clause(6))),
                                                                            bindings([binding("State", 1), binding("Left", [1, 1, 0, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 0, 1]), binding("B", 1), binding("C", [0, 0, #])]),
                                                                            uses([
                                                                              proof(
                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                by(fact("turing.pl", clause(21)))
                                                                              ),
                                                                              proof(
                                                                                goal(move(l, [1, 1, 0, 1], 0, [0, #], [1, 0, 1], 1, [0, 0, #])),
                                                                                by(fact("turing.pl", clause(10))),
                                                                                bindings([binding("Head", 1), binding("Tail", [1, 0, 1]), binding("Cell", 0), binding("Right", [0, #])])
                                                                              ),
                                                                              proof(
                                                                                goal(continue(1, [1, 0, 1], 1, [0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                by(rule("turing.pl", clause(8))),
                                                                                bindings([binding("State", 1), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                                uses([
                                                                                  proof(
                                                                                    goal(find(1, [1, 0, 1], 1, [0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                    by(rule("turing.pl", clause(6))),
                                                                                    bindings([binding("State", 1), binding("Left", [1, 0, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [0, 1]), binding("B", 1), binding("C", [0, 0, 0, #])]),
                                                                                    uses([
                                                                                      proof(
                                                                                        goal(t([1, 1, 0, l], 1)),
                                                                                        by(fact("turing.pl", clause(21)))
                                                                                      ),
                                                                                      proof(
                                                                                        goal(move(l, [1, 0, 1], 0, [0, 0, #], [0, 1], 1, [0, 0, 0, #])),
                                                                                        by(fact("turing.pl", clause(10))),
                                                                                        bindings([binding("Head", 1), binding("Tail", [0, 1]), binding("Cell", 0), binding("Right", [0, 0, #])])
                                                                                      ),
                                                                                      proof(
                                                                                        goal(continue(1, [0, 1], 1, [0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                        by(rule("turing.pl", clause(8))),
                                                                                        bindings([binding("State", 1), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                                        uses([
                                                                                          proof(
                                                                                            goal(find(1, [0, 1], 1, [0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                            by(rule("turing.pl", clause(6))),
                                                                                            bindings([binding("State", 1), binding("Left", [0, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1]), binding("B", 0), binding("C", [0, 0, 0, 0, #])]),
                                                                                            uses([
                                                                                              proof(
                                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                                by(fact("turing.pl", clause(21)))
                                                                                              ),
                                                                                              proof(
                                                                                                goal(move(l, [0, 1], 0, [0, 0, 0, #], [1], 0, [0, 0, 0, 0, #])),
                                                                                                by(fact("turing.pl", clause(10))),
                                                                                                bindings([binding("Head", 0), binding("Tail", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, #])])
                                                                                              ),
                                                                                              proof(
                                                                                                goal(continue(1, [1], 0, [0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                by(rule("turing.pl", clause(8))),
                                                                                                bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #])]),
                                                                                                uses([
                                                                                                  proof(
                                                                                                    goal(find(1, [1], 0, [0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                    by(rule("turing.pl", clause(6))),
                                                                                                    bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", [1]), binding("B", 1), binding("C", [0, 0, 0, 0, #])]),
                                                                                                    uses([
                                                                                                      proof(
                                                                                                        goal(t([1, 0, 1, s], halt)),
                                                                                                        by(fact("turing.pl", clause(20)))
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(move(s, [1], 1, [0, 0, 0, 0, #], [1], 1, [0, 0, 0, 0, #])),
                                                                                                        by(fact("turing.pl", clause(11))),
                                                                                                        bindings([binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #])])
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(continue(halt, [1], 1, [0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                        by(rule("turing.pl", clause(7))),
                                                                                                        bindings([binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 1, 0, 0, 0, 0, #]), binding("R", [1])]),
                                                                                                        uses([
                                                                                                          proof(
                                                                                                            goal(rever([1], [1])),
                                                                                                            by(rule("turing.pl", clause(15))),
                                                                                                            bindings([binding("A", 1), binding("B", []), binding("C", [1]), binding("D", [])]),
                                                                                                            uses([
                                                                                                              proof(
                                                                                                                goal(rever([], [])),
                                                                                                                by(fact("turing.pl", clause(14)))
                                                                                                              ),
                                                                                                              proof(
                                                                                                                goal(append([], [1], [1])),
                                                                                                                by(builtin(append, 3))
                                                                                                              )
                                                                                                            ])
                                                                                                          ),
                                                                                                          proof(
                                                                                                            goal(append([1], [1, 0, 0, 0, 0, #], [1, 1, 0, 0, 0, 0, #])),
                                                                                                            by(builtin(append, 3))
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

addsOne(case3, true).
why(
  addsOne(case3, true),
  proof(
    goal(addsOne(case3, true)),
    by(rule("turing.pl", clause(29))),
    bindings([binding("Case", case3), binding("InTape", [1, 1, 1, 1, 1, 1]), binding("_OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
    uses([
      proof(
        goal(case(case3, [1, 1, 1, 1, 1, 1])),
        by(fact("turing.pl", clause(25)))
      ),
      proof(
        goal(compute([1, 1, 1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
        by(rule("turing.pl", clause(5))),
        bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], 1, [1, 1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", 1), binding("Right", [1, 1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1]), binding("B", 1), binding("C", [1, 1, 1, 1])]),
            uses([
              proof(
                goal(t([0, 1, 1, r], 0)),
                by(fact("turing.pl", clause(18)))
              ),
              proof(
                goal(move(r, [], 1, [1, 1, 1, 1, 1], [1], 1, [1, 1, 1, 1])),
                by(fact("turing.pl", clause(13))),
                bindings([binding("Left", []), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1, 1, 1])])
              ),
              proof(
                goal(continue(0, [1], 1, [1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 1), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                uses([
                  proof(
                    goal(find(0, [1], 1, [1, 1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 0), binding("Left", [1]), binding("Cell", 1), binding("Right", [1, 1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1]), binding("B", 1), binding("C", [1, 1, 1])]),
                    uses([
                      proof(
                        goal(t([0, 1, 1, r], 0)),
                        by(fact("turing.pl", clause(18)))
                      ),
                      proof(
                        goal(move(r, [1], 1, [1, 1, 1, 1], [1, 1], 1, [1, 1, 1])),
                        by(fact("turing.pl", clause(13))),
                        bindings([binding("Left", [1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1, 1])])
                      ),
                      proof(
                        goal(continue(0, [1, 1], 1, [1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                        by(rule("turing.pl", clause(8))),
                        bindings([binding("State", 0), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                        uses([
                          proof(
                            goal(find(0, [1, 1], 1, [1, 1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                            by(rule("turing.pl", clause(6))),
                            bindings([binding("State", 0), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [1, 1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1]), binding("B", 1), binding("C", [1, 1])]),
                            uses([
                              proof(
                                goal(t([0, 1, 1, r], 0)),
                                by(fact("turing.pl", clause(18)))
                              ),
                              proof(
                                goal(move(r, [1, 1], 1, [1, 1, 1], [1, 1, 1], 1, [1, 1])),
                                by(fact("turing.pl", clause(13))),
                                bindings([binding("Left", [1, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1, 1])])
                              ),
                              proof(
                                goal(continue(0, [1, 1, 1], 1, [1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                                by(rule("turing.pl", clause(8))),
                                bindings([binding("State", 0), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                uses([
                                  proof(
                                    goal(find(0, [1, 1, 1], 1, [1, 1], [1, 0, 0, 0, 0, 0, 0, #])),
                                    by(rule("turing.pl", clause(6))),
                                    bindings([binding("State", 0), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [1, 1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1]), binding("B", 1), binding("C", [1])]),
                                    uses([
                                      proof(
                                        goal(t([0, 1, 1, r], 0)),
                                        by(fact("turing.pl", clause(18)))
                                      ),
                                      proof(
                                        goal(move(r, [1, 1, 1], 1, [1, 1], [1, 1, 1, 1], 1, [1])),
                                        by(fact("turing.pl", clause(13))),
                                        bindings([binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [1])])
                                      ),
                                      proof(
                                        goal(continue(0, [1, 1, 1, 1], 1, [1], [1, 0, 0, 0, 0, 0, 0, #])),
                                        by(rule("turing.pl", clause(8))),
                                        bindings([binding("State", 0), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                        uses([
                                          proof(
                                            goal(find(0, [1, 1, 1, 1], 1, [1], [1, 0, 0, 0, 0, 0, 0, #])),
                                            by(rule("turing.pl", clause(6))),
                                            bindings([binding("State", 0), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [1]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1, 1]), binding("B", 1), binding("C", [])]),
                                            uses([
                                              proof(
                                                goal(t([0, 1, 1, r], 0)),
                                                by(fact("turing.pl", clause(18)))
                                              ),
                                              proof(
                                                goal(move(r, [1, 1, 1, 1], 1, [1], [1, 1, 1, 1, 1], 1, [])),
                                                by(fact("turing.pl", clause(13))),
                                                bindings([binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Head", 1), binding("Tail", [])])
                                              ),
                                              proof(
                                                goal(continue(0, [1, 1, 1, 1, 1], 1, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                by(rule("turing.pl", clause(8))),
                                                bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                uses([
                                                  proof(
                                                    goal(find(0, [1, 1, 1, 1, 1], 1, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                    by(rule("turing.pl", clause(6))),
                                                    bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", r), binding("Next", 0), binding("A", [1, 1, 1, 1, 1, 1]), binding("B", #), binding("C", [])]),
                                                    uses([
                                                      proof(
                                                        goal(t([0, 1, 1, r], 0)),
                                                        by(fact("turing.pl", clause(18)))
                                                      ),
                                                      proof(
                                                        goal(move(r, [1, 1, 1, 1, 1], 1, [], [1, 1, 1, 1, 1, 1], #, [])),
                                                        by(fact("turing.pl", clause(12))),
                                                        bindings([binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1)])
                                                      ),
                                                      proof(
                                                        goal(continue(0, [1, 1, 1, 1, 1, 1], #, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                        by(rule("turing.pl", clause(8))),
                                                        bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                        uses([
                                                          proof(
                                                            goal(find(0, [1, 1, 1, 1, 1, 1], #, [], [1, 0, 0, 0, 0, 0, 0, #])),
                                                            by(rule("turing.pl", clause(6))),
                                                            bindings([binding("State", 0), binding("Left", [1, 1, 1, 1, 1, 1]), binding("Cell", #), binding("Right", []), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1, 1, 1]), binding("B", 1), binding("C", [#])]),
                                                            uses([
                                                              proof(
                                                                goal(t([0, #, #, l], 1)),
                                                                by(fact("turing.pl", clause(19)))
                                                              ),
                                                              proof(
                                                                goal(move(l, [1, 1, 1, 1, 1, 1], #, [], [1, 1, 1, 1, 1], 1, [#])),
                                                                by(fact("turing.pl", clause(10))),
                                                                bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 1, 1]), binding("Cell", #), binding("Right", [])])
                                                              ),
                                                              proof(
                                                                goal(continue(1, [1, 1, 1, 1, 1], 1, [#], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                by(rule("turing.pl", clause(8))),
                                                                bindings([binding("State", 1), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                uses([
                                                                  proof(
                                                                    goal(find(1, [1, 1, 1, 1, 1], 1, [#], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                    by(rule("turing.pl", clause(6))),
                                                                    bindings([binding("State", 1), binding("Left", [1, 1, 1, 1, 1]), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1, 1]), binding("B", 1), binding("C", [0, #])]),
                                                                    uses([
                                                                      proof(
                                                                        goal(t([1, 1, 0, l], 1)),
                                                                        by(fact("turing.pl", clause(21)))
                                                                      ),
                                                                      proof(
                                                                        goal(move(l, [1, 1, 1, 1, 1], 0, [#], [1, 1, 1, 1], 1, [0, #])),
                                                                        by(fact("turing.pl", clause(10))),
                                                                        bindings([binding("Head", 1), binding("Tail", [1, 1, 1, 1]), binding("Cell", 0), binding("Right", [#])])
                                                                      ),
                                                                      proof(
                                                                        goal(continue(1, [1, 1, 1, 1], 1, [0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                        by(rule("turing.pl", clause(8))),
                                                                        bindings([binding("State", 1), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                        uses([
                                                                          proof(
                                                                            goal(find(1, [1, 1, 1, 1], 1, [0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                            by(rule("turing.pl", clause(6))),
                                                                            bindings([binding("State", 1), binding("Left", [1, 1, 1, 1]), binding("Cell", 1), binding("Right", [0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1, 1]), binding("B", 1), binding("C", [0, 0, #])]),
                                                                            uses([
                                                                              proof(
                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                by(fact("turing.pl", clause(21)))
                                                                              ),
                                                                              proof(
                                                                                goal(move(l, [1, 1, 1, 1], 0, [0, #], [1, 1, 1], 1, [0, 0, #])),
                                                                                by(fact("turing.pl", clause(10))),
                                                                                bindings([binding("Head", 1), binding("Tail", [1, 1, 1]), binding("Cell", 0), binding("Right", [0, #])])
                                                                              ),
                                                                              proof(
                                                                                goal(continue(1, [1, 1, 1], 1, [0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                by(rule("turing.pl", clause(8))),
                                                                                bindings([binding("State", 1), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                uses([
                                                                                  proof(
                                                                                    goal(find(1, [1, 1, 1], 1, [0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                    by(rule("turing.pl", clause(6))),
                                                                                    bindings([binding("State", 1), binding("Left", [1, 1, 1]), binding("Cell", 1), binding("Right", [0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1, 1]), binding("B", 1), binding("C", [0, 0, 0, #])]),
                                                                                    uses([
                                                                                      proof(
                                                                                        goal(t([1, 1, 0, l], 1)),
                                                                                        by(fact("turing.pl", clause(21)))
                                                                                      ),
                                                                                      proof(
                                                                                        goal(move(l, [1, 1, 1], 0, [0, 0, #], [1, 1], 1, [0, 0, 0, #])),
                                                                                        by(fact("turing.pl", clause(10))),
                                                                                        bindings([binding("Head", 1), binding("Tail", [1, 1]), binding("Cell", 0), binding("Right", [0, 0, #])])
                                                                                      ),
                                                                                      proof(
                                                                                        goal(continue(1, [1, 1], 1, [0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                        by(rule("turing.pl", clause(8))),
                                                                                        bindings([binding("State", 1), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                        uses([
                                                                                          proof(
                                                                                            goal(find(1, [1, 1], 1, [0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                            by(rule("turing.pl", clause(6))),
                                                                                            bindings([binding("State", 1), binding("Left", [1, 1]), binding("Cell", 1), binding("Right", [0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", [1]), binding("B", 1), binding("C", [0, 0, 0, 0, #])]),
                                                                                            uses([
                                                                                              proof(
                                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                                by(fact("turing.pl", clause(21)))
                                                                                              ),
                                                                                              proof(
                                                                                                goal(move(l, [1, 1], 0, [0, 0, 0, #], [1], 1, [0, 0, 0, 0, #])),
                                                                                                by(fact("turing.pl", clause(10))),
                                                                                                bindings([binding("Head", 1), binding("Tail", [1]), binding("Cell", 0), binding("Right", [0, 0, 0, #])])
                                                                                              ),
                                                                                              proof(
                                                                                                goal(continue(1, [1], 1, [0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                by(rule("turing.pl", clause(8))),
                                                                                                bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                                uses([
                                                                                                  proof(
                                                                                                    goal(find(1, [1], 1, [0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                    by(rule("turing.pl", clause(6))),
                                                                                                    bindings([binding("State", 1), binding("Left", [1]), binding("Cell", 1), binding("Right", [0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", []), binding("B", 1), binding("C", [0, 0, 0, 0, 0, #])]),
                                                                                                    uses([
                                                                                                      proof(
                                                                                                        goal(t([1, 1, 0, l], 1)),
                                                                                                        by(fact("turing.pl", clause(21)))
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(move(l, [1], 0, [0, 0, 0, 0, #], [], 1, [0, 0, 0, 0, 0, #])),
                                                                                                        by(fact("turing.pl", clause(10))),
                                                                                                        bindings([binding("Head", 1), binding("Tail", []), binding("Cell", 0), binding("Right", [0, 0, 0, 0, #])])
                                                                                                      ),
                                                                                                      proof(
                                                                                                        goal(continue(1, [], 1, [0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                        by(rule("turing.pl", clause(8))),
                                                                                                        bindings([binding("State", 1), binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                                        uses([
                                                                                                          proof(
                                                                                                            goal(find(1, [], 1, [0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                            by(rule("turing.pl", clause(6))),
                                                                                                            bindings([binding("State", 1), binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 0), binding("Move", l), binding("Next", 1), binding("A", []), binding("B", #), binding("C", [0, 0, 0, 0, 0, 0, #])]),
                                                                                                            uses([
                                                                                                              proof(
                                                                                                                goal(t([1, 1, 0, l], 1)),
                                                                                                                by(fact("turing.pl", clause(21)))
                                                                                                              ),
                                                                                                              proof(
                                                                                                                goal(move(l, [], 0, [0, 0, 0, 0, 0, #], [], #, [0, 0, 0, 0, 0, 0, #])),
                                                                                                                by(fact("turing.pl", clause(9))),
                                                                                                                bindings([binding("Cell", 0), binding("Right", [0, 0, 0, 0, 0, #])])
                                                                                                              ),
                                                                                                              proof(
                                                                                                                goal(continue(1, [], #, [0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                by(rule("turing.pl", clause(8))),
                                                                                                                bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [0, 0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #])]),
                                                                                                                uses([
                                                                                                                  proof(
                                                                                                                    goal(find(1, [], #, [0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                    by(rule("turing.pl", clause(6))),
                                                                                                                    bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [0, 0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", []), binding("B", 1), binding("C", [0, 0, 0, 0, 0, 0, #])]),
                                                                                                                    uses([
                                                                                                                      proof(
                                                                                                                        goal(t([1, #, 1, s], halt)),
                                                                                                                        by(fact("turing.pl", clause(22)))
                                                                                                                      ),
                                                                                                                      proof(
                                                                                                                        goal(move(s, [], 1, [0, 0, 0, 0, 0, 0, #], [], 1, [0, 0, 0, 0, 0, 0, #])),
                                                                                                                        by(fact("turing.pl", clause(11))),
                                                                                                                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, 0, #])])
                                                                                                                      ),
                                                                                                                      proof(
                                                                                                                        goal(continue(halt, [], 1, [0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                        by(rule("turing.pl", clause(7))),
                                                                                                                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [0, 0, 0, 0, 0, 0, #]), binding("OutTape", [1, 0, 0, 0, 0, 0, 0, #]), binding("R", [])]),
                                                                                                                        uses([
                                                                                                                          proof(
                                                                                                                            goal(rever([], [])),
                                                                                                                            by(fact("turing.pl", clause(14)))
                                                                                                                          ),
                                                                                                                          proof(
                                                                                                                            goal(append([], [1, 0, 0, 0, 0, 0, 0, #], [1, 0, 0, 0, 0, 0, 0, #])),
                                                                                                                            by(builtin(append, 3))
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

addsOne(case4, true).
why(
  addsOne(case4, true),
  proof(
    goal(addsOne(case4, true)),
    by(rule("turing.pl", clause(29))),
    bindings([binding("Case", case4), binding("InTape", []), binding("_OutTape", [1, #])]),
    uses([
      proof(
        goal(case(case4, [])),
        by(fact("turing.pl", clause(26)))
      ),
      proof(
        goal(compute([], [1, #])),
        by(rule("turing.pl", clause(4))),
        bindings([binding("OutTape", [1, #]), binding("_Machine", add1), binding("I", 0)]),
        uses([
          proof(
            goal(start(add1, 0)),
            by(fact("turing.pl", clause(16)))
          ),
          proof(
            goal(find(0, [], #, [], [1, #])),
            by(rule("turing.pl", clause(6))),
            bindings([binding("State", 0), binding("Left", []), binding("Cell", #), binding("Right", []), binding("OutTape", [1, #]), binding("Write", #), binding("Move", l), binding("Next", 1), binding("A", []), binding("B", #), binding("C", [#])]),
            uses([
              proof(
                goal(t([0, #, #, l], 1)),
                by(fact("turing.pl", clause(19)))
              ),
              proof(
                goal(move(l, [], #, [], [], #, [#])),
                by(fact("turing.pl", clause(9))),
                bindings([binding("Cell", #), binding("Right", [])])
              ),
              proof(
                goal(continue(1, [], #, [#], [1, #])),
                by(rule("turing.pl", clause(8))),
                bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [#]), binding("OutTape", [1, #])]),
                uses([
                  proof(
                    goal(find(1, [], #, [#], [1, #])),
                    by(rule("turing.pl", clause(6))),
                    bindings([binding("State", 1), binding("Left", []), binding("Cell", #), binding("Right", [#]), binding("OutTape", [1, #]), binding("Write", 1), binding("Move", s), binding("Next", halt), binding("A", []), binding("B", 1), binding("C", [#])]),
                    uses([
                      proof(
                        goal(t([1, #, 1, s], halt)),
                        by(fact("turing.pl", clause(22)))
                      ),
                      proof(
                        goal(move(s, [], 1, [#], [], 1, [#])),
                        by(fact("turing.pl", clause(11))),
                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [#])])
                      ),
                      proof(
                        goal(continue(halt, [], 1, [#], [1, #])),
                        by(rule("turing.pl", clause(7))),
                        bindings([binding("Left", []), binding("Cell", 1), binding("Right", [#]), binding("OutTape", [1, #]), binding("R", [])]),
                        uses([
                          proof(
                            goal(rever([], [])),
                            by(fact("turing.pl", clause(14)))
                          ),
                          proof(
                            goal(append([], [1, #], [1, #])),
                            by(builtin(append, 3))
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

