primeImplicants(quine_mccluskey, [[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]]).
why(
  primeImplicants(quine_mccluskey, [[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]]),
  proof(
    goal(primeImplicants(quine_mccluskey, [[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]])), by(rule("quine-mccluskey.pl", clause(56))),
    bindings([binding("Primes", [[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]])]),
    uses([
      proof(
        goal(prime_implicants([[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]])), by(rule("quine-mccluskey.pl", clause(42))),
        bindings([binding("Primes", [[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]]), binding("Minterms", [1, 3, 7, 11, 15]), binding("DontCares", [0, 2, 5]), binding("Bits", [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])]),
        uses([
          proof(
            goal(minterms([1, 3, 7, 11, 15])), by(rule("quine-mccluskey.pl", clause(49))),
            bindings([binding("Minterms", [1, 3, 7, 11, 15]), binding("Raw", [1, 3, 7, 11, 15])]),
            uses([
              proof(goal(findall(M, minterm(M), [1, 3, 7, 11, 15])), by(builtin(findall, 3))),
              proof(goal(sort([1, 3, 7, 11, 15], [1, 3, 7, 11, 15])), by(builtin(sort, 2)))
            ])
          ),
          proof(
            goal(dont_cares([0, 2, 5])), by(rule("quine-mccluskey.pl", clause(50))),
            bindings([binding("DontCares", [0, 2, 5]), binding("Raw", [0, 2, 5])]),
            uses([
              proof(goal(findall(D, dont_care(D), [0, 2, 5])), by(builtin(findall, 3))),
              proof(goal(sort([0, 2, 5], [0, 2, 5])), by(builtin(sort, 2)))
            ])
          ),
          proof(
            goal(bit_table([bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])), by(rule("quine-mccluskey.pl", clause(51))),
            bindings([binding("Bits", [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])]),
            uses([
              proof(goal(findall(bit(N, Pattern), bits(N, Pattern), [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])), by(builtin(findall, 3)))
            ])
          ),
          proof(goal(qm_prime_implicants([1, 3, 7, 11, 15], [0, 2, 5], [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])], [[0, 0, x, x], [0, x, x, 1], [x, x, 1, 1]])), by(builtin(qm_prime_implicants, 4)))
        ])
      )
    ])
  )
).

minimalCover(quine_mccluskey, [[0, 0, x, x], [x, x, 1, 1]]).
why(
  minimalCover(quine_mccluskey, [[0, 0, x, x], [x, x, 1, 1]]),
  proof(
    goal(minimalCover(quine_mccluskey, [[0, 0, x, x], [x, x, 1, 1]])), by(rule("quine-mccluskey.pl", clause(57))),
    bindings([binding("Cover", [[0, 0, x, x], [x, x, 1, 1]])]),
    uses([
      proof(
        goal(minimal_cover([[0, 0, x, x], [x, x, 1, 1]])), by(rule("quine-mccluskey.pl", clause(55))),
        bindings([binding("Cover", [[0, 0, x, x], [x, x, 1, 1]]), binding("Minterms", [1, 3, 7, 11, 15]), binding("DontCares", [0, 2, 5]), binding("Bits", [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])]),
        uses([
          proof(
            goal(minterms([1, 3, 7, 11, 15])), by(rule("quine-mccluskey.pl", clause(49))),
            bindings([binding("Minterms", [1, 3, 7, 11, 15]), binding("Raw", [1, 3, 7, 11, 15])]),
            uses([
              proof(goal(findall(M, minterm(M), [1, 3, 7, 11, 15])), by(builtin(findall, 3))),
              proof(goal(sort([1, 3, 7, 11, 15], [1, 3, 7, 11, 15])), by(builtin(sort, 2)))
            ])
          ),
          proof(
            goal(dont_cares([0, 2, 5])), by(rule("quine-mccluskey.pl", clause(50))),
            bindings([binding("DontCares", [0, 2, 5]), binding("Raw", [0, 2, 5])]),
            uses([
              proof(goal(findall(D, dont_care(D), [0, 2, 5])), by(builtin(findall, 3))),
              proof(goal(sort([0, 2, 5], [0, 2, 5])), by(builtin(sort, 2)))
            ])
          ),
          proof(
            goal(bit_table([bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])), by(rule("quine-mccluskey.pl", clause(51))),
            bindings([binding("Bits", [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])]),
            uses([
              proof(goal(findall(bit(N, Pattern), bits(N, Pattern), [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])), by(builtin(findall, 3)))
            ])
          ),
          proof(goal(qm_minimal_cover([1, 3, 7, 11, 15], [0, 2, 5], [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])], [[0, 0, x, x], [x, x, 1, 1]])), by(builtin(qm_minimal_cover, 4)))
        ])
      )
    ])
  )
).

