kaprekarSteps(3524, 3).
why(
  kaprekarSteps(3524, 3),
  proof(
    goal(kaprekarSteps(3524, 3)),
    by(rule("kaprekar.pl", clause(11))),
    bindings([binding("N", 3524), binding("Count", 3)]),
    uses([
      proof(
        goal(sample(3524)),
        by(fact("kaprekar.pl", clause(6)))
      ),
      proof(
        goal(recursion_count(3524, 3)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 3524), binding("Count", 3)]),
        uses([
          proof(
            goal(kaprekar_steps(3524, 3)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

kaprekarSteps(2111, 5).
why(
  kaprekarSteps(2111, 5),
  proof(
    goal(kaprekarSteps(2111, 5)),
    by(rule("kaprekar.pl", clause(11))),
    bindings([binding("N", 2111), binding("Count", 5)]),
    uses([
      proof(
        goal(sample(2111)),
        by(fact("kaprekar.pl", clause(7)))
      ),
      proof(
        goal(recursion_count(2111, 5)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 2111), binding("Count", 5)]),
        uses([
          proof(
            goal(kaprekar_steps(2111, 5)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

kaprekarSteps(9831, 7).
why(
  kaprekarSteps(9831, 7),
  proof(
    goal(kaprekarSteps(9831, 7)),
    by(rule("kaprekar.pl", clause(11))),
    bindings([binding("N", 9831), binding("Count", 7)]),
    uses([
      proof(
        goal(sample(9831)),
        by(fact("kaprekar.pl", clause(8)))
      ),
      proof(
        goal(recursion_count(9831, 7)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 9831), binding("Count", 7)]),
        uses([
          proof(
            goal(kaprekar_steps(9831, 7)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

kaprekarSteps(6174, 0).
why(
  kaprekarSteps(6174, 0),
  proof(
    goal(kaprekarSteps(6174, 0)),
    by(rule("kaprekar.pl", clause(11))),
    bindings([binding("N", 6174), binding("Count", 0)]),
    uses([
      proof(
        goal(sample(6174)),
        by(fact("kaprekar.pl", clause(9)))
      ),
      proof(
        goal(recursion_count(6174, 0)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 6174), binding("Count", 0)]),
        uses([
          proof(
            goal(kaprekar_steps(6174, 0)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

reachesConstant(kaprekar, 3524).
why(
  reachesConstant(kaprekar, 3524),
  proof(
    goal(reachesConstant(kaprekar, 3524)),
    by(rule("kaprekar.pl", clause(12))),
    bindings([binding("N", 3524), binding("_Count", 3)]),
    uses([
      proof(
        goal(sample(3524)),
        by(fact("kaprekar.pl", clause(6)))
      ),
      proof(
        goal(recursion_count(3524, 3)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 3524), binding("Count", 3)]),
        uses([
          proof(
            goal(kaprekar_steps(3524, 3)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

reachesConstant(kaprekar, 2111).
why(
  reachesConstant(kaprekar, 2111),
  proof(
    goal(reachesConstant(kaprekar, 2111)),
    by(rule("kaprekar.pl", clause(12))),
    bindings([binding("N", 2111), binding("_Count", 5)]),
    uses([
      proof(
        goal(sample(2111)),
        by(fact("kaprekar.pl", clause(7)))
      ),
      proof(
        goal(recursion_count(2111, 5)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 2111), binding("Count", 5)]),
        uses([
          proof(
            goal(kaprekar_steps(2111, 5)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

reachesConstant(kaprekar, 9831).
why(
  reachesConstant(kaprekar, 9831),
  proof(
    goal(reachesConstant(kaprekar, 9831)),
    by(rule("kaprekar.pl", clause(12))),
    bindings([binding("N", 9831), binding("_Count", 7)]),
    uses([
      proof(
        goal(sample(9831)),
        by(fact("kaprekar.pl", clause(8)))
      ),
      proof(
        goal(recursion_count(9831, 7)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 9831), binding("Count", 7)]),
        uses([
          proof(
            goal(kaprekar_steps(9831, 7)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

reachesConstant(kaprekar, 6174).
why(
  reachesConstant(kaprekar, 6174),
  proof(
    goal(reachesConstant(kaprekar, 6174)),
    by(rule("kaprekar.pl", clause(12))),
    bindings([binding("N", 6174), binding("_Count", 0)]),
    uses([
      proof(
        goal(sample(6174)),
        by(fact("kaprekar.pl", clause(9)))
      ),
      proof(
        goal(recursion_count(6174, 0)),
        by(rule("kaprekar.pl", clause(5))),
        bindings([binding("N", 6174), binding("Count", 0)]),
        uses([
          proof(
            goal(kaprekar_steps(6174, 0)),
            by(builtin(kaprekar_steps, 2))
          )
        ])
      )
    ])
  )
).

