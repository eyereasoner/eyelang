status(exact_cover_sudoku, solved).
why(
  status(exact_cover_sudoku, solved),
  proof(
    goal(status(exact_cover_sudoku, solved)), by(rule("exact-cover-sudoku.pl", clause(33))),
    bindings([binding("_Grid", [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]])]),
    uses([
      proof(
        goal(once(sudoku9([[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]]))), by(builtin(once, 1)),
        uses([
          proof(
            goal(sudoku9([[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]])), by(rule("exact-cover-sudoku.pl", clause(32))),
            bindings([binding("A1", 5), binding("A2", 3), binding("A3", 4), binding("A4", 6), binding("A5", 7), binding("A6", 8), binding("A7", 9), binding("A8", 1), binding("A9", 2), binding("B1", 6), binding("B2", 7), binding("B3", 2), binding("B4", 1), binding("B5", 9), binding("B6", 5), binding("B7", 3), binding("B8", 4), binding("B9", 8), binding("C1", 1), binding("C2", 9), binding("C3", 8), binding("C4", 3), binding("C5", 4), binding("C6", 2), binding("C7", 5), binding("C8", 6), binding("C9", 7), binding("D1", 8), binding("D2", 5), binding("D3", 9), binding("D4", 7), binding("D5", 6), binding("D6", 1), binding("D7", 4), binding("D8", 2), binding("D9", 3), binding("E1", 4), binding("E2", 2), binding("E3", 6), binding("E4", 8), binding("E5", 5), binding("E6", 3), binding("E7", 7), binding("E8", 9), binding("E9", 1), binding("F1", 7), binding("F2", 1), binding("F3", 3), binding("F4", 9), binding("F5", 2), binding("F6", 4), binding("F7", 8), binding("F8", 5), binding("F9", 6), binding("G1", 9), binding("G2", 6), binding("G3", 1), binding("G4", 5), binding("G5", 3), binding("G6", 7), binding("G7", 2), binding("G8", 8), binding("G9", 4), binding("H1", 2), binding("H2", 8), binding("H3", 7), binding("H4", 4), binding("H5", 1), binding("H6", 9), binding("H7", 6), binding("H8", 3), binding("H9", 5), binding("I1", 3), binding("I2", 4), binding("I3", 5), binding("I4", 2), binding("I5", 8), binding("I6", 6), binding("I7", 1), binding("I8", 7), binding("I9", 9)]),
            uses([
              proof(goal(row_candidate(1, [5, 3, 4, 6, 7, 8, 9, 1, 2])), by(fact("exact-cover-sudoku.pl", clause(7)))),
              proof(goal(row_candidate(2, [6, 7, 2, 1, 9, 5, 3, 4, 8])), by(fact("exact-cover-sudoku.pl", clause(10)))),
              proof(goal(row_candidate(3, [1, 9, 8, 3, 4, 2, 5, 6, 7])), by(fact("exact-cover-sudoku.pl", clause(13)))),
              proof(goal(row_candidate(4, [8, 5, 9, 7, 6, 1, 4, 2, 3])), by(fact("exact-cover-sudoku.pl", clause(16)))),
              proof(goal(row_candidate(5, [4, 2, 6, 8, 5, 3, 7, 9, 1])), by(fact("exact-cover-sudoku.pl", clause(19)))),
              proof(goal(row_candidate(6, [7, 1, 3, 9, 2, 4, 8, 5, 6])), by(fact("exact-cover-sudoku.pl", clause(22)))),
              proof(goal(row_candidate(7, [9, 6, 1, 5, 3, 7, 2, 8, 4])), by(fact("exact-cover-sudoku.pl", clause(25)))),
              proof(goal(row_candidate(8, [2, 8, 7, 4, 1, 9, 6, 3, 5])), by(fact("exact-cover-sudoku.pl", clause(28)))),
              proof(goal(row_candidate(9, [3, 4, 5, 2, 8, 6, 1, 7, 9])), by(fact("exact-cover-sudoku.pl", clause(31)))),
              proof(goal(cover9([5, 6, 1, 8, 4, 7, 9, 2, 3])), by(builtin(cover9, 1))),
              proof(goal(cover9([3, 7, 9, 5, 2, 1, 6, 8, 4])), by(builtin(cover9, 1))),
              proof(goal(cover9([4, 2, 8, 9, 6, 3, 1, 7, 5])), by(builtin(cover9, 1))),
              proof(goal(cover9([6, 1, 3, 7, 8, 9, 5, 4, 2])), by(builtin(cover9, 1))),
              proof(goal(cover9([7, 9, 4, 6, 5, 2, 3, 1, 8])), by(builtin(cover9, 1))),
              proof(goal(cover9([8, 5, 2, 1, 3, 4, 7, 9, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 3, 5, 4, 7, 8, 2, 6, 1])), by(builtin(cover9, 1))),
              proof(goal(cover9([1, 4, 6, 2, 9, 5, 8, 3, 7])), by(builtin(cover9, 1))),
              proof(goal(cover9([2, 8, 7, 3, 1, 6, 4, 5, 9])), by(builtin(cover9, 1))),
              proof(goal(cover9([5, 3, 4, 6, 7, 2, 1, 9, 8])), by(builtin(cover9, 1))),
              proof(goal(cover9([6, 7, 8, 1, 9, 5, 3, 4, 2])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 1, 2, 3, 4, 8, 5, 6, 7])), by(builtin(cover9, 1))),
              proof(goal(cover9([8, 5, 9, 4, 2, 6, 7, 1, 3])), by(builtin(cover9, 1))),
              proof(goal(cover9([7, 6, 1, 8, 5, 3, 9, 2, 4])), by(builtin(cover9, 1))),
              proof(goal(cover9([4, 2, 3, 7, 9, 1, 8, 5, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 6, 1, 2, 8, 7, 3, 4, 5])), by(builtin(cover9, 1))),
              proof(goal(cover9([5, 3, 7, 4, 1, 9, 2, 8, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([2, 8, 4, 6, 3, 5, 1, 7, 9])), by(builtin(cover9, 1)))
            ])
          )
        ])
      )
    ])
  )
).