equation(quine_mccluskey, "f = ~A~B + CD").
why(
  equation(quine_mccluskey, "f = ~A~B + CD"),
  proof(
    goal(equation(quine_mccluskey, "f = ~A~B + CD")), by(rule("quine-mccluskey.pl", clause(58))),
    uses([
      proof(
        goal(minimal_cover([[0, 0, x, x], [x, x, 1, 1]])), by(rule("quine-mccluskey.pl", clause(55))),
        bindings([binding("Cover", [[0, 0, x, x], [x, x, 1, 1]]), binding("Minterms", [1, 3, 7, 11, 15]), binding("DontCares", [0, 2, 5]), binding("Bits", [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])]),
        uses([
          proof(
            goal(minterms([1, 3, 7, 11, 15])), by(rule("quine-mccluskey.pl", clause(49))),
            bindings([binding("Minterms", [1, 3, 7, 11, 15]), binding("Raw", [1, 3, 7, 11, 15])]),
            uses([
              proof(goal(findall(M, minterm(M), [1, 3, 7, 11, 15])), by(builtin(findall, 3))),
              proof(goal(sort([1, 3, 7, 11, 15], [1, 3, 7, 11, 15])), by(builtin(sort, 2)))
            ])
          ),
          proof(
            goal(dont_cares([0, 2, 5])), by(rule("quine-mccluskey.pl", clause(50))),
            bindings([binding("DontCares", [0, 2, 5]), binding("Raw", [0, 2, 5])]),
            uses([
              proof(goal(findall(D, dont_care(D), [0, 2, 5])), by(builtin(findall, 3))),
              proof(goal(sort([0, 2, 5], [0, 2, 5])), by(builtin(sort, 2)))
            ])
          ),
          proof(
            goal(bit_table([bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])), by(rule("quine-mccluskey.pl", clause(51))),
            bindings([binding("Bits", [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])]),
            uses([
              proof(goal(findall(bit(N, Pattern), bits(N, Pattern), [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])])), by(builtin(findall, 3)))
            ])
          ),
          proof(goal(qm_minimal_cover([1, 3, 7, 11, 15], [0, 2, 5], [bit(0, [0, 0, 0, 0]), bit(1, [0, 0, 0, 1]), bit(2, [0, 0, 1, 0]), bit(3, [0, 0, 1, 1]), bit(4, [0, 1, 0, 0]), bit(5, [0, 1, 0, 1]), bit(6, [0, 1, 1, 0]), bit(7, [0, 1, 1, 1]), bit(8, [1, 0, 0, 0]), bit(9, [1, 0, 0, 1]), bit(10, [1, 0, 1, 0]), bit(11, [1, 0, 1, 1]), bit(12, [1, 1, 0, 0]), bit(13, [1, 1, 0, 1]), bit(14, [1, 1, 1, 0]), bit(15, [1, 1, 1, 1])], [[0, 0, x, x], [x, x, 1, 1]])), by(builtin(qm_minimal_cover, 4)))
        ])
      )
    ])
  )
).

