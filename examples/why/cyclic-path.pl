path(a, b).
why(
  path(a, b),
  proof(
    goal(path(a, b)), by(rule("cyclic-path.pl", clause(6))),
    bindings([binding("X", a), binding("Y", b)]),
    uses([
      proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2))))
    ])
  )
).

path(b, c).
why(
  path(b, c),
  proof(
    goal(path(b, c)), by(rule("cyclic-path.pl", clause(6))),
    bindings([binding("X", b), binding("Y", c)]),
    uses([
      proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3))))
    ])
  )
).

path(c, d).
why(
  path(c, d),
  proof(
    goal(path(c, d)), by(rule("cyclic-path.pl", clause(6))),
    bindings([binding("X", c), binding("Y", d)]),
    uses([
      proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4))))
    ])
  )
).

path(d, a).
why(
  path(d, a),
  proof(
    goal(path(d, a)), by(rule("cyclic-path.pl", clause(6))),
    bindings([binding("X", d), binding("Y", a)]),
    uses([
      proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5))))
    ])
  )
).

path(a, c).
why(
  path(a, c),
  proof(
    goal(path(a, c)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", a), binding("Z", c), binding("Y", b)]),
    uses([
      proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2)))),
      proof(
        goal(path(b, c)), by(rule("cyclic-path.pl", clause(6))),
        bindings([binding("X", b), binding("Y", c)]),
        uses([
          proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3))))
        ])
      )
    ])
  )
).

path(a, d).
why(
  path(a, d),
  proof(
    goal(path(a, d)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", a), binding("Z", d), binding("Y", b)]),
    uses([
      proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2)))),
      proof(
        goal(path(b, d)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", b), binding("Z", d), binding("Y", c)]),
        uses([
          proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3)))),
          proof(
            goal(path(c, d)), by(rule("cyclic-path.pl", clause(6))),
            bindings([binding("X", c), binding("Y", d)]),
            uses([
              proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4))))
            ])
          )
        ])
      )
    ])
  )
).

path(a, a).
why(
  path(a, a),
  proof(
    goal(path(a, a)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", a), binding("Z", a), binding("Y", b)]),
    uses([
      proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2)))),
      proof(
        goal(path(b, a)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", b), binding("Z", a), binding("Y", c)]),
        uses([
          proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3)))),
          proof(
            goal(path(c, a)), by(rule("cyclic-path.pl", clause(7))),
            bindings([binding("X", c), binding("Z", a), binding("Y", d)]),
            uses([
              proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4)))),
              proof(
                goal(path(d, a)), by(rule("cyclic-path.pl", clause(6))),
                bindings([binding("X", d), binding("Y", a)]),
                uses([
                  proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

path(b, d).
why(
  path(b, d),
  proof(
    goal(path(b, d)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", b), binding("Z", d), binding("Y", c)]),
    uses([
      proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3)))),
      proof(
        goal(path(c, d)), by(rule("cyclic-path.pl", clause(6))),
        bindings([binding("X", c), binding("Y", d)]),
        uses([
          proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4))))
        ])
      )
    ])
  )
).

path(b, a).
why(
  path(b, a),
  proof(
    goal(path(b, a)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", b), binding("Z", a), binding("Y", c)]),
    uses([
      proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3)))),
      proof(
        goal(path(c, a)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", c), binding("Z", a), binding("Y", d)]),
        uses([
          proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4)))),
          proof(
            goal(path(d, a)), by(rule("cyclic-path.pl", clause(6))),
            bindings([binding("X", d), binding("Y", a)]),
            uses([
              proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5))))
            ])
          )
        ])
      )
    ])
  )
).