solution(exact_cover_sudoku, [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]]).
why(
  solution(exact_cover_sudoku, [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]]),
  proof(
    goal(solution(exact_cover_sudoku, [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]])), by(rule("exact-cover-sudoku.pl", clause(34))),
    bindings([binding("Grid", [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]])]),
    uses([
      proof(
        goal(once(sudoku9([[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]]))), by(builtin(once, 1)),
        uses([
          proof(
            goal(sudoku9([[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]])), by(rule("exact-cover-sudoku.pl", clause(32))),
            bindings([binding("A1", 5), binding("A2", 3), binding("A3", 4), binding("A4", 6), binding("A5", 7), binding("A6", 8), binding("A7", 9), binding("A8", 1), binding("A9", 2), binding("B1", 6), binding("B2", 7), binding("B3", 2), binding("B4", 1), binding("B5", 9), binding("B6", 5), binding("B7", 3), binding("B8", 4), binding("B9", 8), binding("C1", 1), binding("C2", 9), binding("C3", 8), binding("C4", 3), binding("C5", 4), binding("C6", 2), binding("C7", 5), binding("C8", 6), binding("C9", 7), binding("D1", 8), binding("D2", 5), binding("D3", 9), binding("D4", 7), binding("D5", 6), binding("D6", 1), binding("D7", 4), binding("D8", 2), binding("D9", 3), binding("E1", 4), binding("E2", 2), binding("E3", 6), binding("E4", 8), binding("E5", 5), binding("E6", 3), binding("E7", 7), binding("E8", 9), binding("E9", 1), binding("F1", 7), binding("F2", 1), binding("F3", 3), binding("F4", 9), binding("F5", 2), binding("F6", 4), binding("F7", 8), binding("F8", 5), binding("F9", 6), binding("G1", 9), binding("G2", 6), binding("G3", 1), binding("G4", 5), binding("G5", 3), binding("G6", 7), binding("G7", 2), binding("G8", 8), binding("G9", 4), binding("H1", 2), binding("H2", 8), binding("H3", 7), binding("H4", 4), binding("H5", 1), binding("H6", 9), binding("H7", 6), binding("H8", 3), binding("H9", 5), binding("I1", 3), binding("I2", 4), binding("I3", 5), binding("I4", 2), binding("I5", 8), binding("I6", 6), binding("I7", 1), binding("I8", 7), binding("I9", 9)]),
            uses([
              proof(goal(row_candidate(1, [5, 3, 4, 6, 7, 8, 9, 1, 2])), by(fact("exact-cover-sudoku.pl", clause(7)))),
              proof(goal(row_candidate(2, [6, 7, 2, 1, 9, 5, 3, 4, 8])), by(fact("exact-cover-sudoku.pl", clause(10)))),
              proof(goal(row_candidate(3, [1, 9, 8, 3, 4, 2, 5, 6, 7])), by(fact("exact-cover-sudoku.pl", clause(13)))),
              proof(goal(row_candidate(4, [8, 5, 9, 7, 6, 1, 4, 2, 3])), by(fact("exact-cover-sudoku.pl", clause(16)))),
              proof(goal(row_candidate(5, [4, 2, 6, 8, 5, 3, 7, 9, 1])), by(fact("exact-cover-sudoku.pl", clause(19)))),
              proof(goal(row_candidate(6, [7, 1, 3, 9, 2, 4, 8, 5, 6])), by(fact("exact-cover-sudoku.pl", clause(22)))),
              proof(goal(row_candidate(7, [9, 6, 1, 5, 3, 7, 2, 8, 4])), by(fact("exact-cover-sudoku.pl", clause(25)))),
              proof(goal(row_candidate(8, [2, 8, 7, 4, 1, 9, 6, 3, 5])), by(fact("exact-cover-sudoku.pl", clause(28)))),
              proof(goal(row_candidate(9, [3, 4, 5, 2, 8, 6, 1, 7, 9])), by(fact("exact-cover-sudoku.pl", clause(31)))),
              proof(goal(cover9([5, 6, 1, 8, 4, 7, 9, 2, 3])), by(builtin(cover9, 1))),
              proof(goal(cover9([3, 7, 9, 5, 2, 1, 6, 8, 4])), by(builtin(cover9, 1))),
              proof(goal(cover9([4, 2, 8, 9, 6, 3, 1, 7, 5])), by(builtin(cover9, 1))),
              proof(goal(cover9([6, 1, 3, 7, 8, 9, 5, 4, 2])), by(builtin(cover9, 1))),
              proof(goal(cover9([7, 9, 4, 6, 5, 2, 3, 1, 8])), by(builtin(cover9, 1))),
              proof(goal(cover9([8, 5, 2, 1, 3, 4, 7, 9, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 3, 5, 4, 7, 8, 2, 6, 1])), by(builtin(cover9, 1))),
              proof(goal(cover9([1, 4, 6, 2, 9, 5, 8, 3, 7])), by(builtin(cover9, 1))),
              proof(goal(cover9([2, 8, 7, 3, 1, 6, 4, 5, 9])), by(builtin(cover9, 1))),
              proof(goal(cover9([5, 3, 4, 6, 7, 2, 1, 9, 8])), by(builtin(cover9, 1))),
              proof(goal(cover9([6, 7, 8, 1, 9, 5, 3, 4, 2])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 1, 2, 3, 4, 8, 5, 6, 7])), by(builtin(cover9, 1))),
              proof(goal(cover9([8, 5, 9, 4, 2, 6, 7, 1, 3])), by(builtin(cover9, 1))),
              proof(goal(cover9([7, 6, 1, 8, 5, 3, 9, 2, 4])), by(builtin(cover9, 1))),
              proof(goal(cover9([4, 2, 3, 7, 9, 1, 8, 5, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 6, 1, 2, 8, 7, 3, 4, 5])), by(builtin(cover9, 1))),
              proof(goal(cover9([5, 3, 7, 4, 1, 9, 2, 8, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([2, 8, 4, 6, 3, 5, 1, 7, 9])), by(builtin(cover9, 1)))
            ])
          )
        ])
      )
    ])
  )
).

