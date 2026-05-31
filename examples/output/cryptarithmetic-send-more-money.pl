status(send_more_money, solved).
why(
  status(send_more_money, solved),
  proof(
    goal(status(send_more_money, solved)),
    by(rule("cryptarithmetic-send-more-money.pl", clause(6))),
    bindings([binding("_Solution", solution(9, 5, 6, 7, 1, 0, 8, 2)), binding("_Send", 9567), binding("_More", 1085), binding("_Money", 10652)]),
    uses([
      proof(
        goal(once(send_more_money(solution(9, 5, 6, 7, 1, 0, 8, 2), 9567, 1085, 10652))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(send_more_money(solution(9, 5, 6, 7, 1, 0, 8, 2), 9567, 1085, 10652)),
            by(rule("cryptarithmetic-send-more-money.pl", clause(4))),
            bindings([binding("S", 9), binding("E", 5), binding("N", 6), binding("D", 7), binding("M", 1), binding("O", 0), binding("R", 8), binding("Y", 2), binding("Send", 9567), binding("More", 1085), binding("Money", 10652)]),
            uses([
              proof(
                goal(alphametic_sum([s, e, n, d, m, o, r, y], [[s, e, n, d], [m, o, r, e]], [m, o, n, e, y], [9, 5, 6, 7, 1, 0, 8, 2], [9567, 1085, 10652])),
                by(builtin(alphametic_sum, 5))
              )
            ])
          )
        ])
      )
    ])
  )
).

status(donald_gerald_robert, solved).
why(
  status(donald_gerald_robert, solved),
  proof(
    goal(status(donald_gerald_robert, solved)),
    by(rule("cryptarithmetic-send-more-money.pl", clause(9))),
    bindings([binding("_Solution", solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0)), binding("_Donald", 526485), binding("_Gerald", 197485), binding("_Robert", 723970)]),
    uses([
      proof(
        goal(once(donald_gerald_robert(solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0), 526485, 197485, 723970))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(donald_gerald_robert(solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0), 526485, 197485, 723970)),
            by(rule("cryptarithmetic-send-more-money.pl", clause(5))),
            bindings([binding("D", 5), binding("O", 2), binding("N", 6), binding("A", 4), binding("L", 8), binding("G", 1), binding("E", 9), binding("R", 7), binding("B", 3), binding("T", 0), binding("Donald", 526485), binding("Gerald", 197485), binding("Robert", 723970)]),
            uses([
              proof(
                goal(alphametic_sum([d, o, n, a, l, g, e, r, b, t], [[d, o, n, a, l, d], [g, e, r, a, l, d]], [r, o, b, e, r, t], [5, 2, 6, 4, 8, 1, 9, 7, 3, 0], [526485, 197485, 723970])),
                by(builtin(alphametic_sum, 5))
              )
            ])
          )
        ])
      )
    ])
  )
).

assignment(send_more_money, solution(9, 5, 6, 7, 1, 0, 8, 2)).
why(
  assignment(send_more_money, solution(9, 5, 6, 7, 1, 0, 8, 2)),
  proof(
    goal(assignment(send_more_money, solution(9, 5, 6, 7, 1, 0, 8, 2))),
    by(rule("cryptarithmetic-send-more-money.pl", clause(7))),
    bindings([binding("Solution", solution(9, 5, 6, 7, 1, 0, 8, 2)), binding("_Send", 9567), binding("_More", 1085), binding("_Money", 10652)]),
    uses([
      proof(
        goal(once(send_more_money(solution(9, 5, 6, 7, 1, 0, 8, 2), 9567, 1085, 10652))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(send_more_money(solution(9, 5, 6, 7, 1, 0, 8, 2), 9567, 1085, 10652)),
            by(rule("cryptarithmetic-send-more-money.pl", clause(4))),
            bindings([binding("S", 9), binding("E", 5), binding("N", 6), binding("D", 7), binding("M", 1), binding("O", 0), binding("R", 8), binding("Y", 2), binding("Send", 9567), binding("More", 1085), binding("Money", 10652)]),
            uses([
              proof(
                goal(alphametic_sum([s, e, n, d, m, o, r, y], [[s, e, n, d], [m, o, r, e]], [m, o, n, e, y], [9, 5, 6, 7, 1, 0, 8, 2], [9567, 1085, 10652])),
                by(builtin(alphametic_sum, 5))
              )
            ])
          )
        ])
      )
    ])
  )
).

