type(meas47, lld_alarm).
why(
  type(meas47, lld_alarm),
  proof(
    goal(type(meas47, lld_alarm)), by(rule("lldm.pl", clause(54))),
    bindings([binding("M", meas47), binding("D", -1.9082339805374957), binding("T", 1.25), binding("NegT", -1.25)]),
    uses([
      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
      proof(
        goal(val(meas47, dCm, -1.9082339805374957)), by(rule("lldm.pl", clause(53))),
        bindings([binding("M", meas47), binding("Z", -1.9082339805374957), binding("X", 21.548900464617255), binding("Y", 23.45713444515475)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
            bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
                bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                    bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                        bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                            bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                    bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                        bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                        bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                          proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                    bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                      proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                          proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                    bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                        bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                            bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                                bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                    bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                        bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                            bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                                bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                    bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                    bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(
                                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                      proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                                bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                                  proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                            bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                      proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                              proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                          proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
            ])
          ),
          proof(
            goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
            bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
                bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                    bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                        bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                            bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                    bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                        bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                        bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                          proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                    bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                      proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                          proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                    bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                        bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                            bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                                bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                    bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                        bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                            bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                                bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                    bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                    bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(
                                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                      proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                                bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                                  proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                            bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                      proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                              proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                          proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
            ])
          ),
          proof(goal(sub(21.548900464617255, 23.45713444515475, -1.9082339805374957)), by(builtin(sub, 3)))
        ])
      ),
      proof(goal(threshold(meas47, lld_alarm_threshold_cm, 1.25)), by(fact("lldm.pl", clause(16)))),
      proof(goal(sub(0, 1.25, -1.25)), by(builtin(sub, 3))),
      proof(goal(lt(-1.9082339805374957, -1.25)), by(builtin(lt, 2)))
    ])
  )
).

lld_left_length_cm(meas47, 21.548900464617255).
why(
  lld_left_length_cm(meas47, 21.548900464617255),
  proof(
    goal(lld_left_length_cm(meas47, 21.548900464617255)), by(rule("lldm.pl", clause(56))),
    bindings([binding("M", meas47), binding("L", 21.548900464617255)]),
    uses([
      proof(
        goal(type(meas47, lld_alarm)), by(rule("lldm.pl", clause(54))),
        bindings([binding("M", meas47), binding("D", -1.9082339805374957), binding("T", 1.25), binding("NegT", -1.25)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, dCm, -1.9082339805374957)), by(rule("lldm.pl", clause(53))),
            bindings([binding("M", meas47), binding("Z", -1.9082339805374957), binding("X", 21.548900464617255), binding("Y", 23.45713444515475)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
                bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
                    bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                        bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                            bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                    bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                        bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                            bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                            bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                              proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                        bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                          proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                              proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                        bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                            bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                                bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                                    bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                        bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                            bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                                bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                                    bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                        bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                        bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                          proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                                    bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                                      proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                  proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                              proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
                bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
                    bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                        bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                            bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                    bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                        bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                            bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                            bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                              proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                        bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                          proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                              proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                        bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                            bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                                bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                                    bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                        bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                            bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                                bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                                    bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                        bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                        bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                          proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                                    bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                                      proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                  proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                              proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(sub(21.548900464617255, 23.45713444515475, -1.9082339805374957)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(threshold(meas47, lld_alarm_threshold_cm, 1.25)), by(fact("lldm.pl", clause(16)))),
          proof(goal(sub(0, 1.25, -1.25)), by(builtin(sub, 3))),
          proof(goal(lt(-1.9082339805374957, -1.25)), by(builtin(lt, 2)))
        ])
      ),
      proof(
        goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
        bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
            bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                    bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                        bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                            bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                    bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                      proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                    bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                      proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                  proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                  proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(
                            goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                            bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                        ])
                      ),
                      proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                      proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                    bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                        bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                            bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                    bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                        bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                            bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                  proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                            bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                              proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                        bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                  proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                          proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                      proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
        ])
      )
    ])
  )
).