path(b, b).
why(
  path(b, b),
  proof(
    goal(path(b, b)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", b), binding("Z", b), binding("Y", c)]),
    uses([
      proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3)))),
      proof(
        goal(path(c, b)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", c), binding("Z", b), binding("Y", d)]),
        uses([
          proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4)))),
          proof(
            goal(path(d, b)), by(rule("cyclic-path.pl", clause(7))),
            bindings([binding("X", d), binding("Z", b), binding("Y", a)]),
            uses([
              proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5)))),
              proof(
                goal(path(a, b)), by(rule("cyclic-path.pl", clause(6))),
                bindings([binding("X", a), binding("Y", b)]),
                uses([
                  proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

path(c, a).
why(
  path(c, a),
  proof(
    goal(path(c, a)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", c), binding("Z", a), binding("Y", d)]),
    uses([
      proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4)))),
      proof(
        goal(path(d, a)), by(rule("cyclic-path.pl", clause(6))),
        bindings([binding("X", d), binding("Y", a)]),
        uses([
          proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5))))
        ])
      )
    ])
  )
).

path(c, b).
why(
  path(c, b),
  proof(
    goal(path(c, b)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", c), binding("Z", b), binding("Y", d)]),
    uses([
      proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4)))),
      proof(
        goal(path(d, b)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", d), binding("Z", b), binding("Y", a)]),
        uses([
          proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5)))),
          proof(
            goal(path(a, b)), by(rule("cyclic-path.pl", clause(6))),
            bindings([binding("X", a), binding("Y", b)]),
            uses([
              proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2))))
            ])
          )
        ])
      )
    ])
  )
).

path(c, c).
why(
  path(c, c),
  proof(
    goal(path(c, c)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", c), binding("Z", c), binding("Y", d)]),
    uses([
      proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4)))),
      proof(
        goal(path(d, c)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", d), binding("Z", c), binding("Y", a)]),
        uses([
          proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5)))),
          proof(
            goal(path(a, c)), by(rule("cyclic-path.pl", clause(7))),
            bindings([binding("X", a), binding("Z", c), binding("Y", b)]),
            uses([
              proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2)))),
              proof(
                goal(path(b, c)), by(rule("cyclic-path.pl", clause(6))),
                bindings([binding("X", b), binding("Y", c)]),
                uses([
                  proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

path(d, b).
why(
  path(d, b),
  proof(
    goal(path(d, b)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", d), binding("Z", b), binding("Y", a)]),
    uses([
      proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5)))),
      proof(
        goal(path(a, b)), by(rule("cyclic-path.pl", clause(6))),
        bindings([binding("X", a), binding("Y", b)]),
        uses([
          proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2))))
        ])
      )
    ])
  )
).

path(d, c).
why(
  path(d, c),
  proof(
    goal(path(d, c)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", d), binding("Z", c), binding("Y", a)]),
    uses([
      proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5)))),
      proof(
        goal(path(a, c)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", a), binding("Z", c), binding("Y", b)]),
        uses([
          proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2)))),
          proof(
            goal(path(b, c)), by(rule("cyclic-path.pl", clause(6))),
            bindings([binding("X", b), binding("Y", c)]),
            uses([
              proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3))))
            ])
          )
        ])
      )
    ])
  )
).

path(d, d).
why(
  path(d, d),
  proof(
    goal(path(d, d)), by(rule("cyclic-path.pl", clause(7))),
    bindings([binding("X", d), binding("Z", d), binding("Y", a)]),
    uses([
      proof(goal(arc(d, a)), by(fact("cyclic-path.pl", clause(5)))),
      proof(
        goal(path(a, d)), by(rule("cyclic-path.pl", clause(7))),
        bindings([binding("X", a), binding("Z", d), binding("Y", b)]),
        uses([
          proof(goal(arc(a, b)), by(fact("cyclic-path.pl", clause(2)))),
          proof(
            goal(path(b, d)), by(rule("cyclic-path.pl", clause(7))),
            bindings([binding("X", b), binding("Z", d), binding("Y", c)]),
            uses([
              proof(goal(arc(b, c)), by(fact("cyclic-path.pl", clause(3)))),
              proof(
                goal(path(c, d)), by(rule("cyclic-path.pl", clause(6))),
                bindings([binding("X", c), binding("Y", d)]),
                uses([
                  proof(goal(arc(c, d)), by(fact("cyclic-path.pl", clause(4))))
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

