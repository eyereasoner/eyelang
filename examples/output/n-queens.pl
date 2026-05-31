solution(nQueens8, [1, 5, 8, 6, 3, 7, 2, 4]).
why(
  solution(nQueens8, [1, 5, 8, 6, 3, 7, 2, 4]),
  proof(
    goal(solution(nQueens8, [1, 5, 8, 6, 3, 7, 2, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [1, 5, 8, 6, 3, 7, 2, 4])]),
    uses([
      proof(
        goal(queens(8, [1, 5, 8, 6, 3, 7, 2, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [1, 5, 8, 6, 3, 7, 2, 4])]),
        uses([
          proof(
            goal(n_queens(8, [1, 5, 8, 6, 3, 7, 2, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [1, 6, 8, 3, 7, 4, 2, 5]).
why(
  solution(nQueens8, [1, 6, 8, 3, 7, 4, 2, 5]),
  proof(
    goal(solution(nQueens8, [1, 6, 8, 3, 7, 4, 2, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [1, 6, 8, 3, 7, 4, 2, 5])]),
    uses([
      proof(
        goal(queens(8, [1, 6, 8, 3, 7, 4, 2, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [1, 6, 8, 3, 7, 4, 2, 5])]),
        uses([
          proof(
            goal(n_queens(8, [1, 6, 8, 3, 7, 4, 2, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [1, 7, 4, 6, 8, 2, 5, 3]).
why(
  solution(nQueens8, [1, 7, 4, 6, 8, 2, 5, 3]),
  proof(
    goal(solution(nQueens8, [1, 7, 4, 6, 8, 2, 5, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [1, 7, 4, 6, 8, 2, 5, 3])]),
    uses([
      proof(
        goal(queens(8, [1, 7, 4, 6, 8, 2, 5, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [1, 7, 4, 6, 8, 2, 5, 3])]),
        uses([
          proof(
            goal(n_queens(8, [1, 7, 4, 6, 8, 2, 5, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [1, 7, 5, 8, 2, 4, 6, 3]).
why(
  solution(nQueens8, [1, 7, 5, 8, 2, 4, 6, 3]),
  proof(
    goal(solution(nQueens8, [1, 7, 5, 8, 2, 4, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [1, 7, 5, 8, 2, 4, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [1, 7, 5, 8, 2, 4, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [1, 7, 5, 8, 2, 4, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [1, 7, 5, 8, 2, 4, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 4, 6, 8, 3, 1, 7, 5]).
why(
  solution(nQueens8, [2, 4, 6, 8, 3, 1, 7, 5]),
  proof(
    goal(solution(nQueens8, [2, 4, 6, 8, 3, 1, 7, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 4, 6, 8, 3, 1, 7, 5])]),
    uses([
      proof(
        goal(queens(8, [2, 4, 6, 8, 3, 1, 7, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 4, 6, 8, 3, 1, 7, 5])]),
        uses([
          proof(
            goal(n_queens(8, [2, 4, 6, 8, 3, 1, 7, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 5, 7, 1, 3, 8, 6, 4]).
why(
  solution(nQueens8, [2, 5, 7, 1, 3, 8, 6, 4]),
  proof(
    goal(solution(nQueens8, [2, 5, 7, 1, 3, 8, 6, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 5, 7, 1, 3, 8, 6, 4])]),
    uses([
      proof(
        goal(queens(8, [2, 5, 7, 1, 3, 8, 6, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 5, 7, 1, 3, 8, 6, 4])]),
        uses([
          proof(
            goal(n_queens(8, [2, 5, 7, 1, 3, 8, 6, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 5, 7, 4, 1, 8, 6, 3]).
why(
  solution(nQueens8, [2, 5, 7, 4, 1, 8, 6, 3]),
  proof(
    goal(solution(nQueens8, [2, 5, 7, 4, 1, 8, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 5, 7, 4, 1, 8, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [2, 5, 7, 4, 1, 8, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 5, 7, 4, 1, 8, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [2, 5, 7, 4, 1, 8, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 6, 1, 7, 4, 8, 3, 5]).
why(
  solution(nQueens8, [2, 6, 1, 7, 4, 8, 3, 5]),
  proof(
    goal(solution(nQueens8, [2, 6, 1, 7, 4, 8, 3, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 6, 1, 7, 4, 8, 3, 5])]),
    uses([
      proof(
        goal(queens(8, [2, 6, 1, 7, 4, 8, 3, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 6, 1, 7, 4, 8, 3, 5])]),
        uses([
          proof(
            goal(n_queens(8, [2, 6, 1, 7, 4, 8, 3, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 6, 8, 3, 1, 4, 7, 5]).
why(
  solution(nQueens8, [2, 6, 8, 3, 1, 4, 7, 5]),
  proof(
    goal(solution(nQueens8, [2, 6, 8, 3, 1, 4, 7, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 6, 8, 3, 1, 4, 7, 5])]),
    uses([
      proof(
        goal(queens(8, [2, 6, 8, 3, 1, 4, 7, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 6, 8, 3, 1, 4, 7, 5])]),
        uses([
          proof(
            goal(n_queens(8, [2, 6, 8, 3, 1, 4, 7, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 7, 3, 6, 8, 5, 1, 4]).
why(
  solution(nQueens8, [2, 7, 3, 6, 8, 5, 1, 4]),
  proof(
    goal(solution(nQueens8, [2, 7, 3, 6, 8, 5, 1, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 7, 3, 6, 8, 5, 1, 4])]),
    uses([
      proof(
        goal(queens(8, [2, 7, 3, 6, 8, 5, 1, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 7, 3, 6, 8, 5, 1, 4])]),
        uses([
          proof(
            goal(n_queens(8, [2, 7, 3, 6, 8, 5, 1, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 7, 5, 8, 1, 4, 6, 3]).
why(
  solution(nQueens8, [2, 7, 5, 8, 1, 4, 6, 3]),
  proof(
    goal(solution(nQueens8, [2, 7, 5, 8, 1, 4, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 7, 5, 8, 1, 4, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [2, 7, 5, 8, 1, 4, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 7, 5, 8, 1, 4, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [2, 7, 5, 8, 1, 4, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [2, 8, 6, 1, 3, 5, 7, 4]).
why(
  solution(nQueens8, [2, 8, 6, 1, 3, 5, 7, 4]),
  proof(
    goal(solution(nQueens8, [2, 8, 6, 1, 3, 5, 7, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [2, 8, 6, 1, 3, 5, 7, 4])]),
    uses([
      proof(
        goal(queens(8, [2, 8, 6, 1, 3, 5, 7, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [2, 8, 6, 1, 3, 5, 7, 4])]),
        uses([
          proof(
            goal(n_queens(8, [2, 8, 6, 1, 3, 5, 7, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 1, 7, 5, 8, 2, 4, 6]).
why(
  solution(nQueens8, [3, 1, 7, 5, 8, 2, 4, 6]),
  proof(
    goal(solution(nQueens8, [3, 1, 7, 5, 8, 2, 4, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 1, 7, 5, 8, 2, 4, 6])]),
    uses([
      proof(
        goal(queens(8, [3, 1, 7, 5, 8, 2, 4, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 1, 7, 5, 8, 2, 4, 6])]),
        uses([
          proof(
            goal(n_queens(8, [3, 1, 7, 5, 8, 2, 4, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 5, 2, 8, 1, 7, 4, 6]).
why(
  solution(nQueens8, [3, 5, 2, 8, 1, 7, 4, 6]),
  proof(
    goal(solution(nQueens8, [3, 5, 2, 8, 1, 7, 4, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 5, 2, 8, 1, 7, 4, 6])]),
    uses([
      proof(
        goal(queens(8, [3, 5, 2, 8, 1, 7, 4, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 5, 2, 8, 1, 7, 4, 6])]),
        uses([
          proof(
            goal(n_queens(8, [3, 5, 2, 8, 1, 7, 4, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 5, 2, 8, 6, 4, 7, 1]).
why(
  solution(nQueens8, [3, 5, 2, 8, 6, 4, 7, 1]),
  proof(
    goal(solution(nQueens8, [3, 5, 2, 8, 6, 4, 7, 1])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 5, 2, 8, 6, 4, 7, 1])]),
    uses([
      proof(
        goal(queens(8, [3, 5, 2, 8, 6, 4, 7, 1])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 5, 2, 8, 6, 4, 7, 1])]),
        uses([
          proof(
            goal(n_queens(8, [3, 5, 2, 8, 6, 4, 7, 1])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 5, 7, 1, 4, 2, 8, 6]).
why(
  solution(nQueens8, [3, 5, 7, 1, 4, 2, 8, 6]),
  proof(
    goal(solution(nQueens8, [3, 5, 7, 1, 4, 2, 8, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 5, 7, 1, 4, 2, 8, 6])]),
    uses([
      proof(
        goal(queens(8, [3, 5, 7, 1, 4, 2, 8, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 5, 7, 1, 4, 2, 8, 6])]),
        uses([
          proof(
            goal(n_queens(8, [3, 5, 7, 1, 4, 2, 8, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 5, 8, 4, 1, 7, 2, 6]).
why(
  solution(nQueens8, [3, 5, 8, 4, 1, 7, 2, 6]),
  proof(
    goal(solution(nQueens8, [3, 5, 8, 4, 1, 7, 2, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 5, 8, 4, 1, 7, 2, 6])]),
    uses([
      proof(
        goal(queens(8, [3, 5, 8, 4, 1, 7, 2, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 5, 8, 4, 1, 7, 2, 6])]),
        uses([
          proof(
            goal(n_queens(8, [3, 5, 8, 4, 1, 7, 2, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 2, 5, 8, 1, 7, 4]).
why(
  solution(nQueens8, [3, 6, 2, 5, 8, 1, 7, 4]),
  proof(
    goal(solution(nQueens8, [3, 6, 2, 5, 8, 1, 7, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 2, 5, 8, 1, 7, 4])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 2, 5, 8, 1, 7, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 2, 5, 8, 1, 7, 4])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 2, 5, 8, 1, 7, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 2, 7, 1, 4, 8, 5]).
why(
  solution(nQueens8, [3, 6, 2, 7, 1, 4, 8, 5]),
  proof(
    goal(solution(nQueens8, [3, 6, 2, 7, 1, 4, 8, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 2, 7, 1, 4, 8, 5])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 2, 7, 1, 4, 8, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 2, 7, 1, 4, 8, 5])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 2, 7, 1, 4, 8, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 2, 7, 5, 1, 8, 4]).
why(
  solution(nQueens8, [3, 6, 2, 7, 5, 1, 8, 4]),
  proof(
    goal(solution(nQueens8, [3, 6, 2, 7, 5, 1, 8, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 2, 7, 5, 1, 8, 4])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 2, 7, 5, 1, 8, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 2, 7, 5, 1, 8, 4])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 2, 7, 5, 1, 8, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 4, 1, 8, 5, 7, 2]).
why(
  solution(nQueens8, [3, 6, 4, 1, 8, 5, 7, 2]),
  proof(
    goal(solution(nQueens8, [3, 6, 4, 1, 8, 5, 7, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 4, 1, 8, 5, 7, 2])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 4, 1, 8, 5, 7, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 4, 1, 8, 5, 7, 2])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 4, 1, 8, 5, 7, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 4, 2, 8, 5, 7, 1]).
why(
  solution(nQueens8, [3, 6, 4, 2, 8, 5, 7, 1]),
  proof(
    goal(solution(nQueens8, [3, 6, 4, 2, 8, 5, 7, 1])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 4, 2, 8, 5, 7, 1])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 4, 2, 8, 5, 7, 1])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 4, 2, 8, 5, 7, 1])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 4, 2, 8, 5, 7, 1])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 8, 1, 4, 7, 5, 2]).
why(
  solution(nQueens8, [3, 6, 8, 1, 4, 7, 5, 2]),
  proof(
    goal(solution(nQueens8, [3, 6, 8, 1, 4, 7, 5, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 8, 1, 4, 7, 5, 2])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 8, 1, 4, 7, 5, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 8, 1, 4, 7, 5, 2])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 8, 1, 4, 7, 5, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 8, 1, 5, 7, 2, 4]).
why(
  solution(nQueens8, [3, 6, 8, 1, 5, 7, 2, 4]),
  proof(
    goal(solution(nQueens8, [3, 6, 8, 1, 5, 7, 2, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 8, 1, 5, 7, 2, 4])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 8, 1, 5, 7, 2, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 8, 1, 5, 7, 2, 4])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 8, 1, 5, 7, 2, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 6, 8, 2, 4, 1, 7, 5]).
why(
  solution(nQueens8, [3, 6, 8, 2, 4, 1, 7, 5]),
  proof(
    goal(solution(nQueens8, [3, 6, 8, 2, 4, 1, 7, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 6, 8, 2, 4, 1, 7, 5])]),
    uses([
      proof(
        goal(queens(8, [3, 6, 8, 2, 4, 1, 7, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 6, 8, 2, 4, 1, 7, 5])]),
        uses([
          proof(
            goal(n_queens(8, [3, 6, 8, 2, 4, 1, 7, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 7, 2, 8, 5, 1, 4, 6]).
why(
  solution(nQueens8, [3, 7, 2, 8, 5, 1, 4, 6]),
  proof(
    goal(solution(nQueens8, [3, 7, 2, 8, 5, 1, 4, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 7, 2, 8, 5, 1, 4, 6])]),
    uses([
      proof(
        goal(queens(8, [3, 7, 2, 8, 5, 1, 4, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 7, 2, 8, 5, 1, 4, 6])]),
        uses([
          proof(
            goal(n_queens(8, [3, 7, 2, 8, 5, 1, 4, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 7, 2, 8, 6, 4, 1, 5]).
why(
  solution(nQueens8, [3, 7, 2, 8, 6, 4, 1, 5]),
  proof(
    goal(solution(nQueens8, [3, 7, 2, 8, 6, 4, 1, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 7, 2, 8, 6, 4, 1, 5])]),
    uses([
      proof(
        goal(queens(8, [3, 7, 2, 8, 6, 4, 1, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 7, 2, 8, 6, 4, 1, 5])]),
        uses([
          proof(
            goal(n_queens(8, [3, 7, 2, 8, 6, 4, 1, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [3, 8, 4, 7, 1, 6, 2, 5]).
why(
  solution(nQueens8, [3, 8, 4, 7, 1, 6, 2, 5]),
  proof(
    goal(solution(nQueens8, [3, 8, 4, 7, 1, 6, 2, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [3, 8, 4, 7, 1, 6, 2, 5])]),
    uses([
      proof(
        goal(queens(8, [3, 8, 4, 7, 1, 6, 2, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [3, 8, 4, 7, 1, 6, 2, 5])]),
        uses([
          proof(
            goal(n_queens(8, [3, 8, 4, 7, 1, 6, 2, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 1, 5, 8, 2, 7, 3, 6]).
why(
  solution(nQueens8, [4, 1, 5, 8, 2, 7, 3, 6]),
  proof(
    goal(solution(nQueens8, [4, 1, 5, 8, 2, 7, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 1, 5, 8, 2, 7, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [4, 1, 5, 8, 2, 7, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 1, 5, 8, 2, 7, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [4, 1, 5, 8, 2, 7, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 1, 5, 8, 6, 3, 7, 2]).
why(
  solution(nQueens8, [4, 1, 5, 8, 6, 3, 7, 2]),
  proof(
    goal(solution(nQueens8, [4, 1, 5, 8, 6, 3, 7, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 1, 5, 8, 6, 3, 7, 2])]),
    uses([
      proof(
        goal(queens(8, [4, 1, 5, 8, 6, 3, 7, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 1, 5, 8, 6, 3, 7, 2])]),
        uses([
          proof(
            goal(n_queens(8, [4, 1, 5, 8, 6, 3, 7, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 2, 5, 8, 6, 1, 3, 7]).
why(
  solution(nQueens8, [4, 2, 5, 8, 6, 1, 3, 7]),
  proof(
    goal(solution(nQueens8, [4, 2, 5, 8, 6, 1, 3, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 2, 5, 8, 6, 1, 3, 7])]),
    uses([
      proof(
        goal(queens(8, [4, 2, 5, 8, 6, 1, 3, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 2, 5, 8, 6, 1, 3, 7])]),
        uses([
          proof(
            goal(n_queens(8, [4, 2, 5, 8, 6, 1, 3, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 2, 7, 3, 6, 8, 1, 5]).
why(
  solution(nQueens8, [4, 2, 7, 3, 6, 8, 1, 5]),
  proof(
    goal(solution(nQueens8, [4, 2, 7, 3, 6, 8, 1, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 2, 7, 3, 6, 8, 1, 5])]),
    uses([
      proof(
        goal(queens(8, [4, 2, 7, 3, 6, 8, 1, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 2, 7, 3, 6, 8, 1, 5])]),
        uses([
          proof(
            goal(n_queens(8, [4, 2, 7, 3, 6, 8, 1, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 2, 7, 3, 6, 8, 5, 1]).
why(
  solution(nQueens8, [4, 2, 7, 3, 6, 8, 5, 1]),
  proof(
    goal(solution(nQueens8, [4, 2, 7, 3, 6, 8, 5, 1])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 2, 7, 3, 6, 8, 5, 1])]),
    uses([
      proof(
        goal(queens(8, [4, 2, 7, 3, 6, 8, 5, 1])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 2, 7, 3, 6, 8, 5, 1])]),
        uses([
          proof(
            goal(n_queens(8, [4, 2, 7, 3, 6, 8, 5, 1])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 2, 7, 5, 1, 8, 6, 3]).
why(
  solution(nQueens8, [4, 2, 7, 5, 1, 8, 6, 3]),
  proof(
    goal(solution(nQueens8, [4, 2, 7, 5, 1, 8, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 2, 7, 5, 1, 8, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [4, 2, 7, 5, 1, 8, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 2, 7, 5, 1, 8, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [4, 2, 7, 5, 1, 8, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 2, 8, 5, 7, 1, 3, 6]).
why(
  solution(nQueens8, [4, 2, 8, 5, 7, 1, 3, 6]),
  proof(
    goal(solution(nQueens8, [4, 2, 8, 5, 7, 1, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 2, 8, 5, 7, 1, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [4, 2, 8, 5, 7, 1, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 2, 8, 5, 7, 1, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [4, 2, 8, 5, 7, 1, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 2, 8, 6, 1, 3, 5, 7]).
why(
  solution(nQueens8, [4, 2, 8, 6, 1, 3, 5, 7]),
  proof(
    goal(solution(nQueens8, [4, 2, 8, 6, 1, 3, 5, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 2, 8, 6, 1, 3, 5, 7])]),
    uses([
      proof(
        goal(queens(8, [4, 2, 8, 6, 1, 3, 5, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 2, 8, 6, 1, 3, 5, 7])]),
        uses([
          proof(
            goal(n_queens(8, [4, 2, 8, 6, 1, 3, 5, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 6, 1, 5, 2, 8, 3, 7]).
why(
  solution(nQueens8, [4, 6, 1, 5, 2, 8, 3, 7]),
  proof(
    goal(solution(nQueens8, [4, 6, 1, 5, 2, 8, 3, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 6, 1, 5, 2, 8, 3, 7])]),
    uses([
      proof(
        goal(queens(8, [4, 6, 1, 5, 2, 8, 3, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 6, 1, 5, 2, 8, 3, 7])]),
        uses([
          proof(
            goal(n_queens(8, [4, 6, 1, 5, 2, 8, 3, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 6, 8, 2, 7, 1, 3, 5]).
why(
  solution(nQueens8, [4, 6, 8, 2, 7, 1, 3, 5]),
  proof(
    goal(solution(nQueens8, [4, 6, 8, 2, 7, 1, 3, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 6, 8, 2, 7, 1, 3, 5])]),
    uses([
      proof(
        goal(queens(8, [4, 6, 8, 2, 7, 1, 3, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 6, 8, 2, 7, 1, 3, 5])]),
        uses([
          proof(
            goal(n_queens(8, [4, 6, 8, 2, 7, 1, 3, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 6, 8, 3, 1, 7, 5, 2]).
why(
  solution(nQueens8, [4, 6, 8, 3, 1, 7, 5, 2]),
  proof(
    goal(solution(nQueens8, [4, 6, 8, 3, 1, 7, 5, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 6, 8, 3, 1, 7, 5, 2])]),
    uses([
      proof(
        goal(queens(8, [4, 6, 8, 3, 1, 7, 5, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 6, 8, 3, 1, 7, 5, 2])]),
        uses([
          proof(
            goal(n_queens(8, [4, 6, 8, 3, 1, 7, 5, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 7, 1, 8, 5, 2, 6, 3]).
why(
  solution(nQueens8, [4, 7, 1, 8, 5, 2, 6, 3]),
  proof(
    goal(solution(nQueens8, [4, 7, 1, 8, 5, 2, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 7, 1, 8, 5, 2, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [4, 7, 1, 8, 5, 2, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 7, 1, 8, 5, 2, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [4, 7, 1, 8, 5, 2, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 7, 3, 8, 2, 5, 1, 6]).
why(
  solution(nQueens8, [4, 7, 3, 8, 2, 5, 1, 6]),
  proof(
    goal(solution(nQueens8, [4, 7, 3, 8, 2, 5, 1, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 7, 3, 8, 2, 5, 1, 6])]),
    uses([
      proof(
        goal(queens(8, [4, 7, 3, 8, 2, 5, 1, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 7, 3, 8, 2, 5, 1, 6])]),
        uses([
          proof(
            goal(n_queens(8, [4, 7, 3, 8, 2, 5, 1, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 7, 5, 2, 6, 1, 3, 8]).
why(
  solution(nQueens8, [4, 7, 5, 2, 6, 1, 3, 8]),
  proof(
    goal(solution(nQueens8, [4, 7, 5, 2, 6, 1, 3, 8])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 7, 5, 2, 6, 1, 3, 8])]),
    uses([
      proof(
        goal(queens(8, [4, 7, 5, 2, 6, 1, 3, 8])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 7, 5, 2, 6, 1, 3, 8])]),
        uses([
          proof(
            goal(n_queens(8, [4, 7, 5, 2, 6, 1, 3, 8])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 7, 5, 3, 1, 6, 8, 2]).
why(
  solution(nQueens8, [4, 7, 5, 3, 1, 6, 8, 2]),
  proof(
    goal(solution(nQueens8, [4, 7, 5, 3, 1, 6, 8, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 7, 5, 3, 1, 6, 8, 2])]),
    uses([
      proof(
        goal(queens(8, [4, 7, 5, 3, 1, 6, 8, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 7, 5, 3, 1, 6, 8, 2])]),
        uses([
          proof(
            goal(n_queens(8, [4, 7, 5, 3, 1, 6, 8, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 8, 1, 3, 6, 2, 7, 5]).
why(
  solution(nQueens8, [4, 8, 1, 3, 6, 2, 7, 5]),
  proof(
    goal(solution(nQueens8, [4, 8, 1, 3, 6, 2, 7, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 8, 1, 3, 6, 2, 7, 5])]),
    uses([
      proof(
        goal(queens(8, [4, 8, 1, 3, 6, 2, 7, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 8, 1, 3, 6, 2, 7, 5])]),
        uses([
          proof(
            goal(n_queens(8, [4, 8, 1, 3, 6, 2, 7, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 8, 1, 5, 7, 2, 6, 3]).
why(
  solution(nQueens8, [4, 8, 1, 5, 7, 2, 6, 3]),
  proof(
    goal(solution(nQueens8, [4, 8, 1, 5, 7, 2, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 8, 1, 5, 7, 2, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [4, 8, 1, 5, 7, 2, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 8, 1, 5, 7, 2, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [4, 8, 1, 5, 7, 2, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [4, 8, 5, 3, 1, 7, 2, 6]).
why(
  solution(nQueens8, [4, 8, 5, 3, 1, 7, 2, 6]),
  proof(
    goal(solution(nQueens8, [4, 8, 5, 3, 1, 7, 2, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [4, 8, 5, 3, 1, 7, 2, 6])]),
    uses([
      proof(
        goal(queens(8, [4, 8, 5, 3, 1, 7, 2, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [4, 8, 5, 3, 1, 7, 2, 6])]),
        uses([
          proof(
            goal(n_queens(8, [4, 8, 5, 3, 1, 7, 2, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 1, 4, 6, 8, 2, 7, 3]).
why(
  solution(nQueens8, [5, 1, 4, 6, 8, 2, 7, 3]),
  proof(
    goal(solution(nQueens8, [5, 1, 4, 6, 8, 2, 7, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 1, 4, 6, 8, 2, 7, 3])]),
    uses([
      proof(
        goal(queens(8, [5, 1, 4, 6, 8, 2, 7, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 1, 4, 6, 8, 2, 7, 3])]),
        uses([
          proof(
            goal(n_queens(8, [5, 1, 4, 6, 8, 2, 7, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 1, 8, 4, 2, 7, 3, 6]).
why(
  solution(nQueens8, [5, 1, 8, 4, 2, 7, 3, 6]),
  proof(
    goal(solution(nQueens8, [5, 1, 8, 4, 2, 7, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 1, 8, 4, 2, 7, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [5, 1, 8, 4, 2, 7, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 1, 8, 4, 2, 7, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [5, 1, 8, 4, 2, 7, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 1, 8, 6, 3, 7, 2, 4]).
why(
  solution(nQueens8, [5, 1, 8, 6, 3, 7, 2, 4]),
  proof(
    goal(solution(nQueens8, [5, 1, 8, 6, 3, 7, 2, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 1, 8, 6, 3, 7, 2, 4])]),
    uses([
      proof(
        goal(queens(8, [5, 1, 8, 6, 3, 7, 2, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 1, 8, 6, 3, 7, 2, 4])]),
        uses([
          proof(
            goal(n_queens(8, [5, 1, 8, 6, 3, 7, 2, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 2, 4, 6, 8, 3, 1, 7]).
why(
  solution(nQueens8, [5, 2, 4, 6, 8, 3, 1, 7]),
  proof(
    goal(solution(nQueens8, [5, 2, 4, 6, 8, 3, 1, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 2, 4, 6, 8, 3, 1, 7])]),
    uses([
      proof(
        goal(queens(8, [5, 2, 4, 6, 8, 3, 1, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 2, 4, 6, 8, 3, 1, 7])]),
        uses([
          proof(
            goal(n_queens(8, [5, 2, 4, 6, 8, 3, 1, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 2, 4, 7, 3, 8, 6, 1]).
why(
  solution(nQueens8, [5, 2, 4, 7, 3, 8, 6, 1]),
  proof(
    goal(solution(nQueens8, [5, 2, 4, 7, 3, 8, 6, 1])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 2, 4, 7, 3, 8, 6, 1])]),
    uses([
      proof(
        goal(queens(8, [5, 2, 4, 7, 3, 8, 6, 1])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 2, 4, 7, 3, 8, 6, 1])]),
        uses([
          proof(
            goal(n_queens(8, [5, 2, 4, 7, 3, 8, 6, 1])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 2, 6, 1, 7, 4, 8, 3]).
why(
  solution(nQueens8, [5, 2, 6, 1, 7, 4, 8, 3]),
  proof(
    goal(solution(nQueens8, [5, 2, 6, 1, 7, 4, 8, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 2, 6, 1, 7, 4, 8, 3])]),
    uses([
      proof(
        goal(queens(8, [5, 2, 6, 1, 7, 4, 8, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 2, 6, 1, 7, 4, 8, 3])]),
        uses([
          proof(
            goal(n_queens(8, [5, 2, 6, 1, 7, 4, 8, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 2, 8, 1, 4, 7, 3, 6]).
why(
  solution(nQueens8, [5, 2, 8, 1, 4, 7, 3, 6]),
  proof(
    goal(solution(nQueens8, [5, 2, 8, 1, 4, 7, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 2, 8, 1, 4, 7, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [5, 2, 8, 1, 4, 7, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 2, 8, 1, 4, 7, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [5, 2, 8, 1, 4, 7, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 3, 1, 6, 8, 2, 4, 7]).
why(
  solution(nQueens8, [5, 3, 1, 6, 8, 2, 4, 7]),
  proof(
    goal(solution(nQueens8, [5, 3, 1, 6, 8, 2, 4, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 3, 1, 6, 8, 2, 4, 7])]),
    uses([
      proof(
        goal(queens(8, [5, 3, 1, 6, 8, 2, 4, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 3, 1, 6, 8, 2, 4, 7])]),
        uses([
          proof(
            goal(n_queens(8, [5, 3, 1, 6, 8, 2, 4, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 3, 1, 7, 2, 8, 6, 4]).
why(
  solution(nQueens8, [5, 3, 1, 7, 2, 8, 6, 4]),
  proof(
    goal(solution(nQueens8, [5, 3, 1, 7, 2, 8, 6, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 3, 1, 7, 2, 8, 6, 4])]),
    uses([
      proof(
        goal(queens(8, [5, 3, 1, 7, 2, 8, 6, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 3, 1, 7, 2, 8, 6, 4])]),
        uses([
          proof(
            goal(n_queens(8, [5, 3, 1, 7, 2, 8, 6, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 3, 8, 4, 7, 1, 6, 2]).
why(
  solution(nQueens8, [5, 3, 8, 4, 7, 1, 6, 2]),
  proof(
    goal(solution(nQueens8, [5, 3, 8, 4, 7, 1, 6, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 3, 8, 4, 7, 1, 6, 2])]),
    uses([
      proof(
        goal(queens(8, [5, 3, 8, 4, 7, 1, 6, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 3, 8, 4, 7, 1, 6, 2])]),
        uses([
          proof(
            goal(n_queens(8, [5, 3, 8, 4, 7, 1, 6, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 7, 1, 3, 8, 6, 4, 2]).
why(
  solution(nQueens8, [5, 7, 1, 3, 8, 6, 4, 2]),
  proof(
    goal(solution(nQueens8, [5, 7, 1, 3, 8, 6, 4, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 7, 1, 3, 8, 6, 4, 2])]),
    uses([
      proof(
        goal(queens(8, [5, 7, 1, 3, 8, 6, 4, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 7, 1, 3, 8, 6, 4, 2])]),
        uses([
          proof(
            goal(n_queens(8, [5, 7, 1, 3, 8, 6, 4, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 7, 1, 4, 2, 8, 6, 3]).
why(
  solution(nQueens8, [5, 7, 1, 4, 2, 8, 6, 3]),
  proof(
    goal(solution(nQueens8, [5, 7, 1, 4, 2, 8, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 7, 1, 4, 2, 8, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [5, 7, 1, 4, 2, 8, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 7, 1, 4, 2, 8, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [5, 7, 1, 4, 2, 8, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 7, 2, 4, 8, 1, 3, 6]).
why(
  solution(nQueens8, [5, 7, 2, 4, 8, 1, 3, 6]),
  proof(
    goal(solution(nQueens8, [5, 7, 2, 4, 8, 1, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 7, 2, 4, 8, 1, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [5, 7, 2, 4, 8, 1, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 7, 2, 4, 8, 1, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [5, 7, 2, 4, 8, 1, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 7, 2, 6, 3, 1, 4, 8]).
why(
  solution(nQueens8, [5, 7, 2, 6, 3, 1, 4, 8]),
  proof(
    goal(solution(nQueens8, [5, 7, 2, 6, 3, 1, 4, 8])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 7, 2, 6, 3, 1, 4, 8])]),
    uses([
      proof(
        goal(queens(8, [5, 7, 2, 6, 3, 1, 4, 8])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 7, 2, 6, 3, 1, 4, 8])]),
        uses([
          proof(
            goal(n_queens(8, [5, 7, 2, 6, 3, 1, 4, 8])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 7, 2, 6, 3, 1, 8, 4]).
why(
  solution(nQueens8, [5, 7, 2, 6, 3, 1, 8, 4]),
  proof(
    goal(solution(nQueens8, [5, 7, 2, 6, 3, 1, 8, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 7, 2, 6, 3, 1, 8, 4])]),
    uses([
      proof(
        goal(queens(8, [5, 7, 2, 6, 3, 1, 8, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 7, 2, 6, 3, 1, 8, 4])]),
        uses([
          proof(
            goal(n_queens(8, [5, 7, 2, 6, 3, 1, 8, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 7, 4, 1, 3, 8, 6, 2]).
why(
  solution(nQueens8, [5, 7, 4, 1, 3, 8, 6, 2]),
  proof(
    goal(solution(nQueens8, [5, 7, 4, 1, 3, 8, 6, 2])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 7, 4, 1, 3, 8, 6, 2])]),
    uses([
      proof(
        goal(queens(8, [5, 7, 4, 1, 3, 8, 6, 2])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 7, 4, 1, 3, 8, 6, 2])]),
        uses([
          proof(
            goal(n_queens(8, [5, 7, 4, 1, 3, 8, 6, 2])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 8, 4, 1, 3, 6, 2, 7]).
why(
  solution(nQueens8, [5, 8, 4, 1, 3, 6, 2, 7]),
  proof(
    goal(solution(nQueens8, [5, 8, 4, 1, 3, 6, 2, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 8, 4, 1, 3, 6, 2, 7])]),
    uses([
      proof(
        goal(queens(8, [5, 8, 4, 1, 3, 6, 2, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 8, 4, 1, 3, 6, 2, 7])]),
        uses([
          proof(
            goal(n_queens(8, [5, 8, 4, 1, 3, 6, 2, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [5, 8, 4, 1, 7, 2, 6, 3]).
why(
  solution(nQueens8, [5, 8, 4, 1, 7, 2, 6, 3]),
  proof(
    goal(solution(nQueens8, [5, 8, 4, 1, 7, 2, 6, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [5, 8, 4, 1, 7, 2, 6, 3])]),
    uses([
      proof(
        goal(queens(8, [5, 8, 4, 1, 7, 2, 6, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [5, 8, 4, 1, 7, 2, 6, 3])]),
        uses([
          proof(
            goal(n_queens(8, [5, 8, 4, 1, 7, 2, 6, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 1, 5, 2, 8, 3, 7, 4]).
why(
  solution(nQueens8, [6, 1, 5, 2, 8, 3, 7, 4]),
  proof(
    goal(solution(nQueens8, [6, 1, 5, 2, 8, 3, 7, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 1, 5, 2, 8, 3, 7, 4])]),
    uses([
      proof(
        goal(queens(8, [6, 1, 5, 2, 8, 3, 7, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 1, 5, 2, 8, 3, 7, 4])]),
        uses([
          proof(
            goal(n_queens(8, [6, 1, 5, 2, 8, 3, 7, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 2, 7, 1, 3, 5, 8, 4]).
why(
  solution(nQueens8, [6, 2, 7, 1, 3, 5, 8, 4]),
  proof(
    goal(solution(nQueens8, [6, 2, 7, 1, 3, 5, 8, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 2, 7, 1, 3, 5, 8, 4])]),
    uses([
      proof(
        goal(queens(8, [6, 2, 7, 1, 3, 5, 8, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 2, 7, 1, 3, 5, 8, 4])]),
        uses([
          proof(
            goal(n_queens(8, [6, 2, 7, 1, 3, 5, 8, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 2, 7, 1, 4, 8, 5, 3]).
why(
  solution(nQueens8, [6, 2, 7, 1, 4, 8, 5, 3]),
  proof(
    goal(solution(nQueens8, [6, 2, 7, 1, 4, 8, 5, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 2, 7, 1, 4, 8, 5, 3])]),
    uses([
      proof(
        goal(queens(8, [6, 2, 7, 1, 4, 8, 5, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 2, 7, 1, 4, 8, 5, 3])]),
        uses([
          proof(
            goal(n_queens(8, [6, 2, 7, 1, 4, 8, 5, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 1, 7, 5, 8, 2, 4]).
why(
  solution(nQueens8, [6, 3, 1, 7, 5, 8, 2, 4]),
  proof(
    goal(solution(nQueens8, [6, 3, 1, 7, 5, 8, 2, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 1, 7, 5, 8, 2, 4])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 1, 7, 5, 8, 2, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 1, 7, 5, 8, 2, 4])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 1, 7, 5, 8, 2, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 1, 8, 4, 2, 7, 5]).
why(
  solution(nQueens8, [6, 3, 1, 8, 4, 2, 7, 5]),
  proof(
    goal(solution(nQueens8, [6, 3, 1, 8, 4, 2, 7, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 1, 8, 4, 2, 7, 5])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 1, 8, 4, 2, 7, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 1, 8, 4, 2, 7, 5])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 1, 8, 4, 2, 7, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 1, 8, 5, 2, 4, 7]).
why(
  solution(nQueens8, [6, 3, 1, 8, 5, 2, 4, 7]),
  proof(
    goal(solution(nQueens8, [6, 3, 1, 8, 5, 2, 4, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 1, 8, 5, 2, 4, 7])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 1, 8, 5, 2, 4, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 1, 8, 5, 2, 4, 7])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 1, 8, 5, 2, 4, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 5, 7, 1, 4, 2, 8]).
why(
  solution(nQueens8, [6, 3, 5, 7, 1, 4, 2, 8]),
  proof(
    goal(solution(nQueens8, [6, 3, 5, 7, 1, 4, 2, 8])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 5, 7, 1, 4, 2, 8])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 5, 7, 1, 4, 2, 8])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 5, 7, 1, 4, 2, 8])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 5, 7, 1, 4, 2, 8])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 5, 8, 1, 4, 2, 7]).
why(
  solution(nQueens8, [6, 3, 5, 8, 1, 4, 2, 7]),
  proof(
    goal(solution(nQueens8, [6, 3, 5, 8, 1, 4, 2, 7])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 5, 8, 1, 4, 2, 7])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 5, 8, 1, 4, 2, 7])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 5, 8, 1, 4, 2, 7])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 5, 8, 1, 4, 2, 7])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 7, 2, 4, 8, 1, 5]).
why(
  solution(nQueens8, [6, 3, 7, 2, 4, 8, 1, 5]),
  proof(
    goal(solution(nQueens8, [6, 3, 7, 2, 4, 8, 1, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 7, 2, 4, 8, 1, 5])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 7, 2, 4, 8, 1, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 7, 2, 4, 8, 1, 5])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 7, 2, 4, 8, 1, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 7, 2, 8, 5, 1, 4]).
why(
  solution(nQueens8, [6, 3, 7, 2, 8, 5, 1, 4]),
  proof(
    goal(solution(nQueens8, [6, 3, 7, 2, 8, 5, 1, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 7, 2, 8, 5, 1, 4])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 7, 2, 8, 5, 1, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 7, 2, 8, 5, 1, 4])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 7, 2, 8, 5, 1, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 3, 7, 4, 1, 8, 2, 5]).
why(
  solution(nQueens8, [6, 3, 7, 4, 1, 8, 2, 5]),
  proof(
    goal(solution(nQueens8, [6, 3, 7, 4, 1, 8, 2, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 3, 7, 4, 1, 8, 2, 5])]),
    uses([
      proof(
        goal(queens(8, [6, 3, 7, 4, 1, 8, 2, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 3, 7, 4, 1, 8, 2, 5])]),
        uses([
          proof(
            goal(n_queens(8, [6, 3, 7, 4, 1, 8, 2, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 4, 1, 5, 8, 2, 7, 3]).
why(
  solution(nQueens8, [6, 4, 1, 5, 8, 2, 7, 3]),
  proof(
    goal(solution(nQueens8, [6, 4, 1, 5, 8, 2, 7, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 4, 1, 5, 8, 2, 7, 3])]),
    uses([
      proof(
        goal(queens(8, [6, 4, 1, 5, 8, 2, 7, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 4, 1, 5, 8, 2, 7, 3])]),
        uses([
          proof(
            goal(n_queens(8, [6, 4, 1, 5, 8, 2, 7, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 4, 2, 8, 5, 7, 1, 3]).
why(
  solution(nQueens8, [6, 4, 2, 8, 5, 7, 1, 3]),
  proof(
    goal(solution(nQueens8, [6, 4, 2, 8, 5, 7, 1, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 4, 2, 8, 5, 7, 1, 3])]),
    uses([
      proof(
        goal(queens(8, [6, 4, 2, 8, 5, 7, 1, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 4, 2, 8, 5, 7, 1, 3])]),
        uses([
          proof(
            goal(n_queens(8, [6, 4, 2, 8, 5, 7, 1, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 4, 7, 1, 3, 5, 2, 8]).
why(
  solution(nQueens8, [6, 4, 7, 1, 3, 5, 2, 8]),
  proof(
    goal(solution(nQueens8, [6, 4, 7, 1, 3, 5, 2, 8])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 4, 7, 1, 3, 5, 2, 8])]),
    uses([
      proof(
        goal(queens(8, [6, 4, 7, 1, 3, 5, 2, 8])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 4, 7, 1, 3, 5, 2, 8])]),
        uses([
          proof(
            goal(n_queens(8, [6, 4, 7, 1, 3, 5, 2, 8])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 4, 7, 1, 8, 2, 5, 3]).
why(
  solution(nQueens8, [6, 4, 7, 1, 8, 2, 5, 3]),
  proof(
    goal(solution(nQueens8, [6, 4, 7, 1, 8, 2, 5, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 4, 7, 1, 8, 2, 5, 3])]),
    uses([
      proof(
        goal(queens(8, [6, 4, 7, 1, 8, 2, 5, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 4, 7, 1, 8, 2, 5, 3])]),
        uses([
          proof(
            goal(n_queens(8, [6, 4, 7, 1, 8, 2, 5, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [6, 8, 2, 4, 1, 7, 5, 3]).
why(
  solution(nQueens8, [6, 8, 2, 4, 1, 7, 5, 3]),
  proof(
    goal(solution(nQueens8, [6, 8, 2, 4, 1, 7, 5, 3])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [6, 8, 2, 4, 1, 7, 5, 3])]),
    uses([
      proof(
        goal(queens(8, [6, 8, 2, 4, 1, 7, 5, 3])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [6, 8, 2, 4, 1, 7, 5, 3])]),
        uses([
          proof(
            goal(n_queens(8, [6, 8, 2, 4, 1, 7, 5, 3])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 1, 3, 8, 6, 4, 2, 5]).
why(
  solution(nQueens8, [7, 1, 3, 8, 6, 4, 2, 5]),
  proof(
    goal(solution(nQueens8, [7, 1, 3, 8, 6, 4, 2, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 1, 3, 8, 6, 4, 2, 5])]),
    uses([
      proof(
        goal(queens(8, [7, 1, 3, 8, 6, 4, 2, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 1, 3, 8, 6, 4, 2, 5])]),
        uses([
          proof(
            goal(n_queens(8, [7, 1, 3, 8, 6, 4, 2, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 2, 4, 1, 8, 5, 3, 6]).
why(
  solution(nQueens8, [7, 2, 4, 1, 8, 5, 3, 6]),
  proof(
    goal(solution(nQueens8, [7, 2, 4, 1, 8, 5, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 2, 4, 1, 8, 5, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [7, 2, 4, 1, 8, 5, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 2, 4, 1, 8, 5, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [7, 2, 4, 1, 8, 5, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 2, 6, 3, 1, 4, 8, 5]).
why(
  solution(nQueens8, [7, 2, 6, 3, 1, 4, 8, 5]),
  proof(
    goal(solution(nQueens8, [7, 2, 6, 3, 1, 4, 8, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 2, 6, 3, 1, 4, 8, 5])]),
    uses([
      proof(
        goal(queens(8, [7, 2, 6, 3, 1, 4, 8, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 2, 6, 3, 1, 4, 8, 5])]),
        uses([
          proof(
            goal(n_queens(8, [7, 2, 6, 3, 1, 4, 8, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 3, 1, 6, 8, 5, 2, 4]).
why(
  solution(nQueens8, [7, 3, 1, 6, 8, 5, 2, 4]),
  proof(
    goal(solution(nQueens8, [7, 3, 1, 6, 8, 5, 2, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 3, 1, 6, 8, 5, 2, 4])]),
    uses([
      proof(
        goal(queens(8, [7, 3, 1, 6, 8, 5, 2, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 3, 1, 6, 8, 5, 2, 4])]),
        uses([
          proof(
            goal(n_queens(8, [7, 3, 1, 6, 8, 5, 2, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 3, 8, 2, 5, 1, 6, 4]).
why(
  solution(nQueens8, [7, 3, 8, 2, 5, 1, 6, 4]),
  proof(
    goal(solution(nQueens8, [7, 3, 8, 2, 5, 1, 6, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 3, 8, 2, 5, 1, 6, 4])]),
    uses([
      proof(
        goal(queens(8, [7, 3, 8, 2, 5, 1, 6, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 3, 8, 2, 5, 1, 6, 4])]),
        uses([
          proof(
            goal(n_queens(8, [7, 3, 8, 2, 5, 1, 6, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 4, 2, 5, 8, 1, 3, 6]).
why(
  solution(nQueens8, [7, 4, 2, 5, 8, 1, 3, 6]),
  proof(
    goal(solution(nQueens8, [7, 4, 2, 5, 8, 1, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 4, 2, 5, 8, 1, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [7, 4, 2, 5, 8, 1, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 4, 2, 5, 8, 1, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [7, 4, 2, 5, 8, 1, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 4, 2, 8, 6, 1, 3, 5]).
why(
  solution(nQueens8, [7, 4, 2, 8, 6, 1, 3, 5]),
  proof(
    goal(solution(nQueens8, [7, 4, 2, 8, 6, 1, 3, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 4, 2, 8, 6, 1, 3, 5])]),
    uses([
      proof(
        goal(queens(8, [7, 4, 2, 8, 6, 1, 3, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 4, 2, 8, 6, 1, 3, 5])]),
        uses([
          proof(
            goal(n_queens(8, [7, 4, 2, 8, 6, 1, 3, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [7, 5, 3, 1, 6, 8, 2, 4]).
why(
  solution(nQueens8, [7, 5, 3, 1, 6, 8, 2, 4]),
  proof(
    goal(solution(nQueens8, [7, 5, 3, 1, 6, 8, 2, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [7, 5, 3, 1, 6, 8, 2, 4])]),
    uses([
      proof(
        goal(queens(8, [7, 5, 3, 1, 6, 8, 2, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [7, 5, 3, 1, 6, 8, 2, 4])]),
        uses([
          proof(
            goal(n_queens(8, [7, 5, 3, 1, 6, 8, 2, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [8, 2, 4, 1, 7, 5, 3, 6]).
why(
  solution(nQueens8, [8, 2, 4, 1, 7, 5, 3, 6]),
  proof(
    goal(solution(nQueens8, [8, 2, 4, 1, 7, 5, 3, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [8, 2, 4, 1, 7, 5, 3, 6])]),
    uses([
      proof(
        goal(queens(8, [8, 2, 4, 1, 7, 5, 3, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [8, 2, 4, 1, 7, 5, 3, 6])]),
        uses([
          proof(
            goal(n_queens(8, [8, 2, 4, 1, 7, 5, 3, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [8, 2, 5, 3, 1, 7, 4, 6]).
why(
  solution(nQueens8, [8, 2, 5, 3, 1, 7, 4, 6]),
  proof(
    goal(solution(nQueens8, [8, 2, 5, 3, 1, 7, 4, 6])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [8, 2, 5, 3, 1, 7, 4, 6])]),
    uses([
      proof(
        goal(queens(8, [8, 2, 5, 3, 1, 7, 4, 6])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [8, 2, 5, 3, 1, 7, 4, 6])]),
        uses([
          proof(
            goal(n_queens(8, [8, 2, 5, 3, 1, 7, 4, 6])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [8, 3, 1, 6, 2, 5, 7, 4]).
why(
  solution(nQueens8, [8, 3, 1, 6, 2, 5, 7, 4]),
  proof(
    goal(solution(nQueens8, [8, 3, 1, 6, 2, 5, 7, 4])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [8, 3, 1, 6, 2, 5, 7, 4])]),
    uses([
      proof(
        goal(queens(8, [8, 3, 1, 6, 2, 5, 7, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [8, 3, 1, 6, 2, 5, 7, 4])]),
        uses([
          proof(
            goal(n_queens(8, [8, 3, 1, 6, 2, 5, 7, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solution(nQueens8, [8, 4, 1, 3, 6, 2, 7, 5]).
why(
  solution(nQueens8, [8, 4, 1, 3, 6, 2, 7, 5]),
  proof(
    goal(solution(nQueens8, [8, 4, 1, 3, 6, 2, 7, 5])),
    by(rule("n-queens.pl", clause(4))),
    bindings([binding("Qs", [8, 4, 1, 3, 6, 2, 7, 5])]),
    uses([
      proof(
        goal(queens(8, [8, 4, 1, 3, 6, 2, 7, 5])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [8, 4, 1, 3, 6, 2, 7, 5])]),
        uses([
          proof(
            goal(n_queens(8, [8, 4, 1, 3, 6, 2, 7, 5])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

solved(nQueens8, true).
why(
  solved(nQueens8, true),
  proof(
    goal(solved(nQueens8, true)),
    by(rule("n-queens.pl", clause(5))),
    bindings([binding("_Qs", [1, 5, 8, 6, 3, 7, 2, 4])]),
    uses([
      proof(
        goal(queens(8, [1, 5, 8, 6, 3, 7, 2, 4])),
        by(rule("n-queens.pl", clause(3))),
        bindings([binding("N", 8), binding("Qs", [1, 5, 8, 6, 3, 7, 2, 4])]),
        uses([
          proof(
            goal(n_queens(8, [1, 5, 8, 6, 3, 7, 2, 4])),
            by(builtin(n_queens, 2))
          )
        ])
      )
    ])
  )
).

