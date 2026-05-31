slope(regression1, 0.80000000000000004).
why(
  slope(regression1, 0.80000000000000004),
  proof(
    goal(slope(regression1, 0.80000000000000004)),
    by(rule("least-squares-regression.pl", clause(11))),
    bindings([binding("Data", regression1), binding("Slope", 0.80000000000000004), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("_SumYY", 54.0), binding("NSumXY", 156.0), binding("SumXSumY", 140.0), binding("Numerator", 16.0), binding("NSumXX", 120.0), binding("SumXSquared", 100.0), binding("Denominator", 20.0)]),
    uses([
      proof(
        goal(sufficient_statistics(regression1, 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
        by(rule("least-squares-regression.pl", clause(10))),
        bindings([binding("Data", regression1), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("Points", [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])]),
        uses([
          proof(
            goal(dataset(regression1, [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])),
            by(fact("least-squares-regression.pl", clause(6)))
          ),
          proof(
            goal(stats([point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
            by(rule("least-squares-regression.pl", clause(9))),
            bindings([binding("X", 1.0), binding("Y", 2.0), binding("Rest", [point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("N0", 3.0), binding("SumX0", 9.0), binding("SumY0", 12.0), binding("SumXX0", 29.0), binding("SumXY0", 37.0), binding("SumYY0", 50.0), binding("XX", 1.0), binding("XY", 2.0), binding("YY", 4.0)]),
            uses([
              proof(
                goal(stats([point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 3.0, 9.0, 12.0, 29.0, 37.0, 50.0)),
                by(rule("least-squares-regression.pl", clause(9))),
                bindings([binding("X", 2.0), binding("Y", 3.0), binding("Rest", [point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 3.0), binding("SumX", 9.0), binding("SumY", 12.0), binding("SumXX", 29.0), binding("SumXY", 37.0), binding("SumYY", 50.0), binding("N0", 2.0), binding("SumX0", 7.0), binding("SumY0", 9.0), binding("SumXX0", 25.0), binding("SumXY0", 31.0), binding("SumYY0", 41.0), binding("XX", 4.0), binding("XY", 6.0), binding("YY", 9.0)]),
                uses([
                  proof(
                    goal(stats([point(3.0, 5.0), point(4.0, 4.0)], 2.0, 7.0, 9.0, 25.0, 31.0, 41.0)),
                    by(rule("least-squares-regression.pl", clause(9))),
                    bindings([binding("X", 3.0), binding("Y", 5.0), binding("Rest", [point(4.0, 4.0)]), binding("N", 2.0), binding("SumX", 7.0), binding("SumY", 9.0), binding("SumXX", 25.0), binding("SumXY", 31.0), binding("SumYY", 41.0), binding("N0", 1.0), binding("SumX0", 4.0), binding("SumY0", 4.0), binding("SumXX0", 16.0), binding("SumXY0", 16.0), binding("SumYY0", 16.0), binding("XX", 9.0), binding("XY", 15.0), binding("YY", 25.0)]),
                    uses([
                      proof(
                        goal(stats([point(4.0, 4.0)], 1.0, 4.0, 4.0, 16.0, 16.0, 16.0)),
                        by(rule("least-squares-regression.pl", clause(9))),
                        bindings([binding("X", 4.0), binding("Y", 4.0), binding("Rest", []), binding("N", 1.0), binding("SumX", 4.0), binding("SumY", 4.0), binding("SumXX", 16.0), binding("SumXY", 16.0), binding("SumYY", 16.0), binding("N0", 0.0), binding("SumX0", 0.0), binding("SumY0", 0.0), binding("SumXX0", 0.0), binding("SumXY0", 0.0), binding("SumYY0", 0.0), binding("XX", 16.0), binding("XY", 16.0), binding("YY", 16.0)]),
                        uses([
                          proof(
                            goal(stats([], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)),
                            by(fact("least-squares-regression.pl", clause(8)))
                          ),
                          proof(
                            goal(add(0.0, 1.0, 1.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(0.0, 4.0, 4.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(0.0, 4.0, 4.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(4.0, 4.0, 16.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(0.0, 16.0, 16.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(4.0, 4.0, 16.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(0.0, 16.0, 16.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(4.0, 4.0, 16.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(0.0, 16.0, 16.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(1.0, 1.0, 2.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(4.0, 3.0, 7.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(4.0, 5.0, 9.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(3.0, 3.0, 9.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(16.0, 9.0, 25.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(3.0, 5.0, 15.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(16.0, 15.0, 31.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(5.0, 5.0, 25.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(16.0, 25.0, 41.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(2.0, 1.0, 3.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(7.0, 2.0, 9.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(9.0, 3.0, 12.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(2.0, 2.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(25.0, 4.0, 29.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(2.0, 3.0, 6.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(31.0, 6.0, 37.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(3.0, 3.0, 9.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(41.0, 9.0, 50.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(3.0, 1.0, 4.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(add(9.0, 1.0, 10.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(add(12.0, 2.0, 14.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(mul(1.0, 1.0, 1.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(29.0, 1.0, 30.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(mul(1.0, 2.0, 2.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(37.0, 2.0, 39.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(mul(2.0, 2.0, 4.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(50.0, 4.0, 54.0)),
                by(builtin(add, 3))
              )
            ])
          )
        ])
      ),
      proof(
        goal(mul(4.0, 39.0, 156.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(mul(10.0, 14.0, 140.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(sub(156.0, 140.0, 16.0)),
        by(builtin(sub, 3))
      ),
      proof(
        goal(mul(4.0, 30.0, 120.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(mul(10.0, 10.0, 100.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(sub(120.0, 100.0, 20.0)),
        by(builtin(sub, 3))
      ),
      proof(
        goal(div(16.0, 20.0, 0.80000000000000004)),
        by(builtin(div, 3))
      )
    ])
  )
).

intercept(regression1, 1.5).
why(
  intercept(regression1, 1.5),
  proof(
    goal(intercept(regression1, 1.5)),
    by(rule("least-squares-regression.pl", clause(12))),
    bindings([binding("Data", regression1), binding("Intercept", 1.5), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("_SumXX", 30.0), binding("_SumXY", 39.0), binding("_SumYY", 54.0), binding("Slope", 0.80000000000000004), binding("SlopeSumX", 8.0), binding("Numerator", 6.0)]),
    uses([
      proof(
        goal(sufficient_statistics(regression1, 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
        by(rule("least-squares-regression.pl", clause(10))),
        bindings([binding("Data", regression1), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("Points", [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])]),
        uses([
          proof(
            goal(dataset(regression1, [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])),
            by(fact("least-squares-regression.pl", clause(6)))
          ),
          proof(
            goal(stats([point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
            by(rule("least-squares-regression.pl", clause(9))),
            bindings([binding("X", 1.0), binding("Y", 2.0), binding("Rest", [point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("N0", 3.0), binding("SumX0", 9.0), binding("SumY0", 12.0), binding("SumXX0", 29.0), binding("SumXY0", 37.0), binding("SumYY0", 50.0), binding("XX", 1.0), binding("XY", 2.0), binding("YY", 4.0)]),
            uses([
              proof(
                goal(stats([point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 3.0, 9.0, 12.0, 29.0, 37.0, 50.0)),
                by(rule("least-squares-regression.pl", clause(9))),
                bindings([binding("X", 2.0), binding("Y", 3.0), binding("Rest", [point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 3.0), binding("SumX", 9.0), binding("SumY", 12.0), binding("SumXX", 29.0), binding("SumXY", 37.0), binding("SumYY", 50.0), binding("N0", 2.0), binding("SumX0", 7.0), binding("SumY0", 9.0), binding("SumXX0", 25.0), binding("SumXY0", 31.0), binding("SumYY0", 41.0), binding("XX", 4.0), binding("XY", 6.0), binding("YY", 9.0)]),
                uses([
                  proof(
                    goal(stats([point(3.0, 5.0), point(4.0, 4.0)], 2.0, 7.0, 9.0, 25.0, 31.0, 41.0)),
                    by(rule("least-squares-regression.pl", clause(9))),
                    bindings([binding("X", 3.0), binding("Y", 5.0), binding("Rest", [point(4.0, 4.0)]), binding("N", 2.0), binding("SumX", 7.0), binding("SumY", 9.0), binding("SumXX", 25.0), binding("SumXY", 31.0), binding("SumYY", 41.0), binding("N0", 1.0), binding("SumX0", 4.0), binding("SumY0", 4.0), binding("SumXX0", 16.0), binding("SumXY0", 16.0), binding("SumYY0", 16.0), binding("XX", 9.0), binding("XY", 15.0), binding("YY", 25.0)]),
                    uses([
                      proof(
                        goal(stats([point(4.0, 4.0)], 1.0, 4.0, 4.0, 16.0, 16.0, 16.0)),
                        by(rule("least-squares-regression.pl", clause(9))),
                        bindings([binding("X", 4.0), binding("Y", 4.0), binding("Rest", []), binding("N", 1.0), binding("SumX", 4.0), binding("SumY", 4.0), binding("SumXX", 16.0), binding("SumXY", 16.0), binding("SumYY", 16.0), binding("N0", 0.0), binding("SumX0", 0.0), binding("SumY0", 0.0), binding("SumXX0", 0.0), binding("SumXY0", 0.0), binding("SumYY0", 0.0), binding("XX", 16.0), binding("XY", 16.0), binding("YY", 16.0)]),
                        uses([
                          proof(
                            goal(stats([], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)),
                            by(fact("least-squares-regression.pl", clause(8)))
                          ),
                          proof(
                            goal(add(0.0, 1.0, 1.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(0.0, 4.0, 4.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(0.0, 4.0, 4.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(4.0, 4.0, 16.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(0.0, 16.0, 16.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(4.0, 4.0, 16.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(0.0, 16.0, 16.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(4.0, 4.0, 16.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(0.0, 16.0, 16.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(1.0, 1.0, 2.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(4.0, 3.0, 7.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(4.0, 5.0, 9.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(3.0, 3.0, 9.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(16.0, 9.0, 25.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(3.0, 5.0, 15.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(16.0, 15.0, 31.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(5.0, 5.0, 25.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(16.0, 25.0, 41.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(2.0, 1.0, 3.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(7.0, 2.0, 9.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(9.0, 3.0, 12.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(2.0, 2.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(25.0, 4.0, 29.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(2.0, 3.0, 6.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(31.0, 6.0, 37.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(3.0, 3.0, 9.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(41.0, 9.0, 50.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(3.0, 1.0, 4.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(add(9.0, 1.0, 10.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(add(12.0, 2.0, 14.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(mul(1.0, 1.0, 1.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(29.0, 1.0, 30.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(mul(1.0, 2.0, 2.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(37.0, 2.0, 39.0)),
                by(builtin(add, 3))
              ),
              proof(
                goal(mul(2.0, 2.0, 4.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(add(50.0, 4.0, 54.0)),
                by(builtin(add, 3))
              )
            ])
          )
        ])
      ),
      proof(
        goal(slope(regression1, 0.80000000000000004)),
        by(rule("least-squares-regression.pl", clause(11))),
        bindings([binding("Data", regression1), binding("Slope", 0.80000000000000004), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("_SumYY", 54.0), binding("NSumXY", 156.0), binding("SumXSumY", 140.0), binding("Numerator", 16.0), binding("NSumXX", 120.0), binding("SumXSquared", 100.0), binding("Denominator", 20.0)]),
        uses([
          proof(
            goal(sufficient_statistics(regression1, 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
            by(rule("least-squares-regression.pl", clause(10))),
            bindings([binding("Data", regression1), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("Points", [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])]),
            uses([
              proof(
                goal(dataset(regression1, [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])),
                by(fact("least-squares-regression.pl", clause(6)))
              ),
              proof(
                goal(stats([point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
                by(rule("least-squares-regression.pl", clause(9))),
                bindings([binding("X", 1.0), binding("Y", 2.0), binding("Rest", [point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("N0", 3.0), binding("SumX0", 9.0), binding("SumY0", 12.0), binding("SumXX0", 29.0), binding("SumXY0", 37.0), binding("SumYY0", 50.0), binding("XX", 1.0), binding("XY", 2.0), binding("YY", 4.0)]),
                uses([
                  proof(
                    goal(stats([point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 3.0, 9.0, 12.0, 29.0, 37.0, 50.0)),
                    by(rule("least-squares-regression.pl", clause(9))),
                    bindings([binding("X", 2.0), binding("Y", 3.0), binding("Rest", [point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 3.0), binding("SumX", 9.0), binding("SumY", 12.0), binding("SumXX", 29.0), binding("SumXY", 37.0), binding("SumYY", 50.0), binding("N0", 2.0), binding("SumX0", 7.0), binding("SumY0", 9.0), binding("SumXX0", 25.0), binding("SumXY0", 31.0), binding("SumYY0", 41.0), binding("XX", 4.0), binding("XY", 6.0), binding("YY", 9.0)]),
                    uses([
                      proof(
                        goal(stats([point(3.0, 5.0), point(4.0, 4.0)], 2.0, 7.0, 9.0, 25.0, 31.0, 41.0)),
                        by(rule("least-squares-regression.pl", clause(9))),
                        bindings([binding("X", 3.0), binding("Y", 5.0), binding("Rest", [point(4.0, 4.0)]), binding("N", 2.0), binding("SumX", 7.0), binding("SumY", 9.0), binding("SumXX", 25.0), binding("SumXY", 31.0), binding("SumYY", 41.0), binding("N0", 1.0), binding("SumX0", 4.0), binding("SumY0", 4.0), binding("SumXX0", 16.0), binding("SumXY0", 16.0), binding("SumYY0", 16.0), binding("XX", 9.0), binding("XY", 15.0), binding("YY", 25.0)]),
                        uses([
                          proof(
                            goal(stats([point(4.0, 4.0)], 1.0, 4.0, 4.0, 16.0, 16.0, 16.0)),
                            by(rule("least-squares-regression.pl", clause(9))),
                            bindings([binding("X", 4.0), binding("Y", 4.0), binding("Rest", []), binding("N", 1.0), binding("SumX", 4.0), binding("SumY", 4.0), binding("SumXX", 16.0), binding("SumXY", 16.0), binding("SumYY", 16.0), binding("N0", 0.0), binding("SumX0", 0.0), binding("SumY0", 0.0), binding("SumXX0", 0.0), binding("SumXY0", 0.0), binding("SumYY0", 0.0), binding("XX", 16.0), binding("XY", 16.0), binding("YY", 16.0)]),
                            uses([
                              proof(
                                goal(stats([], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)),
                                by(fact("least-squares-regression.pl", clause(8)))
                              ),
                              proof(
                                goal(add(0.0, 1.0, 1.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(0.0, 4.0, 4.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(0.0, 4.0, 4.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(4.0, 4.0, 16.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(0.0, 16.0, 16.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(4.0, 4.0, 16.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(0.0, 16.0, 16.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(4.0, 4.0, 16.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(0.0, 16.0, 16.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(1.0, 1.0, 2.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(4.0, 3.0, 7.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(4.0, 5.0, 9.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(3.0, 3.0, 9.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(16.0, 9.0, 25.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(3.0, 5.0, 15.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(16.0, 15.0, 31.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(5.0, 5.0, 25.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(16.0, 25.0, 41.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(2.0, 1.0, 3.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(7.0, 2.0, 9.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(9.0, 3.0, 12.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(2.0, 2.0, 4.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(25.0, 4.0, 29.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(2.0, 3.0, 6.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(31.0, 6.0, 37.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(3.0, 3.0, 9.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(41.0, 9.0, 50.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(3.0, 1.0, 4.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(9.0, 1.0, 10.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(12.0, 2.0, 14.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(1.0, 1.0, 1.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(29.0, 1.0, 30.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(1.0, 2.0, 2.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(37.0, 2.0, 39.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(2.0, 2.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(50.0, 4.0, 54.0)),
                    by(builtin(add, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(mul(4.0, 39.0, 156.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(10.0, 14.0, 140.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sub(156.0, 140.0, 16.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(mul(4.0, 30.0, 120.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(10.0, 10.0, 100.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sub(120.0, 100.0, 20.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(div(16.0, 20.0, 0.80000000000000004)),
            by(builtin(div, 3))
          )
        ])
      ),
      proof(
        goal(mul(0.80000000000000004, 10.0, 8.0)),
        by(builtin(mul, 3))
      ),
      proof(
        goal(sub(14.0, 8.0, 6.0)),
        by(builtin(sub, 3))
      ),
      proof(
        goal(div(6.0, 4.0, 1.5)),
        by(builtin(div, 3))
      )
    ])
  )
).

rSquared(regression1, 0.64000000000000001).
why(
  rSquared(regression1, 0.64000000000000001),
  proof(
    goal(rSquared(regression1, 0.64000000000000001)),
    by(rule("least-squares-regression.pl", clause(15))),
    bindings([binding("Data", regression1), binding("R2", 0.64000000000000001)]),
    uses([
      proof(
        goal(r_squared(regression1, 0.64000000000000001)),
        by(rule("least-squares-regression.pl", clause(13))),
        bindings([binding("Data", regression1), binding("R2", 0.64000000000000001), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("NSumXY", 156.0), binding("SumXSumY", 140.0), binding("NumeratorBase", 16.0), binding("Numerator", 256.0), binding("NSumXX", 120.0), binding("SumXSquared", 100.0), binding("XSpread", 20.0), binding("NSumYY", 216.0), binding("SumYSquared", 196.0), binding("YSpread", 20.0), binding("Denominator", 400.0)]),
        uses([
          proof(
            goal(sufficient_statistics(regression1, 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
            by(rule("least-squares-regression.pl", clause(10))),
            bindings([binding("Data", regression1), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("Points", [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])]),
            uses([
              proof(
                goal(dataset(regression1, [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])),
                by(fact("least-squares-regression.pl", clause(6)))
              ),
              proof(
                goal(stats([point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
                by(rule("least-squares-regression.pl", clause(9))),
                bindings([binding("X", 1.0), binding("Y", 2.0), binding("Rest", [point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("N0", 3.0), binding("SumX0", 9.0), binding("SumY0", 12.0), binding("SumXX0", 29.0), binding("SumXY0", 37.0), binding("SumYY0", 50.0), binding("XX", 1.0), binding("XY", 2.0), binding("YY", 4.0)]),
                uses([
                  proof(
                    goal(stats([point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 3.0, 9.0, 12.0, 29.0, 37.0, 50.0)),
                    by(rule("least-squares-regression.pl", clause(9))),
                    bindings([binding("X", 2.0), binding("Y", 3.0), binding("Rest", [point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 3.0), binding("SumX", 9.0), binding("SumY", 12.0), binding("SumXX", 29.0), binding("SumXY", 37.0), binding("SumYY", 50.0), binding("N0", 2.0), binding("SumX0", 7.0), binding("SumY0", 9.0), binding("SumXX0", 25.0), binding("SumXY0", 31.0), binding("SumYY0", 41.0), binding("XX", 4.0), binding("XY", 6.0), binding("YY", 9.0)]),
                    uses([
                      proof(
                        goal(stats([point(3.0, 5.0), point(4.0, 4.0)], 2.0, 7.0, 9.0, 25.0, 31.0, 41.0)),
                        by(rule("least-squares-regression.pl", clause(9))),
                        bindings([binding("X", 3.0), binding("Y", 5.0), binding("Rest", [point(4.0, 4.0)]), binding("N", 2.0), binding("SumX", 7.0), binding("SumY", 9.0), binding("SumXX", 25.0), binding("SumXY", 31.0), binding("SumYY", 41.0), binding("N0", 1.0), binding("SumX0", 4.0), binding("SumY0", 4.0), binding("SumXX0", 16.0), binding("SumXY0", 16.0), binding("SumYY0", 16.0), binding("XX", 9.0), binding("XY", 15.0), binding("YY", 25.0)]),
                        uses([
                          proof(
                            goal(stats([point(4.0, 4.0)], 1.0, 4.0, 4.0, 16.0, 16.0, 16.0)),
                            by(rule("least-squares-regression.pl", clause(9))),
                            bindings([binding("X", 4.0), binding("Y", 4.0), binding("Rest", []), binding("N", 1.0), binding("SumX", 4.0), binding("SumY", 4.0), binding("SumXX", 16.0), binding("SumXY", 16.0), binding("SumYY", 16.0), binding("N0", 0.0), binding("SumX0", 0.0), binding("SumY0", 0.0), binding("SumXX0", 0.0), binding("SumXY0", 0.0), binding("SumYY0", 0.0), binding("XX", 16.0), binding("XY", 16.0), binding("YY", 16.0)]),
                            uses([
                              proof(
                                goal(stats([], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)),
                                by(fact("least-squares-regression.pl", clause(8)))
                              ),
                              proof(
                                goal(add(0.0, 1.0, 1.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(0.0, 4.0, 4.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(0.0, 4.0, 4.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(4.0, 4.0, 16.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(0.0, 16.0, 16.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(4.0, 4.0, 16.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(0.0, 16.0, 16.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(4.0, 4.0, 16.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(0.0, 16.0, 16.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(1.0, 1.0, 2.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(4.0, 3.0, 7.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(4.0, 5.0, 9.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(3.0, 3.0, 9.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(16.0, 9.0, 25.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(3.0, 5.0, 15.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(16.0, 15.0, 31.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(5.0, 5.0, 25.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(16.0, 25.0, 41.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(2.0, 1.0, 3.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(7.0, 2.0, 9.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(9.0, 3.0, 12.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(2.0, 2.0, 4.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(25.0, 4.0, 29.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(2.0, 3.0, 6.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(31.0, 6.0, 37.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(3.0, 3.0, 9.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(41.0, 9.0, 50.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(3.0, 1.0, 4.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(9.0, 1.0, 10.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(add(12.0, 2.0, 14.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(1.0, 1.0, 1.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(29.0, 1.0, 30.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(1.0, 2.0, 2.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(37.0, 2.0, 39.0)),
                    by(builtin(add, 3))
                  ),
                  proof(
                    goal(mul(2.0, 2.0, 4.0)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(add(50.0, 4.0, 54.0)),
                    by(builtin(add, 3))
                  )
                ])
              )
            ])
          ),
          proof(
            goal(mul(4.0, 39.0, 156.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(10.0, 14.0, 140.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sub(156.0, 140.0, 16.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(pow(16.0, 2.0, 256.0)),
            by(builtin(pow, 3))
          ),
          proof(
            goal(mul(4.0, 30.0, 120.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(10.0, 10.0, 100.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sub(120.0, 100.0, 20.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(mul(4.0, 54.0, 216.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mul(14.0, 14.0, 196.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(sub(216.0, 196.0, 20.0)),
            by(builtin(sub, 3))
          ),
          proof(
            goal(mul(20.0, 20.0, 400.0)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(div(256.0, 400.0, 0.64000000000000001)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

status(regression1, accepted_linear_fit).
why(
  status(regression1, accepted_linear_fit),
  proof(
    goal(status(regression1, accepted_linear_fit)),
    by(rule("least-squares-regression.pl", clause(16))),
    bindings([binding("Data", regression1)]),
    uses([
      proof(
        goal(accepted_fit(regression1)),
        by(rule("least-squares-regression.pl", clause(14))),
        bindings([binding("Data", regression1), binding("R2", 0.64000000000000001), binding("Minimum", 0.60)]),
        uses([
          proof(
            goal(r_squared(regression1, 0.64000000000000001)),
            by(rule("least-squares-regression.pl", clause(13))),
            bindings([binding("Data", regression1), binding("R2", 0.64000000000000001), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("NSumXY", 156.0), binding("SumXSumY", 140.0), binding("NumeratorBase", 16.0), binding("Numerator", 256.0), binding("NSumXX", 120.0), binding("SumXSquared", 100.0), binding("XSpread", 20.0), binding("NSumYY", 216.0), binding("SumYSquared", 196.0), binding("YSpread", 20.0), binding("Denominator", 400.0)]),
            uses([
              proof(
                goal(sufficient_statistics(regression1, 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
                by(rule("least-squares-regression.pl", clause(10))),
                bindings([binding("Data", regression1), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("Points", [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])]),
                uses([
                  proof(
                    goal(dataset(regression1, [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])),
                    by(fact("least-squares-regression.pl", clause(6)))
                  ),
                  proof(
                    goal(stats([point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
                    by(rule("least-squares-regression.pl", clause(9))),
                    bindings([binding("X", 1.0), binding("Y", 2.0), binding("Rest", [point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("N0", 3.0), binding("SumX0", 9.0), binding("SumY0", 12.0), binding("SumXX0", 29.0), binding("SumXY0", 37.0), binding("SumYY0", 50.0), binding("XX", 1.0), binding("XY", 2.0), binding("YY", 4.0)]),
                    uses([
                      proof(
                        goal(stats([point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 3.0, 9.0, 12.0, 29.0, 37.0, 50.0)),
                        by(rule("least-squares-regression.pl", clause(9))),
                        bindings([binding("X", 2.0), binding("Y", 3.0), binding("Rest", [point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 3.0), binding("SumX", 9.0), binding("SumY", 12.0), binding("SumXX", 29.0), binding("SumXY", 37.0), binding("SumYY", 50.0), binding("N0", 2.0), binding("SumX0", 7.0), binding("SumY0", 9.0), binding("SumXX0", 25.0), binding("SumXY0", 31.0), binding("SumYY0", 41.0), binding("XX", 4.0), binding("XY", 6.0), binding("YY", 9.0)]),
                        uses([
                          proof(
                            goal(stats([point(3.0, 5.0), point(4.0, 4.0)], 2.0, 7.0, 9.0, 25.0, 31.0, 41.0)),
                            by(rule("least-squares-regression.pl", clause(9))),
                            bindings([binding("X", 3.0), binding("Y", 5.0), binding("Rest", [point(4.0, 4.0)]), binding("N", 2.0), binding("SumX", 7.0), binding("SumY", 9.0), binding("SumXX", 25.0), binding("SumXY", 31.0), binding("SumYY", 41.0), binding("N0", 1.0), binding("SumX0", 4.0), binding("SumY0", 4.0), binding("SumXX0", 16.0), binding("SumXY0", 16.0), binding("SumYY0", 16.0), binding("XX", 9.0), binding("XY", 15.0), binding("YY", 25.0)]),
                            uses([
                              proof(
                                goal(stats([point(4.0, 4.0)], 1.0, 4.0, 4.0, 16.0, 16.0, 16.0)),
                                by(rule("least-squares-regression.pl", clause(9))),
                                bindings([binding("X", 4.0), binding("Y", 4.0), binding("Rest", []), binding("N", 1.0), binding("SumX", 4.0), binding("SumY", 4.0), binding("SumXX", 16.0), binding("SumXY", 16.0), binding("SumYY", 16.0), binding("N0", 0.0), binding("SumX0", 0.0), binding("SumY0", 0.0), binding("SumXX0", 0.0), binding("SumXY0", 0.0), binding("SumYY0", 0.0), binding("XX", 16.0), binding("XY", 16.0), binding("YY", 16.0)]),
                                uses([
                                  proof(
                                    goal(stats([], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)),
                                    by(fact("least-squares-regression.pl", clause(8)))
                                  ),
                                  proof(
                                    goal(add(0.0, 1.0, 1.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 4.0, 4.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 4.0, 4.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(mul(4.0, 4.0, 16.0)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 16.0, 16.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(mul(4.0, 4.0, 16.0)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 16.0, 16.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(mul(4.0, 4.0, 16.0)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 16.0, 16.0)),
                                    by(builtin(add, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(add(1.0, 1.0, 2.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(4.0, 3.0, 7.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(4.0, 5.0, 9.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(3.0, 3.0, 9.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(16.0, 9.0, 25.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(3.0, 5.0, 15.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(16.0, 15.0, 31.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(5.0, 5.0, 25.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(16.0, 25.0, 41.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(2.0, 1.0, 3.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(7.0, 2.0, 9.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(9.0, 3.0, 12.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(2.0, 2.0, 4.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(25.0, 4.0, 29.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(2.0, 3.0, 6.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(31.0, 6.0, 37.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(3.0, 3.0, 9.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(41.0, 9.0, 50.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(3.0, 1.0, 4.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(9.0, 1.0, 10.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(12.0, 2.0, 14.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(1.0, 1.0, 1.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(29.0, 1.0, 30.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(1.0, 2.0, 2.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(37.0, 2.0, 39.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(2.0, 2.0, 4.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(50.0, 4.0, 54.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(mul(4.0, 39.0, 156.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(10.0, 14.0, 140.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(sub(156.0, 140.0, 16.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(pow(16.0, 2.0, 256.0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(4.0, 30.0, 120.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(10.0, 10.0, 100.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(sub(120.0, 100.0, 20.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(mul(4.0, 54.0, 216.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(14.0, 14.0, 196.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(sub(216.0, 196.0, 20.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(mul(20.0, 20.0, 400.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(256.0, 400.0, 0.64000000000000001)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(threshold(regression1, minimum_r_squared, 0.60)),
            by(fact("least-squares-regression.pl", clause(7)))
          ),
          proof(
            goal(ge(0.64000000000000001, 0.60)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

reason(regression1, "R squared meets the minimum explanatory-power threshold").
why(
  reason(regression1, "R squared meets the minimum explanatory-power threshold"),
  proof(
    goal(reason(regression1, "R squared meets the minimum explanatory-power threshold")),
    by(rule("least-squares-regression.pl", clause(17))),
    bindings([binding("Data", regression1)]),
    uses([
      proof(
        goal(accepted_fit(regression1)),
        by(rule("least-squares-regression.pl", clause(14))),
        bindings([binding("Data", regression1), binding("R2", 0.64000000000000001), binding("Minimum", 0.60)]),
        uses([
          proof(
            goal(r_squared(regression1, 0.64000000000000001)),
            by(rule("least-squares-regression.pl", clause(13))),
            bindings([binding("Data", regression1), binding("R2", 0.64000000000000001), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("NSumXY", 156.0), binding("SumXSumY", 140.0), binding("NumeratorBase", 16.0), binding("Numerator", 256.0), binding("NSumXX", 120.0), binding("SumXSquared", 100.0), binding("XSpread", 20.0), binding("NSumYY", 216.0), binding("SumYSquared", 196.0), binding("YSpread", 20.0), binding("Denominator", 400.0)]),
            uses([
              proof(
                goal(sufficient_statistics(regression1, 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
                by(rule("least-squares-regression.pl", clause(10))),
                bindings([binding("Data", regression1), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("Points", [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])]),
                uses([
                  proof(
                    goal(dataset(regression1, [point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)])),
                    by(fact("least-squares-regression.pl", clause(6)))
                  ),
                  proof(
                    goal(stats([point(1.0, 2.0), point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 4.0, 10.0, 14.0, 30.0, 39.0, 54.0)),
                    by(rule("least-squares-regression.pl", clause(9))),
                    bindings([binding("X", 1.0), binding("Y", 2.0), binding("Rest", [point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 4.0), binding("SumX", 10.0), binding("SumY", 14.0), binding("SumXX", 30.0), binding("SumXY", 39.0), binding("SumYY", 54.0), binding("N0", 3.0), binding("SumX0", 9.0), binding("SumY0", 12.0), binding("SumXX0", 29.0), binding("SumXY0", 37.0), binding("SumYY0", 50.0), binding("XX", 1.0), binding("XY", 2.0), binding("YY", 4.0)]),
                    uses([
                      proof(
                        goal(stats([point(2.0, 3.0), point(3.0, 5.0), point(4.0, 4.0)], 3.0, 9.0, 12.0, 29.0, 37.0, 50.0)),
                        by(rule("least-squares-regression.pl", clause(9))),
                        bindings([binding("X", 2.0), binding("Y", 3.0), binding("Rest", [point(3.0, 5.0), point(4.0, 4.0)]), binding("N", 3.0), binding("SumX", 9.0), binding("SumY", 12.0), binding("SumXX", 29.0), binding("SumXY", 37.0), binding("SumYY", 50.0), binding("N0", 2.0), binding("SumX0", 7.0), binding("SumY0", 9.0), binding("SumXX0", 25.0), binding("SumXY0", 31.0), binding("SumYY0", 41.0), binding("XX", 4.0), binding("XY", 6.0), binding("YY", 9.0)]),
                        uses([
                          proof(
                            goal(stats([point(3.0, 5.0), point(4.0, 4.0)], 2.0, 7.0, 9.0, 25.0, 31.0, 41.0)),
                            by(rule("least-squares-regression.pl", clause(9))),
                            bindings([binding("X", 3.0), binding("Y", 5.0), binding("Rest", [point(4.0, 4.0)]), binding("N", 2.0), binding("SumX", 7.0), binding("SumY", 9.0), binding("SumXX", 25.0), binding("SumXY", 31.0), binding("SumYY", 41.0), binding("N0", 1.0), binding("SumX0", 4.0), binding("SumY0", 4.0), binding("SumXX0", 16.0), binding("SumXY0", 16.0), binding("SumYY0", 16.0), binding("XX", 9.0), binding("XY", 15.0), binding("YY", 25.0)]),
                            uses([
                              proof(
                                goal(stats([point(4.0, 4.0)], 1.0, 4.0, 4.0, 16.0, 16.0, 16.0)),
                                by(rule("least-squares-regression.pl", clause(9))),
                                bindings([binding("X", 4.0), binding("Y", 4.0), binding("Rest", []), binding("N", 1.0), binding("SumX", 4.0), binding("SumY", 4.0), binding("SumXX", 16.0), binding("SumXY", 16.0), binding("SumYY", 16.0), binding("N0", 0.0), binding("SumX0", 0.0), binding("SumY0", 0.0), binding("SumXX0", 0.0), binding("SumXY0", 0.0), binding("SumYY0", 0.0), binding("XX", 16.0), binding("XY", 16.0), binding("YY", 16.0)]),
                                uses([
                                  proof(
                                    goal(stats([], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)),
                                    by(fact("least-squares-regression.pl", clause(8)))
                                  ),
                                  proof(
                                    goal(add(0.0, 1.0, 1.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 4.0, 4.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 4.0, 4.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(mul(4.0, 4.0, 16.0)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 16.0, 16.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(mul(4.0, 4.0, 16.0)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 16.0, 16.0)),
                                    by(builtin(add, 3))
                                  ),
                                  proof(
                                    goal(mul(4.0, 4.0, 16.0)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(add(0.0, 16.0, 16.0)),
                                    by(builtin(add, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(add(1.0, 1.0, 2.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(4.0, 3.0, 7.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(add(4.0, 5.0, 9.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(3.0, 3.0, 9.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(16.0, 9.0, 25.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(3.0, 5.0, 15.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(16.0, 15.0, 31.0)),
                                by(builtin(add, 3))
                              ),
                              proof(
                                goal(mul(5.0, 5.0, 25.0)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(add(16.0, 25.0, 41.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(2.0, 1.0, 3.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(7.0, 2.0, 9.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(add(9.0, 3.0, 12.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(2.0, 2.0, 4.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(25.0, 4.0, 29.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(2.0, 3.0, 6.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(31.0, 6.0, 37.0)),
                            by(builtin(add, 3))
                          ),
                          proof(
                            goal(mul(3.0, 3.0, 9.0)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(add(41.0, 9.0, 50.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(3.0, 1.0, 4.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(9.0, 1.0, 10.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(add(12.0, 2.0, 14.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(1.0, 1.0, 1.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(29.0, 1.0, 30.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(1.0, 2.0, 2.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(37.0, 2.0, 39.0)),
                        by(builtin(add, 3))
                      ),
                      proof(
                        goal(mul(2.0, 2.0, 4.0)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(add(50.0, 4.0, 54.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  )
                ])
              ),
              proof(
                goal(mul(4.0, 39.0, 156.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(10.0, 14.0, 140.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(sub(156.0, 140.0, 16.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(pow(16.0, 2.0, 256.0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(mul(4.0, 30.0, 120.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(10.0, 10.0, 100.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(sub(120.0, 100.0, 20.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(mul(4.0, 54.0, 216.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mul(14.0, 14.0, 196.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(sub(216.0, 196.0, 20.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(mul(20.0, 20.0, 400.0)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(div(256.0, 400.0, 0.64000000000000001)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(threshold(regression1, minimum_r_squared, 0.60)),
            by(fact("least-squares-regression.pl", clause(7)))
          ),
          proof(
            goal(ge(0.64000000000000001, 0.60)),
            by(builtin(ge, 2))
          )
        ])
      )
    ])
  )
).

