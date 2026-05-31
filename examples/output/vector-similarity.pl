dotProduct(pair1, 12.0).
why(
  dotProduct(pair1, 12.0),
  proof(
    goal(dotProduct(pair1, 12.0)), by(rule("vector-similarity.pl", clause(13))),
    bindings([binding("Case", pair1), binding("Dot", 12.0), binding("A", [1.0, 2.0, 3.0]), binding("B", [4.0, -5.0, 6.0])]),
    uses([
      proof(goal(vector(pair1, a, [1.0, 2.0, 3.0])), by(fact("vector-similarity.pl", clause(5)))),
      proof(goal(vector(pair1, b, [4.0, -5.0, 6.0])), by(fact("vector-similarity.pl", clause(6)))),
      proof(
        goal(dot([1.0, 2.0, 3.0], [4.0, -5.0, 6.0], 12.0)), by(rule("vector-similarity.pl", clause(8))),
        bindings([binding("A", 1.0), binding("As", [2.0, 3.0]), binding("B", 4.0), binding("Bs", [-5.0, 6.0]), binding("Dot", 12.0), binding("Product", 4.0), binding("Rest", 8.0)]),
        uses([
          proof(goal(mul(1.0, 4.0, 4.0)), by(builtin(mul, 3))),
          proof(
            goal(dot([2.0, 3.0], [-5.0, 6.0], 8.0)), by(rule("vector-similarity.pl", clause(8))),
            bindings([binding("A", 2.0), binding("As", [3.0]), binding("B", -5.0), binding("Bs", [6.0]), binding("Dot", 8.0), binding("Product", -10.0), binding("Rest", 18.0)]),
            uses([
              proof(goal(mul(2.0, -5.0, -10.0)), by(builtin(mul, 3))),
              proof(
                goal(dot([3.0], [6.0], 18.0)), by(rule("vector-similarity.pl", clause(8))),
                bindings([binding("A", 3.0), binding("As", []), binding("B", 6.0), binding("Bs", []), binding("Dot", 18.0), binding("Product", 18.0), binding("Rest", 0.0)]),
                uses([
                  proof(goal(mul(3.0, 6.0, 18.0)), by(builtin(mul, 3))),
                  proof(goal(dot([], [], 0.0)), by(fact("vector-similarity.pl", clause(7)))),
                  proof(goal(add(18.0, 0.0, 18.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(-10.0, 18.0, 8.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(add(4.0, 8.0, 12.0)), by(builtin(add, 3)))
        ])
      )
    ])
  )
).

normA(pair1, 3.7416573867739413).
why(
  normA(pair1, 3.7416573867739413),
  proof(
    goal(normA(pair1, 3.7416573867739413)), by(rule("vector-similarity.pl", clause(14))),
    bindings([binding("Case", pair1), binding("NormA", 3.7416573867739413), binding("A", [1.0, 2.0, 3.0])]),
    uses([
      proof(goal(vector(pair1, a, [1.0, 2.0, 3.0])), by(fact("vector-similarity.pl", clause(5)))),
      proof(
        goal(norm([1.0, 2.0, 3.0], 3.7416573867739413)), by(rule("vector-similarity.pl", clause(11))),
        bindings([binding("Vector", [1.0, 2.0, 3.0]), binding("Norm", 3.7416573867739413), binding("SumSquares", 14.0)]),
        uses([
          proof(
            goal(sum_squares([1.0, 2.0, 3.0], 14.0)), by(rule("vector-similarity.pl", clause(10))),
            bindings([binding("X", 1.0), binding("Xs", [2.0, 3.0]), binding("Total", 14.0), binding("Squared", 1.0), binding("Rest", 13.0)]),
            uses([
              proof(goal(pow(1.0, 2.0, 1.0)), by(builtin(pow, 3))),
              proof(
                goal(sum_squares([2.0, 3.0], 13.0)), by(rule("vector-similarity.pl", clause(10))),
                bindings([binding("X", 2.0), binding("Xs", [3.0]), binding("Total", 13.0), binding("Squared", 4.0), binding("Rest", 9.0)]),
                uses([
                  proof(goal(pow(2.0, 2.0, 4.0)), by(builtin(pow, 3))),
                  proof(
                    goal(sum_squares([3.0], 9.0)), by(rule("vector-similarity.pl", clause(10))),
                    bindings([binding("X", 3.0), binding("Xs", []), binding("Total", 9.0), binding("Squared", 9.0), binding("Rest", 0.0)]),
                    uses([
                      proof(goal(pow(3.0, 2.0, 9.0)), by(builtin(pow, 3))),
                      proof(goal(sum_squares([], 0.0)), by(fact("vector-similarity.pl", clause(9)))),
                      proof(goal(add(9.0, 0.0, 9.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(4.0, 9.0, 13.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(1.0, 13.0, 14.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(pow(14.0, 0.5, 3.7416573867739413)), by(builtin(pow, 3)))
        ])
      )
    ])
  )
).

normB(pair1, 8.7749643873921226).
why(
  normB(pair1, 8.7749643873921226),
  proof(
    goal(normB(pair1, 8.7749643873921226)), by(rule("vector-similarity.pl", clause(15))),
    bindings([binding("Case", pair1), binding("NormB", 8.7749643873921226), binding("B", [4.0, -5.0, 6.0])]),
    uses([
      proof(goal(vector(pair1, b, [4.0, -5.0, 6.0])), by(fact("vector-similarity.pl", clause(6)))),
      proof(
        goal(norm([4.0, -5.0, 6.0], 8.7749643873921226)), by(rule("vector-similarity.pl", clause(11))),
        bindings([binding("Vector", [4.0, -5.0, 6.0]), binding("Norm", 8.7749643873921226), binding("SumSquares", 77.0)]),
        uses([
          proof(
            goal(sum_squares([4.0, -5.0, 6.0], 77.0)), by(rule("vector-similarity.pl", clause(10))),
            bindings([binding("X", 4.0), binding("Xs", [-5.0, 6.0]), binding("Total", 77.0), binding("Squared", 16.0), binding("Rest", 61.0)]),
            uses([
              proof(goal(pow(4.0, 2.0, 16.0)), by(builtin(pow, 3))),
              proof(
                goal(sum_squares([-5.0, 6.0], 61.0)), by(rule("vector-similarity.pl", clause(10))),
                bindings([binding("X", -5.0), binding("Xs", [6.0]), binding("Total", 61.0), binding("Squared", 25.0), binding("Rest", 36.0)]),
                uses([
                  proof(goal(pow(-5.0, 2.0, 25.0)), by(builtin(pow, 3))),
                  proof(
                    goal(sum_squares([6.0], 36.0)), by(rule("vector-similarity.pl", clause(10))),
                    bindings([binding("X", 6.0), binding("Xs", []), binding("Total", 36.0), binding("Squared", 36.0), binding("Rest", 0.0)]),
                    uses([
                      proof(goal(pow(6.0, 2.0, 36.0)), by(builtin(pow, 3))),
                      proof(goal(sum_squares([], 0.0)), by(fact("vector-similarity.pl", clause(9)))),
                      proof(goal(add(36.0, 0.0, 36.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(25.0, 36.0, 61.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(16.0, 61.0, 77.0)), by(builtin(add, 3)))
            ])
          ),
          proof(goal(pow(77.0, 0.5, 8.7749643873921226)), by(builtin(pow, 3)))
        ])
      )
    ])
  )
).

cosineSimilarity(pair1, 0.36548694232390361).
why(
  cosineSimilarity(pair1, 0.36548694232390361),
  proof(
    goal(cosineSimilarity(pair1, 0.36548694232390361)), by(rule("vector-similarity.pl", clause(16))),
    bindings([binding("Case", pair1), binding("Similarity", 0.36548694232390361)]),
    uses([
      proof(
        goal(cosine_similarity(pair1, 0.36548694232390361)), by(rule("vector-similarity.pl", clause(12))),
        bindings([binding("Case", pair1), binding("Similarity", 0.36548694232390361), binding("A", [1.0, 2.0, 3.0]), binding("B", [4.0, -5.0, 6.0]), binding("Dot", 12.0), binding("NormA", 3.7416573867739413), binding("NormB", 8.7749643873921226), binding("Denominator", 32.832910318764007)]),
        uses([
          proof(goal(vector(pair1, a, [1.0, 2.0, 3.0])), by(fact("vector-similarity.pl", clause(5)))),
          proof(goal(vector(pair1, b, [4.0, -5.0, 6.0])), by(fact("vector-similarity.pl", clause(6)))),
          proof(
            goal(dot([1.0, 2.0, 3.0], [4.0, -5.0, 6.0], 12.0)), by(rule("vector-similarity.pl", clause(8))),
            bindings([binding("A", 1.0), binding("As", [2.0, 3.0]), binding("B", 4.0), binding("Bs", [-5.0, 6.0]), binding("Dot", 12.0), binding("Product", 4.0), binding("Rest", 8.0)]),
            uses([
              proof(goal(mul(1.0, 4.0, 4.0)), by(builtin(mul, 3))),
              proof(
                goal(dot([2.0, 3.0], [-5.0, 6.0], 8.0)), by(rule("vector-similarity.pl", clause(8))),
                bindings([binding("A", 2.0), binding("As", [3.0]), binding("B", -5.0), binding("Bs", [6.0]), binding("Dot", 8.0), binding("Product", -10.0), binding("Rest", 18.0)]),
                uses([
                  proof(goal(mul(2.0, -5.0, -10.0)), by(builtin(mul, 3))),
                  proof(
                    goal(dot([3.0], [6.0], 18.0)), by(rule("vector-similarity.pl", clause(8))),
                    bindings([binding("A", 3.0), binding("As", []), binding("B", 6.0), binding("Bs", []), binding("Dot", 18.0), binding("Product", 18.0), binding("Rest", 0.0)]),
                    uses([
                      proof(goal(mul(3.0, 6.0, 18.0)), by(builtin(mul, 3))),
                      proof(goal(dot([], [], 0.0)), by(fact("vector-similarity.pl", clause(7)))),
                      proof(goal(add(18.0, 0.0, 18.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(-10.0, 18.0, 8.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(add(4.0, 8.0, 12.0)), by(builtin(add, 3)))
            ])
          ),
          proof(
            goal(norm([1.0, 2.0, 3.0], 3.7416573867739413)), by(rule("vector-similarity.pl", clause(11))),
            bindings([binding("Vector", [1.0, 2.0, 3.0]), binding("Norm", 3.7416573867739413), binding("SumSquares", 14.0)]),
            uses([
              proof(
                goal(sum_squares([1.0, 2.0, 3.0], 14.0)), by(rule("vector-similarity.pl", clause(10))),
                bindings([binding("X", 1.0), binding("Xs", [2.0, 3.0]), binding("Total", 14.0), binding("Squared", 1.0), binding("Rest", 13.0)]),
                uses([
                  proof(goal(pow(1.0, 2.0, 1.0)), by(builtin(pow, 3))),
                  proof(
                    goal(sum_squares([2.0, 3.0], 13.0)), by(rule("vector-similarity.pl", clause(10))),
                    bindings([binding("X", 2.0), binding("Xs", [3.0]), binding("Total", 13.0), binding("Squared", 4.0), binding("Rest", 9.0)]),
                    uses([
                      proof(goal(pow(2.0, 2.0, 4.0)), by(builtin(pow, 3))),
                      proof(
                        goal(sum_squares([3.0], 9.0)), by(rule("vector-similarity.pl", clause(10))),
                        bindings([binding("X", 3.0), binding("Xs", []), binding("Total", 9.0), binding("Squared", 9.0), binding("Rest", 0.0)]),
                        uses([
                          proof(goal(pow(3.0, 2.0, 9.0)), by(builtin(pow, 3))),
                          proof(goal(sum_squares([], 0.0)), by(fact("vector-similarity.pl", clause(9)))),
                          proof(goal(add(9.0, 0.0, 9.0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(4.0, 9.0, 13.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(1.0, 13.0, 14.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(pow(14.0, 0.5, 3.7416573867739413)), by(builtin(pow, 3)))
            ])
          ),
          proof(
            goal(norm([4.0, -5.0, 6.0], 8.7749643873921226)), by(rule("vector-similarity.pl", clause(11))),
            bindings([binding("Vector", [4.0, -5.0, 6.0]), binding("Norm", 8.7749643873921226), binding("SumSquares", 77.0)]),
            uses([
              proof(
                goal(sum_squares([4.0, -5.0, 6.0], 77.0)), by(rule("vector-similarity.pl", clause(10))),
                bindings([binding("X", 4.0), binding("Xs", [-5.0, 6.0]), binding("Total", 77.0), binding("Squared", 16.0), binding("Rest", 61.0)]),
                uses([
                  proof(goal(pow(4.0, 2.0, 16.0)), by(builtin(pow, 3))),
                  proof(
                    goal(sum_squares([-5.0, 6.0], 61.0)), by(rule("vector-similarity.pl", clause(10))),
                    bindings([binding("X", -5.0), binding("Xs", [6.0]), binding("Total", 61.0), binding("Squared", 25.0), binding("Rest", 36.0)]),
                    uses([
                      proof(goal(pow(-5.0, 2.0, 25.0)), by(builtin(pow, 3))),
                      proof(
                        goal(sum_squares([6.0], 36.0)), by(rule("vector-similarity.pl", clause(10))),
                        bindings([binding("X", 6.0), binding("Xs", []), binding("Total", 36.0), binding("Squared", 36.0), binding("Rest", 0.0)]),
                        uses([
                          proof(goal(pow(6.0, 2.0, 36.0)), by(builtin(pow, 3))),
                          proof(goal(sum_squares([], 0.0)), by(fact("vector-similarity.pl", clause(9)))),
                          proof(goal(add(36.0, 0.0, 36.0)), by(builtin(add, 3)))
                        ])
                      ),
                      proof(goal(add(25.0, 36.0, 61.0)), by(builtin(add, 3)))
                    ])
                  ),
                  proof(goal(add(16.0, 61.0, 77.0)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(pow(77.0, 0.5, 8.7749643873921226)), by(builtin(pow, 3)))
            ])
          ),
          proof(goal(mul(3.7416573867739413, 8.7749643873921226, 32.832910318764007)), by(builtin(mul, 3))),
          proof(goal(div(12.0, 32.832910318764007, 0.36548694232390361)), by(builtin(div, 3)))
        ])
      )
    ])
  )
).

