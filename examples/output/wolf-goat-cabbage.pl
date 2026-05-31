solution(puzzle, [goat, nothing, wolf, goat, cabbage, nothing, goat]).
why(
  solution(puzzle, [goat, nothing, wolf, goat, cabbage, nothing, goat]),
  proof(
    goal(solution(puzzle, [goat, nothing, wolf, goat, cabbage, nothing, goat])),
    by(rule("wolf-goat-cabbage.pl", clause(16))),
    bindings([binding("Moves", [goat, nothing, wolf, goat, cabbage, nothing, goat])]),
    uses([
      proof(
        goal(solution([goat, nothing, wolf, goat, cabbage, nothing, goat])),
        by(rule("wolf-goat-cabbage.pl", clause(4))),
        bindings([binding("Moves", [goat, nothing, wolf, goat, cabbage, nothing, goat])]),
        uses([
          proof(
            goal(solve([w, w, w, w], [e, e, e, e], [[w, w, w, w]], [goat, nothing, wolf, goat, cabbage, nothing, goat])),
            by(rule("wolf-goat-cabbage.pl", clause(6))),
            bindings([binding("Config", [w, w, w, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, w, w, w]]), binding("Move", goat), binding("Rest", [nothing, wolf, goat, cabbage, nothing, goat]), binding("NextConfig", [e, w, e, w])]),
            uses([
              proof(
                goal(move([w, w, w, w], goat, [e, w, e, w])),
                by(rule("wolf-goat-cabbage.pl", clause(8))),
                bindings([binding("X", w), binding("Wolf", w), binding("Cabbage", w), binding("Y", e)]),
                uses([
                  proof(
                    goal(change(w, e)),
                    by(fact("wolf-goat-cabbage.pl", clause(12)))
                  )
                ])
              ),
              proof(
                goal(safe([e, w, e, w])),
                by(rule("wolf-goat-cabbage.pl", clause(13))),
                bindings([binding("Man", e), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w)]),
                uses([
                  proof(
                    goal(one_eq(e, e, w)),
                    by(fact("wolf-goat-cabbage.pl", clause(14))),
                    bindings([binding("X", e), binding("__anon0", w)])
                  ),
                  proof(
                    goal(one_eq(e, e, w)),
                    by(fact("wolf-goat-cabbage.pl", clause(14))),
                    bindings([binding("X", e), binding("__anon0", w)])
                  )
                ])
              ),
              proof(
                goal(not_member([e, w, e, w], [[w, w, w, w]])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(solve([e, w, e, w], [e, e, e, e], [[e, w, e, w], [w, w, w, w]], [nothing, wolf, goat, cabbage, nothing, goat])),
                by(rule("wolf-goat-cabbage.pl", clause(6))),
                bindings([binding("Config", [e, w, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, w, e, w], [w, w, w, w]]), binding("Move", nothing), binding("Rest", [wolf, goat, cabbage, nothing, goat]), binding("NextConfig", [w, w, e, w])]),
                uses([
                  proof(
                    goal(move([e, w, e, w], nothing, [w, w, e, w])),
                    by(rule("wolf-goat-cabbage.pl", clause(10))),
                    bindings([binding("X", e), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w), binding("Y", w)]),
                    uses([
                      proof(
                        goal(change(e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(11)))
                      )
                    ])
                  ),
                  proof(
                    goal(safe([w, w, e, w])),
                    by(rule("wolf-goat-cabbage.pl", clause(13))),
                    bindings([binding("Man", w), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w)]),
                    uses([
                      proof(
                        goal(one_eq(w, e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(15))),
                        bindings([binding("X", w), binding("__anon1", e)])
                      ),
                      proof(
                        goal(one_eq(w, e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(15))),
                        bindings([binding("X", w), binding("__anon1", e)])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member([w, w, e, w], [[e, w, e, w], [w, w, w, w]])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(solve([w, w, e, w], [e, e, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]], [wolf, goat, cabbage, nothing, goat])),
                    by(rule("wolf-goat-cabbage.pl", clause(6))),
                    bindings([binding("Config", [w, w, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", wolf), binding("Rest", [goat, cabbage, nothing, goat]), binding("NextConfig", [e, e, e, w])]),
                    uses([
                      proof(
                        goal(move([w, w, e, w], wolf, [e, e, e, w])),
                        by(rule("wolf-goat-cabbage.pl", clause(7))),
                        bindings([binding("X", w), binding("Goat", e), binding("Cabbage", w), binding("Y", e)]),
                        uses([
                          proof(
                            goal(change(w, e)),
                            by(fact("wolf-goat-cabbage.pl", clause(12)))
                          )
                        ])
                      ),
                      proof(
                        goal(safe([e, e, e, w])),
                        by(rule("wolf-goat-cabbage.pl", clause(13))),
                        bindings([binding("Man", e), binding("Wolf", e), binding("Goat", e), binding("Cabbage", w)]),
                        uses([
                          proof(
                            goal(one_eq(e, e, e)),
                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                            bindings([binding("X", e), binding("__anon0", e)])
                          ),
                          proof(
                            goal(one_eq(e, e, w)),
                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                            bindings([binding("X", e), binding("__anon0", w)])
                          )
                        ])
                      ),
                      proof(
                        goal(not_member([e, e, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                        by(builtin(not_member, 2))
                      ),
                      proof(
                        goal(solve([e, e, e, w], [e, e, e, e], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat, cabbage, nothing, goat])),
                        by(rule("wolf-goat-cabbage.pl", clause(6))),
                        bindings([binding("Config", [e, e, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", goat), binding("Rest", [cabbage, nothing, goat]), binding("NextConfig", [w, e, w, w])]),
                        uses([
                          proof(
                            goal(move([e, e, e, w], goat, [w, e, w, w])),
                            by(rule("wolf-goat-cabbage.pl", clause(8))),
                            bindings([binding("X", e), binding("Wolf", e), binding("Cabbage", w), binding("Y", w)]),
                            uses([
                              proof(
                                goal(change(e, w)),
                                by(fact("wolf-goat-cabbage.pl", clause(11)))
                              )
                            ])
                          ),
                          proof(
                            goal(safe([w, e, w, w])),
                            by(rule("wolf-goat-cabbage.pl", clause(13))),
                            bindings([binding("Man", w), binding("Wolf", e), binding("Goat", w), binding("Cabbage", w)]),
                            uses([
                              proof(
                                goal(one_eq(w, w, e)),
                                by(fact("wolf-goat-cabbage.pl", clause(14))),
                                bindings([binding("X", w), binding("__anon0", e)])
                              ),
                              proof(
                                goal(one_eq(w, w, w)),
                                by(fact("wolf-goat-cabbage.pl", clause(14))),
                                bindings([binding("X", w), binding("__anon0", w)])
                              )
                            ])
                          ),
                          proof(
                            goal(not_member([w, e, w, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                            by(builtin(not_member, 2))
                          ),
                          proof(
                            goal(solve([w, e, w, w], [e, e, e, e], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [cabbage, nothing, goat])),
                            by(rule("wolf-goat-cabbage.pl", clause(6))),
                            bindings([binding("Config", [w, e, w, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", cabbage), binding("Rest", [nothing, goat]), binding("NextConfig", [e, e, w, e])]),
                            uses([
                              proof(
                                goal(move([w, e, w, w], cabbage, [e, e, w, e])),
                                by(rule("wolf-goat-cabbage.pl", clause(9))),
                                bindings([binding("X", w), binding("Wolf", e), binding("Goat", w), binding("Y", e)]),
                                uses([
                                  proof(
                                    goal(change(w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(12)))
                                  )
                                ])
                              ),
                              proof(
                                goal(safe([e, e, w, e])),
                                by(rule("wolf-goat-cabbage.pl", clause(13))),
                                bindings([binding("Man", e), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e)]),
                                uses([
                                  proof(
                                    goal(one_eq(e, w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(15))),
                                    bindings([binding("X", e), binding("__anon1", w)])
                                  ),
                                  proof(
                                    goal(one_eq(e, w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(15))),
                                    bindings([binding("X", e), binding("__anon1", w)])
                                  )
                                ])
                              ),
                              proof(
                                goal(not_member([e, e, w, e], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                by(builtin(not_member, 2))
                              ),
                              proof(
                                goal(solve([e, e, w, e], [e, e, e, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [nothing, goat])),
                                by(rule("wolf-goat-cabbage.pl", clause(6))),
                                bindings([binding("Config", [e, e, w, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", nothing), binding("Rest", [goat]), binding("NextConfig", [w, e, w, e])]),
                                uses([
                                  proof(
                                    goal(move([e, e, w, e], nothing, [w, e, w, e])),
                                    by(rule("wolf-goat-cabbage.pl", clause(10))),
                                    bindings([binding("X", e), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e), binding("Y", w)]),
                                    uses([
                                      proof(
                                        goal(change(e, w)),
                                        by(fact("wolf-goat-cabbage.pl", clause(11)))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(safe([w, e, w, e])),
                                    by(rule("wolf-goat-cabbage.pl", clause(13))),
                                    bindings([binding("Man", w), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e)]),
                                    uses([
                                      proof(
                                        goal(one_eq(w, w, e)),
                                        by(fact("wolf-goat-cabbage.pl", clause(14))),
                                        bindings([binding("X", w), binding("__anon0", e)])
                                      ),
                                      proof(
                                        goal(one_eq(w, w, e)),
                                        by(fact("wolf-goat-cabbage.pl", clause(14))),
                                        bindings([binding("X", w), binding("__anon0", e)])
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(not_member([w, e, w, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                    by(builtin(not_member, 2))
                                  ),
                                  proof(
                                    goal(solve([w, e, w, e], [e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat])),
                                    by(rule("wolf-goat-cabbage.pl", clause(6))),
                                    bindings([binding("Config", [w, e, w, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", goat), binding("Rest", []), binding("NextConfig", [e, e, e, e])]),
                                    uses([
                                      proof(
                                        goal(move([w, e, w, e], goat, [e, e, e, e])),
                                        by(rule("wolf-goat-cabbage.pl", clause(8))),
                                        bindings([binding("X", w), binding("Wolf", e), binding("Cabbage", e), binding("Y", e)]),
                                        uses([
                                          proof(
                                            goal(change(w, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(12)))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(safe([e, e, e, e])),
                                        by(rule("wolf-goat-cabbage.pl", clause(13))),
                                        bindings([binding("Man", e), binding("Wolf", e), binding("Goat", e), binding("Cabbage", e)]),
                                        uses([
                                          proof(
                                            goal(one_eq(e, e, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                                            bindings([binding("X", e), binding("__anon0", e)])
                                          ),
                                          proof(
                                            goal(one_eq(e, e, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                                            bindings([binding("X", e), binding("__anon0", e)])
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(not_member([e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                        by(builtin(not_member, 2))
                                      ),
                                      proof(
                                        goal(solve([e, e, e, e], [e, e, e, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [])),
                                        by(fact("wolf-goat-cabbage.pl", clause(5))),
                                        bindings([binding("Config", [e, e, e, e]), binding("_Visited", [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])])
                                      )
                                    ])
                                  )
                                ])
                              )
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
            goal(length([goat, nothing, wolf, goat, cabbage, nothing, goat], 7)),
            by(builtin(length, 2))
          )
        ])
      )
    ])
  )
).

solution(puzzle, [goat, nothing, cabbage, goat, wolf, nothing, goat]).
why(
  solution(puzzle, [goat, nothing, cabbage, goat, wolf, nothing, goat]),
  proof(
    goal(solution(puzzle, [goat, nothing, cabbage, goat, wolf, nothing, goat])),
    by(rule("wolf-goat-cabbage.pl", clause(16))),
    bindings([binding("Moves", [goat, nothing, cabbage, goat, wolf, nothing, goat])]),
    uses([
      proof(
        goal(solution([goat, nothing, cabbage, goat, wolf, nothing, goat])),
        by(rule("wolf-goat-cabbage.pl", clause(4))),
        bindings([binding("Moves", [goat, nothing, cabbage, goat, wolf, nothing, goat])]),
        uses([
          proof(
            goal(solve([w, w, w, w], [e, e, e, e], [[w, w, w, w]], [goat, nothing, cabbage, goat, wolf, nothing, goat])),
            by(rule("wolf-goat-cabbage.pl", clause(6))),
            bindings([binding("Config", [w, w, w, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, w, w, w]]), binding("Move", goat), binding("Rest", [nothing, cabbage, goat, wolf, nothing, goat]), binding("NextConfig", [e, w, e, w])]),
            uses([
              proof(
                goal(move([w, w, w, w], goat, [e, w, e, w])),
                by(rule("wolf-goat-cabbage.pl", clause(8))),
                bindings([binding("X", w), binding("Wolf", w), binding("Cabbage", w), binding("Y", e)]),
                uses([
                  proof(
                    goal(change(w, e)),
                    by(fact("wolf-goat-cabbage.pl", clause(12)))
                  )
                ])
              ),
              proof(
                goal(safe([e, w, e, w])),
                by(rule("wolf-goat-cabbage.pl", clause(13))),
                bindings([binding("Man", e), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w)]),
                uses([
                  proof(
                    goal(one_eq(e, e, w)),
                    by(fact("wolf-goat-cabbage.pl", clause(14))),
                    bindings([binding("X", e), binding("__anon0", w)])
                  ),
                  proof(
                    goal(one_eq(e, e, w)),
                    by(fact("wolf-goat-cabbage.pl", clause(14))),
                    bindings([binding("X", e), binding("__anon0", w)])
                  )
                ])
              ),
              proof(
                goal(not_member([e, w, e, w], [[w, w, w, w]])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(solve([e, w, e, w], [e, e, e, e], [[e, w, e, w], [w, w, w, w]], [nothing, cabbage, goat, wolf, nothing, goat])),
                by(rule("wolf-goat-cabbage.pl", clause(6))),
                bindings([binding("Config", [e, w, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, w, e, w], [w, w, w, w]]), binding("Move", nothing), binding("Rest", [cabbage, goat, wolf, nothing, goat]), binding("NextConfig", [w, w, e, w])]),
                uses([
                  proof(
                    goal(move([e, w, e, w], nothing, [w, w, e, w])),
                    by(rule("wolf-goat-cabbage.pl", clause(10))),
                    bindings([binding("X", e), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w), binding("Y", w)]),
                    uses([
                      proof(
                        goal(change(e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(11)))
                      )
                    ])
                  ),
                  proof(
                    goal(safe([w, w, e, w])),
                    by(rule("wolf-goat-cabbage.pl", clause(13))),
                    bindings([binding("Man", w), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w)]),
                    uses([
                      proof(
                        goal(one_eq(w, e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(15))),
                        bindings([binding("X", w), binding("__anon1", e)])
                      ),
                      proof(
                        goal(one_eq(w, e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(15))),
                        bindings([binding("X", w), binding("__anon1", e)])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member([w, w, e, w], [[e, w, e, w], [w, w, w, w]])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(solve([w, w, e, w], [e, e, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]], [cabbage, goat, wolf, nothing, goat])),
                    by(rule("wolf-goat-cabbage.pl", clause(6))),
                    bindings([binding("Config", [w, w, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", cabbage), binding("Rest", [goat, wolf, nothing, goat]), binding("NextConfig", [e, w, e, e])]),
                    uses([
                      proof(
                        goal(move([w, w, e, w], cabbage, [e, w, e, e])),
                        by(rule("wolf-goat-cabbage.pl", clause(9))),
                        bindings([binding("X", w), binding("Wolf", w), binding("Goat", e), binding("Y", e)]),
                        uses([
                          proof(
                            goal(change(w, e)),
                            by(fact("wolf-goat-cabbage.pl", clause(12)))
                          )
                        ])
                      ),
                      proof(
                        goal(safe([e, w, e, e])),
                        by(rule("wolf-goat-cabbage.pl", clause(13))),
                        bindings([binding("Man", e), binding("Wolf", w), binding("Goat", e), binding("Cabbage", e)]),
                        uses([
                          proof(
                            goal(one_eq(e, e, w)),
                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                            bindings([binding("X", e), binding("__anon0", w)])
                          ),
                          proof(
                            goal(one_eq(e, e, e)),
                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                            bindings([binding("X", e), binding("__anon0", e)])
                          )
                        ])
                      ),
                      proof(
                        goal(not_member([e, w, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                        by(builtin(not_member, 2))
                      ),
                      proof(
                        goal(solve([e, w, e, e], [e, e, e, e], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat, wolf, nothing, goat])),
                        by(rule("wolf-goat-cabbage.pl", clause(6))),
                        bindings([binding("Config", [e, w, e, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", goat), binding("Rest", [wolf, nothing, goat]), binding("NextConfig", [w, w, w, e])]),
                        uses([
                          proof(
                            goal(move([e, w, e, e], goat, [w, w, w, e])),
                            by(rule("wolf-goat-cabbage.pl", clause(8))),
                            bindings([binding("X", e), binding("Wolf", w), binding("Cabbage", e), binding("Y", w)]),
                            uses([
                              proof(
                                goal(change(e, w)),
                                by(fact("wolf-goat-cabbage.pl", clause(11)))
                              )
                            ])
                          ),
                          proof(
                            goal(safe([w, w, w, e])),
                            by(rule("wolf-goat-cabbage.pl", clause(13))),
                            bindings([binding("Man", w), binding("Wolf", w), binding("Goat", w), binding("Cabbage", e)]),
                            uses([
                              proof(
                                goal(one_eq(w, w, w)),
                                by(fact("wolf-goat-cabbage.pl", clause(14))),
                                bindings([binding("X", w), binding("__anon0", w)])
                              ),
                              proof(
                                goal(one_eq(w, w, e)),
                                by(fact("wolf-goat-cabbage.pl", clause(14))),
                                bindings([binding("X", w), binding("__anon0", e)])
                              )
                            ])
                          ),
                          proof(
                            goal(not_member([w, w, w, e], [[e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                            by(builtin(not_member, 2))
                          ),
                          proof(
                            goal(solve([w, w, w, e], [e, e, e, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [wolf, nothing, goat])),
                            by(rule("wolf-goat-cabbage.pl", clause(6))),
                            bindings([binding("Config", [w, w, w, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", wolf), binding("Rest", [nothing, goat]), binding("NextConfig", [e, e, w, e])]),
                            uses([
                              proof(
                                goal(move([w, w, w, e], wolf, [e, e, w, e])),
                                by(rule("wolf-goat-cabbage.pl", clause(7))),
                                bindings([binding("X", w), binding("Goat", w), binding("Cabbage", e), binding("Y", e)]),
                                uses([
                                  proof(
                                    goal(change(w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(12)))
                                  )
                                ])
                              ),
                              proof(
                                goal(safe([e, e, w, e])),
                                by(rule("wolf-goat-cabbage.pl", clause(13))),
                                bindings([binding("Man", e), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e)]),
                                uses([
                                  proof(
                                    goal(one_eq(e, w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(15))),
                                    bindings([binding("X", e), binding("__anon1", w)])
                                  ),
                                  proof(
                                    goal(one_eq(e, w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(15))),
                                    bindings([binding("X", e), binding("__anon1", w)])
                                  )
                                ])
                              ),
                              proof(
                                goal(not_member([e, e, w, e], [[w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                by(builtin(not_member, 2))
                              ),
                              proof(
                                goal(solve([e, e, w, e], [e, e, e, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [nothing, goat])),
                                by(rule("wolf-goat-cabbage.pl", clause(6))),
                                bindings([binding("Config", [e, e, w, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", nothing), binding("Rest", [goat]), binding("NextConfig", [w, e, w, e])]),
                                uses([
                                  proof(
                                    goal(move([e, e, w, e], nothing, [w, e, w, e])),
                                    by(rule("wolf-goat-cabbage.pl", clause(10))),
                                    bindings([binding("X", e), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e), binding("Y", w)]),
                                    uses([
                                      proof(
                                        goal(change(e, w)),
                                        by(fact("wolf-goat-cabbage.pl", clause(11)))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(safe([w, e, w, e])),
                                    by(rule("wolf-goat-cabbage.pl", clause(13))),
                                    bindings([binding("Man", w), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e)]),
                                    uses([
                                      proof(
                                        goal(one_eq(w, w, e)),
                                        by(fact("wolf-goat-cabbage.pl", clause(14))),
                                        bindings([binding("X", w), binding("__anon0", e)])
                                      ),
                                      proof(
                                        goal(one_eq(w, w, e)),
                                        by(fact("wolf-goat-cabbage.pl", clause(14))),
                                        bindings([binding("X", w), binding("__anon0", e)])
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(not_member([w, e, w, e], [[e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                    by(builtin(not_member, 2))
                                  ),
                                  proof(
                                    goal(solve([w, e, w, e], [e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat])),
                                    by(rule("wolf-goat-cabbage.pl", clause(6))),
                                    bindings([binding("Config", [w, e, w, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", goat), binding("Rest", []), binding("NextConfig", [e, e, e, e])]),
                                    uses([
                                      proof(
                                        goal(move([w, e, w, e], goat, [e, e, e, e])),
                                        by(rule("wolf-goat-cabbage.pl", clause(8))),
                                        bindings([binding("X", w), binding("Wolf", e), binding("Cabbage", e), binding("Y", e)]),
                                        uses([
                                          proof(
                                            goal(change(w, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(12)))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(safe([e, e, e, e])),
                                        by(rule("wolf-goat-cabbage.pl", clause(13))),
                                        bindings([binding("Man", e), binding("Wolf", e), binding("Goat", e), binding("Cabbage", e)]),
                                        uses([
                                          proof(
                                            goal(one_eq(e, e, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                                            bindings([binding("X", e), binding("__anon0", e)])
                                          ),
                                          proof(
                                            goal(one_eq(e, e, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                                            bindings([binding("X", e), binding("__anon0", e)])
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(not_member([e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                        by(builtin(not_member, 2))
                                      ),
                                      proof(
                                        goal(solve([e, e, e, e], [e, e, e, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [])),
                                        by(fact("wolf-goat-cabbage.pl", clause(5))),
                                        bindings([binding("Config", [e, e, e, e]), binding("_Visited", [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, w, w, e], [e, w, e, e], [w, w, e, w], [e, w, e, w], [w, w, w, w]])])
                                      )
                                    ])
                                  )
                                ])
                              )
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
            goal(length([goat, nothing, cabbage, goat, wolf, nothing, goat], 7)),
            by(builtin(length, 2))
          )
        ])
      )
    ])
  )
).

solved(puzzle, true).
why(
  solved(puzzle, true),
  proof(
    goal(solved(puzzle, true)),
    by(rule("wolf-goat-cabbage.pl", clause(17))),
    bindings([binding("_Moves", [goat, nothing, wolf, goat, cabbage, nothing, goat])]),
    uses([
      proof(
        goal(solution([goat, nothing, wolf, goat, cabbage, nothing, goat])),
        by(rule("wolf-goat-cabbage.pl", clause(4))),
        bindings([binding("Moves", [goat, nothing, wolf, goat, cabbage, nothing, goat])]),
        uses([
          proof(
            goal(solve([w, w, w, w], [e, e, e, e], [[w, w, w, w]], [goat, nothing, wolf, goat, cabbage, nothing, goat])),
            by(rule("wolf-goat-cabbage.pl", clause(6))),
            bindings([binding("Config", [w, w, w, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, w, w, w]]), binding("Move", goat), binding("Rest", [nothing, wolf, goat, cabbage, nothing, goat]), binding("NextConfig", [e, w, e, w])]),
            uses([
              proof(
                goal(move([w, w, w, w], goat, [e, w, e, w])),
                by(rule("wolf-goat-cabbage.pl", clause(8))),
                bindings([binding("X", w), binding("Wolf", w), binding("Cabbage", w), binding("Y", e)]),
                uses([
                  proof(
                    goal(change(w, e)),
                    by(fact("wolf-goat-cabbage.pl", clause(12)))
                  )
                ])
              ),
              proof(
                goal(safe([e, w, e, w])),
                by(rule("wolf-goat-cabbage.pl", clause(13))),
                bindings([binding("Man", e), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w)]),
                uses([
                  proof(
                    goal(one_eq(e, e, w)),
                    by(fact("wolf-goat-cabbage.pl", clause(14))),
                    bindings([binding("X", e), binding("__anon0", w)])
                  ),
                  proof(
                    goal(one_eq(e, e, w)),
                    by(fact("wolf-goat-cabbage.pl", clause(14))),
                    bindings([binding("X", e), binding("__anon0", w)])
                  )
                ])
              ),
              proof(
                goal(not_member([e, w, e, w], [[w, w, w, w]])),
                by(builtin(not_member, 2))
              ),
              proof(
                goal(solve([e, w, e, w], [e, e, e, e], [[e, w, e, w], [w, w, w, w]], [nothing, wolf, goat, cabbage, nothing, goat])),
                by(rule("wolf-goat-cabbage.pl", clause(6))),
                bindings([binding("Config", [e, w, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, w, e, w], [w, w, w, w]]), binding("Move", nothing), binding("Rest", [wolf, goat, cabbage, nothing, goat]), binding("NextConfig", [w, w, e, w])]),
                uses([
                  proof(
                    goal(move([e, w, e, w], nothing, [w, w, e, w])),
                    by(rule("wolf-goat-cabbage.pl", clause(10))),
                    bindings([binding("X", e), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w), binding("Y", w)]),
                    uses([
                      proof(
                        goal(change(e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(11)))
                      )
                    ])
                  ),
                  proof(
                    goal(safe([w, w, e, w])),
                    by(rule("wolf-goat-cabbage.pl", clause(13))),
                    bindings([binding("Man", w), binding("Wolf", w), binding("Goat", e), binding("Cabbage", w)]),
                    uses([
                      proof(
                        goal(one_eq(w, e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(15))),
                        bindings([binding("X", w), binding("__anon1", e)])
                      ),
                      proof(
                        goal(one_eq(w, e, w)),
                        by(fact("wolf-goat-cabbage.pl", clause(15))),
                        bindings([binding("X", w), binding("__anon1", e)])
                      )
                    ])
                  ),
                  proof(
                    goal(not_member([w, w, e, w], [[e, w, e, w], [w, w, w, w]])),
                    by(builtin(not_member, 2))
                  ),
                  proof(
                    goal(solve([w, w, e, w], [e, e, e, e], [[w, w, e, w], [e, w, e, w], [w, w, w, w]], [wolf, goat, cabbage, nothing, goat])),
                    by(rule("wolf-goat-cabbage.pl", clause(6))),
                    bindings([binding("Config", [w, w, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", wolf), binding("Rest", [goat, cabbage, nothing, goat]), binding("NextConfig", [e, e, e, w])]),
                    uses([
                      proof(
                        goal(move([w, w, e, w], wolf, [e, e, e, w])),
                        by(rule("wolf-goat-cabbage.pl", clause(7))),
                        bindings([binding("X", w), binding("Goat", e), binding("Cabbage", w), binding("Y", e)]),
                        uses([
                          proof(
                            goal(change(w, e)),
                            by(fact("wolf-goat-cabbage.pl", clause(12)))
                          )
                        ])
                      ),
                      proof(
                        goal(safe([e, e, e, w])),
                        by(rule("wolf-goat-cabbage.pl", clause(13))),
                        bindings([binding("Man", e), binding("Wolf", e), binding("Goat", e), binding("Cabbage", w)]),
                        uses([
                          proof(
                            goal(one_eq(e, e, e)),
                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                            bindings([binding("X", e), binding("__anon0", e)])
                          ),
                          proof(
                            goal(one_eq(e, e, w)),
                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                            bindings([binding("X", e), binding("__anon0", w)])
                          )
                        ])
                      ),
                      proof(
                        goal(not_member([e, e, e, w], [[w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                        by(builtin(not_member, 2))
                      ),
                      proof(
                        goal(solve([e, e, e, w], [e, e, e, e], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat, cabbage, nothing, goat])),
                        by(rule("wolf-goat-cabbage.pl", clause(6))),
                        bindings([binding("Config", [e, e, e, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", goat), binding("Rest", [cabbage, nothing, goat]), binding("NextConfig", [w, e, w, w])]),
                        uses([
                          proof(
                            goal(move([e, e, e, w], goat, [w, e, w, w])),
                            by(rule("wolf-goat-cabbage.pl", clause(8))),
                            bindings([binding("X", e), binding("Wolf", e), binding("Cabbage", w), binding("Y", w)]),
                            uses([
                              proof(
                                goal(change(e, w)),
                                by(fact("wolf-goat-cabbage.pl", clause(11)))
                              )
                            ])
                          ),
                          proof(
                            goal(safe([w, e, w, w])),
                            by(rule("wolf-goat-cabbage.pl", clause(13))),
                            bindings([binding("Man", w), binding("Wolf", e), binding("Goat", w), binding("Cabbage", w)]),
                            uses([
                              proof(
                                goal(one_eq(w, w, e)),
                                by(fact("wolf-goat-cabbage.pl", clause(14))),
                                bindings([binding("X", w), binding("__anon0", e)])
                              ),
                              proof(
                                goal(one_eq(w, w, w)),
                                by(fact("wolf-goat-cabbage.pl", clause(14))),
                                bindings([binding("X", w), binding("__anon0", w)])
                              )
                            ])
                          ),
                          proof(
                            goal(not_member([w, e, w, w], [[e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                            by(builtin(not_member, 2))
                          ),
                          proof(
                            goal(solve([w, e, w, w], [e, e, e, e], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [cabbage, nothing, goat])),
                            by(rule("wolf-goat-cabbage.pl", clause(6))),
                            bindings([binding("Config", [w, e, w, w]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", cabbage), binding("Rest", [nothing, goat]), binding("NextConfig", [e, e, w, e])]),
                            uses([
                              proof(
                                goal(move([w, e, w, w], cabbage, [e, e, w, e])),
                                by(rule("wolf-goat-cabbage.pl", clause(9))),
                                bindings([binding("X", w), binding("Wolf", e), binding("Goat", w), binding("Y", e)]),
                                uses([
                                  proof(
                                    goal(change(w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(12)))
                                  )
                                ])
                              ),
                              proof(
                                goal(safe([e, e, w, e])),
                                by(rule("wolf-goat-cabbage.pl", clause(13))),
                                bindings([binding("Man", e), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e)]),
                                uses([
                                  proof(
                                    goal(one_eq(e, w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(15))),
                                    bindings([binding("X", e), binding("__anon1", w)])
                                  ),
                                  proof(
                                    goal(one_eq(e, w, e)),
                                    by(fact("wolf-goat-cabbage.pl", clause(15))),
                                    bindings([binding("X", e), binding("__anon1", w)])
                                  )
                                ])
                              ),
                              proof(
                                goal(not_member([e, e, w, e], [[w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                by(builtin(not_member, 2))
                              ),
                              proof(
                                goal(solve([e, e, w, e], [e, e, e, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [nothing, goat])),
                                by(rule("wolf-goat-cabbage.pl", clause(6))),
                                bindings([binding("Config", [e, e, w, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", nothing), binding("Rest", [goat]), binding("NextConfig", [w, e, w, e])]),
                                uses([
                                  proof(
                                    goal(move([e, e, w, e], nothing, [w, e, w, e])),
                                    by(rule("wolf-goat-cabbage.pl", clause(10))),
                                    bindings([binding("X", e), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e), binding("Y", w)]),
                                    uses([
                                      proof(
                                        goal(change(e, w)),
                                        by(fact("wolf-goat-cabbage.pl", clause(11)))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(safe([w, e, w, e])),
                                    by(rule("wolf-goat-cabbage.pl", clause(13))),
                                    bindings([binding("Man", w), binding("Wolf", e), binding("Goat", w), binding("Cabbage", e)]),
                                    uses([
                                      proof(
                                        goal(one_eq(w, w, e)),
                                        by(fact("wolf-goat-cabbage.pl", clause(14))),
                                        bindings([binding("X", w), binding("__anon0", e)])
                                      ),
                                      proof(
                                        goal(one_eq(w, w, e)),
                                        by(fact("wolf-goat-cabbage.pl", clause(14))),
                                        bindings([binding("X", w), binding("__anon0", e)])
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(not_member([w, e, w, e], [[e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                    by(builtin(not_member, 2))
                                  ),
                                  proof(
                                    goal(solve([w, e, w, e], [e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [goat])),
                                    by(rule("wolf-goat-cabbage.pl", clause(6))),
                                    bindings([binding("Config", [w, e, w, e]), binding("Goal", [e, e, e, e]), binding("Visited", [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]]), binding("Move", goat), binding("Rest", []), binding("NextConfig", [e, e, e, e])]),
                                    uses([
                                      proof(
                                        goal(move([w, e, w, e], goat, [e, e, e, e])),
                                        by(rule("wolf-goat-cabbage.pl", clause(8))),
                                        bindings([binding("X", w), binding("Wolf", e), binding("Cabbage", e), binding("Y", e)]),
                                        uses([
                                          proof(
                                            goal(change(w, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(12)))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(safe([e, e, e, e])),
                                        by(rule("wolf-goat-cabbage.pl", clause(13))),
                                        bindings([binding("Man", e), binding("Wolf", e), binding("Goat", e), binding("Cabbage", e)]),
                                        uses([
                                          proof(
                                            goal(one_eq(e, e, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                                            bindings([binding("X", e), binding("__anon0", e)])
                                          ),
                                          proof(
                                            goal(one_eq(e, e, e)),
                                            by(fact("wolf-goat-cabbage.pl", clause(14))),
                                            bindings([binding("X", e), binding("__anon0", e)])
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(not_member([e, e, e, e], [[w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])),
                                        by(builtin(not_member, 2))
                                      ),
                                      proof(
                                        goal(solve([e, e, e, e], [e, e, e, e], [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]], [])),
                                        by(fact("wolf-goat-cabbage.pl", clause(5))),
                                        bindings([binding("Config", [e, e, e, e]), binding("_Visited", [[e, e, e, e], [w, e, w, e], [e, e, w, e], [w, e, w, w], [e, e, e, w], [w, w, e, w], [e, w, e, w], [w, w, w, w]])])
                                      )
                                    ])
                                  )
                                ])
                              )
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
            goal(length([goat, nothing, wolf, goat, cabbage, nothing, goat], 7)),
            by(builtin(length, 2))
          )
        ])
      )
    ])
  )
).

