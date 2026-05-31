mean(scores, 5.0).
why(
  mean(scores, 5.0),
  proof(
    goal(mean(scores, 5.0)),
    by(rule("statistics-summary.pl", clause(8))),
    bindings([binding("Name", scores), binding("Mean", 5.0), binding("Values", [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 40.0), binding("Count", 8)]),
    uses([
      proof(
        goal(sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0])),
        by(fact("statistics-summary.pl", clause(5)))
      ),
      proof(
        goal(sum([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 40.0)),
        by(rule("statistics-summary.pl", clause(7))),
        bindings([binding("X", 2.0), binding("Xs", [4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 40.0), binding("Rest", 38.0)]),
        uses([
          proof(
            goal(sum([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 38.0)),
            by(rule("statistics-summary.pl", clause(7))),
            bindings([binding("X", 4.0), binding("Xs", [4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 38.0), binding("Rest", 34.0)]),
            uses([
              proof(
                goal(sum([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 34.0)),
                by(rule("statistics-summary.pl", clause(7))),
                bindings([binding("X", 4.0), binding("Xs", [4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 34.0), binding("Rest", 30.0)]),
                uses([
                  proof(
                    goal(sum([4.0, 5.0, 5.0, 7.0, 9.0], 30.0)),
                    by(rule("statistics-summary.pl", clause(7))),
                    bindings([binding("X", 4.0), binding("Xs", [5.0, 5.0, 7.0, 9.0]), binding("Total", 30.0), binding("Rest", 26.0)]),
                    uses([
                      proof(
                        goal(sum([5.0, 5.0, 7.0, 9.0], 26.0)),
                        by(rule("statistics-summary.pl", clause(7))),
                        bindings([binding("X", 5.0), binding("Xs", [5.0, 7.0, 9.0]), binding("Total", 26.0), binding("Rest", 21.0)]),
                        uses([
                          proof(
                            goal(sum([5.0, 7.0, 9.0], 21.0)),
                            by(rule("statistics-summary.pl", clause(7))),
                            bindings([binding("X", 5.0), binding("Xs", [7.0, 9.0]), binding("Total", 21.0), binding("Rest", 16.0)]),
                            uses([
                              proof(
                                goal(sum([7.0, 9.0], 16.0)),
                                by(rule("statistics-summary.pl", clause(7))),
                                bindings([binding("X", 7.0), binding("Xs", [9.0]), binding("Total", 16.0), binding("Rest", 9.0)]),
                                uses([
                                  proof(
                                    goal(sum([9.0], 9.0)),
                                    by(rule("statistics-summary.pl", clause(7))),
                                    bindings([binding("X", 9.0), binding("Xs", []), binding("Total", 9.0), binding("Rest", 0.0)]),
                                    uses([
                                      proof(
                                        goal(sum([], 0.0)),
                                        by(fact("statistics-summary.pl", clause(6)))
                                      ),
                                      proof(
                                        goal(add(9.0, 0.0, 9.0)),
                                        by(builtin(add, 3))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(add(7.0, 9.0, 16.0)),
                                    by(builtin(add, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(add(5.0, 16.0, 21.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(5.0, 21.0, 26.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(4.0, 26.0, 30.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(4.0, 30.0, 34.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(4.0, 34.0, 38.0)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(add(2.0, 38.0, 40.0)),
            by(builtin(add, 3))
          )
        ])
      ),
      proof(
        goal(length([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 8)),
        by(builtin(length, 2))
      ),
      proof(
        goal(div(40.0, 8, 5.0)),
        by(builtin(div, 3))
      )
    ])
  )
).

count(scores, 8).
why(
  count(scores, 8),
  proof(
    goal(count(scores, 8)),
    by(rule("statistics-summary.pl", clause(13))),
    bindings([binding("Name", scores), binding("Count", 8), binding("Values", [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0])]),
    uses([
      proof(
        goal(sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0])),
        by(fact("statistics-summary.pl", clause(5)))
      ),
      proof(
        goal(length([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 8)),
        by(builtin(length, 2))
      )
    ])
  )
).

populationVariance(scores, 4.0).
why(
  populationVariance(scores, 4.0),
  proof(
    goal(populationVariance(scores, 4.0)),
    by(rule("statistics-summary.pl", clause(14))),
    bindings([binding("Name", scores), binding("Variance", 4.0)]),
    uses([
      proof(
        goal(population_variance(scores, 4.0)),
        by(rule("statistics-summary.pl", clause(11))),
        bindings([binding("Name", scores), binding("Variance", 4.0), binding("Values", [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("SumSquaredErrors", 32.0), binding("Count", 8)]),
        uses([
          proof(
            goal(sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0])),
            by(fact("statistics-summary.pl", clause(5)))
          ),
          proof(
            goal(mean(scores, 5.0)),
            by(rule("statistics-summary.pl", clause(8))),
            bindings([binding("Name", scores), binding("Mean", 5.0), binding("Values", [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 40.0), binding("Count", 8)]),
            uses([
              proof(
                goal(sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0])),
                by(fact("statistics-summary.pl", clause(5)))
              ),
              proof(
                goal(sum([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 40.0)),
                by(rule("statistics-summary.pl", clause(7))),
                bindings([binding("X", 2.0), binding("Xs", [4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 40.0), binding("Rest", 38.0)]),
                uses([
                  proof(
                    goal(sum([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 38.0)),
                    by(rule("statistics-summary.pl", clause(7))),
                    bindings([binding("X", 4.0), binding("Xs", [4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 38.0), binding("Rest", 34.0)]),
                    uses([
                      proof(
                        goal(sum([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 34.0)),
                        by(rule("statistics-summary.pl", clause(7))),
                        bindings([binding("X", 4.0), binding("Xs", [4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 34.0), binding("Rest", 30.0)]),
                        uses([
                          proof(
                            goal(sum([4.0, 5.0, 5.0, 7.0, 9.0], 30.0)),
                            by(rule("statistics-summary.pl", clause(7))),
                            bindings([binding("X", 4.0), binding("Xs", [5.0, 5.0, 7.0, 9.0]), binding("Total", 30.0), binding("Rest", 26.0)]),
                            uses([
                              proof(
                                goal(sum([5.0, 5.0, 7.0, 9.0], 26.0)),
                                by(rule("statistics-summary.pl", clause(7))),
                                bindings([binding("X", 5.0), binding("Xs", [5.0, 7.0, 9.0]), binding("Total", 26.0), binding("Rest", 21.0)]),
                                uses([
                                  proof(
                                    goal(sum([5.0, 7.0, 9.0], 21.0)),
                                    by(rule("statistics-summary.pl", clause(7))),
                                    bindings([binding("X", 5.0), binding("Xs", [7.0, 9.0]), binding("Total", 21.0), binding("Rest", 16.0)]),
                                    uses([
                                      proof(
                                        goal(sum([7.0, 9.0], 16.0)),
                                        by(rule("statistics-summary.pl", clause(7))),
                                        bindings([binding("X", 7.0), binding("Xs", [9.0]), binding("Total", 16.0), binding("Rest", 9.0)]),
                                        uses([
                                          proof(
                                            goal(sum([9.0], 9.0)),
                                            by(rule("statistics-summary.pl", clause(7))),
                                            bindings([binding("X", 9.0), binding("Xs", []), binding("Total", 9.0), binding("Rest", 0.0)]),
                                            uses([
                                              proof(
                                                goal(sum([], 0.0)),
                                                by(fact("statistics-summary.pl", clause(6)))
                                              ),
                                              proof(
                                                goal(add(9.0, 0.0, 9.0)),
                                                by(builtin(add, 3))
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(add(7.0, 9.0, 16.0)),
                                            by(builtin(add, 3))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(add(5.0, 16.0, 21.0)),
                                        by(builtin(add, 3))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(add(5.0, 21.0, 26.0)),
                                    by(builtin(add, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(add(4.0, 26.0, 30.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(4.0, 30.0, 34.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(4.0, 34.0, 38.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(2.0, 38.0, 40.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(length([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 8)),
                by(builtin(length, 2))
              ),
              proof(
                goal(div(40.0, 8, 5.0)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(squared_error_sum([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 32.0)),
            by(rule("statistics-summary.pl", clause(10))),
            bindings([binding("X", 2.0), binding("Xs", [4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 32.0), binding("Delta", -3.0), binding("Squared", 9.0), binding("Rest", 23.0)]),
            uses([
              proof(
                goal(sub(2.0, 5.0, -3.0)),
                by(builtin(sub, 3))
              ),
              proof(
                goal(pow(-3.0, 2.0, 9.0)),
                by(builtin(pow, 3))
              ),
              proof(
                goal(squared_error_sum([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 23.0)),
                by(rule("statistics-summary.pl", clause(10))),
                bindings([binding("X", 4.0), binding("Xs", [4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 23.0), binding("Delta", -1.0), binding("Squared", 1.0), binding("Rest", 22.0)]),
                uses([
                  proof(
                    goal(sub(4.0, 5.0, -1.0)),
                    by(builtin(sub, 3))
                  ),
                  proof(
                    goal(pow(-1.0, 2.0, 1.0)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(squared_error_sum([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 22.0)),
                    by(rule("statistics-summary.pl", clause(10))),
                    bindings([binding("X", 4.0), binding("Xs", [4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 22.0), binding("Delta", -1.0), binding("Squared", 1.0), binding("Rest", 21.0)]),
                    uses([
                      proof(
                        goal(sub(4.0, 5.0, -1.0)),
                        by(builtin(sub, 3))
                      ),
                      proof(
                        goal(pow(-1.0, 2.0, 1.0)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(squared_error_sum([4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 21.0)),
                        by(rule("statistics-summary.pl", clause(10))),
                        bindings([binding("X", 4.0), binding("Xs", [5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 21.0), binding("Delta", -1.0), binding("Squared", 1.0), binding("Rest", 20.0)]),
                        uses([
                          proof(
                            goal(sub(4.0, 5.0, -1.0)),
                            by(builtin(sub, 3))
                          ),
                          proof(
                            goal(pow(-1.0, 2.0, 1.0)),
                            by(builtin(pow, 3))
                          ),
                          proof(
                            goal(squared_error_sum([5.0, 5.0, 7.0, 9.0], 5.0, 20.0)),
                            by(rule("statistics-summary.pl", clause(10))),
                            bindings([binding("X", 5.0), binding("Xs", [5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 20.0), binding("Delta", 0.0), binding("Squared", 0.0), binding("Rest", 20.0)]),
                            uses([
                              proof(
                                goal(sub(5.0, 5.0, 0.0)),
                                by(builtin(sub, 3))
                              ),
                              proof(
                                goal(pow(0.0, 2.0, 0.0)),
                                by(builtin(pow, 3))
                              ),
                              proof(
                                goal(squared_error_sum([5.0, 7.0, 9.0], 5.0, 20.0)),
                                by(rule("statistics-summary.pl", clause(10))),
                                bindings([binding("X", 5.0), binding("Xs", [7.0, 9.0]), binding("Mean", 5.0), binding("Total", 20.0), binding("Delta", 0.0), binding("Squared", 0.0), binding("Rest", 20.0)]),
                                uses([
                                  proof(
                                    goal(sub(5.0, 5.0, 0.0)),
                                    by(builtin(sub, 3))
                                  ),
                                  proof(
                                    goal(pow(0.0, 2.0, 0.0)),
                                    by(builtin(pow, 3))
                                  ),
                                  proof(
                                    goal(squared_error_sum([7.0, 9.0], 5.0, 20.0)),
                                    by(rule("statistics-summary.pl", clause(10))),
                                    bindings([binding("X", 7.0), binding("Xs", [9.0]), binding("Mean", 5.0), binding("Total", 20.0), binding("Delta", 2.0), binding("Squared", 4.0), binding("Rest", 16.0)]),
                                    uses([
                                      proof(
                                        goal(sub(7.0, 5.0, 2.0)),
                                        by(builtin(sub, 3))
                                      ),
                                      proof(
                                        goal(pow(2.0, 2.0, 4.0)),
                                        by(builtin(pow, 3))
                                      ),
                                      proof(
                                        goal(squared_error_sum([9.0], 5.0, 16.0)),
                                        by(rule("statistics-summary.pl", clause(10))),
                                        bindings([binding("X", 9.0), binding("Xs", []), binding("Mean", 5.0), binding("Total", 16.0), binding("Delta", 4.0), binding("Squared", 16.0), binding("Rest", 0.0)]),
                                        uses([
                                          proof(
                                            goal(sub(9.0, 5.0, 4.0)),
                                            by(builtin(sub, 3))
                                          ),
                                          proof(
                                            goal(pow(4.0, 2.0, 16.0)),
                                            by(builtin(pow, 3))
                                          ),
                                          proof(
                                            goal(squared_error_sum([], 5.0, 0.0)),
                                            by(fact("statistics-summary.pl", clause(9))),
                                            bindings([binding("_Mean", 5.0)])
                                          ),
                                          proof(
                                            goal(add(16.0, 0.0, 16.0)),
                                            by(builtin(add, 3))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(add(4.0, 16.0, 20.0)),
                                        by(builtin(add, 3))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(add(0.0, 20.0, 20.0)),
                                    by(builtin(add, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(add(0.0, 20.0, 20.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(1.0, 20.0, 21.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(1.0, 21.0, 22.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(1.0, 22.0, 23.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(add(9.0, 23.0, 32.0)),
                by(builtin(add, 3))
              )
            ])
          ),
          proof(
            goal(length([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 8)),
            by(builtin(length, 2))
          ),
          proof(
            goal(div(32.0, 8, 4.0)),
            by(builtin(div, 3))
          )
        ])
      )
    ])
  )
).

populationStddev(scores, 2.0).
why(
  populationStddev(scores, 2.0),
  proof(
    goal(populationStddev(scores, 2.0)),
    by(rule("statistics-summary.pl", clause(15))),
    bindings([binding("Name", scores), binding("Stddev", 2.0)]),
    uses([
      proof(
        goal(population_stddev(scores, 2.0)),
        by(rule("statistics-summary.pl", clause(12))),
        bindings([binding("Name", scores), binding("Stddev", 2.0), binding("Variance", 4.0)]),
        uses([
          proof(
            goal(population_variance(scores, 4.0)),
            by(rule("statistics-summary.pl", clause(11))),
            bindings([binding("Name", scores), binding("Variance", 4.0), binding("Values", [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("SumSquaredErrors", 32.0), binding("Count", 8)]),
            uses([
              proof(
                goal(sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0])),
                by(fact("statistics-summary.pl", clause(5)))
              ),
              proof(
                goal(mean(scores, 5.0)),
                by(rule("statistics-summary.pl", clause(8))),
                bindings([binding("Name", scores), binding("Mean", 5.0), binding("Values", [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 40.0), binding("Count", 8)]),
                uses([
                  proof(
                    goal(sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0])),
                    by(fact("statistics-summary.pl", clause(5)))
                  ),
                  proof(
                    goal(sum([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 40.0)),
                    by(rule("statistics-summary.pl", clause(7))),
                    bindings([binding("X", 2.0), binding("Xs", [4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 40.0), binding("Rest", 38.0)]),
                    uses([
                      proof(
                        goal(sum([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 38.0)),
                        by(rule("statistics-summary.pl", clause(7))),
                        bindings([binding("X", 4.0), binding("Xs", [4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 38.0), binding("Rest", 34.0)]),
                        uses([
                          proof(
                            goal(sum([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 34.0)),
                            by(rule("statistics-summary.pl", clause(7))),
                            bindings([binding("X", 4.0), binding("Xs", [4.0, 5.0, 5.0, 7.0, 9.0]), binding("Total", 34.0), binding("Rest", 30.0)]),
                            uses([
                              proof(
                                goal(sum([4.0, 5.0, 5.0, 7.0, 9.0], 30.0)),
                                by(rule("statistics-summary.pl", clause(7))),
                                bindings([binding("X", 4.0), binding("Xs", [5.0, 5.0, 7.0, 9.0]), binding("Total", 30.0), binding("Rest", 26.0)]),
                                uses([
                                  proof(
                                    goal(sum([5.0, 5.0, 7.0, 9.0], 26.0)),
                                    by(rule("statistics-summary.pl", clause(7))),
                                    bindings([binding("X", 5.0), binding("Xs", [5.0, 7.0, 9.0]), binding("Total", 26.0), binding("Rest", 21.0)]),
                                    uses([
                                      proof(
                                        goal(sum([5.0, 7.0, 9.0], 21.0)),
                                        by(rule("statistics-summary.pl", clause(7))),
                                        bindings([binding("X", 5.0), binding("Xs", [7.0, 9.0]), binding("Total", 21.0), binding("Rest", 16.0)]),
                                        uses([
                                          proof(
                                            goal(sum([7.0, 9.0], 16.0)),
                                            by(rule("statistics-summary.pl", clause(7))),
                                            bindings([binding("X", 7.0), binding("Xs", [9.0]), binding("Total", 16.0), binding("Rest", 9.0)]),
                                            uses([
                                              proof(
                                                goal(sum([9.0], 9.0)),
                                                by(rule("statistics-summary.pl", clause(7))),
                                                bindings([binding("X", 9.0), binding("Xs", []), binding("Total", 9.0), binding("Rest", 0.0)]),
                                                uses([
                                                  proof(
                                                    goal(sum([], 0.0)),
                                                    by(fact("statistics-summary.pl", clause(6)))
                                                  ),
                                                  proof(
                                                    goal(add(9.0, 0.0, 9.0)),
                                                    by(builtin(add, 3))
                                                  )
                                                ])
                                              ),
                                              proof(
                                                goal(add(7.0, 9.0, 16.0)),
                                                by(builtin(add, 3))
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(add(5.0, 16.0, 21.0)),
                                            by(builtin(add, 3))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(add(5.0, 21.0, 26.0)),
                                        by(builtin(add, 3))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(add(4.0, 26.0, 30.0)),
                                    by(builtin(add, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(add(4.0, 30.0, 34.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(4.0, 34.0, 38.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(2.0, 38.0, 40.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(length([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 8)),
                    by(builtin(length, 2))
                  ),
                  proof(
                    goal(div(40.0, 8, 5.0)),
                    by(builtin(div, 3))
                  )
                ])
              ),
              proof(
                goal(squared_error_sum([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 32.0)),
                by(rule("statistics-summary.pl", clause(10))),
                bindings([binding("X", 2.0), binding("Xs", [4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 32.0), binding("Delta", -3.0), binding("Squared", 9.0), binding("Rest", 23.0)]),
                uses([
                  proof(
                    goal(sub(2.0, 5.0, -3.0)),
                    by(builtin(sub, 3))
                  ),
                  proof(
                    goal(pow(-3.0, 2.0, 9.0)),
                    by(builtin(pow, 3))
                  ),
                  proof(
                    goal(squared_error_sum([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 23.0)),
                    by(rule("statistics-summary.pl", clause(10))),
                    bindings([binding("X", 4.0), binding("Xs", [4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 23.0), binding("Delta", -1.0), binding("Squared", 1.0), binding("Rest", 22.0)]),
                    uses([
                      proof(
                        goal(sub(4.0, 5.0, -1.0)),
                        by(builtin(sub, 3))
                      ),
                      proof(
                        goal(pow(-1.0, 2.0, 1.0)),
                        by(builtin(pow, 3))
                      ),
                      proof(
                        goal(squared_error_sum([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 22.0)),
                        by(rule("statistics-summary.pl", clause(10))),
                        bindings([binding("X", 4.0), binding("Xs", [4.0, 5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 22.0), binding("Delta", -1.0), binding("Squared", 1.0), binding("Rest", 21.0)]),
                        uses([
                          proof(
                            goal(sub(4.0, 5.0, -1.0)),
                            by(builtin(sub, 3))
                          ),
                          proof(
                            goal(pow(-1.0, 2.0, 1.0)),
                            by(builtin(pow, 3))
                          ),
                          proof(
                            goal(squared_error_sum([4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 21.0)),
                            by(rule("statistics-summary.pl", clause(10))),
                            bindings([binding("X", 4.0), binding("Xs", [5.0, 5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 21.0), binding("Delta", -1.0), binding("Squared", 1.0), binding("Rest", 20.0)]),
                            uses([
                              proof(
                                goal(sub(4.0, 5.0, -1.0)),
                                by(builtin(sub, 3))
                              ),
                              proof(
                                goal(pow(-1.0, 2.0, 1.0)),
                                by(builtin(pow, 3))
                              ),
                              proof(
                                goal(squared_error_sum([5.0, 5.0, 7.0, 9.0], 5.0, 20.0)),
                                by(rule("statistics-summary.pl", clause(10))),
                                bindings([binding("X", 5.0), binding("Xs", [5.0, 7.0, 9.0]), binding("Mean", 5.0), binding("Total", 20.0), binding("Delta", 0.0), binding("Squared", 0.0), binding("Rest", 20.0)]),
                                uses([
                                  proof(
                                    goal(sub(5.0, 5.0, 0.0)),
                                    by(builtin(sub, 3))
                                  ),
                                  proof(
                                    goal(pow(0.0, 2.0, 0.0)),
                                    by(builtin(pow, 3))
                                  ),
                                  proof(
                                    goal(squared_error_sum([5.0, 7.0, 9.0], 5.0, 20.0)),
                                    by(rule("statistics-summary.pl", clause(10))),
                                    bindings([binding("X", 5.0), binding("Xs", [7.0, 9.0]), binding("Mean", 5.0), binding("Total", 20.0), binding("Delta", 0.0), binding("Squared", 0.0), binding("Rest", 20.0)]),
                                    uses([
                                      proof(
                                        goal(sub(5.0, 5.0, 0.0)),
                                        by(builtin(sub, 3))
                                      ),
                                      proof(
                                        goal(pow(0.0, 2.0, 0.0)),
                                        by(builtin(pow, 3))
                                      ),
                                      proof(
                                        goal(squared_error_sum([7.0, 9.0], 5.0, 20.0)),
                                        by(rule("statistics-summary.pl", clause(10))),
                                        bindings([binding("X", 7.0), binding("Xs", [9.0]), binding("Mean", 5.0), binding("Total", 20.0), binding("Delta", 2.0), binding("Squared", 4.0), binding("Rest", 16.0)]),
                                        uses([
                                          proof(
                                            goal(sub(7.0, 5.0, 2.0)),
                                            by(builtin(sub, 3))
                                          ),
                                          proof(
                                            goal(pow(2.0, 2.0, 4.0)),
                                            by(builtin(pow, 3))
                                          ),
                                          proof(
                                            goal(squared_error_sum([9.0], 5.0, 16.0)),
                                            by(rule("statistics-summary.pl", clause(10))),
                                            bindings([binding("X", 9.0), binding("Xs", []), binding("Mean", 5.0), binding("Total", 16.0), binding("Delta", 4.0), binding("Squared", 16.0), binding("Rest", 0.0)]),
                                            uses([
                                              proof(
                                                goal(sub(9.0, 5.0, 4.0)),
                                                by(builtin(sub, 3))
                                              ),
                                              proof(
                                                goal(pow(4.0, 2.0, 16.0)),
                                                by(builtin(pow, 3))
                                              ),
                                              proof(
                                                goal(squared_error_sum([], 5.0, 0.0)),
                                                by(fact("statistics-summary.pl", clause(9))),
                                                bindings([binding("_Mean", 5.0)])
                                              ),
                                              proof(
                                                goal(add(16.0, 0.0, 16.0)),
                                                by(builtin(add, 3))
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(add(4.0, 16.0, 20.0)),
                                            by(builtin(add, 3))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(add(0.0, 20.0, 20.0)),
                                        by(builtin(add, 3))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(add(0.0, 20.0, 20.0)),
                                    by(builtin(add, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(add(1.0, 20.0, 21.0)),
                                by(builtin(add, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(add(1.0, 21.0, 22.0)),
                            by(builtin(add, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(add(1.0, 22.0, 23.0)),
                        by(builtin(add, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(add(9.0, 23.0, 32.0)),
                    by(builtin(add, 3))
                  )
                ])
              ),
              proof(
                goal(length([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 8)),
                by(builtin(length, 2))
              ),
              proof(
                goal(div(32.0, 8, 4.0)),
                by(builtin(div, 3))
              )
            ])
          ),
          proof(
            goal(pow(4.0, 0.5, 2.0)),
            by(builtin(pow, 3))
          )
        ])
      )
    ])
  )
).