firstRow(exact_cover_sudoku, [5, 3, 4, 6, 7, 8, 9, 1, 2]).
why(
  firstRow(exact_cover_sudoku, [5, 3, 4, 6, 7, 8, 9, 1, 2]),
  proof(
    goal(firstRow(exact_cover_sudoku, [5, 3, 4, 6, 7, 8, 9, 1, 2])), by(rule("exact-cover-sudoku.pl", clause(35))),
    bindings([binding("Row", [5, 3, 4, 6, 7, 8, 9, 1, 2]), binding("_Rows", [[6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]])]),
    uses([
      proof(
        goal(once(sudoku9([[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]]))), by(builtin(once, 1)),
        uses([
          proof(
            goal(sudoku9([[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]])), by(rule("exact-cover-sudoku.pl", clause(32))),
            bindings([binding("A1", 5), binding("A2", 3), binding("A3", 4), binding("A4", 6), binding("A5", 7), binding("A6", 8), binding("A7", 9), binding("A8", 1), binding("A9", 2), binding("B1", 6), binding("B2", 7), binding("B3", 2), binding("B4", 1), binding("B5", 9), binding("B6", 5), binding("B7", 3), binding("B8", 4), binding("B9", 8), binding("C1", 1), binding("C2", 9), binding("C3", 8), binding("C4", 3), binding("C5", 4), binding("C6", 2), binding("C7", 5), binding("C8", 6), binding("C9", 7), binding("D1", 8), binding("D2", 5), binding("D3", 9), binding("D4", 7), binding("D5", 6), binding("D6", 1), binding("D7", 4), binding("D8", 2), binding("D9", 3), binding("E1", 4), binding("E2", 2), binding("E3", 6), binding("E4", 8), binding("E5", 5), binding("E6", 3), binding("E7", 7), binding("E8", 9), binding("E9", 1), binding("F1", 7), binding("F2", 1), binding("F3", 3), binding("F4", 9), binding("F5", 2), binding("F6", 4), binding("F7", 8), binding("F8", 5), binding("F9", 6), binding("G1", 9), binding("G2", 6), binding("G3", 1), binding("G4", 5), binding("G5", 3), binding("G6", 7), binding("G7", 2), binding("G8", 8), binding("G9", 4), binding("H1", 2), binding("H2", 8), binding("H3", 7), binding("H4", 4), binding("H5", 1), binding("H6", 9), binding("H7", 6), binding("H8", 3), binding("H9", 5), binding("I1", 3), binding("I2", 4), binding("I3", 5), binding("I4", 2), binding("I5", 8), binding("I6", 6), binding("I7", 1), binding("I8", 7), binding("I9", 9)]),
            uses([
              proof(goal(row_candidate(1, [5, 3, 4, 6, 7, 8, 9, 1, 2])), by(fact("exact-cover-sudoku.pl", clause(7)))),
              proof(goal(row_candidate(2, [6, 7, 2, 1, 9, 5, 3, 4, 8])), by(fact("exact-cover-sudoku.pl", clause(10)))),
              proof(goal(row_candidate(3, [1, 9, 8, 3, 4, 2, 5, 6, 7])), by(fact("exact-cover-sudoku.pl", clause(13)))),
              proof(goal(row_candidate(4, [8, 5, 9, 7, 6, 1, 4, 2, 3])), by(fact("exact-cover-sudoku.pl", clause(16)))),
              proof(goal(row_candidate(5, [4, 2, 6, 8, 5, 3, 7, 9, 1])), by(fact("exact-cover-sudoku.pl", clause(19)))),
              proof(goal(row_candidate(6, [7, 1, 3, 9, 2, 4, 8, 5, 6])), by(fact("exact-cover-sudoku.pl", clause(22)))),
              proof(goal(row_candidate(7, [9, 6, 1, 5, 3, 7, 2, 8, 4])), by(fact("exact-cover-sudoku.pl", clause(25)))),
              proof(goal(row_candidate(8, [2, 8, 7, 4, 1, 9, 6, 3, 5])), by(fact("exact-cover-sudoku.pl", clause(28)))),
              proof(goal(row_candidate(9, [3, 4, 5, 2, 8, 6, 1, 7, 9])), by(fact("exact-cover-sudoku.pl", clause(31)))),
              proof(goal(cover9([5, 6, 1, 8, 4, 7, 9, 2, 3])), by(builtin(cover9, 1))),
              proof(goal(cover9([3, 7, 9, 5, 2, 1, 6, 8, 4])), by(builtin(cover9, 1))),
              proof(goal(cover9([4, 2, 8, 9, 6, 3, 1, 7, 5])), by(builtin(cover9, 1))),
              proof(goal(cover9([6, 1, 3, 7, 8, 9, 5, 4, 2])), by(builtin(cover9, 1))),
              proof(goal(cover9([7, 9, 4, 6, 5, 2, 3, 1, 8])), by(builtin(cover9, 1))),
              proof(goal(cover9([8, 5, 2, 1, 3, 4, 7, 9, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 3, 5, 4, 7, 8, 2, 6, 1])), by(builtin(cover9, 1))),
              proof(goal(cover9([1, 4, 6, 2, 9, 5, 8, 3, 7])), by(builtin(cover9, 1))),
              proof(goal(cover9([2, 8, 7, 3, 1, 6, 4, 5, 9])), by(builtin(cover9, 1))),
              proof(goal(cover9([5, 3, 4, 6, 7, 2, 1, 9, 8])), by(builtin(cover9, 1))),
              proof(goal(cover9([6, 7, 8, 1, 9, 5, 3, 4, 2])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 1, 2, 3, 4, 8, 5, 6, 7])), by(builtin(cover9, 1))),
              proof(goal(cover9([8, 5, 9, 4, 2, 6, 7, 1, 3])), by(builtin(cover9, 1))),
              proof(goal(cover9([7, 6, 1, 8, 5, 3, 9, 2, 4])), by(builtin(cover9, 1))),
              proof(goal(cover9([4, 2, 3, 7, 9, 1, 8, 5, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([9, 6, 1, 2, 8, 7, 3, 4, 5])), by(builtin(cover9, 1))),
              proof(goal(cover9([5, 3, 7, 4, 1, 9, 2, 8, 6])), by(builtin(cover9, 1))),
              proof(goal(cover9([2, 8, 4, 6, 3, 5, 1, 7, 9])), by(builtin(cover9, 1)))
            ])
          )
        ])
      )
    ])
  )
).

