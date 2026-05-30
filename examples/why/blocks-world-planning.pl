status(blocks_world, planned).
why(
  status(blocks_world, planned),
  proof(
    goal(status(blocks_world, planned)), by(rule("blocks-world-planning.pl", clause(21))),
    bindings([binding("_Moves", [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("_Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])]),
    uses([
      proof(
        goal(once(five_move_plan([move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]))), by(builtin(once, 1)),
        uses([
          proof(
            goal(five_move_plan([move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(20))),
            bindings([binding("Moves", [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Start", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("SortedStart", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("SortedGoal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])]),
            uses([
              proof(goal(initial([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(5)))),
              proof(goal(goal([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(6)))),
              proof(goal(sort([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(builtin(sort, 2))),
              proof(goal(sort([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(sort, 2))),
              proof(
                goal(plan([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 5, [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 5), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(e, d, table)), binding("Moves", [move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("RestDepth", 4)]),
                uses([
                  proof(goal(gt(5, 0)), by(builtin(gt, 2))),
                  proof(
                    goal(move([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], move(e, d, table), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                    bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Block", e), binding("From", d), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, b), on(d, c)])]),
                    uses([
                      proof(goal(member(on(e, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(builtin(member, 2))),
                      proof(
                        goal(clear(e, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(14))),
                        bindings([binding("Block", e), binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])]),
                        uses([
                          proof(goal(not(member(on(_Other, e), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]))), by(builtin(not, 1)))
                        ])
                      ),
                      proof(
                        goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(12))),
                        bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])])
                      ),
                      proof(
                        goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(15))),
                        bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])])
                      ),
                      proof(goal(neq(e, table)), by(builtin(neq, 2))),
                      proof(goal(neq(d, table)), by(builtin(neq, 2))),
                      proof(goal(select(on(e, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, b), on(d, c)])), by(builtin(select, 3))),
                      proof(goal(sort([on(e, table), on(a, table), on(b, a), on(c, b), on(d, c)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(builtin(sort, 2)))
                    ])
                  ),
                  proof(goal(not_member([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                  proof(goal(sub(5, 1, 4)), by(builtin(sub, 3))),
                  proof(
                    goal(plan([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 4, [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                    bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 4), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(d, c, table)), binding("Moves", [move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("RestDepth", 3)]),
                    uses([
                      proof(goal(gt(4, 0)), by(builtin(gt, 2))),
                      proof(
                        goal(move([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], move(d, c, table), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                        bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Block", d), binding("From", c), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, b), on(e, table)])]),
                        uses([
                          proof(goal(member(on(d, c), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(builtin(member, 2))),
                          proof(
                            goal(clear(d, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                            bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])]),
                            uses([
                              proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                            ])
                          ),
                          proof(
                            goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(fact("blocks-world-planning.pl", clause(12))),
                            bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])])
                          ),
                          proof(
                            goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(fact("blocks-world-planning.pl", clause(15))),
                            bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])])
                          ),
                          proof(goal(neq(d, table)), by(builtin(neq, 2))),
                          proof(goal(neq(c, table)), by(builtin(neq, 2))),
                          proof(goal(select(on(d, c), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(e, table)])), by(builtin(select, 3))),
                          proof(goal(sort([on(d, table), on(a, table), on(b, a), on(c, b), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(builtin(sort, 2)))
                        ])
                      ),
                      proof(goal(not_member([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                      proof(goal(sub(4, 1, 3)), by(builtin(sub, 3))),
                      proof(
                        goal(plan([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 3, [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                        bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 3), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(c, b, table)), binding("Moves", [move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("RestDepth", 2)]),
                        uses([
                          proof(goal(gt(3, 0)), by(builtin(gt, 2))),
                          proof(
                            goal(move([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], move(c, b, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                            bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Block", c), binding("From", b), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(d, table), on(e, table)])]),
                            uses([
                              proof(goal(member(on(c, b), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(builtin(member, 2))),
                              proof(
                                goal(clear(c, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])]),
                                uses([
                                  proof(goal(not(member(on(_Other, c), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                ])
                              ),
                              proof(
                                goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(fact("blocks-world-planning.pl", clause(12))),
                                bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])])
                              ),
                              proof(
                                goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(fact("blocks-world-planning.pl", clause(15))),
                                bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])])
                              ),
                              proof(goal(neq(c, table)), by(builtin(neq, 2))),
                              proof(goal(neq(b, table)), by(builtin(neq, 2))),
                              proof(goal(select(on(c, b), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(d, table), on(e, table)])), by(builtin(select, 3))),
                              proof(goal(sort([on(c, table), on(a, table), on(b, a), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(sort, 2)))
                            ])
                          ),
                          proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                          proof(goal(sub(3, 1, 2)), by(builtin(sub, 3))),
                          proof(
                            goal(plan([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 2, [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                            bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 2), binding("Visited", [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(d, table, c)), binding("Moves", [move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("RestDepth", 1)]),
                            uses([
                              proof(goal(gt(2, 0)), by(builtin(gt, 2))),
                              proof(
                                goal(move([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], move(d, table, c), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                                bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Block", d), binding("From", table), binding("To", c), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, table), on(e, table)])]),
                                uses([
                                  proof(goal(member(on(d, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(member, 2))),
                                  proof(
                                    goal(clear(d, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                    bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                    uses([
                                      proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                    ])
                                  ),
                                  proof(
                                    goal(support(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(13))),
                                    bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("_Below", table)]),
                                    uses([
                                      proof(goal(block(c)), by(fact("blocks-world-planning.pl", clause(9)))),
                                      proof(goal(member(on(c, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(member, 2)))
                                    ])
                                  ),
                                  proof(
                                    goal(clear_support(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(16))),
                                    bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                    uses([
                                      proof(goal(block(c)), by(fact("blocks-world-planning.pl", clause(9)))),
                                      proof(
                                        goal(clear(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                        bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                        uses([
                                          proof(goal(not(member(on(_Other, c), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                        ])
                                      )
                                    ])
                                  ),
                                  proof(goal(neq(d, c)), by(builtin(neq, 2))),
                                  proof(goal(neq(table, c)), by(builtin(neq, 2))),
                                  proof(goal(select(on(d, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(e, table)])), by(builtin(select, 3))),
                                  proof(goal(sort([on(d, c), on(a, table), on(b, a), on(c, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(sort, 2)))
                                ])
                              ),
                              proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                              proof(goal(sub(2, 1, 1)), by(builtin(sub, 3))),
                              proof(
                                goal(plan([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 1, [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                                bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 1), binding("Visited", [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(e, table, d)), binding("Moves", []), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("RestDepth", 0)]),
                                uses([
                                  proof(goal(gt(1, 0)), by(builtin(gt, 2))),
                                  proof(
                                    goal(move([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], move(e, table, d), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(17))),
                                    bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Block", e), binding("From", table), binding("To", d), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Rest", [on(a, table), on(b, a), on(c, table), on(d, c)])]),
                                    uses([
                                      proof(goal(member(on(e, table), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(member, 2))),
                                      proof(
                                        goal(clear(e, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                        bindings([binding("Block", e), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                        uses([
                                          proof(goal(not(member(on(_Other, e), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                                        ])
                                      ),
                                      proof(
                                        goal(support(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(13))),
                                        bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("_Below", c)]),
                                        uses([
                                          proof(goal(block(d)), by(fact("blocks-world-planning.pl", clause(10)))),
                                          proof(goal(member(on(d, c), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(member, 2)))
                                        ])
                                      ),
                                      proof(
                                        goal(clear_support(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(16))),
                                        bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                        uses([
                                          proof(goal(block(d)), by(fact("blocks-world-planning.pl", clause(10)))),
                                          proof(
                                            goal(clear(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                            bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                            uses([
                                              proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                                            ])
                                          )
                                        ])
                                      ),
                                      proof(goal(neq(e, d)), by(builtin(neq, 2))),
                                      proof(goal(neq(table, d)), by(builtin(neq, 2))),
                                      proof(goal(select(on(e, table), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c)])), by(builtin(select, 3))),
                                      proof(goal(sort([on(e, d), on(a, table), on(b, a), on(c, table), on(d, c)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(sort, 2)))
                                    ])
                                  ),
                                  proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                                  proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                                  proof(
                                    goal(plan([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 0, [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(18))),
                                    bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("_Visited", [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])]),
                                    uses([
                                      proof(goal(eq([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(eq, 2)))
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      )
                    ])
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

plan(blocks_world, [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]).
why(
  plan(blocks_world, [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]),
  proof(
    goal(plan(blocks_world, [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)])), by(rule("blocks-world-planning.pl", clause(22))),
    bindings([binding("Moves", [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("_Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])]),
    uses([
      proof(
        goal(once(five_move_plan([move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]))), by(builtin(once, 1)),
        uses([
          proof(
            goal(five_move_plan([move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(20))),
            bindings([binding("Moves", [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Start", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("SortedStart", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("SortedGoal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])]),
            uses([
              proof(goal(initial([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(5)))),
              proof(goal(goal([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(6)))),
              proof(goal(sort([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(builtin(sort, 2))),
              proof(goal(sort([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(sort, 2))),
              proof(
                goal(plan([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 5, [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 5), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(e, d, table)), binding("Moves", [move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("RestDepth", 4)]),
                uses([
                  proof(goal(gt(5, 0)), by(builtin(gt, 2))),
                  proof(
                    goal(move([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], move(e, d, table), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                    bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Block", e), binding("From", d), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, b), on(d, c)])]),
                    uses([
                      proof(goal(member(on(e, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(builtin(member, 2))),
                      proof(
                        goal(clear(e, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(14))),
                        bindings([binding("Block", e), binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])]),
                        uses([
                          proof(goal(not(member(on(_Other, e), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]))), by(builtin(not, 1)))
                        ])
                      ),
                      proof(
                        goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(12))),
                        bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])])
                      ),
                      proof(
                        goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(15))),
                        bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])])
                      ),
                      proof(goal(neq(e, table)), by(builtin(neq, 2))),
                      proof(goal(neq(d, table)), by(builtin(neq, 2))),
                      proof(goal(select(on(e, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, b), on(d, c)])), by(builtin(select, 3))),
                      proof(goal(sort([on(e, table), on(a, table), on(b, a), on(c, b), on(d, c)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(builtin(sort, 2)))
                    ])
                  ),
                  proof(goal(not_member([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                  proof(goal(sub(5, 1, 4)), by(builtin(sub, 3))),
                  proof(
                    goal(plan([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 4, [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                    bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 4), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(d, c, table)), binding("Moves", [move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("RestDepth", 3)]),
                    uses([
                      proof(goal(gt(4, 0)), by(builtin(gt, 2))),
                      proof(
                        goal(move([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], move(d, c, table), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                        bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Block", d), binding("From", c), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, b), on(e, table)])]),
                        uses([
                          proof(goal(member(on(d, c), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(builtin(member, 2))),
                          proof(
                            goal(clear(d, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                            bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])]),
                            uses([
                              proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                            ])
                          ),
                          proof(
                            goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(fact("blocks-world-planning.pl", clause(12))),
                            bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])])
                          ),
                          proof(
                            goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(fact("blocks-world-planning.pl", clause(15))),
                            bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])])
                          ),
                          proof(goal(neq(d, table)), by(builtin(neq, 2))),
                          proof(goal(neq(c, table)), by(builtin(neq, 2))),
                          proof(goal(select(on(d, c), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(e, table)])), by(builtin(select, 3))),
                          proof(goal(sort([on(d, table), on(a, table), on(b, a), on(c, b), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(builtin(sort, 2)))
                        ])
                      ),
                      proof(goal(not_member([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                      proof(goal(sub(4, 1, 3)), by(builtin(sub, 3))),
                      proof(
                        goal(plan([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 3, [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                        bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 3), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(c, b, table)), binding("Moves", [move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("RestDepth", 2)]),
                        uses([
                          proof(goal(gt(3, 0)), by(builtin(gt, 2))),
                          proof(
                            goal(move([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], move(c, b, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                            bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Block", c), binding("From", b), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(d, table), on(e, table)])]),
                            uses([
                              proof(goal(member(on(c, b), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(builtin(member, 2))),
                              proof(
                                goal(clear(c, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])]),
                                uses([
                                  proof(goal(not(member(on(_Other, c), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                ])
                              ),
                              proof(
                                goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(fact("blocks-world-planning.pl", clause(12))),
                                bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])])
                              ),
                              proof(
                                goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(fact("blocks-world-planning.pl", clause(15))),
                                bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])])
                              ),
                              proof(goal(neq(c, table)), by(builtin(neq, 2))),
                              proof(goal(neq(b, table)), by(builtin(neq, 2))),
                              proof(goal(select(on(c, b), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(d, table), on(e, table)])), by(builtin(select, 3))),
                              proof(goal(sort([on(c, table), on(a, table), on(b, a), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(sort, 2)))
                            ])
                          ),
                          proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                          proof(goal(sub(3, 1, 2)), by(builtin(sub, 3))),
                          proof(
                            goal(plan([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 2, [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                            bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 2), binding("Visited", [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(d, table, c)), binding("Moves", [move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("RestDepth", 1)]),
                            uses([
                              proof(goal(gt(2, 0)), by(builtin(gt, 2))),
                              proof(
                                goal(move([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], move(d, table, c), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                                bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Block", d), binding("From", table), binding("To", c), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, table), on(e, table)])]),
                                uses([
                                  proof(goal(member(on(d, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(member, 2))),
                                  proof(
                                    goal(clear(d, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                    bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                    uses([
                                      proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                    ])
                                  ),
                                  proof(
                                    goal(support(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(13))),
                                    bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("_Below", table)]),
                                    uses([
                                      proof(goal(block(c)), by(fact("blocks-world-planning.pl", clause(9)))),
                                      proof(goal(member(on(c, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(member, 2)))
                                    ])
                                  ),
                                  proof(
                                    goal(clear_support(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(16))),
                                    bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                    uses([
                                      proof(goal(block(c)), by(fact("blocks-world-planning.pl", clause(9)))),
                                      proof(
                                        goal(clear(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                        bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                        uses([
                                          proof(goal(not(member(on(_Other, c), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                        ])
                                      )
                                    ])
                                  ),
                                  proof(goal(neq(d, c)), by(builtin(neq, 2))),
                                  proof(goal(neq(table, c)), by(builtin(neq, 2))),
                                  proof(goal(select(on(d, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(e, table)])), by(builtin(select, 3))),
                                  proof(goal(sort([on(d, c), on(a, table), on(b, a), on(c, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(sort, 2)))
                                ])
                              ),
                              proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                              proof(goal(sub(2, 1, 1)), by(builtin(sub, 3))),
                              proof(
                                goal(plan([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 1, [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                                bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 1), binding("Visited", [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(e, table, d)), binding("Moves", []), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("RestDepth", 0)]),
                                uses([
                                  proof(goal(gt(1, 0)), by(builtin(gt, 2))),
                                  proof(
                                    goal(move([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], move(e, table, d), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(17))),
                                    bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Block", e), binding("From", table), binding("To", d), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Rest", [on(a, table), on(b, a), on(c, table), on(d, c)])]),
                                    uses([
                                      proof(goal(member(on(e, table), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(member, 2))),
                                      proof(
                                        goal(clear(e, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                        bindings([binding("Block", e), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                        uses([
                                          proof(goal(not(member(on(_Other, e), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                                        ])
                                      ),
                                      proof(
                                        goal(support(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(13))),
                                        bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("_Below", c)]),
                                        uses([
                                          proof(goal(block(d)), by(fact("blocks-world-planning.pl", clause(10)))),
                                          proof(goal(member(on(d, c), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(member, 2)))
                                        ])
                                      ),
                                      proof(
                                        goal(clear_support(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(16))),
                                        bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                        uses([
                                          proof(goal(block(d)), by(fact("blocks-world-planning.pl", clause(10)))),
                                          proof(
                                            goal(clear(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                            bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                            uses([
                                              proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                                            ])
                                          )
                                        ])
                                      ),
                                      proof(goal(neq(e, d)), by(builtin(neq, 2))),
                                      proof(goal(neq(table, d)), by(builtin(neq, 2))),
                                      proof(goal(select(on(e, table), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c)])), by(builtin(select, 3))),
                                      proof(goal(sort([on(e, d), on(a, table), on(b, a), on(c, table), on(d, c)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(sort, 2)))
                                    ])
                                  ),
                                  proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                                  proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                                  proof(
                                    goal(plan([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 0, [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(18))),
                                    bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("_Visited", [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])]),
                                    uses([
                                      proof(goal(eq([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(eq, 2)))
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      )
                    ])
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

finalState(blocks_world, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]).
why(
  finalState(blocks_world, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]),
  proof(
    goal(finalState(blocks_world, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(23))),
    bindings([binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("_Moves", [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)])]),
    uses([
      proof(
        goal(once(five_move_plan([move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]))), by(builtin(once, 1)),
        uses([
          proof(
            goal(five_move_plan([move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(20))),
            bindings([binding("Moves", [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Start", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("SortedStart", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("SortedGoal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])]),
            uses([
              proof(goal(initial([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(5)))),
              proof(goal(goal([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(6)))),
              proof(goal(sort([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(builtin(sort, 2))),
              proof(goal(sort([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(sort, 2))),
              proof(
                goal(plan([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 5, [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(e, d, table), move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 5), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(e, d, table)), binding("Moves", [move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("RestDepth", 4)]),
                uses([
                  proof(goal(gt(5, 0)), by(builtin(gt, 2))),
                  proof(
                    goal(move([on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], move(e, d, table), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                    bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]), binding("Block", e), binding("From", d), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, b), on(d, c)])]),
                    uses([
                      proof(goal(member(on(e, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(builtin(member, 2))),
                      proof(
                        goal(clear(e, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(14))),
                        bindings([binding("Block", e), binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])]),
                        uses([
                          proof(goal(not(member(on(_Other, e), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]))), by(builtin(not, 1)))
                        ])
                      ),
                      proof(
                        goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(12))),
                        bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])])
                      ),
                      proof(
                        goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])), by(fact("blocks-world-planning.pl", clause(15))),
                        bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)])])
                      ),
                      proof(goal(neq(e, table)), by(builtin(neq, 2))),
                      proof(goal(neq(d, table)), by(builtin(neq, 2))),
                      proof(goal(select(on(e, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, b), on(d, c)])), by(builtin(select, 3))),
                      proof(goal(sort([on(e, table), on(a, table), on(b, a), on(c, b), on(d, c)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(builtin(sort, 2)))
                    ])
                  ),
                  proof(goal(not_member([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                  proof(goal(sub(5, 1, 4)), by(builtin(sub, 3))),
                  proof(
                    goal(plan([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 4, [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(d, c, table), move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                    bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 4), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(d, c, table)), binding("Moves", [move(c, b, table), move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("RestDepth", 3)]),
                    uses([
                      proof(goal(gt(4, 0)), by(builtin(gt, 2))),
                      proof(
                        goal(move([on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], move(d, c, table), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                        bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]), binding("Block", d), binding("From", c), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, b), on(e, table)])]),
                        uses([
                          proof(goal(member(on(d, c), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(builtin(member, 2))),
                          proof(
                            goal(clear(d, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                            bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])]),
                            uses([
                              proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                            ])
                          ),
                          proof(
                            goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(fact("blocks-world-planning.pl", clause(12))),
                            bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])])
                          ),
                          proof(
                            goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])), by(fact("blocks-world-planning.pl", clause(15))),
                            bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)])])
                          ),
                          proof(goal(neq(d, table)), by(builtin(neq, 2))),
                          proof(goal(neq(c, table)), by(builtin(neq, 2))),
                          proof(goal(select(on(d, c), [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(e, table)])), by(builtin(select, 3))),
                          proof(goal(sort([on(d, table), on(a, table), on(b, a), on(c, b), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(builtin(sort, 2)))
                        ])
                      ),
                      proof(goal(not_member([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                      proof(goal(sub(4, 1, 3)), by(builtin(sub, 3))),
                      proof(
                        goal(plan([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 3, [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(c, b, table), move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                        bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 3), binding("Visited", [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(c, b, table)), binding("Moves", [move(d, table, c), move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("RestDepth", 2)]),
                        uses([
                          proof(goal(gt(3, 0)), by(builtin(gt, 2))),
                          proof(
                            goal(move([on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], move(c, b, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                            bindings([binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]), binding("Block", c), binding("From", b), binding("To", table), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(d, table), on(e, table)])]),
                            uses([
                              proof(goal(member(on(c, b), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(builtin(member, 2))),
                              proof(
                                goal(clear(c, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])]),
                                uses([
                                  proof(goal(not(member(on(_Other, c), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                ])
                              ),
                              proof(
                                goal(support(table, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(fact("blocks-world-planning.pl", clause(12))),
                                bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])])
                              ),
                              proof(
                                goal(clear_support(table, [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])), by(fact("blocks-world-planning.pl", clause(15))),
                                bindings([binding("_State", [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)])])
                              ),
                              proof(goal(neq(c, table)), by(builtin(neq, 2))),
                              proof(goal(neq(b, table)), by(builtin(neq, 2))),
                              proof(goal(select(on(c, b), [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(d, table), on(e, table)])), by(builtin(select, 3))),
                              proof(goal(sort([on(c, table), on(a, table), on(b, a), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(sort, 2)))
                            ])
                          ),
                          proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [[on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                          proof(goal(sub(3, 1, 2)), by(builtin(sub, 3))),
                          proof(
                            goal(plan([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 2, [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(d, table, c), move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                            bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 2), binding("Visited", [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(d, table, c)), binding("Moves", [move(e, table, d)]), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("RestDepth", 1)]),
                            uses([
                              proof(goal(gt(2, 0)), by(builtin(gt, 2))),
                              proof(
                                goal(move([on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], move(d, table, c), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(17))),
                                bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("Block", d), binding("From", table), binding("To", c), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Rest", [on(a, table), on(b, a), on(c, table), on(e, table)])]),
                                uses([
                                  proof(goal(member(on(d, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(member, 2))),
                                  proof(
                                    goal(clear(d, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                    bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                    uses([
                                      proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                    ])
                                  ),
                                  proof(
                                    goal(support(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(13))),
                                    bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]), binding("_Below", table)]),
                                    uses([
                                      proof(goal(block(c)), by(fact("blocks-world-planning.pl", clause(9)))),
                                      proof(goal(member(on(c, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(builtin(member, 2)))
                                    ])
                                  ),
                                  proof(
                                    goal(clear_support(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(16))),
                                    bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                    uses([
                                      proof(goal(block(c)), by(fact("blocks-world-planning.pl", clause(9)))),
                                      proof(
                                        goal(clear(c, [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                        bindings([binding("Block", c), binding("State", [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)])]),
                                        uses([
                                          proof(goal(not(member(on(_Other, c), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)]))), by(builtin(not, 1)))
                                        ])
                                      )
                                    ])
                                  ),
                                  proof(goal(neq(d, c)), by(builtin(neq, 2))),
                                  proof(goal(neq(table, c)), by(builtin(neq, 2))),
                                  proof(goal(select(on(d, table), [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(e, table)])), by(builtin(select, 3))),
                                  proof(goal(sort([on(d, c), on(a, table), on(b, a), on(c, table), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(sort, 2)))
                                ])
                              ),
                              proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [[on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                              proof(goal(sub(2, 1, 1)), by(builtin(sub, 3))),
                              proof(
                                goal(plan([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 1, [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [move(e, table, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(19))),
                                bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Depth", 1), binding("Visited", [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]]), binding("Move", move(e, table, d)), binding("Moves", []), binding("Final", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Next", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("RestDepth", 0)]),
                                uses([
                                  proof(goal(gt(1, 0)), by(builtin(gt, 2))),
                                  proof(
                                    goal(move([on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], move(e, table, d), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(17))),
                                    bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("Block", e), binding("From", table), binding("To", d), binding("NewState", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Rest", [on(a, table), on(b, a), on(c, table), on(d, c)])]),
                                    uses([
                                      proof(goal(member(on(e, table), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(member, 2))),
                                      proof(
                                        goal(clear(e, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                        bindings([binding("Block", e), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                        uses([
                                          proof(goal(not(member(on(_Other, e), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                                        ])
                                      ),
                                      proof(
                                        goal(support(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(13))),
                                        bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]), binding("_Below", c)]),
                                        uses([
                                          proof(goal(block(d)), by(fact("blocks-world-planning.pl", clause(10)))),
                                          proof(goal(member(on(d, c), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(builtin(member, 2)))
                                        ])
                                      ),
                                      proof(
                                        goal(clear_support(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(16))),
                                        bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                        uses([
                                          proof(goal(block(d)), by(fact("blocks-world-planning.pl", clause(10)))),
                                          proof(
                                            goal(clear(d, [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])), by(rule("blocks-world-planning.pl", clause(14))),
                                            bindings([binding("Block", d), binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)])]),
                                            uses([
                                              proof(goal(not(member(on(_Other, d), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)]))), by(builtin(not, 1)))
                                            ])
                                          )
                                        ])
                                      ),
                                      proof(goal(neq(e, d)), by(builtin(neq, 2))),
                                      proof(goal(neq(table, d)), by(builtin(neq, 2))),
                                      proof(goal(select(on(e, table), [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, c)])), by(builtin(select, 3))),
                                      proof(goal(sort([on(e, d), on(a, table), on(b, a), on(c, table), on(d, c)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(sort, 2)))
                                    ])
                                  ),
                                  proof(goal(not_member([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])), by(builtin(not_member, 2))),
                                  proof(goal(sub(1, 1, 0)), by(builtin(sub, 3))),
                                  proof(
                                    goal(plan([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], 0, [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]], [], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(rule("blocks-world-planning.pl", clause(18))),
                                    bindings([binding("State", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("Goal", [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)]), binding("_Visited", [[on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, table), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, table), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, table)], [on(a, table), on(b, a), on(c, b), on(d, c), on(e, d)]])]),
                                    uses([
                                      proof(goal(eq([on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)], [on(a, table), on(b, a), on(c, table), on(d, c), on(e, d)])), by(builtin(eq, 2)))
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      )
                    ])
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

blockCount(blocks_world, 5).
why(
  blockCount(blocks_world, 5),
  proof(
    goal(blockCount(blocks_world, 5)), by(rule("blocks-world-planning.pl", clause(24))),
    bindings([binding("Count", 5), binding("Blocks", [a, b, c, d, e])]),
    uses([
      proof(goal(findall(Block, block(Block), [a, b, c, d, e])), by(builtin(findall, 3))),
      proof(goal(length([a, b, c, d, e], 5)), by(builtin(length, 2)))
    ])
  )
).