lld_right_length_cm(meas47, 23.45713444515475).
why(
  lld_right_length_cm(meas47, 23.45713444515475),
  proof(
    goal(lld_right_length_cm(meas47, 23.45713444515475)), by(rule("lldm.pl", clause(57))),
    bindings([binding("M", meas47), binding("R", 23.45713444515475)]),
    uses([
      proof(
        goal(type(meas47, lld_alarm)), by(rule("lldm.pl", clause(54))),
        bindings([binding("M", meas47), binding("D", -1.9082339805374957), binding("T", 1.25), binding("NegT", -1.25)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, dCm, -1.9082339805374957)), by(rule("lldm.pl", clause(53))),
            bindings([binding("M", meas47), binding("Z", -1.9082339805374957), binding("X", 21.548900464617255), binding("Y", 23.45713444515475)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
                bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
                    bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                        bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                            bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                    bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                        bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                            bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                            bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                              proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                        bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                          proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                              proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                        bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                            bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                                bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                                    bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                        bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                            bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                                bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                                    bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                        bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                        bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                          proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                                    bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                                      proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                  proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                              proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
                bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
                    bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                        bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                            bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                    bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                        bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                            bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                            bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                              proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                        bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                          proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                              proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                        bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                            bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                                bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                                    bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                        bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                            bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                                bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                                    bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                        bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                        bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                          proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                                    bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                                      proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                  proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                              proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(sub(21.548900464617255, 23.45713444515475, -1.9082339805374957)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(threshold(meas47, lld_alarm_threshold_cm, 1.25)), by(fact("lldm.pl", clause(16)))),
          proof(goal(sub(0, 1.25, -1.25)), by(builtin(sub, 3))),
          proof(goal(lt(-1.9082339805374957, -1.25)), by(builtin(lt, 2)))
        ])
      ),
      proof(
        goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
        bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
            bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                    bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                        bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                            bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                    bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                      proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                    bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                      proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                  proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                  proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(
                            goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                            bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                        ])
                      ),
                      proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                      proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                    bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                        bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                            bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                    bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                        bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                            bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                  proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                            bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                              proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                        bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                  proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                          proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                      proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
        ])
      )
    ])
  )
).