assignment(donald_gerald_robert, solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0)).
why(
  assignment(donald_gerald_robert, solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0)),
  proof(
    goal(assignment(donald_gerald_robert, solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0))),
    by(rule("cryptarithmetic-send-more-money.pl", clause(10))),
    bindings([binding("Solution", solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0)), binding("_Donald", 526485), binding("_Gerald", 197485), binding("_Robert", 723970)]),
    uses([
      proof(
        goal(once(donald_gerald_robert(solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0), 526485, 197485, 723970))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(donald_gerald_robert(solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0), 526485, 197485, 723970)),
            by(rule("cryptarithmetic-send-more-money.pl", clause(5))),
            bindings([binding("D", 5), binding("O", 2), binding("N", 6), binding("A", 4), binding("L", 8), binding("G", 1), binding("E", 9), binding("R", 7), binding("B", 3), binding("T", 0), binding("Donald", 526485), binding("Gerald", 197485), binding("Robert", 723970)]),
            uses([
              proof(
                goal(alphametic_sum([d, o, n, a, l, g, e, r, b, t], [[d, o, n, a, l, d], [g, e, r, a, l, d]], [r, o, b, e, r, t], [5, 2, 6, 4, 8, 1, 9, 7, 3, 0], [526485, 197485, 723970])),
                by(builtin(alphametic_sum, 5))
              )
            ])
          )
        ])
      )
    ])
  )
).

equation(send_more_money, plus(9567, 1085, 10652)).
why(
  equation(send_more_money, plus(9567, 1085, 10652)),
  proof(
    goal(equation(send_more_money, plus(9567, 1085, 10652))),
    by(rule("cryptarithmetic-send-more-money.pl", clause(8))),
    bindings([binding("Send", 9567), binding("More", 1085), binding("Money", 10652), binding("_Solution", solution(9, 5, 6, 7, 1, 0, 8, 2))]),
    uses([
      proof(
        goal(once(send_more_money(solution(9, 5, 6, 7, 1, 0, 8, 2), 9567, 1085, 10652))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(send_more_money(solution(9, 5, 6, 7, 1, 0, 8, 2), 9567, 1085, 10652)),
            by(rule("cryptarithmetic-send-more-money.pl", clause(4))),
            bindings([binding("S", 9), binding("E", 5), binding("N", 6), binding("D", 7), binding("M", 1), binding("O", 0), binding("R", 8), binding("Y", 2), binding("Send", 9567), binding("More", 1085), binding("Money", 10652)]),
            uses([
              proof(
                goal(alphametic_sum([s, e, n, d, m, o, r, y], [[s, e, n, d], [m, o, r, e]], [m, o, n, e, y], [9, 5, 6, 7, 1, 0, 8, 2], [9567, 1085, 10652])),
                by(builtin(alphametic_sum, 5))
              )
            ])
          )
        ])
      )
    ])
  )
).

equation(donald_gerald_robert, plus(526485, 197485, 723970)).
why(
  equation(donald_gerald_robert, plus(526485, 197485, 723970)),
  proof(
    goal(equation(donald_gerald_robert, plus(526485, 197485, 723970))),
    by(rule("cryptarithmetic-send-more-money.pl", clause(11))),
    bindings([binding("Donald", 526485), binding("Gerald", 197485), binding("Robert", 723970), binding("_Solution", solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0))]),
    uses([
      proof(
        goal(once(donald_gerald_robert(solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0), 526485, 197485, 723970))),
        by(builtin(once, 1)),
        uses([
          proof(
            goal(donald_gerald_robert(solution(5, 2, 6, 4, 8, 1, 9, 7, 3, 0), 526485, 197485, 723970)),
            by(rule("cryptarithmetic-send-more-money.pl", clause(5))),
            bindings([binding("D", 5), binding("O", 2), binding("N", 6), binding("A", 4), binding("L", 8), binding("G", 1), binding("E", 9), binding("R", 7), binding("B", 3), binding("T", 0), binding("Donald", 526485), binding("Gerald", 197485), binding("Robert", 723970)]),
            uses([
              proof(
                goal(alphametic_sum([d, o, n, a, l, g, e, r, b, t], [[d, o, n, a, l, d], [g, e, r, a, l, d]], [r, o, b, e, r, t], [5, 2, 6, 4, 8, 1, 9, 7, 3, 0], [526485, 197485, 723970])),
                by(builtin(alphametic_sum, 5))
              )
            ])
          )
        ])
      )
    ])
  )
).

