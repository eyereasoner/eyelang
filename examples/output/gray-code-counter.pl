isgcc([[1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0]], [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]).
why(
  isgcc([[1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0]], [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]]),
  proof(
    goal(isgcc([[1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0]], [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])),
    by(rule("gray-code-counter.pl", clause(19))),
    bindings([binding("States", [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])]),
    uses([
      proof(
        goal(testgcc([1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0], [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])),
        by(rule("gray-code-counter.pl", clause(18))),
        bindings([binding("C", 1), binding("Cs", [1, 1, 1, 1, 1, 1, 1, 1]), binding("State", [0, 0, 0]), binding("Next", [0, 0, 1]), binding("Rest", [[0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])]),
        uses([
          proof(
            goal(gcc(1, [0, 0, 0], [0, 0, 1])),
            by(rule("gray-code-counter.pl", clause(16))),
            bindings([binding("C", 1), binding("Qa", 0), binding("Qb", 0), binding("Qc", 0), binding("Za", 0), binding("Zb", 0), binding("Zc", 1), binding("D1", 0), binding("D2", 0), binding("D3", 1)]),
            uses([
              proof(
                goal(netb(0, 0, 0, 0, 0)),
                by(rule("gray-code-counter.pl", clause(15))),
                bindings([binding("A", 0), binding("B", 0), binding("C", 0), binding("Q1", 0), binding("Q2", 0), binding("T1", 0), binding("NC", 1), binding("T2", 0), binding("NA", 1), binding("T3", 0)]),
                uses([
                  proof(
                    goal(and(0, 0, 0)),
                    by(fact("gray-code-counter.pl", clause(2)))
                  ),
                  proof(
                    goal(inv(0, 1)),
                    by(fact("gray-code-counter.pl", clause(10)))
                  ),
                  proof(
                    goal(and(0, 1, 0)),
                    by(fact("gray-code-counter.pl", clause(3)))
                  ),
                  proof(
                    goal(inv(0, 1)),
                    by(fact("gray-code-counter.pl", clause(10)))
                  ),
                  proof(
                    goal(and(1, 0, 0)),
                    by(fact("gray-code-counter.pl", clause(4)))
                  ),
                  proof(
                    goal(or(0, 0, 0)),
                    by(fact("gray-code-counter.pl", clause(6)))
                  ),
                  proof(
                    goal(or(0, 0, 0)),
                    by(fact("gray-code-counter.pl", clause(6)))
                  )
                ])
              ),
              proof(
                goal(neta(0, 0, 1)),
                by(rule("gray-code-counter.pl", clause(14))),
                bindings([binding("A", 0), binding("B", 0), binding("Q", 1), binding("T1", 0), binding("NA", 1), binding("NB", 1), binding("T2", 1)]),
                uses([
                  proof(
                    goal(and(0, 0, 0)),
                    by(fact("gray-code-counter.pl", clause(2)))
                  ),
                  proof(
                    goal(inv(0, 1)),
                    by(fact("gray-code-counter.pl", clause(10)))
                  ),
                  proof(
                    goal(inv(0, 1)),
                    by(fact("gray-code-counter.pl", clause(10)))
                  ),
                  proof(
                    goal(and(1, 1, 1)),
                    by(fact("gray-code-counter.pl", clause(5)))
                  ),
                  proof(
                    goal(or(0, 1, 1)),
                    by(fact("gray-code-counter.pl", clause(7)))
                  )
                ])
              ),
              proof(
                goal(dff(0, 1, 0, 0)),
                by(fact("gray-code-counter.pl", clause(13))),
                bindings([binding("D", 0), binding("_Q", 0)])
              ),
              proof(
                goal(dff(0, 1, 0, 0)),
                by(fact("gray-code-counter.pl", clause(13))),
                bindings([binding("D", 0), binding("_Q", 0)])
              ),
              proof(
                goal(dff(1, 1, 0, 1)),
                by(fact("gray-code-counter.pl", clause(13))),
                bindings([binding("D", 1), binding("_Q", 0)])
              )
            ])
          ),
          proof(
            goal(testgcc([1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1], [[0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])),
            by(rule("gray-code-counter.pl", clause(18))),
            bindings([binding("C", 1), binding("Cs", [1, 1, 1, 1, 1, 1, 1]), binding("State", [0, 0, 1]), binding("Next", [0, 1, 1]), binding("Rest", [[0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])]),
            uses([
              proof(
                goal(gcc(1, [0, 0, 1], [0, 1, 1])),
                by(rule("gray-code-counter.pl", clause(16))),
                bindings([binding("C", 1), binding("Qa", 0), binding("Qb", 0), binding("Qc", 1), binding("Za", 0), binding("Zb", 1), binding("Zc", 1), binding("D1", 0), binding("D2", 1), binding("D3", 1)]),
                uses([
                  proof(
                    goal(netb(0, 0, 1, 0, 1)),
                    by(rule("gray-code-counter.pl", clause(15))),
                    bindings([binding("A", 0), binding("B", 0), binding("C", 1), binding("Q1", 0), binding("Q2", 1), binding("T1", 0), binding("NC", 0), binding("T2", 0), binding("NA", 1), binding("T3", 1)]),
                    uses([
                      proof(
                        goal(and(0, 1, 0)),
                        by(fact("gray-code-counter.pl", clause(3)))
                      ),
                      proof(
                        goal(inv(1, 0)),
                        by(fact("gray-code-counter.pl", clause(11)))
                      ),
                      proof(
                        goal(and(0, 0, 0)),
                        by(fact("gray-code-counter.pl", clause(2)))
                      ),
                      proof(
                        goal(inv(0, 1)),
                        by(fact("gray-code-counter.pl", clause(10)))
                      ),
                      proof(
                        goal(and(1, 1, 1)),
                        by(fact("gray-code-counter.pl", clause(5)))
                      ),
                      proof(
                        goal(or(0, 0, 0)),
                        by(fact("gray-code-counter.pl", clause(6)))
                      ),
                      proof(
                        goal(or(0, 1, 1)),
                        by(fact("gray-code-counter.pl", clause(7)))
                      )
                    ])
                  ),
                  proof(
                    goal(neta(0, 0, 1)),
                    by(rule("gray-code-counter.pl", clause(14))),
                    bindings([binding("A", 0), binding("B", 0), binding("Q", 1), binding("T1", 0), binding("NA", 1), binding("NB", 1), binding("T2", 1)]),
                    uses([
                      proof(
                        goal(and(0, 0, 0)),
                        by(fact("gray-code-counter.pl", clause(2)))
                      ),
                      proof(
                        goal(inv(0, 1)),
                        by(fact("gray-code-counter.pl", clause(10)))
                      ),
                      proof(
                        goal(inv(0, 1)),
                        by(fact("gray-code-counter.pl", clause(10)))
                      ),
                      proof(
                        goal(and(1, 1, 1)),
                        by(fact("gray-code-counter.pl", clause(5)))
                      ),
                      proof(
                        goal(or(0, 1, 1)),
                        by(fact("gray-code-counter.pl", clause(7)))
                      )
                    ])
                  ),
                  proof(
                    goal(dff(0, 1, 0, 0)),
                    by(fact("gray-code-counter.pl", clause(13))),
                    bindings([binding("D", 0), binding("_Q", 0)])
                  ),
                  proof(
                    goal(dff(1, 1, 0, 1)),
                    by(fact("gray-code-counter.pl", clause(13))),
                    bindings([binding("D", 1), binding("_Q", 0)])
                  ),
                  proof(
                    goal(dff(1, 1, 1, 1)),
                    by(fact("gray-code-counter.pl", clause(13))),
                    bindings([binding("D", 1), binding("_Q", 1)])
                  )
                ])
              ),
              proof(
                goal(testgcc([1, 1, 1, 1, 1, 1, 1], [0, 1, 1], [[0, 1, 0], [1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])),
                by(rule("gray-code-counter.pl", clause(18))),
                bindings([binding("C", 1), binding("Cs", [1, 1, 1, 1, 1, 1]), binding("State", [0, 1, 1]), binding("Next", [0, 1, 0]), binding("Rest", [[1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])]),
                uses([
                  proof(
                    goal(gcc(1, [0, 1, 1], [0, 1, 0])),
                    by(rule("gray-code-counter.pl", clause(16))),
                    bindings([binding("C", 1), binding("Qa", 0), binding("Qb", 1), binding("Qc", 1), binding("Za", 0), binding("Zb", 1), binding("Zc", 0), binding("D1", 0), binding("D2", 1), binding("D3", 0)]),
                    uses([
                      proof(
                        goal(netb(0, 1, 1, 0, 1)),
                        by(rule("gray-code-counter.pl", clause(15))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("Q1", 0), binding("Q2", 1), binding("T1", 0), binding("NC", 0), binding("T2", 0), binding("NA", 1), binding("T3", 1)]),
                        uses([
                          proof(
                            goal(and(0, 1, 0)),
                            by(fact("gray-code-counter.pl", clause(3)))
                          ),
                          proof(
                            goal(inv(1, 0)),
                            by(fact("gray-code-counter.pl", clause(11)))
                          ),
                          proof(
                            goal(and(1, 0, 0)),
                            by(fact("gray-code-counter.pl", clause(4)))
                          ),
                          proof(
                            goal(inv(0, 1)),
                            by(fact("gray-code-counter.pl", clause(10)))
                          ),
                          proof(
                            goal(and(1, 1, 1)),
                            by(fact("gray-code-counter.pl", clause(5)))
                          ),
                          proof(
                            goal(or(0, 0, 0)),
                            by(fact("gray-code-counter.pl", clause(6)))
                          ),
                          proof(
                            goal(or(0, 1, 1)),
                            by(fact("gray-code-counter.pl", clause(7)))
                          )
                        ])
                      ),
                      proof(
                        goal(neta(0, 1, 0)),
                        by(rule("gray-code-counter.pl", clause(14))),
                        bindings([binding("A", 0), binding("B", 1), binding("Q", 0), binding("T1", 0), binding("NA", 1), binding("NB", 0), binding("T2", 0)]),
                        uses([
                          proof(
                            goal(and(0, 1, 0)),
                            by(fact("gray-code-counter.pl", clause(3)))
                          ),
                          proof(
                            goal(inv(0, 1)),
                            by(fact("gray-code-counter.pl", clause(10)))
                          ),
                          proof(
                            goal(inv(1, 0)),
                            by(fact("gray-code-counter.pl", clause(11)))
                          ),
                          proof(
                            goal(and(1, 0, 0)),
                            by(fact("gray-code-counter.pl", clause(4)))
                          ),
                          proof(
                            goal(or(0, 0, 0)),
                            by(fact("gray-code-counter.pl", clause(6)))
                          )
                        ])
                      ),
                      proof(
                        goal(dff(0, 1, 0, 0)),
                        by(fact("gray-code-counter.pl", clause(13))),
                        bindings([binding("D", 0), binding("_Q", 0)])
                      ),
                      proof(
                        goal(dff(1, 1, 1, 1)),
                        by(fact("gray-code-counter.pl", clause(13))),
                        bindings([binding("D", 1), binding("_Q", 1)])
                      ),
                      proof(
                        goal(dff(0, 1, 1, 0)),
                        by(fact("gray-code-counter.pl", clause(13))),
                        bindings([binding("D", 0), binding("_Q", 1)])
                      )
                    ])
                  ),
                  proof(
                    goal(testgcc([1, 1, 1, 1, 1, 1], [0, 1, 0], [[1, 1, 0], [1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])),
                    by(rule("gray-code-counter.pl", clause(18))),
                    bindings([binding("C", 1), binding("Cs", [1, 1, 1, 1, 1]), binding("State", [0, 1, 0]), binding("Next", [1, 1, 0]), binding("Rest", [[1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])]),
                    uses([
                      proof(
                        goal(gcc(1, [0, 1, 0], [1, 1, 0])),
                        by(rule("gray-code-counter.pl", clause(16))),
                        bindings([binding("C", 1), binding("Qa", 0), binding("Qb", 1), binding("Qc", 0), binding("Za", 1), binding("Zb", 1), binding("Zc", 0), binding("D1", 1), binding("D2", 1), binding("D3", 0)]),
                        uses([
                          proof(
                            goal(netb(0, 1, 0, 1, 1)),
                            by(rule("gray-code-counter.pl", clause(15))),
                            bindings([binding("A", 0), binding("B", 1), binding("C", 0), binding("Q1", 1), binding("Q2", 1), binding("T1", 0), binding("NC", 1), binding("T2", 1), binding("NA", 1), binding("T3", 0)]),
                            uses([
                              proof(
                                goal(and(0, 0, 0)),
                                by(fact("gray-code-counter.pl", clause(2)))
                              ),
                              proof(
                                goal(inv(0, 1)),
                                by(fact("gray-code-counter.pl", clause(10)))
                              ),
                              proof(
                                goal(and(1, 1, 1)),
                                by(fact("gray-code-counter.pl", clause(5)))
                              ),
                              proof(
                                goal(inv(0, 1)),
                                by(fact("gray-code-counter.pl", clause(10)))
                              ),
                              proof(
                                goal(and(1, 0, 0)),
                                by(fact("gray-code-counter.pl", clause(4)))
                              ),
                              proof(
                                goal(or(0, 1, 1)),
                                by(fact("gray-code-counter.pl", clause(7)))
                              ),
                              proof(
                                goal(or(1, 0, 1)),
                                by(fact("gray-code-counter.pl", clause(8)))
                              )
                            ])
                          ),
                          proof(
                            goal(neta(0, 1, 0)),
                            by(rule("gray-code-counter.pl", clause(14))),
                            bindings([binding("A", 0), binding("B", 1), binding("Q", 0), binding("T1", 0), binding("NA", 1), binding("NB", 0), binding("T2", 0)]),
                            uses([
                              proof(
                                goal(and(0, 1, 0)),
                                by(fact("gray-code-counter.pl", clause(3)))
                              ),
                              proof(
                                goal(inv(0, 1)),
                                by(fact("gray-code-counter.pl", clause(10)))
                              ),
                              proof(
                                goal(inv(1, 0)),
                                by(fact("gray-code-counter.pl", clause(11)))
                              ),
                              proof(
                                goal(and(1, 0, 0)),
                                by(fact("gray-code-counter.pl", clause(4)))
                              ),
                              proof(
                                goal(or(0, 0, 0)),
                                by(fact("gray-code-counter.pl", clause(6)))
                              )
                            ])
                          ),
                          proof(
                            goal(dff(1, 1, 0, 1)),
                            by(fact("gray-code-counter.pl", clause(13))),
                            bindings([binding("D", 1), binding("_Q", 0)])
                          ),
                          proof(
                            goal(dff(1, 1, 1, 1)),
                            by(fact("gray-code-counter.pl", clause(13))),
                            bindings([binding("D", 1), binding("_Q", 1)])
                          ),
                          proof(
                            goal(dff(0, 1, 0, 0)),
                            by(fact("gray-code-counter.pl", clause(13))),
                            bindings([binding("D", 0), binding("_Q", 0)])
                          )
                        ])
                      ),
                      proof(
                        goal(testgcc([1, 1, 1, 1, 1], [1, 1, 0], [[1, 1, 1], [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])),
                        by(rule("gray-code-counter.pl", clause(18))),
                        bindings([binding("C", 1), binding("Cs", [1, 1, 1, 1]), binding("State", [1, 1, 0]), binding("Next", [1, 1, 1]), binding("Rest", [[1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])]),
                        uses([
                          proof(
                            goal(gcc(1, [1, 1, 0], [1, 1, 1])),
                            by(rule("gray-code-counter.pl", clause(16))),
                            bindings([binding("C", 1), binding("Qa", 1), binding("Qb", 1), binding("Qc", 0), binding("Za", 1), binding("Zb", 1), binding("Zc", 1), binding("D1", 1), binding("D2", 1), binding("D3", 1)]),
                            uses([
                              proof(
                                goal(netb(1, 1, 0, 1, 1)),
                                by(rule("gray-code-counter.pl", clause(15))),
                                bindings([binding("A", 1), binding("B", 1), binding("C", 0), binding("Q1", 1), binding("Q2", 1), binding("T1", 0), binding("NC", 1), binding("T2", 1), binding("NA", 0), binding("T3", 0)]),
                                uses([
                                  proof(
                                    goal(and(1, 0, 0)),
                                    by(fact("gray-code-counter.pl", clause(4)))
                                  ),
                                  proof(
                                    goal(inv(0, 1)),
                                    by(fact("gray-code-counter.pl", clause(10)))
                                  ),
                                  proof(
                                    goal(and(1, 1, 1)),
                                    by(fact("gray-code-counter.pl", clause(5)))
                                  ),
                                  proof(
                                    goal(inv(1, 0)),
                                    by(fact("gray-code-counter.pl", clause(11)))
                                  ),
                                  proof(
                                    goal(and(0, 0, 0)),
                                    by(fact("gray-code-counter.pl", clause(2)))
                                  ),
                                  proof(
                                    goal(or(0, 1, 1)),
                                    by(fact("gray-code-counter.pl", clause(7)))
                                  ),
                                  proof(
                                    goal(or(1, 0, 1)),
                                    by(fact("gray-code-counter.pl", clause(8)))
                                  )
                                ])
                              ),
                              proof(
                                goal(neta(1, 1, 1)),
                                by(rule("gray-code-counter.pl", clause(14))),
                                bindings([binding("A", 1), binding("B", 1), binding("Q", 1), binding("T1", 1), binding("NA", 0), binding("NB", 0), binding("T2", 0)]),
                                uses([
                                  proof(
                                    goal(and(1, 1, 1)),
                                    by(fact("gray-code-counter.pl", clause(5)))
                                  ),
                                  proof(
                                    goal(inv(1, 0)),
                                    by(fact("gray-code-counter.pl", clause(11)))
                                  ),
                                  proof(
                                    goal(inv(1, 0)),
                                    by(fact("gray-code-counter.pl", clause(11)))
                                  ),
                                  proof(
                                    goal(and(0, 0, 0)),
                                    by(fact("gray-code-counter.pl", clause(2)))
                                  ),
                                  proof(
                                    goal(or(1, 0, 1)),
                                    by(fact("gray-code-counter.pl", clause(8)))
                                  )
                                ])
                              ),
                              proof(
                                goal(dff(1, 1, 1, 1)),
                                by(fact("gray-code-counter.pl", clause(13))),
                                bindings([binding("D", 1), binding("_Q", 1)])
                              ),
                              proof(
                                goal(dff(1, 1, 1, 1)),
                                by(fact("gray-code-counter.pl", clause(13))),
                                bindings([binding("D", 1), binding("_Q", 1)])
                              ),
                              proof(
                                goal(dff(1, 1, 0, 1)),
                                by(fact("gray-code-counter.pl", clause(13))),
                                bindings([binding("D", 1), binding("_Q", 0)])
                              )
                            ])
                          ),
                          proof(
                            goal(testgcc([1, 1, 1, 1], [1, 1, 1], [[1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])),
                            by(rule("gray-code-counter.pl", clause(18))),
                            bindings([binding("C", 1), binding("Cs", [1, 1, 1]), binding("State", [1, 1, 1]), binding("Next", [1, 0, 1]), binding("Rest", [[1, 0, 0], [0, 0, 0], [0, 0, 1]])]),
                            uses([
                              proof(
                                goal(gcc(1, [1, 1, 1], [1, 0, 1])),
                                by(rule("gray-code-counter.pl", clause(16))),
                                bindings([binding("C", 1), binding("Qa", 1), binding("Qb", 1), binding("Qc", 1), binding("Za", 1), binding("Zb", 0), binding("Zc", 1), binding("D1", 1), binding("D2", 0), binding("D3", 1)]),
                                uses([
                                  proof(
                                    goal(netb(1, 1, 1, 1, 0)),
                                    by(rule("gray-code-counter.pl", clause(15))),
                                    bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("Q1", 1), binding("Q2", 0), binding("T1", 1), binding("NC", 0), binding("T2", 0), binding("NA", 0), binding("T3", 0)]),
                                    uses([
                                      proof(
                                        goal(and(1, 1, 1)),
                                        by(fact("gray-code-counter.pl", clause(5)))
                                      ),
                                      proof(
                                        goal(inv(1, 0)),
                                        by(fact("gray-code-counter.pl", clause(11)))
                                      ),
                                      proof(
                                        goal(and(1, 0, 0)),
                                        by(fact("gray-code-counter.pl", clause(4)))
                                      ),
                                      proof(
                                        goal(inv(1, 0)),
                                        by(fact("gray-code-counter.pl", clause(11)))
                                      ),
                                      proof(
                                        goal(and(0, 1, 0)),
                                        by(fact("gray-code-counter.pl", clause(3)))
                                      ),
                                      proof(
                                        goal(or(1, 0, 1)),
                                        by(fact("gray-code-counter.pl", clause(8)))
                                      ),
                                      proof(
                                        goal(or(0, 0, 0)),
                                        by(fact("gray-code-counter.pl", clause(6)))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(neta(1, 1, 1)),
                                    by(rule("gray-code-counter.pl", clause(14))),
                                    bindings([binding("A", 1), binding("B", 1), binding("Q", 1), binding("T1", 1), binding("NA", 0), binding("NB", 0), binding("T2", 0)]),
                                    uses([
                                      proof(
                                        goal(and(1, 1, 1)),
                                        by(fact("gray-code-counter.pl", clause(5)))
                                      ),
                                      proof(
                                        goal(inv(1, 0)),
                                        by(fact("gray-code-counter.pl", clause(11)))
                                      ),
                                      proof(
                                        goal(inv(1, 0)),
                                        by(fact("gray-code-counter.pl", clause(11)))
                                      ),
                                      proof(
                                        goal(and(0, 0, 0)),
                                        by(fact("gray-code-counter.pl", clause(2)))
                                      ),
                                      proof(
                                        goal(or(1, 0, 1)),
                                        by(fact("gray-code-counter.pl", clause(8)))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(dff(1, 1, 1, 1)),
                                    by(fact("gray-code-counter.pl", clause(13))),
                                    bindings([binding("D", 1), binding("_Q", 1)])
                                  ),
                                  proof(
                                    goal(dff(0, 1, 1, 0)),
                                    by(fact("gray-code-counter.pl", clause(13))),
                                    bindings([binding("D", 0), binding("_Q", 1)])
                                  ),
                                  proof(
                                    goal(dff(1, 1, 1, 1)),
                                    by(fact("gray-code-counter.pl", clause(13))),
                                    bindings([binding("D", 1), binding("_Q", 1)])
                                  )
                                ])
                              ),
                              proof(
                                goal(testgcc([1, 1, 1], [1, 0, 1], [[1, 0, 0], [0, 0, 0], [0, 0, 1]])),
                                by(rule("gray-code-counter.pl", clause(18))),
                                bindings([binding("C", 1), binding("Cs", [1, 1]), binding("State", [1, 0, 1]), binding("Next", [1, 0, 0]), binding("Rest", [[0, 0, 0], [0, 0, 1]])]),
                                uses([
                                  proof(
                                    goal(gcc(1, [1, 0, 1], [1, 0, 0])),
                                    by(rule("gray-code-counter.pl", clause(16))),
                                    bindings([binding("C", 1), binding("Qa", 1), binding("Qb", 0), binding("Qc", 1), binding("Za", 1), binding("Zb", 0), binding("Zc", 0), binding("D1", 1), binding("D2", 0), binding("D3", 0)]),
                                    uses([
                                      proof(
                                        goal(netb(1, 0, 1, 1, 0)),
                                        by(rule("gray-code-counter.pl", clause(15))),
                                        bindings([binding("A", 1), binding("B", 0), binding("C", 1), binding("Q1", 1), binding("Q2", 0), binding("T1", 1), binding("NC", 0), binding("T2", 0), binding("NA", 0), binding("T3", 0)]),
                                        uses([
                                          proof(
                                            goal(and(1, 1, 1)),
                                            by(fact("gray-code-counter.pl", clause(5)))
                                          ),
                                          proof(
                                            goal(inv(1, 0)),
                                            by(fact("gray-code-counter.pl", clause(11)))
                                          ),
                                          proof(
                                            goal(and(0, 0, 0)),
                                            by(fact("gray-code-counter.pl", clause(2)))
                                          ),
                                          proof(
                                            goal(inv(1, 0)),
                                            by(fact("gray-code-counter.pl", clause(11)))
                                          ),
                                          proof(
                                            goal(and(0, 1, 0)),
                                            by(fact("gray-code-counter.pl", clause(3)))
                                          ),
                                          proof(
                                            goal(or(1, 0, 1)),
                                            by(fact("gray-code-counter.pl", clause(8)))
                                          ),
                                          proof(
                                            goal(or(0, 0, 0)),
                                            by(fact("gray-code-counter.pl", clause(6)))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(neta(1, 0, 0)),
                                        by(rule("gray-code-counter.pl", clause(14))),
                                        bindings([binding("A", 1), binding("B", 0), binding("Q", 0), binding("T1", 0), binding("NA", 0), binding("NB", 1), binding("T2", 0)]),
                                        uses([
                                          proof(
                                            goal(and(1, 0, 0)),
                                            by(fact("gray-code-counter.pl", clause(4)))
                                          ),
                                          proof(
                                            goal(inv(1, 0)),
                                            by(fact("gray-code-counter.pl", clause(11)))
                                          ),
                                          proof(
                                            goal(inv(0, 1)),
                                            by(fact("gray-code-counter.pl", clause(10)))
                                          ),
                                          proof(
                                            goal(and(0, 1, 0)),
                                            by(fact("gray-code-counter.pl", clause(3)))
                                          ),
                                          proof(
                                            goal(or(0, 0, 0)),
                                            by(fact("gray-code-counter.pl", clause(6)))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(dff(1, 1, 1, 1)),
                                        by(fact("gray-code-counter.pl", clause(13))),
                                        bindings([binding("D", 1), binding("_Q", 1)])
                                      ),
                                      proof(
                                        goal(dff(0, 1, 0, 0)),
                                        by(fact("gray-code-counter.pl", clause(13))),
                                        bindings([binding("D", 0), binding("_Q", 0)])
                                      ),
                                      proof(
                                        goal(dff(0, 1, 1, 0)),
                                        by(fact("gray-code-counter.pl", clause(13))),
                                        bindings([binding("D", 0), binding("_Q", 1)])
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(testgcc([1, 1], [1, 0, 0], [[0, 0, 0], [0, 0, 1]])),
                                    by(rule("gray-code-counter.pl", clause(18))),
                                    bindings([binding("C", 1), binding("Cs", [1]), binding("State", [1, 0, 0]), binding("Next", [0, 0, 0]), binding("Rest", [[0, 0, 1]])]),
                                    uses([
                                      proof(
                                        goal(gcc(1, [1, 0, 0], [0, 0, 0])),
                                        by(rule("gray-code-counter.pl", clause(16))),
                                        bindings([binding("C", 1), binding("Qa", 1), binding("Qb", 0), binding("Qc", 0), binding("Za", 0), binding("Zb", 0), binding("Zc", 0), binding("D1", 0), binding("D2", 0), binding("D3", 0)]),
                                        uses([
                                          proof(
                                            goal(netb(1, 0, 0, 0, 0)),
                                            by(rule("gray-code-counter.pl", clause(15))),
                                            bindings([binding("A", 1), binding("B", 0), binding("C", 0), binding("Q1", 0), binding("Q2", 0), binding("T1", 0), binding("NC", 1), binding("T2", 0), binding("NA", 0), binding("T3", 0)]),
                                            uses([
                                              proof(
                                                goal(and(1, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(4)))
                                              ),
                                              proof(
                                                goal(inv(0, 1)),
                                                by(fact("gray-code-counter.pl", clause(10)))
                                              ),
                                              proof(
                                                goal(and(0, 1, 0)),
                                                by(fact("gray-code-counter.pl", clause(3)))
                                              ),
                                              proof(
                                                goal(inv(1, 0)),
                                                by(fact("gray-code-counter.pl", clause(11)))
                                              ),
                                              proof(
                                                goal(and(0, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(2)))
                                              ),
                                              proof(
                                                goal(or(0, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(6)))
                                              ),
                                              proof(
                                                goal(or(0, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(6)))
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(neta(1, 0, 0)),
                                            by(rule("gray-code-counter.pl", clause(14))),
                                            bindings([binding("A", 1), binding("B", 0), binding("Q", 0), binding("T1", 0), binding("NA", 0), binding("NB", 1), binding("T2", 0)]),
                                            uses([
                                              proof(
                                                goal(and(1, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(4)))
                                              ),
                                              proof(
                                                goal(inv(1, 0)),
                                                by(fact("gray-code-counter.pl", clause(11)))
                                              ),
                                              proof(
                                                goal(inv(0, 1)),
                                                by(fact("gray-code-counter.pl", clause(10)))
                                              ),
                                              proof(
                                                goal(and(0, 1, 0)),
                                                by(fact("gray-code-counter.pl", clause(3)))
                                              ),
                                              proof(
                                                goal(or(0, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(6)))
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(dff(0, 1, 1, 0)),
                                            by(fact("gray-code-counter.pl", clause(13))),
                                            bindings([binding("D", 0), binding("_Q", 1)])
                                          ),
                                          proof(
                                            goal(dff(0, 1, 0, 0)),
                                            by(fact("gray-code-counter.pl", clause(13))),
                                            bindings([binding("D", 0), binding("_Q", 0)])
                                          ),
                                          proof(
                                            goal(dff(0, 1, 0, 0)),
                                            by(fact("gray-code-counter.pl", clause(13))),
                                            bindings([binding("D", 0), binding("_Q", 0)])
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(testgcc([1], [0, 0, 0], [[0, 0, 1]])),
                                        by(rule("gray-code-counter.pl", clause(18))),
                                        bindings([binding("C", 1), binding("Cs", []), binding("State", [0, 0, 0]), binding("Next", [0, 0, 1]), binding("Rest", [])]),
                                        uses([
                                          proof(
                                            goal(gcc(1, [0, 0, 0], [0, 0, 1])),
                                            by(rule("gray-code-counter.pl", clause(16))),
                                            bindings([binding("C", 1), binding("Qa", 0), binding("Qb", 0), binding("Qc", 0), binding("Za", 0), binding("Zb", 0), binding("Zc", 1), binding("D1", 0), binding("D2", 0), binding("D3", 1)]),
                                            uses([
                                              proof(
                                                goal(netb(0, 0, 0, 0, 0)),
                                                by(rule("gray-code-counter.pl", clause(15))),
                                                bindings([binding("A", 0), binding("B", 0), binding("C", 0), binding("Q1", 0), binding("Q2", 0), binding("T1", 0), binding("NC", 1), binding("T2", 0), binding("NA", 1), binding("T3", 0)]),
                                                uses([
                                                  proof(
                                                    goal(and(0, 0, 0)),
                                                    by(fact("gray-code-counter.pl", clause(2)))
                                                  ),
                                                  proof(
                                                    goal(inv(0, 1)),
                                                    by(fact("gray-code-counter.pl", clause(10)))
                                                  ),
                                                  proof(
                                                    goal(and(0, 1, 0)),
                                                    by(fact("gray-code-counter.pl", clause(3)))
                                                  ),
                                                  proof(
                                                    goal(inv(0, 1)),
                                                    by(fact("gray-code-counter.pl", clause(10)))
                                                  ),
                                                  proof(
                                                    goal(and(1, 0, 0)),
                                                    by(fact("gray-code-counter.pl", clause(4)))
                                                  ),
                                                  proof(
                                                    goal(or(0, 0, 0)),
                                                    by(fact("gray-code-counter.pl", clause(6)))
                                                  ),
                                                  proof(
                                                    goal(or(0, 0, 0)),
                                                    by(fact("gray-code-counter.pl", clause(6)))
                                                  )
                                                ])
                                              ),
                                              proof(
                                                goal(neta(0, 0, 1)),
                                                by(rule("gray-code-counter.pl", clause(14))),
                                                bindings([binding("A", 0), binding("B", 0), binding("Q", 1), binding("T1", 0), binding("NA", 1), binding("NB", 1), binding("T2", 1)]),
                                                uses([
                                                  proof(
                                                    goal(and(0, 0, 0)),
                                                    by(fact("gray-code-counter.pl", clause(2)))
                                                  ),
                                                  proof(
                                                    goal(inv(0, 1)),
                                                    by(fact("gray-code-counter.pl", clause(10)))
                                                  ),
                                                  proof(
                                                    goal(inv(0, 1)),
                                                    by(fact("gray-code-counter.pl", clause(10)))
                                                  ),
                                                  proof(
                                                    goal(and(1, 1, 1)),
                                                    by(fact("gray-code-counter.pl", clause(5)))
                                                  ),
                                                  proof(
                                                    goal(or(0, 1, 1)),
                                                    by(fact("gray-code-counter.pl", clause(7)))
                                                  )
                                                ])
                                              ),
                                              proof(
                                                goal(dff(0, 1, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(13))),
                                                bindings([binding("D", 0), binding("_Q", 0)])
                                              ),
                                              proof(
                                                goal(dff(0, 1, 0, 0)),
                                                by(fact("gray-code-counter.pl", clause(13))),
                                                bindings([binding("D", 0), binding("_Q", 0)])
                                              ),
                                              proof(
                                                goal(dff(1, 1, 0, 1)),
                                                by(fact("gray-code-counter.pl", clause(13))),
                                                bindings([binding("D", 1), binding("_Q", 0)])
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(testgcc([], [0, 0, 1], [])),
                                            by(fact("gray-code-counter.pl", clause(17))),
                                            bindings([binding("_State", [0, 0, 1])])
                                          )
                                        ])
                                      )
                                    ])
                                  )
                                ])
                              )
                            ])
                          )
                        ])
                      )
                    ])
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