lld_discrepancy_cm(meas47, -1.9082339805374957).
why(
  lld_discrepancy_cm(meas47, -1.9082339805374957),
  proof(
    goal(lld_discrepancy_cm(meas47, -1.9082339805374957)), by(rule("lldm.pl", clause(58))),
    bindings([binding("M", meas47), binding("D", -1.9082339805374957)]),
    uses([
      proof(
        goal(type(meas47, lld_alarm)), by(rule("lldm.pl", clause(54))),
        bindings([binding("M", meas47), binding("D", -1.9082339805374957), binding("T", 1.25), binding("NegT", -1.25)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, dCm, -1.9082339805374957)), by(rule("lldm.pl", clause(53))),
            bindings([binding("M", meas47), binding("Z", -1.9082339805374957), binding("X", 21.548900464617255), binding("Y", 23.45713444515475)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
                bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
                    bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                        bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                            bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                    bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                        bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                            bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                            bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                              proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                        bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                          proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                              proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                        bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                            bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                                bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                                    bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                        bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                            bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                                bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                                    bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                        bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                        bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                          proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                                    bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                                      proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                  proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                              proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
                bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
                    bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                        bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                            bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                    bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                        bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                            bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                            bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                              proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                        bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                          proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                              proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                        bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                            bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                                bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                                    bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                        bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                            bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                                bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                                    bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                        bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                        bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                          proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                                    bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                                      proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                  proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                              proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(sub(21.548900464617255, 23.45713444515475, -1.9082339805374957)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(threshold(meas47, lld_alarm_threshold_cm, 1.25)), by(fact("lldm.pl", clause(16)))),
          proof(goal(sub(0, 1.25, -1.25)), by(builtin(sub, 3))),
          proof(goal(lt(-1.9082339805374957, -1.25)), by(builtin(lt, 2)))
        ])
      ),
      proof(
        goal(val(meas47, dCm, -1.9082339805374957)), by(rule("lldm.pl", clause(53))),
        bindings([binding("M", meas47), binding("Z", -1.9082339805374957), binding("X", 21.548900464617255), binding("Y", 23.45713444515475)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
            bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
                bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                    bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                        bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                            bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                    bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                        bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                        bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                          proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                    bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                      proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                          proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                    bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                        bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                            bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                                bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                    bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                        bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                            bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                                bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                    bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                    bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(
                                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                      proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                                bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                                  proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                            bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                      proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                              proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                          proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
            ])
          ),
          proof(
            goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
            bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
                bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                    bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                        bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                            bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                    bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                        bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                        bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                          proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                    bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                      proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(
                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                          proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(
                    goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                    bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                        bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                            bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                                bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                    bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                        bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                            bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                                bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                    bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                    bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(
                                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                      proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                                bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                  proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                                  proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                            bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                      proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                              proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                            ])
                          ),
                          proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                          proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                    ])
                  ),
                  proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
            ])
          ),
          proof(goal(sub(21.548900464617255, 23.45713444515475, -1.9082339805374957)), by(builtin(sub, 3)))
        ])
      )
    ])
  )
).

lld_threshold_cm(meas47, 1.25).
why(
  lld_threshold_cm(meas47, 1.25),
  proof(
    goal(lld_threshold_cm(meas47, 1.25)), by(rule("lldm.pl", clause(59))),
    bindings([binding("M", meas47), binding("T", 1.25)]),
    uses([
      proof(
        goal(type(meas47, lld_alarm)), by(rule("lldm.pl", clause(54))),
        bindings([binding("M", meas47), binding("D", -1.9082339805374957), binding("T", 1.25), binding("NegT", -1.25)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, dCm, -1.9082339805374957)), by(rule("lldm.pl", clause(53))),
            bindings([binding("M", meas47), binding("Z", -1.9082339805374957), binding("X", 21.548900464617255), binding("Y", 23.45713444515475)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
                bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
                    bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                        bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                            bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                    bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                        bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                            bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                            bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                              proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                        bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                          proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                              proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                        bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                            bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                                bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                                    bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                        bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                            bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                                bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                                    bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                        bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                        bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                          proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                                    bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                                      proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                  proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                              proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
                bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
                    bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                        bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                            bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                    bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                        bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                            bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                            bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                              proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                        bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                          proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                              proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                        bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                            bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                                bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                                    bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                        bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                            bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                                bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                                    bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                        bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                        bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                          proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                                    bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                                      proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                  proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                              proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(sub(21.548900464617255, 23.45713444515475, -1.9082339805374957)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(threshold(meas47, lld_alarm_threshold_cm, 1.25)), by(fact("lldm.pl", clause(16)))),
          proof(goal(sub(0, 1.25, -1.25)), by(builtin(sub, 3))),
          proof(goal(lt(-1.9082339805374957, -1.25)), by(builtin(lt, 2)))
        ])
      ),
      proof(goal(threshold(meas47, lld_alarm_threshold_cm, 1.25)), by(fact("lldm.pl", clause(16))))
    ])
  )
).

