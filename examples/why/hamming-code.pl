syndrome(packet1, 5).
why(
  syndrome(packet1, 5),
  proof(
    goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
    bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
    uses([
      proof(
        goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
        bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
        uses([
          proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
          proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
          proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
          proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
          proof(
            goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
            bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
            uses([
              proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
              proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
              proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
              proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
            ])
          )
        ])
      ),
      proof(
        goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
        bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
        uses([
          proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
          proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
          proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
          proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
          proof(
            goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
            bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
            uses([
              proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
              proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
              proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
              proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
            ])
          )
        ])
      ),
      proof(
        goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
        bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
        uses([
          proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
          proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
          proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
          proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
          proof(
            goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
            bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
            uses([
              proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
              proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
              proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
              proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
            ])
          )
        ])
      ),
      proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
      proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
      proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
      proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
    ])
  )
).

errorBit(packet1, 5).
why(
  errorBit(packet1, 5),
  proof(
    goal(errorBit(packet1, 5)), by(rule("hamming-code.pl", clause(25))),
    bindings([binding("Code", packet1), binding("Position", 5)]),
    uses([
      proof(
        goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
        bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
        uses([
          proof(
            goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
            bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                uses([
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                  proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                  proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
            bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                uses([
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                  proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
            bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                uses([
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                  proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                  proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
          proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
          proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
          proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(gt(5, 0)), by(builtin(gt, 2)))
    ])
  )
).

correctedCodeword(packet1, [1, 0, 1, 1, 0, 1, 0]).
why(
  correctedCodeword(packet1, [1, 0, 1, 1, 0, 1, 0]),
  proof(
    goal(correctedCodeword(packet1, [1, 0, 1, 1, 0, 1, 0])), by(rule("hamming-code.pl", clause(26))),
    bindings([binding("Code", packet1), binding("Codeword", [1, 0, 1, 1, 0, 1, 0])]),
    uses([
      proof(
        goal(corrected_codeword(packet1, [1, 0, 1, 1, 0, 1, 0])), by(rule("hamming-code.pl", clause(23))),
        bindings([binding("Code", packet1), binding("B1", 1), binding("B2", 0), binding("B3", 1), binding("B4", 1), binding("B5", 0), binding("B6", 1), binding("B7", 0)]),
        uses([
          proof(
            goal(corrected_bit(packet1, 1, 1)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 1), binding("Bit", 1), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(1, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 2, 0)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 2), binding("Bit", 0), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(2, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 3, 1)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 3), binding("Bit", 1), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(3, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 4, 1)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 4), binding("Bit", 1), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(4, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 5, 0)), by(rule("hamming-code.pl", clause(21))),
            bindings([binding("Code", packet1), binding("Position", 5), binding("Corrected", 0), binding("Bit", 1)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(flip(1, 0)), by(fact("hamming-code.pl", clause(15))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 6, 1)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 6), binding("Bit", 1), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(6, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 7, 0)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 7), binding("Bit", 0), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(7, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13))))
            ])
          )
        ])
      )
    ])
  )
).

decodedPayload(packet1, [1, 0, 1, 0]).
why(
  decodedPayload(packet1, [1, 0, 1, 0]),
  proof(
    goal(decodedPayload(packet1, [1, 0, 1, 0])), by(rule("hamming-code.pl", clause(27))),
    bindings([binding("Code", packet1), binding("Payload", [1, 0, 1, 0])]),
    uses([
      proof(
        goal(decoded_payload(packet1, [1, 0, 1, 0])), by(rule("hamming-code.pl", clause(24))),
        bindings([binding("Code", packet1), binding("D1", 1), binding("D2", 0), binding("D3", 1), binding("D4", 0)]),
        uses([
          proof(
            goal(corrected_bit(packet1, 3, 1)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 3), binding("Bit", 1), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(3, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 5, 0)), by(rule("hamming-code.pl", clause(21))),
            bindings([binding("Code", packet1), binding("Position", 5), binding("Corrected", 0), binding("Bit", 1)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(flip(1, 0)), by(fact("hamming-code.pl", clause(15))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 6, 1)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 6), binding("Bit", 1), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(6, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12))))
            ])
          ),
          proof(
            goal(corrected_bit(packet1, 7, 0)), by(rule("hamming-code.pl", clause(22))),
            bindings([binding("Code", packet1), binding("Position", 7), binding("Bit", 0), binding("ErrorPosition", 5)]),
            uses([
              proof(
                goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
                bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
                uses([
                  proof(
                    goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
                    bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
                    bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
                      proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                        uses([
                          proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                          proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(
                    goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
                    bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
                    uses([
                      proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
                      proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
                      proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
                      proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
                      proof(
                        goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                        bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                        uses([
                          proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                          proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                          proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                          proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                        ])
                      )
                    ])
                  ),
                  proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
                  proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
                  proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
                ])
              ),
              proof(goal(neq(7, 5)), by(builtin(neq, 2))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13))))
            ])
          )
        ])
      )
    ])
  )
).

status(packet1, single_bit_corrected).
why(
  status(packet1, single_bit_corrected),
  proof(
    goal(status(packet1, single_bit_corrected)), by(rule("hamming-code.pl", clause(28))),
    bindings([binding("Code", packet1), binding("Position", 5)]),
    uses([
      proof(
        goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
        bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
        uses([
          proof(
            goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
            bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                uses([
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                  proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                  proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
            bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                uses([
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                  proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
            bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                uses([
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                  proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                  proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
          proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
          proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
          proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(gt(5, 0)), by(builtin(gt, 2)))
    ])
  )
).

reason(packet1, "Hamming syndrome identifies the flipped bit position").
why(
  reason(packet1, "Hamming syndrome identifies the flipped bit position"),
  proof(
    goal(reason(packet1, "Hamming syndrome identifies the flipped bit position")), by(rule("hamming-code.pl", clause(29))),
    bindings([binding("Code", packet1), binding("Position", 5)]),
    uses([
      proof(
        goal(syndrome(packet1, 5)), by(rule("hamming-code.pl", clause(20))),
        bindings([binding("Code", packet1), binding("Syndrome", 5), binding("S1", 1), binding("S2", 0), binding("S4", 1), binding("WeightedS2", 0), binding("WeightedS4", 4), binding("Partial", 1)]),
        uses([
          proof(
            goal(syndrome_bit1(packet1, 1)), by(rule("hamming-code.pl", clause(17))),
            bindings([binding("Code", packet1), binding("S1", 1), binding("B1", 1), binding("B3", 1), binding("B5", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 1, 1)), by(fact("hamming-code.pl", clause(7)))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                uses([
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                  proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                  proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(syndrome_bit2(packet1, 0)), by(rule("hamming-code.pl", clause(18))),
            bindings([binding("Code", packet1), binding("S2", 0), binding("B2", 0), binding("B3", 1), binding("B6", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 2, 0)), by(fact("hamming-code.pl", clause(8)))),
              proof(goal(received_bit(packet1, 3, 1)), by(fact("hamming-code.pl", clause(9)))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(0, 1, 1, 0, 0)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 0), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 0), binding("AB", 1), binding("ABC", 2), binding("Sum", 2)]),
                uses([
                  proof(goal(add(0, 1, 1)), by(builtin(add, 3))),
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 0, 2)), by(builtin(add, 3))),
                  proof(goal(mod(2, 2, 0)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(
            goal(syndrome_bit4(packet1, 1)), by(rule("hamming-code.pl", clause(19))),
            bindings([binding("Code", packet1), binding("S4", 1), binding("B4", 1), binding("B5", 1), binding("B6", 1), binding("B7", 0)]),
            uses([
              proof(goal(received_bit(packet1, 4, 1)), by(fact("hamming-code.pl", clause(10)))),
              proof(goal(received_bit(packet1, 5, 1)), by(fact("hamming-code.pl", clause(11)))),
              proof(goal(received_bit(packet1, 6, 1)), by(fact("hamming-code.pl", clause(12)))),
              proof(goal(received_bit(packet1, 7, 0)), by(fact("hamming-code.pl", clause(13)))),
              proof(
                goal(parity4(1, 1, 1, 0, 1)), by(rule("hamming-code.pl", clause(16))),
                bindings([binding("A", 1), binding("B", 1), binding("C", 1), binding("D", 0), binding("Parity", 1), binding("AB", 2), binding("ABC", 3), binding("Sum", 3)]),
                uses([
                  proof(goal(add(1, 1, 2)), by(builtin(add, 3))),
                  proof(goal(add(2, 1, 3)), by(builtin(add, 3))),
                  proof(goal(add(3, 0, 3)), by(builtin(add, 3))),
                  proof(goal(mod(3, 2, 1)), by(builtin(mod, 3)))
                ])
              )
            ])
          ),
          proof(goal(mul(0, 2, 0)), by(builtin(mul, 3))),
          proof(goal(mul(1, 4, 4)), by(builtin(mul, 3))),
          proof(goal(add(1, 0, 1)), by(builtin(add, 3))),
          proof(goal(add(1, 4, 5)), by(builtin(add, 3)))
        ])
      ),
      proof(goal(gt(5, 0)), by(builtin(gt, 2)))
    ])
  )
).