lld_reason(meas47, "discrepancy below negative threshold").
why(
  lld_reason(meas47, "discrepancy below negative threshold"),
  proof(
    goal(lld_reason(meas47, "discrepancy below negative threshold")), by(rule("lldm.pl", clause(60))),
    bindings([binding("M", meas47)]),
    uses([
      proof(
        goal(type(meas47, lld_alarm)), by(rule("lldm.pl", clause(54))),
        bindings([binding("M", meas47), binding("D", -1.9082339805374957), binding("T", 1.25), binding("NegT", -1.25)]),
        uses([
          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
          proof(
            goal(val(meas47, dCm, -1.9082339805374957)), by(rule("lldm.pl", clause(53))),
            bindings([binding("M", meas47), binding("Z", -1.9082339805374957), binding("X", 21.548900464617255), binding("Y", 23.45713444515475)]),
            uses([
              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
              proof(
                goal(val(meas47, d53Cm, 21.548900464617255)), by(rule("lldm.pl", clause(51))),
                bindings([binding("M", meas47), binding("Z", 21.548900464617255), binding("X", 464.35511123398175)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd53Cm2, 464.35511123398175)), by(rule("lldm.pl", clause(49))),
                    bindings([binding("M", meas47), binding("Z", 464.35511123398175), binding("X", 1.8274562043619251), binding("Y", 462.52765502961984)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx53Cm2, 1.8274562043619251)), by(rule("lldm.pl", clause(45))),
                        bindings([binding("M", meas47), binding("Z", 1.8274562043619251), binding("X", -1.3518343849606449)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx53Cm, -1.3518343849606449)), by(rule("lldm.pl", clause(19))),
                            bindings([binding("M", meas47), binding("Z", -1.3518343849606449), binding("X", 2.2481656150393552), binding("Y", 3.6)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                    bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                        bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                            bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                            bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                              proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                        bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                          proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                          proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                              proof(goal(sub(2.2481656150393552, 3.6, -1.3518343849606449)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.3518343849606449, 2, 1.8274562043619251)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy53Cm2, 462.52765502961984)), by(rule("lldm.pl", clause(47))),
                        bindings([binding("M", meas47), binding("Z", 462.52765502961984), binding("X", -21.506456124373905)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy53Cm, -21.506456124373905)), by(rule("lldm.pl", clause(25))),
                            bindings([binding("M", meas47), binding("Z", -21.506456124373905), binding("X", 8.2935438756260975), binding("Y", 29.8)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p5yCm, 8.2935438756260975)), by(rule("lldm.pl", clause(42))),
                                bindings([binding("M", meas47), binding("Z", 8.2935438756260975), binding("X", 0.49354387562609769), binding("Y", 7.8)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx51Cm, 0.49354387562609769)), by(rule("lldm.pl", clause(39))),
                                    bindings([binding("M", meas47), binding("Z", 0.49354387562609769), binding("X", -0.062857142857142861), binding("Y", -7.8518343849606449)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx51Cm, -7.8518343849606449)), by(rule("lldm.pl", clause(18))),
                                        bindings([binding("M", meas47), binding("Z", -7.8518343849606449), binding("X", 2.2481656150393552), binding("Y", 10.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p5xCm, 2.2481656150393552)), by(rule("lldm.pl", clause(41))),
                                            bindings([binding("M", meas47), binding("Z", 2.2481656150393552), binding("X", -35.907584415584417), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy13Cm, -35.907584415584417)), by(rule("lldm.pl", clause(35))),
                                                bindings([binding("M", meas47), binding("Z", -35.907584415584417), binding("X", -57.907584415584417), binding("Y", -22.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd13Cm, -57.907584415584417)), by(rule("lldm.pl", clause(34))),
                                                    bindings([binding("M", meas47), binding("Z", -57.907584415584417), binding("X", -0.6348571428571429), binding("Y", 57.272727272727273)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x1Cm, -0.6348571428571429)), by(rule("lldm.pl", clause(30))),
                                                        bindings([binding("M", meas47), binding("Z", -0.6348571428571429), binding("X", -0.062857142857142861), binding("Y", 10.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(mul(-0.062857142857142861, 10.1, -0.6348571428571429)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x3Cm, 57.272727272727273)), by(rule("lldm.pl", clause(32))),
                                                        bindings([binding("M", meas47), binding("Z", 57.272727272727273), binding("X", 15.909090909090908), binding("Y", 3.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p3xCm, 3.6)), by(fact("lldm.pl", clause(12)))),
                                                          proof(goal(mul(15.909090909090908, 3.6, 57.272727272727273)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-0.6348571428571429, 57.272727272727273, -57.907584415584417)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy13Cm, -22.0)), by(rule("lldm.pl", clause(23))),
                                                    bindings([binding("M", meas47), binding("Z", -22.0), binding("X", 7.8), binding("Y", 29.8)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                                                      proof(goal(sub(7.8, 29.8, -22.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-57.907584415584417, -22.0, -35.907584415584417)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-35.907584415584417, -15.971948051948051, 2.2481656150393552)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                          proof(goal(sub(2.2481656150393552, 10.1, -7.8518343849606449)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, -7.8518343849606449, 0.49354387562609769)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                  proof(goal(add(0.49354387562609769, 7.8, 8.2935438756260975)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p3yCm, 29.8)), by(fact("lldm.pl", clause(13)))),
                              proof(goal(sub(8.2935438756260975, 29.8, -21.506456124373905)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-21.506456124373905, 2, 462.52765502961984)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(1.8274562043619251, 462.52765502961984, 464.35511123398175)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(464.35511123398175, 0.5, 21.548900464617255)), by(builtin(pow, 3)))
                ])
              ),
              proof(
                goal(val(meas47, d64Cm, 23.45713444515475)), by(rule("lldm.pl", clause(52))),
                bindings([binding("M", meas47), binding("Z", 23.45713444515475), binding("X", 550.23715637806549)]),
                uses([
                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                  proof(
                    goal(val(meas47, ssd64Cm2, 550.23715637806549)), by(rule("lldm.pl", clause(50))),
                    bindings([binding("M", meas47), binding("Z", 550.23715637806549), binding("X", 2.1654425265642967), binding("Y", 548.07171385150116)]),
                    uses([
                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                      proof(
                        goal(val(meas47, sdx64Cm2, 2.1654425265642967)), by(rule("lldm.pl", clause(46))),
                        bindings([binding("M", meas47), binding("Z", 2.1654425265642967), binding("X", -1.4715442659207696)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dx64Cm, -1.4715442659207696)), by(rule("lldm.pl", clause(21))),
                            bindings([binding("M", meas47), binding("Z", -1.4715442659207696), binding("X", 53.228455734079233), binding("Y", 54.7)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                    bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                        bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                            bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                            bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                    bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                              proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                        bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                          proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                          proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(
                                    goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                    bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                        bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                            bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                    bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                    bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                      proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                      proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                ])
                                              ),
                                              proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                    ])
                                  ),
                                  proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                              proof(goal(sub(53.228455734079233, 54.7, -1.4715442659207696)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-1.4715442659207696, 2, 2.1654425265642967)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(
                        goal(val(meas47, sdy64Cm2, 548.07171385150116)), by(rule("lldm.pl", clause(48))),
                        bindings([binding("M", meas47), binding("Z", 548.07171385150116), binding("X", -23.410931503284981)]),
                        uses([
                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                          proof(
                            goal(val(meas47, dy64Cm, -23.410931503284981)), by(rule("lldm.pl", clause(26))),
                            bindings([binding("M", meas47), binding("Z", -23.410931503284981), binding("X", 5.0890684967150195), binding("Y", 28.5)]),
                            uses([
                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                              proof(
                                goal(val(meas47, p6yCm, 5.0890684967150195)), by(rule("lldm.pl", clause(44))),
                                bindings([binding("M", meas47), binding("Z", 5.0890684967150195), binding("X", -0.51093150328498027), binding("Y", 5.6)]),
                                uses([
                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                  proof(
                                    goal(val(meas47, pL1dx62Cm, -0.51093150328498027)), by(rule("lldm.pl", clause(40))),
                                    bindings([binding("M", meas47), binding("Z", -0.51093150328498027), binding("X", -0.062857142857142861), binding("Y", 8.1284557340792318)]),
                                    uses([
                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                      proof(
                                        goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                        bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                            bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                              proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                              proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(
                                            goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                            bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                              proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                              proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                            ])
                                          ),
                                          proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                        ])
                                      ),
                                      proof(
                                        goal(val(meas47, dx62Cm, 8.1284557340792318)), by(rule("lldm.pl", clause(20))),
                                        bindings([binding("M", meas47), binding("Z", 8.1284557340792318), binding("X", 53.228455734079233), binding("Y", 45.1)]),
                                        uses([
                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                          proof(
                                            goal(val(meas47, p6xCm, 53.228455734079233)), by(rule("lldm.pl", clause(43))),
                                            bindings([binding("M", meas47), binding("Z", 53.228455734079233), binding("X", -850.16212987012989), binding("Y", -15.971948051948051)]),
                                            uses([
                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                              proof(
                                                goal(val(meas47, ddy24Cm, -850.16212987012989)), by(rule("lldm.pl", clause(37))),
                                                bindings([binding("M", meas47), binding("Z", -850.16212987012989), binding("X", -873.06212987012987), binding("Y", -22.899999999999999)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, dd24Cm, -873.06212987012987)), by(rule("lldm.pl", clause(36))),
                                                    bindings([binding("M", meas47), binding("Z", -873.06212987012987), binding("X", -2.834857142857143), binding("Y", 870.22727272727275)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, pL1x2Cm, -2.834857142857143)), by(rule("lldm.pl", clause(31))),
                                                        bindings([binding("M", meas47), binding("Z", -2.834857142857143), binding("X", -0.062857142857142861), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(mul(-0.062857142857142861, 45.1, -2.834857142857143)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, pL3x4Cm, 870.22727272727275)), by(rule("lldm.pl", clause(33))),
                                                        bindings([binding("M", meas47), binding("Z", 870.22727272727275), binding("X", 15.909090909090908), binding("Y", 54.7)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                            bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                                bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(
                                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                                    uses([
                                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                      proof(
                                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                        uses([
                                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                        ])
                                                                      ),
                                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                                    ])
                                                                  ),
                                                                  proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(val(meas47, p4xCm, 54.7)), by(fact("lldm.pl", clause(14)))),
                                                          proof(goal(mul(15.909090909090908, 54.7, 870.22727272727275)), by(builtin(mul, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(-2.834857142857143, 870.22727272727275, -873.06212987012987)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, dy24Cm, -22.899999999999999)), by(rule("lldm.pl", clause(24))),
                                                    bindings([binding("M", meas47), binding("Z", -22.899999999999999), binding("X", 5.6), binding("Y", 28.5)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                      proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                                                      proof(goal(sub(5.6, 28.5, -22.899999999999999)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-873.06212987012987, -22.899999999999999, -850.16212987012989)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(
                                                goal(val(meas47, ddL13, -15.971948051948051)), by(rule("lldm.pl", clause(38))),
                                                bindings([binding("M", meas47), binding("Z", -15.971948051948051), binding("X", -0.062857142857142861), binding("Y", 15.909090909090908)]),
                                                uses([
                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                  proof(
                                                    goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                    bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                        bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                          proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                          proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                        bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                          proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(val(meas47, cL3, 15.909090909090908)), by(rule("lldm.pl", clause(29))),
                                                    bindings([binding("M", meas47), binding("Z", 15.909090909090908), binding("X", -15.909090909090908)]),
                                                    uses([
                                                      proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                      proof(
                                                        goal(val(meas47, dL3m, -15.909090909090908)), by(rule("lldm.pl", clause(28))),
                                                        bindings([binding("M", meas47), binding("Z", -15.909090909090908), binding("X", -0.062857142857142861)]),
                                                        uses([
                                                          proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                          proof(
                                                            goal(val(meas47, cL1, -0.062857142857142861)), by(rule("lldm.pl", clause(27))),
                                                            bindings([binding("M", meas47), binding("Z", -0.062857142857142861), binding("Y", 2.2000000000000002), binding("X", -35.0)]),
                                                            uses([
                                                              proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                              proof(
                                                                goal(val(meas47, dy12Cm, 2.2000000000000002)), by(rule("lldm.pl", clause(22))),
                                                                bindings([binding("M", meas47), binding("Z", 2.2000000000000002), binding("X", 7.8), binding("Y", 5.6)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1yCm, 7.8)), by(fact("lldm.pl", clause(9)))),
                                                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                                                  proof(goal(sub(7.8, 5.6, 2.2000000000000002)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(val(meas47, dx12Cm, -35.0)), by(rule("lldm.pl", clause(17))),
                                                                bindings([binding("M", meas47), binding("Z", -35.0), binding("X", 10.1), binding("Y", 45.1)]),
                                                                uses([
                                                                  proof(goal(measurement(meas47)), by(fact("lldm.pl", clause(7)))),
                                                                  proof(goal(val(meas47, p1xCm, 10.1)), by(fact("lldm.pl", clause(8)))),
                                                                  proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                                                  proof(goal(sub(10.1, 45.1, -35.0)), by(builtin(sub, 3)))
                                                                ])
                                                              ),
                                                              proof(goal(div(2.2000000000000002, -35.0, -0.062857142857142861)), by(builtin(div, 3)))
                                                            ])
                                                          ),
                                                          proof(goal(div(1, -0.062857142857142861, -15.909090909090908)), by(builtin(div, 3)))
                                                        ])
                                                      ),
                                                      proof(goal(sub(0, -15.909090909090908, 15.909090909090908)), by(builtin(sub, 3)))
                                                    ])
                                                  ),
                                                  proof(goal(sub(-0.062857142857142861, 15.909090909090908, -15.971948051948051)), by(builtin(sub, 3)))
                                                ])
                                              ),
                                              proof(goal(div(-850.16212987012989, -15.971948051948051, 53.228455734079233)), by(builtin(div, 3)))
                                            ])
                                          ),
                                          proof(goal(val(meas47, p2xCm, 45.1)), by(fact("lldm.pl", clause(10)))),
                                          proof(goal(sub(53.228455734079233, 45.1, 8.1284557340792318)), by(builtin(sub, 3)))
                                        ])
                                      ),
                                      proof(goal(mul(-0.062857142857142861, 8.1284557340792318, -0.51093150328498027)), by(builtin(mul, 3)))
                                    ])
                                  ),
                                  proof(goal(val(meas47, p2yCm, 5.6)), by(fact("lldm.pl", clause(11)))),
                                  proof(goal(add(-0.51093150328498027, 5.6, 5.0890684967150195)), by(builtin(add, 3)))
                                ])
                              ),
                              proof(goal(val(meas47, p4yCm, 28.5)), by(fact("lldm.pl", clause(15)))),
                              proof(goal(sub(5.0890684967150195, 28.5, -23.410931503284981)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(pow(-23.410931503284981, 2, 548.07171385150116)), by(builtin(pow, 3)))
                        ])
                      ),
                      proof(goal(add(2.1654425265642967, 548.07171385150116, 550.23715637806549)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(pow(550.23715637806549, 0.5, 23.45713444515475)), by(builtin(pow, 3)))
                ])
              ),
              proof(goal(sub(21.548900464617255, 23.45713444515475, -1.9082339805374957)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(threshold(meas47, lld_alarm_threshold_cm, 1.25)), by(fact("lldm.pl", clause(16)))),
          proof(goal(sub(0, 1.25, -1.25)), by(builtin(sub, 3))),
          proof(goal(lt(-1.9082339805374957, -1.25)), by(builtin(lt, 2)))
        ])
      )
    ])
  )
).

